package dailystandups.util;

import com.google.appengine.api.datastore.*;
import dailystandups.model.*;

import java.util.*;

/**
 * Created by Piet de Vries on 15-02-18.
 *
 */
public class DataUtils {

    private static DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

    /*
     *****************TABLE NAMES************************
     */
    private static final String KIND_USER = "StandUpUser";
    private static final String KIND_PLANNING = "Planning";
    private static final String KIND_VAK = "Vak";
    private static final String KIND_TICKET = "Ticket";
    private static final String KIND_PLANNING_TICKET = "Planning_Ticket";

     /*
     *****************COLUMN NAMES************************
     */
    private static final String PROPERTY_GROEP = "groep";
    private static final String PROPERTY_COHORT = "cohort";
    private static final String PROPERTY_NAAM = "naam";
    private static final String PROPERTY_EMAIL = "email";
    private static final String PROPERTY_LATEST_PLANNING_ID = "laatste_planning";
    private static final String PROPERTY_DATE = "date";
    private static final String PROPERTY_BELEMMERINGEN = "belemmeringen";
    private static final String PROPERTY_AFGEROND = "afgerond";
    private static final String PROPERTY_REDEN_NIET_AF = "reden_niet_af";
    private static final String PROPERTY_CODE = "code";
    private static final String PROPERTY_VAK = "vak";
    private static final String PROPERTY_AANTAL_UREN = "aantal_uren";
    private static final String PROPERTY_PLANNING_ID = "planning_id";
    private static final String PROPERTY_TICKET_ID = "ticket_id";
    private static final String PROPERTY_DOCENT = "docent";
    private static final String PROPERTY_BESCHRIJVING = "beschrijving";
    private static final String PROPERTY_NAAM_PROJECT = "projectnaam";
    private static final String PROPERTY_IS_DELETED = "deleted";

    public static void saveUserAndPlanning(Planning planning, boolean isNew) {

        //save the user
        StandUpUser standUpUser = planning.getUser();
        Entity userEntity = new Entity(KIND_USER, standUpUser.getEmail());
        if (isNew) {
            //update user
            userEntity.setProperty(PROPERTY_GROEP, standUpUser.getGroep());
            userEntity.setProperty(PROPERTY_COHORT, standUpUser.getCohort());
            String naam = standUpUser.getNaam();
            //zorg dat naam begint met hoofdletter ivm sorteren
            String eersteLetter = naam.substring(0, 1).toUpperCase();
            naam = eersteLetter + naam.substring(1);
            userEntity.setProperty(PROPERTY_NAAM, naam);
            userEntity.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
            userEntity.setProperty(PROPERTY_LATEST_PLANNING_ID, planning.getId());
            datastore.put(userEntity);

            //save new tickets
            long[] ticketCodes = planning.getTicketIds();

            for (long ticketId : ticketCodes) {
                //datastore maakt id
                Entity ticketUser = new Entity(KIND_PLANNING_TICKET);
                ticketUser.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
                ticketUser.setProperty(PROPERTY_PLANNING_ID, planning.getId());
                ticketUser.setProperty(PROPERTY_TICKET_ID, ticketId);

                //niet afgerond is -1;
                ticketUser.setProperty(PROPERTY_AFGEROND, -1);

                datastore.put(ticketUser);
            }
        }

        //save planning as child of user id=timestamp
        Entity planningEntity = new Entity(KIND_PLANNING, planning.getId(), userEntity.getKey());
        planningEntity.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
        planningEntity.setProperty(PROPERTY_DATE, planning.getEntryDate());
        planningEntity.setProperty(PROPERTY_BELEMMERINGEN, planning.getBelemmeringen());
        planningEntity.setProperty(PROPERTY_REDEN_NIET_AF, planning.getRedenNietAf());
        datastore.put(planningEntity);
    }

    public static Planning getPlanning(String userId) throws EntityNotFoundException {
        Key userKey = KeyFactory.createKey(KIND_USER, userId);
        Entity userEntity = datastore.get(userKey);
        return getPlanning(makeUserFromEntity(userEntity));
    }

    private static StandUpUser makeUserFromEntity(Entity userEntity) {
        String email = (String) userEntity.getProperty(PROPERTY_EMAIL);
        String naam = (String) userEntity.getProperty(PROPERTY_NAAM);
        String groep = (String) userEntity.getProperty(PROPERTY_GROEP);
        StandUpUser user = new StandUpUser(email, naam, groep);
        user.setLaatstePlanningId((long) userEntity.getProperty(PROPERTY_LATEST_PLANNING_ID));
        return user;
    }


    private static Planning getPlanning(StandUpUser user) {
        long planningId;
        planningId = user.getLaatstePlanningId();
        Key planningKey = new KeyFactory.Builder(KIND_USER, user.getEmail())
                .addChild(KIND_PLANNING, planningId)
                .getKey();
        Entity planningEntity;
        try {
            planningEntity = datastore.get(planningKey);
            Planning planning = makePlanningFromEntity(planningEntity);
            planning.setUser(user);
            List<Ticket> tickets = getTicketsFromPlanning(user.getEmail(), planning.getId());
            planning.setTickets(tickets.toArray(new Ticket[tickets.size()]));
            return planning;
        } catch (EntityNotFoundException e) {
            return null;
        }
    }

    private static Planning makePlanningFromEntity(Entity entity) {
        Planning planning = new Planning();
        planning.setEntryDate((Date) entity.getProperty(PROPERTY_DATE));
        planning.setBelemmeringen((String) entity.getProperty(PROPERTY_BELEMMERINGEN));
        planning.setRedenNietAf((String) entity.getProperty(PROPERTY_REDEN_NIET_AF));
        return planning;
    }

    public static List<StandUpUser> getUsersFromCohortWithLatestPlanning(int cohort) {
        ArrayList<StandUpUser> users = new ArrayList<>();
        Query.Filter propertyFilter = new Query.FilterPredicate(PROPERTY_COHORT,
                Query.FilterOperator.EQUAL, cohort);

        Query q = new Query(KIND_USER).addSort(PROPERTY_NAAM,
                Query.SortDirection.ASCENDING).setFilter(propertyFilter);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity entity : pq.asIterable()) {
            StandUpUser user = makeUserFromEntity(entity);
            user.setHuidigePlanning(getPlanning(user));
            users.add(user);
        }
        return users;
    }

    public static ArrayList<Planning> getPlanningenFromUser(String email) {
        ArrayList<Planning> planningen = new ArrayList<>();
        Key ancestorKey = KeyFactory.createKey(KIND_USER, email);
        Query q = new Query(KIND_PLANNING)
                .setAncestor(ancestorKey)
                .addSort(PROPERTY_DATE, Query.SortDirection.DESCENDING);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity entity : pq.asIterable()) {
            Planning pv2 = makePlanningFromEntity(entity);
            List<Ticket> ticketsList = getTicketsFromPlanning(email, pv2.getId());
            Ticket[] tickets = new Ticket[ticketsList.size()];
            ticketsList.toArray(tickets);
            pv2.setTickets(tickets);
            planningen.add(pv2);
        }

        return planningen;
    }

    public static void voegVakToe(Vak vak) {
        Entity entity = new Entity(KIND_VAK);
        entity.setProperty(PROPERTY_NAAM, vak.getNaam());
        entity.setProperty(PROPERTY_DOCENT, vak.getDocent());
        datastore.put(entity);
    }

    public static void updateVak(Vak vak) {
        Key key = KeyFactory.createKey(KIND_VAK, vak.getId());
        try {
            Entity entity = datastore.get(key);
            entity.setProperty(PROPERTY_NAAM, vak.getNaam());
            if (vak.getDocent() != null) {
                entity.setProperty(PROPERTY_DOCENT, vak.getDocent());
            }
            datastore.put(entity);
        } catch (EntityNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteVak(long vakId) {
        Key key = KeyFactory.createKey(KIND_VAK, vakId);
        return setEntityAsDeleted(key);
    }

    public static boolean updateTicket(Ticket ticket) {
        Key key = KeyFactory.createKey(KIND_TICKET, ticket.getId());
        try {
            Entity entity = datastore.get(key);
            entity.setProperty(PROPERTY_CODE, ticket.getCodeTicket());
            entity.setProperty(PROPERTY_AANTAL_UREN, ticket.getAantalUren());
            datastore.put(entity);
            return true;
        } catch (EntityNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deleteTicket(long ticketId) {
        Key key = KeyFactory.createKey(KIND_TICKET, ticketId);
        return setEntityAsDeleted(key);
    }

    private static boolean setEntityAsDeleted(Key key) {
        try {
            Entity entity = datastore.get(key);
            entity.setProperty(PROPERTY_IS_DELETED, new Date().getTime());
            datastore.put(entity);
            return true;
        } catch (EntityNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static ArrayList<Vak> getVakken() {
        ArrayList<Vak> vakken = new ArrayList<>();
        Query q = new Query(KIND_VAK).addSort(PROPERTY_NAAM);
        PreparedQuery pq = datastore.prepare(q);
        return maakVakLijst(pq);
    }


    public static ArrayList<Vak> getVakkenFromDocent(String docent) {
        Query.Filter propertyFilter = new Query.FilterPredicate(PROPERTY_DOCENT, Query.FilterOperator.EQUAL, docent);
        Query q = new Query(KIND_VAK).setFilter(propertyFilter).addSort(PROPERTY_NAAM);
        PreparedQuery pq = datastore.prepare(q);
        return maakVakLijst(pq);
    }

    private static ArrayList<Vak> maakVakLijst(PreparedQuery pq) {
        ArrayList<Vak> vakken = new ArrayList<>();
        for (Entity e : pq.asIterable()) {
            long id = e.getKey().getId();
            String naam = (String) e.getProperty(PROPERTY_NAAM);
            // filter deleted vakken
            if (e.getProperty(PROPERTY_IS_DELETED) == null ) {
                vakken.add(new Vak(naam, null, id));
            }
        }
        return vakken;
    }

    public static long voegTicketToe(Ticket ticket) {
        Entity entity = new Entity(KIND_TICKET);
        entity.setProperty(PROPERTY_VAK, ticket.getVakId());
        entity.setProperty(PROPERTY_CODE, ticket.getCodeTicket());
        entity.setProperty(PROPERTY_AANTAL_UREN, ticket.getAantalUren());
        if (ticket instanceof ProjectTicket) {
            entity.setProperty(PROPERTY_BESCHRIJVING, ((ProjectTicket) ticket).getBeschrijvingTicket());
            entity.setProperty(PROPERTY_NAAM_PROJECT, ((ProjectTicket) ticket).getProjectNaam());
        }
        datastore.put(entity);
        return entity.getKey().getId();
    }

    public static List<Ticket> getTicketsFromVak(long id) {
        ArrayList<Ticket> tickets = new ArrayList<>();
        Query.Filter propertyFilter = new Query.FilterPredicate(PROPERTY_VAK,
                Query.FilterOperator.EQUAL, id);
        Query q = new Query(KIND_TICKET).setFilter(propertyFilter).addSort(PROPERTY_CODE);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e : pq.asIterable()) {
            // filter op is deleted
            if (e.getProperty(PROPERTY_IS_DELETED) == null) {
                tickets.add(makeTicketFromEntity(e, 0));
            }
        }
        return tickets;
    }

    public static List<Ticket> getTicketsFromPlanning(String email, long planningId) {
        List<Ticket> tickets = new ArrayList<>();
        Query.Filter emailFilter = new Query.FilterPredicate(PROPERTY_EMAIL, Query.FilterOperator.EQUAL,
                email);
        Query.Filter planningFilter = new Query.FilterPredicate(PROPERTY_PLANNING_ID, Query.FilterOperator.EQUAL,
                planningId);
        Query.Filter compositeFilter = Query.CompositeFilterOperator.and(emailFilter, planningFilter);
        Query q = new Query(KIND_PLANNING_TICKET).setFilter(compositeFilter).addSort(PROPERTY_TICKET_ID);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e : pq.asIterable()) {
            long ticketCode = (long) e.getProperty(PROPERTY_TICKET_ID);
            long afgerond = (long) e.getProperty(PROPERTY_AFGEROND);
            Key key = KeyFactory.createKey(KIND_TICKET, ticketCode);
            try {
                tickets.add(makeTicketFromEntity(datastore.get(key), afgerond));
            } catch (EntityNotFoundException ignored) {
            }
        }
        if (!tickets.isEmpty()) {
            Collections.sort(tickets, new Comparator<Ticket>() {
                @Override
                public int compare(Ticket o1, Ticket o2) {
                    return o1.getCodeTicket().compareToIgnoreCase(o2.getCodeTicket());
                }
            });
        }
        return tickets;
    }

    private static Ticket makeTicketFromEntity(Entity ticketEntity, long afgerond) {
        long vakId = (long) ticketEntity.getProperty(PROPERTY_VAK);
        int aantalUren = (int) (long) ticketEntity.getProperty(PROPERTY_AANTAL_UREN);
        String code = (String) ticketEntity.getProperty(PROPERTY_CODE);
        long id = ticketEntity.getKey().getId();
        Ticket ticket;
        if (ticketEntity.getProperty(PROPERTY_NAAM_PROJECT) != null) {
            String project = (String) ticketEntity.getProperty(PROPERTY_NAAM_PROJECT);
            String beschrijving = (String) ticketEntity.getProperty(PROPERTY_BESCHRIJVING);
            ticket = new ProjectTicket(
                    id,
                    vakId,
                    aantalUren,
                    afgerond,
                    beschrijving,
                    project);
        } else {
            ticket = new Ticket(id, vakId, code, aantalUren, afgerond);
        }
        ticket.setVak(getVak(vakId));
        return ticket;
    }

    private static Vak getVak(long id) {
        Key vakKey = KeyFactory.createKey(KIND_VAK, id);
        try {
            Entity vakEntity = datastore.get(vakKey);
            String naam = (String) vakEntity.getProperty(PROPERTY_NAAM);
            String docent = (String) vakEntity.getProperty(PROPERTY_DOCENT);
            return new Vak(naam, docent, id);
        } catch (EntityNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void setTicketAfgerond(long ticketId, long date, String email) {
        Query.Filter emailFilter = new Query.FilterPredicate(PROPERTY_EMAIL, Query.FilterOperator.EQUAL,
                email);
        Query.Filter ticketFilter = new Query.FilterPredicate(PROPERTY_TICKET_ID, Query.FilterOperator.EQUAL,
                ticketId);

        Query.Filter compositeFilter = Query.CompositeFilterOperator.and(emailFilter, ticketFilter);
        Query q = new Query(KIND_PLANNING_TICKET).setFilter(compositeFilter);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e: pq.asIterable()) {
            e.setProperty(PROPERTY_AFGEROND, date);
            datastore.put(e);
        }
    }

    public static StandUpUser getStandUpUser(String email) {
        Key key = KeyFactory.createKey(KIND_USER, email);
        Entity entity;
        try {
            entity = datastore.get(key);
        } catch (EntityNotFoundException e) {
            return null;
        }
        return makeUserFromEntity(entity);
    }

    public static long[] getAfgerondeTicketsFromUser(String email) {
        Query.Filter emailFilter = new Query.FilterPredicate(PROPERTY_EMAIL, Query.FilterOperator.EQUAL,
                email);
        Query.Filter afgerondFilter = new Query.FilterPredicate(PROPERTY_AFGEROND, Query.FilterOperator.GREATER_THAN,
                0);

        Query.Filter compositeFilter = Query.CompositeFilterOperator.and(emailFilter, afgerondFilter);
        Query q = new Query(KIND_PLANNING_TICKET).setFilter(compositeFilter);
        PreparedQuery pq = datastore.prepare(q);
        long[] afgerondeTickets = new long[pq.countEntities(FetchOptions.Builder.withDefaults())];
        int index = 0;
        for (Entity e: pq.asIterable()) {
            afgerondeTickets[index] = (long) e.getProperty(PROPERTY_TICKET_ID);
            index++;
        }
        return afgerondeTickets;
    }
}

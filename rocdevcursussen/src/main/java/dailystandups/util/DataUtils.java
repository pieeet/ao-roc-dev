package dailystandups.util;

import com.google.appengine.api.datastore.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dailystandups.model.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Piet de Vries on 15-02-18.
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
    private static final String KIND_HULPVRAAG = "Hulpvraag";


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
    private static final String PROPERTY_IS_APPROVED = "approved";
    private static final String PROPERTY_HULPVRAAG = "hulpvraag";
    private static final String PROPERTY_AFGEHANDELD = "afgehandeld";
    private static final String PROPERTY_STATUS = "status";


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
            userEntity.setProperty(PROPERTY_STATUS, standUpUser.getStatus());
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
        String groepString = (String) userEntity.getProperty(PROPERTY_GROEP);
        int status = StandUpUser.STATUS_ACTIEF;
        if (userEntity.getProperty(PROPERTY_STATUS) != null) {
            status = (int) (long) userEntity.getProperty(PROPERTY_STATUS);
        }

        Groep groep = null;
        for (Groep g : Groep.values()) {
            if (g.getNaam().equals(groepString)) {
                groep = g;
                break;
            }
        }
        StandUpUser user = new StandUpUser(email, naam, groep, status);
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
            planning.setTickets(tickets.toArray(new Ticket[0]));
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

    public static UsersWithPlanningResult<StandUpUser> getUsersWithLatestPlanning(
            int cohort, String groep, String startCursorString, boolean getSortedOnDate, boolean ascending) {
        final int PAGE_SIZE = 10;
        FetchOptions fetchOptions = FetchOptions.Builder.withLimit(PAGE_SIZE);
        if (startCursorString != null && !startCursorString.equals("")) {
            fetchOptions.startCursor(Cursor.fromWebSafeString(startCursorString));    // Where we left off
        }
        ArrayList<StandUpUser> users = new ArrayList<>();
        Query.Filter groepFilter = null;
        if (cohort > 0) {
            groepFilter = new Query.FilterPredicate(PROPERTY_COHORT,
                    Query.FilterOperator.EQUAL, cohort);
        } else if (groep != null) {
            groepFilter = new Query.FilterPredicate(PROPERTY_GROEP,
                    Query.FilterOperator.EQUAL, groep);
        }
        Query.Filter statusFilter = new Query.FilterPredicate(PROPERTY_STATUS, Query.FilterOperator.EQUAL,
                StandUpUser.STATUS_ACTIEF);
        Query.CompositeFilter compositeFilter = Query.CompositeFilterOperator.and(groepFilter, statusFilter);

        String sortOrder = PROPERTY_NAAM;
        Query.SortDirection direction = Query.SortDirection.ASCENDING;
        if (getSortedOnDate) {
            sortOrder = PROPERTY_LATEST_PLANNING_ID;
            if (!ascending) {
                direction = Query.SortDirection.DESCENDING;
            }
        }
        Query q = new Query(KIND_USER).addSort(sortOrder,
                direction).setFilter(compositeFilter);
        PreparedQuery pq = datastore.prepare(q);
        QueryResultList<Entity> results = pq.asQueryResultList(fetchOptions);
        for (Entity entity : results) {
            StandUpUser user = makeUserFromEntity(entity);
            user.setHuidigePlanning(getPlanning(user));
            users.add(user);
        }


        Cursor cursor = results.getCursor();
        if (cursor != null && results.size() == PAGE_SIZE) {
            String cursorString = cursor.toWebSafeString();
            return new UsersWithPlanningResult<>(users, cursorString);
        } else {
            return new UsersWithPlanningResult<>(users);
        }
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

    public static boolean updateVak(Vak vak) {
        Key key = KeyFactory.createKey(KIND_VAK, vak.getId());
        try {
            Entity entity = datastore.get(key);
            entity.setProperty(PROPERTY_NAAM, vak.getNaam());
            if (vak.getDocent() != null) {
                entity.setProperty(PROPERTY_DOCENT, vak.getDocent());
            }
            datastore.put(entity);
            return true;
        } catch (EntityNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean deleteVak(long vakId) {
        Key key = KeyFactory.createKey(KIND_VAK, vakId);
        return setEntityAsDeleted(key);
    }

    public static boolean updateProjectTicket(ProjectTicket ticket) {
        Key key = KeyFactory.createKey(KIND_TICKET, ticket.getId());
        try {
            Entity entity = datastore.get(key);
            // check of het wel een "nieuw" projectticket is en nog niet approved
            if (entity.getProperty(PROPERTY_IS_APPROVED) != null &&
                    entity.getProperty(PROPERTY_IS_APPROVED).equals("pending")) {
                entity.setProperty(PROPERTY_NAAM_PROJECT, ticket.getProjectNaam());
                entity.setProperty(PROPERTY_BESCHRIJVING, ticket.getBeschrijvingTicket());
                entity.setProperty(PROPERTY_AANTAL_UREN, ticket.getAantalUren());
                datastore.put(entity);
                return true;
            } else return false;
        } catch (EntityNotFoundException e) {
            return false;
        }

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

    /**
     * @param id    the ticket id in datastore
     * @param email the email of the admin that approves ticket
     * @return the admin that first approved the ticket
     */
    public static String approveTicket(long id, String email) {
        Key key = KeyFactory.createKey(KIND_TICKET, id);
        try {
            Entity entity = datastore.get(key);
            if (entity.getProperty(PROPERTY_IS_APPROVED).equals("pending")) {
                entity.setProperty(PROPERTY_IS_APPROVED, email);
                datastore.put(entity);
            }
            return (String) entity.getProperty(PROPERTY_IS_APPROVED);
        } catch (EntityNotFoundException e) {
            return null;
        }
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
            if (e.getProperty(PROPERTY_IS_DELETED) == null) {
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
            entity.setProperty(PROPERTY_IS_APPROVED, ((ProjectTicket) ticket).getApproved());
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
            String approved = null;
            if (ticketEntity.getProperty(PROPERTY_IS_APPROVED) != null) {
                approved = (String) ticketEntity.getProperty(PROPERTY_IS_APPROVED);
            }
            ticket = new ProjectTicket(
                    id,
                    vakId,
                    aantalUren,
                    afgerond,
                    beschrijving,
                    project,
                    approved);
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

    // een ticket kan in meerdere planningen voorkomen. Niet afgerond = -1
    public static void setTicketAfgerond(long ticketId, long date, String email) {
        // check if ticket is project ticket --> approved, if not return
        Key k = KeyFactory.createKey(KIND_TICKET, ticketId);
        try {
            Entity ticketEntity = datastore.get(k);
            Ticket ticket = makeTicketFromEntity(ticketEntity, 0);
            if (ticket instanceof ProjectTicket) {
                if (((ProjectTicket) ticket).getApproved() != null &&
                        ((ProjectTicket) ticket).getApproved().equals("pending")) return;
            }
        } catch (EntityNotFoundException e) {
            return;
        }

        Query.Filter emailFilter = new Query.FilterPredicate(PROPERTY_EMAIL, Query.FilterOperator.EQUAL,
                email);
        Query.Filter ticketFilter = new Query.FilterPredicate(PROPERTY_TICKET_ID, Query.FilterOperator.EQUAL,
                ticketId);

        Query.Filter compositeFilter = Query.CompositeFilterOperator.and(emailFilter, ticketFilter);
        Query q = new Query(KIND_PLANNING_TICKET).setFilter(compositeFilter);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e : pq.asIterable()) {
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
        for (Entity e : pq.asIterable()) {
            afgerondeTickets[index] = (long) e.getProperty(PROPERTY_TICKET_ID);
            index++;
        }
        return afgerondeTickets;
    }

    public static boolean voegTicketAanPlanningToe(String email, long planningId, long ticketId) {
        Entity entity = new Entity(KIND_PLANNING_TICKET);
        entity.setProperty(PROPERTY_EMAIL, email);
        entity.setProperty(PROPERTY_PLANNING_ID, planningId);
        entity.setProperty(PROPERTY_TICKET_ID, ticketId);
        entity.setProperty(PROPERTY_AFGEROND, -1);
        datastore.put(entity);
        return true;
    }

    public static void voegHulpvraagToe(Hulpvraag hulpvraag) {
        Entity entity;
        if (hulpvraag.getId() < 1) {
            entity = new Entity(KIND_HULPVRAAG);
        } else {
            Key key = KeyFactory.createKey(KIND_HULPVRAAG, hulpvraag.getId());
            entity = new Entity(KIND_HULPVRAAG, key);
        }

        entity.setProperty(PROPERTY_EMAIL, hulpvraag.getEmailUser());
        entity.setProperty(PROPERTY_VAK, hulpvraag.getVak());
        entity.setProperty(PROPERTY_DATE, hulpvraag.getEntryDate().getTime());
        entity.setProperty(PROPERTY_HULPVRAAG, hulpvraag.getHulpvraag());
        entity.setProperty(PROPERTY_AFGEHANDELD, hulpvraag.getAfgehandeld() != null ?
                hulpvraag.getAfgehandeld().getTime() : -1);
        entity.setProperty(PROPERTY_DOCENT, hulpvraag.getDocent() != null ? hulpvraag.getDocent() : "");
        datastore.put(entity);
    }

    public static ArrayList<Hulpvraag> getOpenHulpvragen() {
        ArrayList<Hulpvraag> hulpvragen = new ArrayList<>();
        Query.Filter isOpenFilter = new Query.FilterPredicate(PROPERTY_AFGEHANDELD, Query.FilterOperator.LESS_THAN,
                1);
        Query q = new Query(KIND_HULPVRAAG)
                .setFilter(isOpenFilter)
                .addSort(PROPERTY_AFGEHANDELD)
                .addSort(PROPERTY_DATE,
                        Query.SortDirection.ASCENDING);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity entity : pq.asIterable()) {
            long id = entity.getKey().getId();
            String email = (String) entity.getProperty(PROPERTY_EMAIL);
            String vak = (String) entity.getProperty(PROPERTY_VAK);
            String vraag = (String) entity.getProperty(PROPERTY_HULPVRAAG);
            long date = (long) entity.getProperty(PROPERTY_DATE);
            String docent = null;
            long afgehandeld = 0;
            Hulpvraag hulpvraag = new Hulpvraag(id, email, vak, vraag, new Date(date), docent, new Date(afgehandeld));
            hulpvragen.add(hulpvraag);
        }
        return hulpvragen;
    }

    public static void deleteHulpvraag(long id, String docent) throws EntityNotFoundException {
        Key key = KeyFactory.createKey(KIND_HULPVRAAG, id);
        Entity entity = datastore.get(key);
        entity.setProperty(PROPERTY_AFGEHANDELD, new Date().getTime());
        entity.setProperty(PROPERTY_DOCENT, docent);
        datastore.put(entity);
    }

    public static void updateUser(StandUpUser user) {
        Key key = KeyFactory.createKey(KIND_USER, user.getEmail());
        try {
            Entity entity = datastore.get(key);
            entity.setProperty(PROPERTY_NAAM, user.getNaam());
            entity.setProperty(PROPERTY_GROEP, user.getGroep());
            entity.setProperty(PROPERTY_COHORT, user.getCohort());
            entity.setProperty(PROPERTY_STATUS, user.getStatus());
            datastore.put(entity);
        } catch (EntityNotFoundException e) {
            e.printStackTrace();
        }
    }


    // API

    public static JSONObject getPlanningenFromCohort(int cohort) throws JSONException {
        JSONObject jso = new JSONObject();

        Query.Filter cohortFilter = new Query.FilterPredicate(PROPERTY_COHORT, Query.FilterOperator.EQUAL,
                cohort);
        Query.Filter statusFilter = new Query.FilterPredicate(PROPERTY_STATUS, Query.FilterOperator.EQUAL,
                StandUpUser.STATUS_ACTIEF);
        Query.CompositeFilter compositeFilter = Query.CompositeFilterOperator.and(cohortFilter, statusFilter);

        Query q = new Query(KIND_USER).setFilter(compositeFilter).setKeysOnly();
        PreparedQuery pq = datastore.prepare(q);
        for (Entity entity : pq.asIterable()) {
            JSONObject jsouser = new JSONObject();
            Key key = entity.getKey();
            String email = key.getName();


            Key ancestorKey = KeyFactory.createKey(KIND_USER, email);
            Query q2 = new Query(KIND_PLANNING)
                    .setAncestor(ancestorKey)
                    .addSort(PROPERTY_DATE, Query.SortDirection.DESCENDING);
            PreparedQuery pq2 = datastore.prepare(q2);
            JSONArray planningdata = new JSONArray();
            for (Entity ent : pq2.asIterable()) {
                Planning pv2 = makePlanningFromEntity(ent);
                planningdata.put(pv2.getEntryDate().toString());
            }
            jsouser.put("email", email);
            jsouser.put("planningdata", planningdata);
            jso.put(email, jsouser);
        }
        return jso;
    }

}


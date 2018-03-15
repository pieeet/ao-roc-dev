package dailystandups;

import com.google.appengine.api.datastore.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Piet de Vries on 15-02-18.
 *
 */
class DataUtils {

    private static DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

    private static final String KIND_USER = "StandUpUser";
    private static final String KIND_PLANNING = "Planning";
    private static final String KIND_VAK = "Vak";
    private static final String KIND_TICKET = "Ticket";
    private static final String KIND_PLANNING_TICKET = "Planning_Ticket";

    private static final String PROPERTY_GROEP = "groep";
    private static final String PROPERTY_COHORT = "cohort";
    private static final String PROPERTY_NAAM = "naam";
    private static final String PROPERTY_EMAIL = "email";
    private static final String PROPERTY_LATEST_PLANNING_ID = "laatste_planning";
    private static final String PROPERTY_FORMER_PLANNING_ID = "vorige_planning";
    private static final String PROPERTY_DATE = "date";
    private static final String PROPERTY_PLANNING = "planning";
    private static final String PROPERTY_BELEMMERINGEN = "belemmeringen";
    private static final String PROPERTY_AFGEROND = "afgerond";
    private static final String PROPERTY_GEDAAN = "gedaan";
    private static final String PROPERTY_NOG_DOEN = "nog_doen";
    private static final String PROPERTY_REDEN_NIET_AF = "reden_niet_af";
    private static final String PROPERTY_CODE = "code";
    private static final String PROPERTY_VAK = KIND_VAK;
    private static final String PROPERTY_AANTAL_UREN = "aantal_uren";
    private static final String PROPERTY_PLANNING_ID = "planning_id";
    private static final String PROPERTY_TICKET_CODE = "ticketcode";

    static void saveUserAndPlanning(Planning planning, long vorigePlanningId, boolean isNew) {
        //save the user
        StandUpUser standUpUser = planning.getUser();
        Entity userEntity = new Entity(KIND_USER, standUpUser.getEmail());
        if (isNew) {
            userEntity.setProperty(PROPERTY_GROEP, standUpUser.getGroep());
            userEntity.setProperty(PROPERTY_COHORT, standUpUser.getCohort());

            //zorg dat naam begint met hoofdletter
            String naam = standUpUser.getNaam();
            String eersteLetter = naam.substring(0, 1).toUpperCase();
            naam = eersteLetter + naam.substring(1);
            userEntity.setProperty(PROPERTY_NAAM, naam);
            userEntity.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
            userEntity.setProperty(PROPERTY_LATEST_PLANNING_ID, planning.getDate().getTime());
            if (vorigePlanningId > 0) userEntity.setProperty(PROPERTY_FORMER_PLANNING_ID, vorigePlanningId);
            datastore.put(userEntity);
        }

        //save planning as child of user id=timestamp
        Entity planningEntity = new Entity(KIND_PLANNING, planning.getDate().getTime(), userEntity.getKey());
        planningEntity.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
        planningEntity.setProperty(PROPERTY_DATE, planning.getDate());
        planningEntity.setProperty(PROPERTY_PLANNING, planning.getPlanning());
        planningEntity.setProperty(PROPERTY_BELEMMERINGEN, planning.getBelemmeringen());
        planningEntity.setProperty(PROPERTY_AFGEROND, planning.isAfgerond());
        planningEntity.setProperty(PROPERTY_GEDAAN, planning.getGedaan());
        planningEntity.setProperty(PROPERTY_NOG_DOEN, planning.getNogTeDoen());
        planningEntity.setProperty(PROPERTY_REDEN_NIET_AF, planning.getRedenNietAf());
        datastore.put(planningEntity);
    }

    static void saveUserAndPlanning(PlanningV2 planning, long vorigePlanningId, boolean isNew) {

        //save the user
        StandUpUser standUpUser = planning.getUser();
        Entity userEntity = new Entity(KIND_USER, standUpUser.getEmail());
        if (isNew) {

            //update user
            userEntity.setProperty(PROPERTY_GROEP, standUpUser.getGroep());
            userEntity.setProperty(PROPERTY_COHORT, standUpUser.getCohort());
            //zorg dat naam begint met hoofdletter
            String naam = standUpUser.getNaam();
            String eersteLetter = naam.substring(0, 1).toUpperCase();
            naam = eersteLetter + naam.substring(1);
            userEntity.setProperty(PROPERTY_NAAM, naam);
            userEntity.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
            userEntity.setProperty(PROPERTY_LATEST_PLANNING_ID, planning.getEntryDate().getTime());
            if (vorigePlanningId > 0) userEntity.setProperty(PROPERTY_FORMER_PLANNING_ID, vorigePlanningId);
            datastore.put(userEntity);
        }

        //save planning as child of user id=timestamp
        Entity planningEntity = new Entity(KIND_PLANNING, planning.getEntryDate().getTime(), userEntity.getKey());
        planningEntity.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
        planningEntity.setProperty(PROPERTY_DATE, planning.getEntryDate());
        planningEntity.setProperty(PROPERTY_BELEMMERINGEN, planning.getBelemmeringen());
        planningEntity.setProperty(PROPERTY_AFGEROND, planning.isAfgerond());
        planningEntity.setProperty(PROPERTY_GEDAAN, planning.getGedaan());
        planningEntity.setProperty(PROPERTY_NOG_DOEN, planning.getNogTeDoen());
        planningEntity.setProperty(PROPERTY_REDEN_NIET_AF, planning.getRedenNietAf());
        datastore.put(planningEntity);

        //save tickets
        String[] ticketCodes = planning.getTicketIds();
        for (String ticketcode: ticketCodes) {
            Entity ticketUser = new Entity(KIND_PLANNING_TICKET, standUpUser.getEmail() + "_" +
                    planning.getEntryDate().getTime() +"-" + ticketcode);
            ticketUser.setProperty(PROPERTY_EMAIL, standUpUser.getEmail());
            ticketUser.setProperty(PROPERTY_PLANNING_ID, planning.getEntryDate().getTime());
            ticketUser.setProperty(PROPERTY_TICKET_CODE, ticketcode);

            datastore.put(ticketUser);
        }
    }

    static Planning getPlanning(String userId, boolean isLatest) {
        Key userKey = KeyFactory.createKey(KIND_USER, userId);
        try {
            Entity userEntity = datastore.get(userKey);
            return getPlanning(makeUserFromEntity(userEntity), isLatest);
        } catch (EntityNotFoundException e) {
            return null;
        }
    }

    static PlanningV2 getPlanningV2(String userId, boolean isLatest) {
        Key userKey = KeyFactory.createKey(KIND_USER, userId);
        try {
            Entity userEntity = datastore.get(userKey);
            return getPlanningV2(makeUserFromEntity(userEntity), isLatest);
        } catch (EntityNotFoundException e) {
            return null;
        }
    }

    private static StandUpUser makeUserFromEntity(Entity userEntity) {
        String email = (String) userEntity.getProperty(PROPERTY_EMAIL);
        String naam = (String) userEntity.getProperty(PROPERTY_NAAM);
        String groep = (String) userEntity.getProperty(PROPERTY_GROEP);
        StandUpUser user = new StandUpUser(email,naam, groep);
        user.setLaatstePlanningId((long) userEntity.getProperty(PROPERTY_LATEST_PLANNING_ID));
        if (userEntity.getProperty(PROPERTY_FORMER_PLANNING_ID) != null) {
            user.setVorigePlanningId((long) userEntity.getProperty(PROPERTY_FORMER_PLANNING_ID));
        } else {
            user.setVorigePlanningId(-1L);
        }
        return user;
    }

    private static Planning getPlanning(StandUpUser user, boolean isLatest) {
        long planningId;
        if (isLatest) planningId = user.getLaatstePlanningId();
        else planningId = user.getVorigePlanningId();
        Key planningKey = new KeyFactory.Builder(KIND_USER, user.getEmail())
                .addChild(KIND_PLANNING, planningId)
                .getKey();
        Entity planningEntity;
        try {
            planningEntity = datastore.get(planningKey);
            Planning planning = getPlanningFromEntity(planningEntity);
            planning.setUser(user);
            return planning;
        } catch (EntityNotFoundException e) {
            return null;
        }
    }

    private static PlanningV2 getPlanningV2(StandUpUser user, boolean isLatest) {
        long planningId;
        if (isLatest) planningId = user.getLaatstePlanningId();
        else planningId = user.getVorigePlanningId();
        Key planningKey = new KeyFactory.Builder(KIND_USER, user.getEmail())
                .addChild(KIND_PLANNING, planningId)
                .getKey();
        Entity planningEntity;
        try {
            planningEntity = datastore.get(planningKey);
            PlanningV2 planning = getPlanningV2FromEntity(planningEntity);
            planning.setUser(user);
            List<Ticket> tickets = getTicketsFromPlanning(planning);
            planning.setTickets(tickets.toArray(new Ticket[tickets.size()]));
            return planning;
        } catch (EntityNotFoundException e) {
            return null;
        }
    }

    private static Planning getPlanningFromEntity(Entity entity) {
        Planning planning = new Planning();
        planning.setDate((Date) entity.getProperty(PROPERTY_DATE));
        planning.setPlanning((String) entity.getProperty(PROPERTY_PLANNING));
        planning.setBelemmeringen((String) entity.getProperty(PROPERTY_BELEMMERINGEN));
        planning.setAfgerond((Boolean) entity.getProperty(PROPERTY_AFGEROND));
        planning.setGedaan((String) entity.getProperty(PROPERTY_GEDAAN));
        planning.setNogTeDoen((String) entity.getProperty(PROPERTY_NOG_DOEN));
        planning.setRedenNietAf((String) entity.getProperty(PROPERTY_REDEN_NIET_AF));
        return planning;
    }

    private static PlanningV2 getPlanningV2FromEntity(Entity entity) {
        PlanningV2 planning = new PlanningV2();
        planning.setEntryDate((Date) entity.getProperty(PROPERTY_DATE));
        planning.setPlanning((String) entity.getProperty(PROPERTY_PLANNING));
        planning.setBelemmeringen((String) entity.getProperty(PROPERTY_BELEMMERINGEN));
        planning.setAfgerond((Boolean) entity.getProperty(PROPERTY_AFGEROND));
        planning.setGedaan((String) entity.getProperty(PROPERTY_GEDAAN));
        planning.setNogTeDoen((String) entity.getProperty(PROPERTY_NOG_DOEN));
        planning.setRedenNietAf((String) entity.getProperty(PROPERTY_REDEN_NIET_AF));
        return planning;
    }

    static List<StandUpUser> getUsersFromCohortWithLatestPlanning(int cohort) {
        ArrayList<StandUpUser> users = new ArrayList<>();
        Query.Filter propertyFilter= new Query.FilterPredicate(PROPERTY_COHORT,
                Query.FilterOperator.EQUAL, cohort);

        Query q = new Query(KIND_USER).addSort(PROPERTY_NAAM,
                Query.SortDirection.ASCENDING).setFilter(propertyFilter);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity entity: pq.asIterable()) {
            StandUpUser user = makeUserFromEntity(entity);
            user.setHuidigePlanning(getPlanning(user, true));
            user.setVorigePlanning(getPlanning(user, false));
            users.add(user);
        }
        return users;
    }

    static ArrayList<Planning> getPlanningenFromUser(String email) {
        ArrayList<Planning> planningen = new ArrayList<>();
        Key ancestorKey = KeyFactory.createKey(KIND_USER, email);
        Query q = new Query(KIND_PLANNING)
                .setAncestor(ancestorKey)
                .addSort(PROPERTY_DATE, Query.SortDirection.DESCENDING);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity entity: pq.asIterable()) {
            planningen.add(getPlanningFromEntity(entity));
        }
        return planningen;
    }

    static void voegVakToe(Vak vak) {
        Entity entity = new Entity(KIND_VAK, vak.getNaam());
        entity.setProperty(PROPERTY_NAAM, vak.getNaam());
        datastore.put(entity);
    }

    static ArrayList<Vak> getVakken() {
        ArrayList<Vak> vakken = new ArrayList<>();
        Query q = new Query(KIND_VAK).addSort(PROPERTY_NAAM);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e: pq.asIterable()) {
            String naam = (String) e.getProperty(PROPERTY_NAAM);
            vakken.add(new Vak(naam));
        }
        return vakken;
    }

    static void voegTicketToe(Ticket ticket) {
        Entity entity = new Entity(KIND_TICKET, ticket.getCodeTicket());
        entity.setProperty(PROPERTY_VAK, ticket.getNaamVak());
        entity.setProperty(PROPERTY_CODE, ticket.getCodeTicket());
        entity.setProperty(PROPERTY_AANTAL_UREN, ticket.getAantalUren());
        datastore.put(entity);
    }

    static List<Ticket> getTickets(Vak vak) {
        ArrayList<Ticket> tickets = new ArrayList<>();
        Query.Filter propertyFilter= new Query.FilterPredicate(PROPERTY_VAK,
                Query.FilterOperator.EQUAL, vak.getNaam());
        Query q = new Query(KIND_TICKET).setFilter(propertyFilter).addSort(PROPERTY_CODE);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e: pq.asIterable()) {
            String vakProperty = (String) e.getProperty(PROPERTY_VAK);
            String code = (String) e.getProperty(PROPERTY_CODE);
            int aantalUren = (int) (long) e.getProperty(PROPERTY_AANTAL_UREN);
            tickets.add(new Ticket(vakProperty, code, aantalUren));
        }
        return tickets;
    }

    static List<Ticket> getTicketsFromPlanning(PlanningV2 planning) {
        List<Ticket> tickets = new ArrayList<>();
        Query.Filter emailFilter = new Query.FilterPredicate(PROPERTY_EMAIL, Query.FilterOperator.EQUAL,
                planning.getUser().getEmail());
        Query.Filter planningFilter = new Query.FilterPredicate(PROPERTY_PLANNING_ID, Query.FilterOperator.EQUAL,
                planning.getEntryDate().getTime());

        Query.Filter compositeFilter = Query.CompositeFilterOperator.and(emailFilter, planningFilter);
        Query q = new Query(KIND_PLANNING_TICKET).setFilter(compositeFilter).addSort(PROPERTY_TICKET_CODE);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e: pq.asIterable()) {
            String ticketCode = (String) e.getProperty(PROPERTY_TICKET_CODE);
            Key key = KeyFactory.createKey(KIND_TICKET, ticketCode);
            try {
                Entity ticketEntity = datastore.get(key);
                String vak = (String) ticketEntity.getProperty(PROPERTY_VAK);
                int aantalUren = (int) (long) ticketEntity.getProperty(PROPERTY_AANTAL_UREN);
                String code = (String) ticketEntity.getProperty(PROPERTY_CODE);
                tickets.add(new Ticket(vak, code, aantalUren));
            } catch (EntityNotFoundException ignored) {
            }
        }
        return tickets;
    }

}

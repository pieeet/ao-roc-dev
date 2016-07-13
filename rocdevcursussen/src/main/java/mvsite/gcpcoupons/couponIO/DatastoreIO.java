package mvsite.gcpcoupons.couponIO;

import com.google.appengine.api.datastore.*;
import mvsite.gcpcoupons.Coupon;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by piet on 12-07-16.
 */
public class DatastoreIO {


    private static final String TABEL_NAAM = "Coupon";
    private static final String PROPERTY_CODE = "coupon_code";
    private static final String PROPERTY_SCHOOLJAAR = "schooljaar";
    private static final String PROPERTY_EMAILGEBRUIKER = "email_gebruiker";


    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();


    public void voegCouponToe(Coupon coupon) {
        Entity ent = new Entity(TABEL_NAAM, coupon.getCode());
        ent.setProperty(PROPERTY_CODE, coupon.getCode());
        ent.setProperty(PROPERTY_SCHOOLJAAR, coupon.getSchooljaar());
        ent.setProperty(PROPERTY_EMAILGEBRUIKER, coupon.getEmailUser());

        datastore.put(ent);
    }




    //haalt coupon van gebruiker
    public Coupon[] getCoupons(int schooljaar, String emailUser) {
        Coupon[] coupons = null;
        Query.Filter jaarFilter = new Query.FilterPredicate(PROPERTY_SCHOOLJAAR, Query.FilterOperator.EQUAL,
                schooljaar);
        Query.Filter userFilter = new Query.FilterPredicate(PROPERTY_EMAILGEBRUIKER, Query.FilterOperator.EQUAL,
                emailUser);
        Query.CompositeFilter jaarEnUserFilter = Query.CompositeFilterOperator.and(jaarFilter, userFilter);
        Query q = new Query(TABEL_NAAM).setFilter(jaarEnUserFilter);
        List<Entity> results = datastore.prepare(q).asList(FetchOptions.Builder.withDefaults());
        //gebruiker heeft al een coupon
        if (!results.isEmpty()) {
            coupons = new Coupon[results.size()];
            for (int i = 0; i < results.size(); i++) {
                String code = (String) results.get(i).getProperty((PROPERTY_CODE));
                coupons[i] = new Coupon(schooljaar, code, emailUser);
            }

        // er wprdt een coupon gezocht
        } else {
            userFilter = new Query.FilterPredicate(PROPERTY_EMAILGEBRUIKER, Query.FilterOperator.EQUAL, "");
            jaarEnUserFilter = Query.CompositeFilterOperator.and(jaarFilter, userFilter);
            q = new Query(TABEL_NAAM).setFilter(jaarEnUserFilter);
            results = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(1));
            if (!results.isEmpty()) {
                Entity en = results.get(0);
                String code = (String) en.getProperty(PROPERTY_CODE);
                coupons = new Coupon[1];
                coupons[0] = new Coupon(schooljaar, code, emailUser);
                voegCouponToe(coupons[0]);
            }
        }
        return coupons;

    }


    public ArrayList<Coupon> getBeschikbareCouponsVanJaar(int schooljaar) {
        ArrayList<Coupon> coupons = getAlleCouponsVanJaar(schooljaar);
        ArrayList<Coupon> beschikbareCoupons = new ArrayList<>();
        for (Coupon coupon: coupons) {
            if (coupon.getEmailUser() == null) {
                beschikbareCoupons.add(coupon);
            }
        }

        return beschikbareCoupons;
    }

    public ArrayList<Coupon> getGebruikteCouponsVanJaar(int schooljaar) {
        ArrayList<Coupon> coupons = getAlleCouponsVanJaar(schooljaar);
        ArrayList<Coupon> gebruikteCoupons = new ArrayList<>();
        for (Coupon coupon: coupons) {
            if (coupon.getEmailUser() != null) {
                gebruikteCoupons.add(coupon);
            }
        }
        return gebruikteCoupons;
    }

    private ArrayList<Coupon> getAlleCouponsVanJaar(int schooljaar) {
        ArrayList<Coupon> coupons = new ArrayList<>();
        Query.Filter schooljaarFilter = new Query.FilterPredicate(PROPERTY_SCHOOLJAAR,
                Query.FilterOperator.EQUAL,
                schooljaar);
        Query q = new Query(TABEL_NAAM).setFilter(schooljaarFilter);
        PreparedQuery pq = datastore.prepare(q);
        for (Entity e: pq.asIterable()) {
            int schljr = (int) (long) e.getProperty(PROPERTY_SCHOOLJAAR);
            String code = (String) e.getProperty(PROPERTY_CODE);
            String emailUser = (String) e.getProperty(PROPERTY_EMAILGEBRUIKER);
            Coupon coupon = new Coupon(schljr, code, emailUser);
            coupons.add(coupon);
        }
        return coupons;
    }



}

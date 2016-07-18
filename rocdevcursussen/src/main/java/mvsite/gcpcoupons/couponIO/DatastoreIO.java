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
    private static final String PROPERTY_SCHOOLJAAR = "schooljaar";
    private static final String PROPERTY_GEBRUIKER = "email_gebruiker";
    private static final String PROPERTY_LEEG = "";

    DatastoreService datastore;

    public DatastoreIO() {
        datastore = DatastoreServiceFactory.getDatastoreService();
    }

    public void voegCouponToe(Coupon coupon) {
        //code = key
        Entity ent = new Entity(TABEL_NAAM, coupon.getCode());
        ent.setProperty(PROPERTY_SCHOOLJAAR, coupon.getSchooljaar());
        ent.setProperty(PROPERTY_GEBRUIKER, coupon.getEmailUser());
        datastore.put(ent);
    }

    //haalt coupon van gebruiker
    public Coupon[] getCoupons(int schooljaar, String emailUser) {
        Coupon[] coupons = null;
        Query.Filter jaarFilter = new Query.FilterPredicate(PROPERTY_SCHOOLJAAR, Query.FilterOperator.EQUAL,
                schooljaar);

        //haalt alle coupons van gebruiker
        Query.Filter userFilter = new Query.FilterPredicate(PROPERTY_GEBRUIKER, Query.FilterOperator.EQUAL,
                emailUser);
        Query.CompositeFilter jaarEnUserFilter = Query.CompositeFilterOperator.and(jaarFilter, userFilter);

        //we hebben alleen de keys (couponcodes) nodig
        Query q = new Query(TABEL_NAAM).setFilter(jaarEnUserFilter).setKeysOnly();
        List<Entity> results = datastore.prepare(q).asList(FetchOptions.Builder.withDefaults());

        //als gebruiker al coupons heeft is lijst niet leeg
        if (!results.isEmpty()) {
            coupons = new Coupon[results.size()];
            for (int i = 0; i < results.size(); i++) {
                coupons[i] = new Coupon(schooljaar, results.get(i).getKey().getName(), emailUser);
            }

        //gebruiker heeft geen coupons, er wprdt een ongebruikte coupon gehaald (gebruiker == "")
        } else {
            userFilter = new Query.FilterPredicate(PROPERTY_GEBRUIKER, Query.FilterOperator.EQUAL, PROPERTY_LEEG);
            jaarEnUserFilter = Query.CompositeFilterOperator.and(jaarFilter, userFilter);
            q = new Query(TABEL_NAAM).setFilter(jaarEnUserFilter).setKeysOnly();

            //we hoeven maar één ongebruikte code (limit == 1)
            results = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(1));

            //als er nog een ongebruikte coupon is
            if (!results.isEmpty()) {
                Entity entity = results.get(0);
                coupons = new Coupon[1];
                coupons[0] = new Coupon(schooljaar, entity.getKey().getName(), emailUser);
                voegCouponToe(coupons[0]);
            }
        }
        return coupons;
    }
}

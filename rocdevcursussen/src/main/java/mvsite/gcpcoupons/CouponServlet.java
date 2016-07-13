package mvsite.gcpcoupons;

import mvsite.gcpcoupons.couponIO.DatastoreIO;
import org.json.JSONArray;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by piet on 12-07-16.
 */
public class CouponServlet extends HttpServlet {
    String test = "09VF-9NCD-LYV6-RKVW,0BND-XXAM-QCX9-B0NC,0QL8-0H0U-N5DE-D3KH,0UNC-HD7D-MP8P-MU4Q,0Y3B-GPPL-LFKP-EP5J,0YB5-47VL-5X7R-KELX,10BD-TKXW-V0YP-TV0Q,18L4-1C4F-E1VT-HCWW,1FVX-W219-YB87-EWUA,1HPK-3KN2-X9RV-XLU1,1N3T-1C5E-TE9X-KAYL,1V1F-9J73-WUWA-K13T,1XFN-RKPU-DMJR-7NPB,23KG-51VN-F7YK-VJYA,2QF7-JRJT-86LK-88QG,2TY8-8KXC-0NWH-1X16,2YE9-4ATG-9PBQ-0WA1,3EY0-7782-EVDN-KN5U,3EY4-BTK2-KY69-K5EW,3MD7-HR3W-HYTX-W8X7,3P78-LYKV-5FQ7-06TQ,3RDD-8CNT-HCLE-8P62,3X8Y-W2QL-T8D0-1K8A,4290-DLLG-NQP7-BEKU,44A5-TLYH-4DRN-YT9U,52V4-JFJA-TMBC-FDTE,57BE-DUB6-U11P-Y996,5RP3-VTMW-UW27-ELPP,6CEJ-8E57-JF76-BGH8,6K0Q-3YRL-A1WL-1VEP,6N4J-U3UJ-PH0P-157Y,6NDJ-X3W9-CL5L-PEK0,7VQQ-9W0E-7FFB-PLF7,7XC4-RWHD-UX1G-RCM5,8064-JB83-R5AW-DRXL,8NYW-N77L-ACQM-QB54,92U3-UNQC-XJ1K-T12V,9AMV-MFQ3-34E4-Y8FW,9BT7-2THC-FM8P-2KX0,9K6E-XMLJ-VWMK-52Q2,9R00-QFH2-GGY3-EPXB,9XJM-K9C2-PYG8-3QYM,A7J3-Y9R1-EYNB-37N6,AATJ-47TN-QE9P-PBLM,APU8-REPA-AAA3-0AR2,BFGR-W56D-R3W7-WJC6,CGW8-CRY2-ET2L-5L2T,DA3R-40PA-LCHP-PD7G,DCKL-2X7Y-5C5H-JV61,DETX-93CM-DYD6-F2WD,DG79-931B-NMBJ-4TMP,DQ3L-UR24-C3H5-6DTX,DXL1-FNEN-7QT3-GFR8,E8Y4-L1ED-577M-N7G2,EHCY-QV36-P07M-F7AA,EXMR-CM7F-MM1B-4PYF,FLV1-KK6P-VMQ0-5P89,FT57-C1AU-YTQL-0UV5,G657-XE4X-NHJD-6LQT,G944-YNVD-JF0L-RX8K,GHBG-55BD-NAN2-UHHV,GNEA-XNDE-0UA9-7YQX,HACU-C5V6-E969-1V29,HJT0-MPPL-Y4NR-092W,HKWU-AP8E-VBHH-YXCQ,HPMF-03U3-Q63Q-R7W4,HPVF-VBFQ-LACQ-5F8M,J110-1VD8-GNPK-FJDC,J57A-CFAD-HHQW-R7WD,JEW2-6RM2-AAGV-E16Q,K9T4-PPUL-F9U3-AWBM,KLXN-Q8FV-VR1Y-KVH5,KU6N-LHDH-UYKQ-W3EP,LHAC-KUE0-RV2Y-UQF7,M74T-UKW5-MRDL-GDXM,N9XV-VRXV-KQX2-8QD6,NJ5E-YNVV-DWDM-KM2M,Q24F-EDHQ-JMVW-JQWP,Q5DE-13D8-KTLY-M4K2,Q68P-7TE2-7R7E-M3UF,QPH1-X04Q-5PV0-B6N1,QTV6-W58T-23VB-KA0B,QU46-8UWA-TK3G-3MYD,R93E-7BP4-V7VA-8E1T,RGRY-K8RD-M3XK-KBML,RKXP-BKNT-E8F2-KJAW,RKY6-1D8T-UM7B-9Y4L,RMH8-LGQC-0B8Y-RKLK,RYYV-KK58-BD4J-NWCX,T231-66CA-050W-52BY,TEL0-GJYK-HJ0L-BW5H,TG0K-7X0L-1DYG-6MJ4,TQ3W-TKCA-XHAD-CCK1,U8D2-0FLB-G6QC-P1WG,UAR0-JTK5-Q656-X1Q6,UENW-A156-HDU6-DQUK,UJJ7-K1BC-H3CB-G25M,UMKB-U5MG-U3X0-47EW,V3WV-UQGT-5XKM-N5G2,V8WW-M73L-BJR6-FEUJ,V9DD-7DCA-3545-8QY2,VE38-86LW-UF6D-6C1L,VN7G-980X-RQKH-0FQU,VVB0-J3BR-B2G4-ML1U,VX0M-2FMQ-NU3N-0EV8,VYP6-XGX7-40PH-K5VT,W8KU-8FDU-K9W1-T0TV,WARJ-AHTX-YE1D-HJWE,WDWP-4RV5-0J7U-L9VA,WNB4-6BMR-67DJ-B5GF,X174-GRUA-YY95-PDE0,XNV9-ED0L-JX6L-NDMH,XRL4-U28N-8AHA-PV2T,XY2P-U7K9-04T7-B0E5,Y7LK-HWUU-WF9M-A99E,YF59-KN01-P3QD-V9AT,YFGR-861D-YTYT-JJ2P,YKEH-BMT3-4H5T-A86K,YPQ8-W13P-UJHQ-HRW1,YT15-HCNL-N0F8-580W";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String[] schooljaren = {"2016"};
        req.setAttribute("schooljaren", schooljaren);
        RequestDispatcher disp = req.getRequestDispatcher("/AO/Coupons/coupons.jsp");
        disp.forward(req, resp);



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DatastoreIO io = new DatastoreIO();

        if (req.getParameter("nieuwe_coupon") != null) {
            String codeString = req.getParameter("coupon_code");
            String[] codes = codeString.split(",");
            int jaar = Integer.parseInt(req.getParameter("jaar_coupon"));
            int i = 1;
            for (String code: codes) {
                Coupon coupon = new Coupon(jaar, code);
                io.voegCouponToe(coupon);
                System.out.println("coupon" + i + ": " + coupon.getCode());
                i++;
            }
            resp.getWriter().print("" + codes.length);

        }else if (req.getParameter("get_coupon_button") != null) {
            int schooljaar = Integer.parseInt(req.getParameter("schooljaar"));
            String emailUser = req.getParameter("username");
            Coupon[] coupons = io.getCoupons(schooljaar, emailUser);
            JSONArray jsonArray = new JSONArray();
            if (coupons != null) {
                for (Coupon coupon: coupons) {
                    jsonArray.put(coupon.getCode());
                }

            } else {
                jsonArray.put("Geen coupon gevonden");
            }
            System.out.println(jsonArray.toString());
            resp.getWriter().print(jsonArray.toString());

        } else if (req.getParameter("geef_coupon_terug_button") != null) {

        }

    }
}

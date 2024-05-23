using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_registration
{
    public partial class Return : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                // Verify that the paymentId is not null or empty
                string paymentId = Request.Form["razorpay_payment_id"];
                if (string.IsNullOrEmpty(paymentId))
                {
                    // Handle the case when paymentId is null or empty
                    // ...
                    return;
                }

                // Verify payment signature
                int am = Convert.ToInt32(Math.Round(Convert.ToDouble(Session["totalprice"].ToString())));
                Dictionary<string, object> input = new Dictionary<string, object>();
                input.Add("amount", am); // this amount should be same as transaction amount

                string key = "rzp_test_cvwiiVvHjyJrmr";
                string secret = "J4d2RxfQ97udLpP5JSNuvwSH";

                RazorpayClient client = new RazorpayClient(key, secret);
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                Dictionary<string, string> attributes = new Dictionary<string, string>();

                attributes.Add("razorpay_payment_id", paymentId);
                attributes.Add("razorpay_order_id", Request.Form["razorpay_order_id"]);
                attributes.Add("razorpay_signature", Request.Form["razorpay_signature"]);

                Utils.verifyPaymentSignature(attributes);

                // Verify that Session["product"] and Session["totalprice"] are not null
                if (Session["product"] != null && Session["totalprice"] != null)
                {
                    // Display payment details
                    Literal1.Text = "<table style='width:100%' border='1'><tr><td>Product Name:</td><td>" + Session["product"].ToString() + "</td></tr><tr><td>Amount ₹:</td><td>" + Session["totalprice"].ToString() + "</td></tr><tr><td>Payment Status:</td><td>Successful</td></tr></table>";
                }
                else
                {
                    // Handle the case when Session values are null
                    // ...
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                // Log or display the error as needed
            }
        }
    }
}

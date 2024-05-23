using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Security.Policy;
using System.Web.UI;
using System.Security.Cryptography;

namespace project_registration
{
    public partial class membershipaspx : System.Web.UI.Page
    {
        protected void Submit_Click(object sender, EventArgs e)
        {
            if (IsEmailAlreadyExists(txtEmail.Text))
            {
                // Email already exists, show an error message
                string script = "alert('Email address is already in use. Please choose a different one.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmailExistsScript", script, true);
            }
            else
            {
                try
                {
                    // Prepare data for Razorpay order creation
                    Dictionary<string, object> input = new Dictionary<string, object>();
                    input.Add("amount", 50000); // Example amount
                    input.Add("currency", "INR");
                    input.Add("receipt", Guid.NewGuid().ToString()); // Unique receipt ID
                    input.Add("payment_capture", 1); // Automatically capture payment

                    // Create a new Razorpay client instance
                    string key = "rzp_test_cvwiiVvHjyJrmr";
                    string secret = "J4d2RxfQ97udLpP5JSNuvwSH";
                    RazorpayClient client = new RazorpayClient(key, secret);

                    // Create a new order using Razorpay client
                    Razorpay.Api.Order order = client.Order.Create(input);

                    string orderId = order["id"].ToString();
                    string paymentId = ""; // Initialize paymentId

                    // Get the payment ID from the response
                    paymentId = order["id"].ToString();

                    // Save payment details to the database along with user input data
                    SavePaymentToDatabase(paymentId, orderId, txtName.Text, txtEmail.Text, txtContact.Text);

                    // Call JavaScript function to open Razorpay payment gateway with order ID
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "RazorpayScript", $"OpenRazorpay('{orderId}');", true);
                }
                catch (Exception ex)
                {
                    // Handle exception
                    string errorMessage = "An error occurred while processing your payment. Please try again later.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorScript", $"alert('{errorMessage}');", true);
                }
            }
        }

        private bool IsEmailAlreadyExists(string Email)
        {
            // Check if the email already exists in the database
            SqlConnection conn = new SqlConnection("Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM membership WHERE Email = @Email", conn);
            cmd.Parameters.AddWithValue("@Email", Email);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            return count > 0;
        }




        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["session_id"] == null || Session["User_id"] == null)
            {
                Response.Redirect("Login.aspx");

            }

          
            if (!IsPostBack)
            {
                // Check if the payment response from Razorpay is available in query parameters
                if (!string.IsNullOrEmpty(Request.QueryString["razorpay_payment_id"]))
                {
                    // Payment response received from Razorpay
                    string paymentId = Request.QueryString["razorpay_payment_id"];
                    string orderId = Request.QueryString["razorpay_order_id"];

                    // Save payment details to the database
                   // SavePaymentToDatabase(paymentId, orderId, txtName.Text, txtEmail.Text, txtContact.Text);

                    // Show confirmation popup
                    string successMessage = "Your payment was successful. Thank you!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessScript", $"alert('{successMessage}');", true);
                }
            }
        }

        private DateTime CalculateMembershipExpiry()
        {
            // Get the current date
            DateTime currentDate = DateTime.Now;

            // Add 28 days to the current date to get the expiry date
            DateTime expiryDate = currentDate.AddDays(28);

            return expiryDate;
        }

        private void SavePaymentToDatabase(string paymentId, string orderId, string uname, string Email, string Phone)
        {
            DateTime expiryDate = CalculateMembershipExpiry();

            try
            {
                // Connect to the database
                string connectionString = "Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {

                  
                    // Insert payment details into the database
                    string query = "INSERT INTO membership (PaymentId, OrderId, uname, Email, Phone, expiryDate) VALUES (@PaymentId, @OrderId, @Name, @Email, @Contact, @ExpiryDate)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PaymentId", paymentId);
                        cmd.Parameters.AddWithValue("@OrderId", orderId);
                        cmd.Parameters.AddWithValue("@Name", uname);
                        cmd.Parameters.AddWithValue("@Email", Email);
                        cmd.Parameters.AddWithValue("@Contact", Phone);
                        cmd.Parameters.AddWithValue("@ExpiryDate", expiryDate);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                SendResetEmail(paymentId, orderId, uname, Email, Phone, expiryDate);
            }
            catch (Exception ex)
            {
                // Handle exception
                string errorMessage = "An error occurred while saving payment details to the database.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorScript", $"alert('{errorMessage}');", true);
            }
        }

        private void SendResetEmail(
    string paymentId,
    string orderId,
    string uname,
    string Email,
    string Phone,
    DateTime expiryDate

   )
        {

            // Gmail SMTP configuration
            string smtpHost = "smtp.gmail.com";
            int smtpPort = 587;
            string smtpUsername = "knowd1499@gmail.com";
            string smtpPassword = "ozmucgigsgfyuwav";

            // Email content
            string subject = "Premium Membership  - NutriAssure";
            string body = $@"
                    <html>
                        <body style='font-family: Arial, sans-serif;'>
                            <p>Dear {uname},</p>
                          <p>Thank you for taking premium membership! Here is your membership confirmation:</p>

                            <table style='border: 1px solid #dddddd; border-collapse: collapse; width: 100%; margin-top: 20px;'>
                                <tr>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'><strong>Email:</strong></td>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'>{Email}</td>
                                </tr>
                                <tr>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'><strong>Contact:</strong></td>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'>{Phone}</td>
                                </tr>
                                <tr>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'><strong>paymentID:</strong></td>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'>{paymentId}</td>
                                </tr>
                                        <tr>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'><strong>orderID:</strong></td>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'>{orderId}</td>
                                </tr>                                                                            
                                <tr>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'><expirydate:</strong></td>
                                    <td style='border: 1px solid #dddddd; padding: 8px;'>{expiryDate} </td>
                                </tr>
                                                                        
                             </table>

                            <p style='margin-top: 20px;'><strong>Total Amount:</strong> <b> <u> 500 </u> rupees only /- </b> </p>

                            <p style='margin-top: 20px;'>Thank you for choosing NutriAssure! We look forward to serving you.</p>
                            <p>Sincerely,<br>NutriAssure</p>
                        </body>
                    </html>
                    ";


            using (SmtpClient smtpClient = new SmtpClient(smtpHost, smtpPort))
            {
                smtpClient.EnableSsl = true;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);

                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(smtpUsername);
                    mailMessage.To.Add(Email);
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;

                    smtpClient.Send(mailMessage);
                }



            }
        }
    }
}

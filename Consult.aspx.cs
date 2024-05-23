using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace project_registration
{
    public partial class Consult : Page
    {
        private const string connectionString = "Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True";

        int amount;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["session_id"] == null || Session["User_id"] == null)
            {
                Response.Redirect("Login.aspx");

            }

            string userId = Session["User_id"].ToString();
            // string userEmail = ""; // Assuming you have obtained the email associated with the user

            // Check if the user email is present in the membership table
            string connectionString = "Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM membership WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", userId);
                    int count = (int)cmd.ExecuteScalar();

                    if (count == 0)
                    {
                        // User email not found in membership table, redirect to login page
                         amount = 100000;


                    }
                    else
                    {
                        amount = 50000;
                    }

                }
            }


            if (!IsPostBack)
            {
                // Initialize the dropdown list
                List<string> availableTimeSlots = GetAvailableTimeSlots();
                preferredTime.DataSource = availableTimeSlots;
                preferredTime.DataBind();

                // Disable past dates in the calendar and allow booking for the next day
                DateTime nextDay = DateTime.Now.AddDays(1);
                preferredDate.Attributes["min"] = nextDay.ToString("yyyy-MM-dd");
            }

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

        private List<string> GetAvailableTimeSlots()
        {
            // Sample list of time slots, you should replace this with your actual data
            List<string> timeSlots = new List<string>
            {
                "9:00 AM - 10:00 AM",
                "10:00 AM - 11:00 AM",
                "11:00 AM - 12:00 PM",
                // Add more time slots as needed
            };

            return timeSlots;
        }

        protected void BookAppointment_Click(object sender, EventArgs e)
        {
            string selectedTimeSlot = preferredTime.SelectedValue;
            string selectedDateText = preferredDate.Text;
            string userEmail = email.Text.Trim();
            string userName = name.Text.Trim();
            string userPhone = phone.Text.Trim();

            // Parse the selected date
            DateTime selectedDate;
            if (DateTime.TryParseExact(selectedDateText, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out selectedDate))
            {
                // Check if the selected time slot is available
                if (IsTimeSlotAvailable(selectedTimeSlot, selectedDate))
                {
                    // Initiate Razorpay payment process
                    InitiatePayment(selectedTimeSlot, selectedDate, userEmail, userName, userPhone);
                    InsertConsultancyDetails(selectedTimeSlot, selectedDate);
                    SendBookingConfirmationEmail(userEmail, userName, userPhone, selectedTimeSlot, selectedDate);

                }
                else
                {
                    // Show a pop-up indicating the time slot is already booked
                    ScriptManager.RegisterStartupScript(this, GetType(), "TimeSlotNotAvailableAlert", "alert('This time slot is already booked.');", true);
                }
            }
            else
            {
                // Show an error message for an invalid date format
                ScriptManager.RegisterStartupScript(this, GetType(), "InvalidDateAlert", "alert('Invalid date format.');", true);
            }
        }

        private bool IsTimeSlotAvailable(string selectedTimeSlot, DateTime selectedDate)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT IsBooked FROM TimeSlots WHERE SlotTime = @SelectedTimeSlot AND BookingDate = @SelectedDate";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    string startTime = selectedTimeSlot.Split('-')[0].Trim();
                    command.Parameters.AddWithValue("@SelectedTimeSlot", startTime);
                    command.Parameters.AddWithValue("@SelectedDate", selectedDate.ToString("yyyy-MM-dd"));

                    connection.Open();
                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        return !(bool)result;
                    }
                    else
                    {
                        // If no record found, assume the slot is available
                        return true;
                    }
                }
            }
        }

        private void InitiatePayment(string selectedTimeSlot, DateTime selectedDate, string userEmail, string userName, string userPhone)
        {
            try
            {
                // Prepare data for Razorpay order creation
                Dictionary<string, object> input = new Dictionary<string, object>();
                input.Add("amount", amount); // Updated amount to 1000 INR
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
                // SavePaymentToDatabase(paymentId, orderId, txtName.Text, txtEmail.Text, txtContact.Text);

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

        private void InsertConsultancyDetails(string selectedTimeSlot, DateTime selectedDate)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ConsultancyDetails (Name, Email, Phone, PreferredDate, PreferredTime, AppointmentType, AdditionalInformation) " +
                               "VALUES (@Name, @Email, @Phone, @PreferredDate, @PreferredTime, @AppointmentType, @AdditionalInformation)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Set parameters based on your form fields
                    command.Parameters.AddWithValue("@Name", name.Text);
                    command.Parameters.AddWithValue("@Email", email.Text);
                    command.Parameters.AddWithValue("@Phone", phone.Text);
                    command.Parameters.AddWithValue("@PreferredDate", selectedDate);
                    command.Parameters.AddWithValue("@PreferredTime", selectedTimeSlot);

                    // Assuming you have radio buttons for appointment type
                    string appointmentType = offlineRadioButton.Checked ? "Offline" : "Online";
                    command.Parameters.AddWithValue("@AppointmentType", appointmentType);

                    command.Parameters.AddWithValue("@AdditionalInformation", message.Text);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void SendBookingConfirmationEmail(string userEmail, string userName, string userPhone, string selectedTimeSlot, DateTime selectedDate)
        {
            try
            {
                // Replace the placeholders with your actual SMTP server details
                string smtpHost = "smtp.gmail.com";
                int smtpPort = 587; // Replace with the actual port
                string smtpUsername = "knowd1499@gmail.com";
                string smtpPassword = "ozmucgigsgfyuwav"; // Use the generated App Password here

                using (SmtpClient smtpClient = new SmtpClient(smtpHost, smtpPort))
                {
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
                    smtpClient.EnableSsl = true;

                    // Create the email message
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress("knowd1499@gmail.com"); // Replace with your actual sender email
                    mailMessage.To.Add(userEmail);
                    mailMessage.Subject = "Booking Confirmation";

                    // Enhanced email body with design
                    mailMessage.Body = $@"
                        <!DOCTYPE html>
                        <html lang='en'>
                        <head>
                            <meta charset='UTF-8'>
                            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                            <style>
                                body {{
                                    font-family: 'Arial', sans-serif;
                                    background-color: #f4f4f4;
                                    padding: 20px;
                                    text-align: center;
                                }}
                                .container {{
                                    max-width: 600px;
                                    margin: 0 auto;
                                    background-color: #fff;
                                    padding: 20px;
                                    border-radius: 10px;
                                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                                }}
                                h1 {{
                                    color: #007bff;
                                }}
                                p {{
                                    color: #333;
                                    line-height: 1.6;
                                }}
                            </style>
                        </head>
                        <body>
                            <div class='container'>
                                <h1>Booking Confirmation</h1>
                                <p>Dear {userName},</p>
                                <p>Your booking for {selectedTimeSlot} on {selectedDate:yyyy-MM-dd} is confirmed.</p>
                                <p>Thank you!</p>
                            </div>
                        </body>
                        </html>
                    ";

                    mailMessage.IsBodyHtml = true;

                    // Send the email
                    smtpClient.Send(mailMessage);

                    // Log success
                    System.Diagnostics.Debug.WriteLine($"Email sent to {userEmail} for booking on {selectedDate:yyyy-MM-dd} at {selectedTimeSlot}");
                }
            }
            catch (Exception ex)
            {
                // Log or display the exception details for debugging
                System.Diagnostics.Debug.WriteLine($"Error sending email: {ex.Message}");
                ScriptManager.RegisterStartupScript(this, GetType(), "EmailErrorAlert", $"alert('Error sending email: {ex.Message}');", true);
            }
        }
    }
}

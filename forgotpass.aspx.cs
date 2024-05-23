using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;

namespace CRUD
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string connectionString = "Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        // ... existing code ...

        protected void BtnForgotPassword_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text.Trim();

                // Check if the email exists in the database
                string username;
                string newPassword;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("SELECT FullName FROM users WHERE Email = @Email", conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                username = reader["FullName"].ToString();
                                newPassword = GenerateRandomPassword();

                                // Log the generated password
                                LogMessage($"Generated password: {newPassword}");

                                // Update the user's password in the database with the new temporary password
                                UpdatePassword(username, newPassword);

                                // Send a password reset link to the user's email
                                SendResetEmail(email, username, newPassword);

                                lblMessage.Text = "Password reset successful. Check your email for further instructions.";
                            }
                            else
                            {
                                // User with the provided email does not exist
                                lblMessage.Text = "User with the provided email does not exist.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        // ... existing code ...


        private string GenerateRandomPassword()
        {
            // Generate a random password (you may use a more secure method)
            return Guid.NewGuid().ToString().Substring(0, 8);
        }

        // ... existing code ...

        private void UpdatePassword(string username, string newPassword)
        {
            try
            {
                // Hash the new password before updating in the database
                string hashedPassword = HashPassword(newPassword);

                // Log the generated and hashed password
                LogMessage($"Generated password: {newPassword}");
                LogMessage($"Hashed password before update: {hashedPassword}");

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("UPDATE users SET Password=@Password WHERE FullName=@FullName", conn))
                    {
                        cmd.Parameters.AddWithValue("@Password", newPassword);
                        cmd.Parameters.AddWithValue("@FullName", username);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected == 0)
                        {
                            LogMessage($"No rows updated for user {username}. Check if the user exists in the database.");
                        }
                    }
                }

                // Log the successful update
                LogMessage($"Password updated successfully for user {username}");
            }
            catch (Exception ex)
            {
                // Log the exception
                LogException(ex);
                throw; // Re-throw the exception to propagate it to the caller
            }
        }


        private void LogMessage(string message)
        {
            // Implement logging logic, e.g., write to a log file or log database table
            // Example: File.AppendAllText("logfile.txt", $"{DateTime.Now} - {message}\n");
        }

        private void LogException(Exception ex)
        {
            // Implement logging logic for exceptions
            // Example: File.AppendAllText("errorlog.txt", $"{DateTime.Now} - {ex.ToString()}\n");
        }

        // ... existing code ...


        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }

        // Modify the SendResetEmail method
        private void SendResetEmail(string email, string username, string newPassword)
        {
            try
            {
                // Gmail SMTP configuration
                string smtpHost = "smtp.gmail.com";
                int smtpPort = 587;
                string smtpUsername = "knowd1499@gmail.com";
                string smtpPassword = "ozmucgigsgfyuwav";

                // Email content
                string subject = "Password Reset - NutriAssure";
                string body = $"Dear {username},\n\nYour password has been reset to: {newPassword}\n\nPlease change your password after logging in.\n\nSincerely,\nNutriAssure";

                using (SmtpClient smtpClient = new SmtpClient(smtpHost, smtpPort))
                {
                    smtpClient.EnableSsl = true;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);

                    using (MailMessage mailMessage = new MailMessage())
                    {
                        mailMessage.From = new MailAddress(smtpUsername);
                        mailMessage.To.Add(email);
                        mailMessage.Subject = subject;
                        mailMessage.Body = body;

                        smtpClient.Send(mailMessage);
                    }

                    // Log success message after sending the email
                    LogMessage($"Password reset email sent successfully to {email}");
                }
            }
            catch (Exception ex)
            {
                // Log the exception
                LogException(ex);
                lblMessage.Text = "An error occurred while sending the password reset email. Please try again later.";
            }
        }

    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace YourNamespace
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (IsEmailAlreadyExists(Email_TextBox.Text))
            {
                // Email already exists, show an error message
                string script = "alert('Email address is already in use. Please choose a different one.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmailExistsScript", script, true);
            }
            else
            {
                try
                {
                    string fullname = Name_TextBox.Text;
                    string MobileNo = Mobile_TextBox.Text;
                    string email = Email_TextBox.Text;
                    string password = Password_TextBox.Text;

                    // Save the user data to the database
                    using (SqlConnection conn = new SqlConnection("Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True"))
                    {
                        conn.Open();

                        using (SqlCommand cmd = new SqlCommand("INSERT INTO users(FullName, MobileNo, Email, Password) VALUES (@FullName, @MobileNo, @Email, @Password)", conn))
                        {
                            cmd.Parameters.AddWithValue("@FullName", fullname);
                            cmd.Parameters.AddWithValue("@MobileNo", MobileNo);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Password", password);

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                lblMessage.Text = "Record Inserted Successfully";
                            }
                            else
                            {
                                lblMessage.Text = "Record Not Inserted";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }

        }

        private bool IsEmailAlreadyExists(string email)
        {
            // Check if the email already exists in the database
            SqlConnection conn = new SqlConnection("Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True");
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM users WHERE Email = @User_id", conn);
            cmd.Parameters.AddWithValue("@User_id", email);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            return count > 0;
        }
    }
}




using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_registration
{
    public partial class fooddiary : System.Web.UI.Page
    {
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
                            Response.Redirect("membershipaspx.aspx");


                        }
                     
                }
                }

            
        }

    }
}
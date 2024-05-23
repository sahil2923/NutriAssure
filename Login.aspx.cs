using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginPage2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {
            {
                
                try
                {
                    using (SqlConnection conn = new SqlConnection("Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True"))
                    {
                        conn.Open();

                        
                        using (SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE MobileNo=@MobileNo AND Password=@Password AND Email=@Email", conn))
                        {
                            cmd.Parameters.AddWithValue("@MobileNo", Mobile_TextBox.Text);
                            cmd.Parameters.AddWithValue("@Email", Email_TextBox.Text);
                            cmd.Parameters.AddWithValue("@Password", Password_TextBox.Text);

                            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                            {
                                DataSet ds = new DataSet();
                                da.Fill(ds, "Users");

                                if (ds.Tables["Users"].Rows.Count == 0)
                                {
                                    
                                    lblMessage.Text = "Invalid user credentials";
                                }
                                else
                                {
                                    Session["session_id"] = Session.SessionID;
                                    Session["User_id"] = Email_TextBox.Text;
                                    Response.Redirect("home.aspx");
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
        }
       
    }
}
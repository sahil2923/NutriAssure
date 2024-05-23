using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace project_registration
{
    public partial class adminpanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin_id"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            else
            {

                string AdminId = Session["Admin_id"].ToString();
                string connectionString = "Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Fetch admin details
                    string adminQuery = "SELECT * FROM AdminInfo WHERE Admin_id = @Admin_id";
                    using (SqlCommand command = new SqlCommand(adminQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Admin_id", AdminId);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            rptGuides.DataSource = reader;
                            rptGuides.DataBind();
                        }
                    }

                    // Fetch total users count
                    string usersQuery = "SELECT COUNT(*) FROM Users";
                    using (SqlCommand command = new SqlCommand(usersQuery, connection))
                    {
                        lblTotalUsers.Text = command.ExecuteScalar().ToString();
                    }

                    // Fetch total memberships count
                    string membershipsQuery = "SELECT COUNT(*) FROM membership";
                    using (SqlCommand command = new SqlCommand(membershipsQuery, connection))
                    {
                        lblTotalMemberships.Text = command.ExecuteScalar().ToString();
                    }

                    string consultancyQuery = "SELECT COUNT(*) FROM ConsultancyDetails";
                    using (SqlCommand command = new SqlCommand(consultancyQuery, connection))
                    {
                        lblTotalConsultancy.Text = command.ExecuteScalar().ToString();
                    }

                    // Fetch new orders count
                    // Add your query here

                    // Fetch users data
                    string usersDataQuery = "SELECT FullName, Email FROM users";
                    using (SqlCommand command = new SqlCommand(usersDataQuery, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            rptUsers.DataSource = reader;
                            rptUsers.DataBind();
                        }
                    }

                    // Fetch memberships data
                    string membershipsDataQuery = "SELECT uname, Email FROM membership";
                    using (SqlCommand command = new SqlCommand(membershipsDataQuery, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            rptMemberships.DataSource = reader;
                            rptMemberships.DataBind();
                        }
                    }

                    // Fetch ConsultancyDetails data
                    string consultancyDataQuery = "SELECT ConsultancyID,Name,Email,Phone,PreferredDate,PreferredTime,AppointmentType,AdditionalInformation,CreatedAt FROM ConsultancyDetails";
                    using (SqlCommand command = new SqlCommand(consultancyDataQuery, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            rptConsultancy.DataSource = reader;
                            rptConsultancy.DataBind();
                        }
                    }


                }
            }
            if (!IsPostBack)
            {
                // Bind data to the Repeater controls
                BindConsultancyData();
            }
        }
        protected void btnDeleteConsultancy_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string consultancyID = btnDelete.CommandArgument.ToString();

            // Write code here to delete the record with the given ConsultancyID from the ConsultancyDetails table
            // Construct your DELETE query and execute it
            string deleteQuery = "DELETE FROM ConsultancyDetails WHERE ConsultancyID = @ConsultancyID";

            string connectionString = "Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@ConsultancyID", consultancyID);
                    int rowsAffected = command.ExecuteNonQuery();

                    // Optionally, you can display a message or perform additional actions based on the result of the deletion operation
                    if (rowsAffected > 0)
                    {
                        // Record deleted successfully
                    }
                    else
                    {
                        // Record not found or deletion unsuccessful
                    }
                }
            }

            // After deleting, you may want to refresh the data displayed in the Repeater
            BindConsultancyData();
        }
        private void BindConsultancyData()
        {
            // Fetch ConsultancyDetails data and bind to rptConsultancy Repeater
            string consultancyDataQuery = "SELECT ConsultancyID, Name, Email, Phone, PreferredDate, PreferredTime, AppointmentType, AdditionalInformation, CreatedAt FROM ConsultancyDetails";
            using (SqlConnection connection = new SqlConnection("Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True"))
            {
                using (SqlCommand command = new SqlCommand(consultancyDataQuery, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        rptConsultancy.DataSource = reader;
                        rptConsultancy.DataBind();
                    }
                }
            }
        }

    }
}

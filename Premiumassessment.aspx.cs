using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace project_registration
{
    public partial class Premiumassessment : System.Web.UI.Page
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
            if (IsPostBack)
            {
                // Call the assessment logic when the page is loaded again after a postback
                PerformPremiumAssessment();
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            PerformPremiumAssessment();
        }

        private void PerformPremiumAssessment()
        {
            // Retrieve values from the form controls
            string name = txtName.Text;
            string email = txtEmail.Text;
            int age = Convert.ToInt32(txtAge.Text);
            string gender = ddlGender.SelectedValue;
            int dailyCalories = Convert.ToInt32(txtDailyCalories.Text);
            string vegetablesIntake = GetSelectedRadioButtonValue("vegetablesIntake");
            string processedFoodsOption = GetSelectedRadioButtonValue("processedFoodsOption");
            string dairyOption = GetSelectedRadioButtonValue("dairyOption");
            string otherComments = txtOtherComments.Text;
            int mealFrequency = Convert.ToInt32(ddlMealFrequency.SelectedValue);
            string waterIntake = ddlWaterIntake.SelectedValue;
            string exerciseFrequency = ddlExerciseFrequency.SelectedValue;
            int weight = Convert.ToInt32(txtWeight.Text);
            int height = Convert.ToInt32(txtHeight.Text);

            // Perform assessment logic
            string assessmentResult = CalculatePremiumAssessment(name, email, age, gender, dailyCalories,
                                                                 vegetablesIntake, processedFoodsOption, dairyOption,
                                                                 otherComments, mealFrequency, waterIntake,
                                                                 exerciseFrequency, weight, height);

            // Store assessment result message in session
            Session["ResultMessage"] = assessmentResult;

            // Add assessment data to the database
            AddAssessmentToDatabase(name, email, gender, age, height, weight, assessmentResult);

            // Redirect the user to the result page
            Response.Redirect("ResultPage.aspx");
        }

        private void AddAssessmentToDatabase(string name, string email, string gender, int age, int height, int weight, string result)
        {
            string connectionString = "Server=LAPTOP-96CH6CJ7\\SQLEXPRESS;Database=sahildb;Trusted_Connection=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO AssessmentData (Name, Email, Gender, Age, Height, Weight, Result) " +
                               "VALUES (@Name, @Email, @Gender, @Age, @Height, @Weight, @Result)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Height", height);
                    cmd.Parameters.AddWithValue("@Weight", weight);
                    cmd.Parameters.AddWithValue("@Result", result);
                    cmd.ExecuteNonQuery();
                }
            }
        }


        private string GetSelectedRadioButtonValue(string groupName)
        {
            foreach (var control in Page.Controls)
            {
                if (control is RadioButton radioButton && radioButton.GroupName == groupName && radioButton.Checked)
                {
                    return radioButton.Text;
                }
            }
            return string.Empty;
        }

        private string CalculatePremiumAssessment(string name, string email, int age, string gender, int dailyCalories,
                                                   string vegetablesIntake, string processedFoodsOption, string dairyOption,
                                                   string otherComments, int mealFrequency, string waterIntake,
                                                   string exerciseFrequency, int weight, int height)
        {
            double heightInMeters = height / 100.0;
            double bmi = weight / (heightInMeters * heightInMeters);

            // Determine BMI category
            string bmiCategory;
            if (bmi < 18.5)
            {
                bmiCategory = "Underweight";
            }
            else if (bmi >= 18.5 && bmi < 25)
            {
                bmiCategory = "Normal weight";
            }
            else if (bmi >= 25 && bmi < 30)
            {
                bmiCategory = "Overweight";
            }
            else
            {
                bmiCategory = "Obese";
            }

            // Determine overall health status based on various factors
            string overallHealthStatus;
            if (age >= 18 && age <= 60 && exerciseFrequency == "regularly" && (bmi >= 18.5 && bmi < 25) &&
                mealFrequency >= 3 && waterIntake == "2-3 litres" && vegetablesIntake == "regularly" &&
                processedFoodsOption == "no" && dairyOption == "yes")
            {
                overallHealthStatus = "Excellent";
            }
            else if (age >= 18 && age <= 60 && (exerciseFrequency == "occasionally" || exerciseFrequency == "regularly") &&
                     (bmi >= 18.5 && bmi < 30) && (mealFrequency >= 2 && mealFrequency <= 5) &&
                     (waterIntake == "1-2 litres" || waterIntake == "2-3 litres") && vegetablesIntake != "rarely" &&
                     processedFoodsOption == "no" && dairyOption != "no")
            {
                overallHealthStatus = "Good";
            }
            else
            {
                overallHealthStatus = "Needs Improvement";
            }

            // Generate assessment result message
            string resultMessage = $"Dear {name}, based on your assessment:\n";
            resultMessage += $"- Your BMI is {bmi:f1}, categorized as {bmiCategory}.\n";
            resultMessage += $"- Your overall health status is {overallHealthStatus}.";

            return resultMessage;
        }

        // Function to calculate BMI
        private double CalculateBMI(int weight, int height)
        {
            double heightInMeters = height / 100.0;
            return weight / (heightInMeters * heightInMeters);
        }

    }
}

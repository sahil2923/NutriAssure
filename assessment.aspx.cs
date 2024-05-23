using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project_registration
{
    public partial class assessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["session_id"] == null)
            {
                Response.Redirect("Login.aspx");

            }

        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            // Initialize health score
            int healthScore = 0;

            // Score based on age
            int age = Convert.ToInt32(txtAge.Text);
            if (age >= 18 && age <= 30)
            {
                healthScore += 30;
            }
            else if (age > 30 && age <= 50)
            {
                healthScore += 15;
            }
            else if (age > 50)
            {
                healthScore += 10;
            }

            // Score based on daily calorie intake
            int dailyCalories = Convert.ToInt32(txtDailyCalories.Text);
            if (dailyCalories >= 2000 && dailyCalories <= 2500)
            {
                healthScore += 30;
            }
            else if (dailyCalories > 2500 && dailyCalories <= 3000)
            {
                healthScore += 15;
            }
            else if (dailyCalories > 3000)
            {
                healthScore += 10;
            }

            // Score based on gender
            if (ddlGender.SelectedValue == "female")
            {
                healthScore += 10; // Adjust score based on gender
            }

            // Score based on vegetable intake
            if (ddlVegetablesIntake.SelectedValue == "regularly")
            {
                healthScore += 25; // Adjust score based on vegetable intake
            }

            // Score based on processed foods
            if (rbProcessedFoods.SelectedValue == "no")
            {
                healthScore += 15; // Adjust score based on processed foods
            }

            // Score based on water intake
            switch (rbWaterIntake.SelectedValue)
            {
                case "2-3 litres":
                    healthScore += 20;
                    break;
                case "more than 3 litres":
                    healthScore += 25;
                    break;
                case "Half litre ":
                    healthScore += 15;
                    break;
                case "1-2 litres":
                    healthScore += 10;
                    break;
                 
            }

            // Score based on sleep hours
            switch (rbSleepHours.SelectedValue)
            {
                case "8 hours":
                    healthScore += 30;
                    break;
                case "6 hours":
                    healthScore += 15;
                    break;
                    // Add more cases as needed
            }

            // Score based on meditation
            if (rbMeditation.SelectedValue == "regularly")
            {
                healthScore += 20; // Adjust score based on meditation
            }

            // Score based on health issues
            if (rbHealthIssue.SelectedValue == "no")
            {
                healthScore += 10; // Adjust score based on health issues
            }

            // Calculate overall health percentage
            int maxPossibleScore = 200; // Adjust this value based on the maximum score achievable
            double healthPercentage = (double)healthScore / maxPossibleScore * 100;

            // Display the health percentage or redirect to a result page
            resultLabel.Text = $"Your overall assessment score: {healthPercentage:F2}%";
        }
    }
}
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assessment.aspx.cs" Inherits="project_registration.assessment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritional Assessment</title>
    <!-- Add your CSS styles here -->
   <style>
    /* Add your CSS styles here */
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
    }
      .floating-text {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #fff;
            padding: 10px;
            border-bottom: 1px solid #ccc;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            z-index: 9999; /* Ensure it's above other elements */
            text-align: center;
        }

    .assessment-container {
        max-width: 800px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333;
    }

    form {
        margin-top: 20px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #555;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 16px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    /* Style the button */
    .btn-success {
        background-color: #28a745; /* Green */
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
        border-radius: 4px;
    }
    .result-label {
    display: block;
    margin-top: 10px;
    padding: 10px;
    background-color: #f8d7da;
    border-radius: 4px;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

    /* Change the button color on hover */
    .btn-success:hover {
        background-color: #218838; /* Darker green */
    }
</style>


</head>
<body>
    <form id="assessmentForm" runat="server">
        <div class="floating-text">
            <strong>This assessment is not created by a nutritionist but  is algorithm-based.</strong>
        </div>
        <div class="assessment-container">
            <h1>Nutritional Assessment</h1>
            <p>Fill out the following form to assess your nutritional health.</p>
            <!-- Personal Information Section -->
            <h2>Personal Information</h2>
            <label for="txtName">Your Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>

            <label for="txtEmail">Your Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required></asp:TextBox>

            <label for="txtAge">Your Age:</label>
            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" type="number" required></asp:TextBox>

            <label for="ddlGender">Gender:</label>
            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" required>
                <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:DropDownList>

            <!-- Nutritional Habits Section -->
            <h2>Nutritional Habits</h2>
            <label for="txtDailyCalories">Average Daily Caloric Intake (kcal):</label>
            <asp:TextBox ID="txtDailyCalories" runat="server" CssClass="form-control" type="number" required></asp:TextBox>

            <label for="ddlVegetablesIntake">How often do you eat vegetables?</label>
            <asp:DropDownList ID="ddlVegetablesIntake" runat="server" CssClass="form-control" required>
                <asp:ListItem Text="Rarely" Value="rarely"></asp:ListItem>
                <asp:ListItem Text="Occasionally" Value="occasionally"></asp:ListItem>
                <asp:ListItem Text="Regularly" Value="regularly"></asp:ListItem>
            </asp:DropDownList>

            <label for="rbProcessedFoods">Do you consume processed foods frequently?</label>
            <div id="rbProcessedFoods" class="answer-options">
                <asp:RadioButtonList ID="rbProcessedFoods" runat="server" CssClass="form-control" required>
                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <label for="rbWaterIntake">How much water do you usually drink per day?</label>
            <div id="rbWaterIntake" class="answer-options">
                <asp:RadioButtonList ID="rbWaterIntake" runat="server" CssClass="form-control" required>
                    <asp:ListItem Text="Half litre" Value="Half litre"></asp:ListItem>
                    <asp:ListItem Text="1-2 litres" Value="1-2 litres"></asp:ListItem>
                    <asp:ListItem Text="2-3 litres" Value="2-3 litres"></asp:ListItem>
                    <asp:ListItem Text="More than 3 litres" Value="more than 3 litres"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <label for="rbSleepHours">How much hours do you sleep in a day?</label>
            <div id="rbSleepHours" class="answer-options">
                <asp:RadioButtonList ID="rbSleepHours" runat="server" CssClass="form-control" required>
                    <asp:ListItem Text="8 hours" Value="8 hours"></asp:ListItem>
                    <asp:ListItem Text="6 hours" Value="6 hours"></asp:ListItem>
                    <asp:ListItem Text="4 hours" Value="4 hours"></asp:ListItem>
                    <asp:ListItem Text="Less than 4 hours" Value="less than 4 hours"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <label for="rbMeditation">How often do you practice meditation?</label>
            <div id="rbMeditation" class="answer-options">
                <asp:RadioButtonList ID="rbMeditation" runat="server" CssClass="form-control" required>
                    <asp:ListItem Text="Rarely" Value="rarely"></asp:ListItem>
                    <asp:ListItem Text="Occasionally" Value="occasionally"></asp:ListItem>
                    <asp:ListItem Text="Regularly" Value="regularly"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <label for="rbHealthIssue">Do you have any health issues?</label>
            <div id="rbHealthIssue" class="answer-options">
                <asp:RadioButtonList ID="rbHealthIssue" runat="server" CssClass="form-control" required onclick="toggleHealthIssueInput()">
                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div class="health-issue-input" id="healthIssueInput" style="display: none;">
                <label for="txtHealthIssue">Describe your health issue:</label>
                <asp:TextBox ID="txtHealthIssue" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="SubmitButton" runat="server" Text="Submit Assessment" OnClick="Submit_Click" CssClass=" btn btn-success rounded-pill pl-3 pr-2 text-white" />
                  <asp:Label ID="resultLabel" runat="server" CssClass="result-label"></asp:Label>
        </div>
    </form>

    <!-- Add your JavaScript code here -->
    <script>
        function toggleHealthIssueInput() {
            var healthIssueInput = document.getElementById('healthIssueInput');
            healthIssueInput.style.display = (document.querySelector('input[name="rbHealthIssue"]:checked').value === 'yes') ? 'block' : 'none';
        }
    </script>
</body>
</html>

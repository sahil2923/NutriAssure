<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Premiumassessment.aspx.cs" Inherits="project_registration.Premiumassessment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritional Assessment</title>
    <script>
        // JavaScript function to display the spinning wheel upon form submission
        function showSpinner() {
            document.getElementById('spinner').style.display = 'block';
        }
    </script>
    <style>
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
        .spinner {
            margin: 100px auto;
            width: 50px;
            height: 40px;
            text-align: center;
            font-size: 10px;
        }
        .spinner > div {
            background-color: #333;
            height: 100%;
            width: 6px;
            display: inline-block;
            animation: stretchdelay 1.2s infinite ease-in-out;
        }
        .spinner .rect2 {
            animation-delay: -1.1s;
        }
        .spinner .rect3 {
            animation-delay: -1.0s;
        }
        .spinner .rect4 {
            animation-delay: -0.9s;
        }
        .spinner .rect5 {
            animation-delay: -0.8s;
        }
        @keyframes stretchdelay {
            0%, 40%, 100% { transform: scaleY(0.4); }  
            20% { transform: scaleY(1.0); }
        }
    
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
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
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            color: #555;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }

        /* Advanced styles */
        .radio-group label {
            display: inline-block;
            margin-right: 20px;
            cursor: pointer;
        }

        .radio-group input[type="radio"] {
            display: none;
        }

        .radio-group input[type="radio"] + label {
            padding: 10px 20px;
            background-color: #e9ecef;
            color: #333;
            border-radius: 4px;
        }

        .radio-group input[type="radio"]:checked + label {
            background-color: #007bff;
            color: #fff;
        }

        .textarea-group textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }

        .checkbox-group {
            margin-bottom: 16px;
        }

        .checkbox-options {
            display: flex;
            align-items: center;
        }

        .checkbox-option {
            margin-right: 10px;
        }

        .btn-submit {
            display: block;
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Nutritional Assessment</h1>
        <form id="assessmentForm" runat="server">
             <div class="floating-text">
            <strong>This assessment is not created by a nutritionist but  is algorithm-based.</strong>
        </div>
           
            <!-- Personal Information Section -->
            <h2>Personal Information</h2>
            <label for="txtName">Your Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Required="true"></asp:TextBox>

            <label for="txtEmail">Your Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Required="true"></asp:TextBox>

            <label for="txtAge">Your Age:</label>
            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" type="number" Required="true" min="18" max="100"></asp:TextBox>

            <label for="ddlGender">Gender:</label>
            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Required="true">
                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:DropDownList>

            <!-- Nutritional Habits Section -->
            <h2>Nutritional Habits</h2>
            <label for="txtDailyCalories">Average Daily Caloric Intake (kcal):</label>
            <asp:TextBox ID="txtDailyCalories" runat="server" type="number" CssClass="form-control" required min="500" max="5000"></asp:TextBox>

            <div class="radio-group">
                <label>How often do you eat vegetables?</label>
                <input type="radio" id="rbVegetablesRarely" runat="server" name="vegetablesIntake" value="rarely" required />
                <asp:Label ID="lblVegetablesRarely" runat="server" AssociatedControlID="rbVegetablesRarely" Text="Rarely"></asp:Label>
                <input type="radio" id="rbVegetablesOccasionally" runat="server" name="vegetablesIntake" value="occasionally" />
                <asp:Label ID="lblVegetablesOccasionally" runat="server" AssociatedControlID="rbVegetablesOccasionally" Text="Occasionally"></asp:Label>
                <input type="radio" id="rbVegetablesRegularly" runat="server" name="vegetablesIntake" value="regularly" />
                <asp:Label ID="lblVegetablesRegularly" runat="server" AssociatedControlID="rbVegetablesRegularly" Text="Regularly"></asp:Label>
            </div>

            <div class="checkbox-group">
                <asp:Label ID="lblProcessedFoods" runat="server" Text="Do you consume processed foods frequently?"></asp:Label>
                <div class="checkbox-options">
                    <asp:CheckBox ID="chkProcessedFoodsYes" runat="server" CssClass="checkbox-option" />
                    <asp:Label ID="lblProcessedFoodsYes" runat="server" AssociatedControlID="chkProcessedFoodsYes" Text="Yes"></asp:Label>
                    <asp:CheckBox ID="chkProcessedFoodsNo" runat="server" CssClass="checkbox-option" />
                    <asp:Label ID="lblProcessedFoodsNo" runat="server" AssociatedControlID="chkProcessedFoodsNo" Text="No"></asp:Label>
                </div>
            </div>

            <div class="checkbox-group">
                <asp:Label ID="lblDairy" runat="server" Text="Do you consume dairy products?"></asp:Label>
                <div class="checkbox-options">
                    <asp:CheckBox ID="chkDairyYes" runat="server" CssClass="checkbox-option" />
                    <asp:Label ID="lblDairyYes" runat="server" AssociatedControlID="chkDairyYes" Text="Yes"></asp:Label>
                    <asp:CheckBox ID="chkDairyNo" runat="server" CssClass="checkbox-option" />
                    <asp:Label ID="lblDairyNo" runat="server" AssociatedControlID="chkDairyNo" Text="No"></asp:Label>
                </div>
            </div>

            <div class="textarea-group">
                <label for="txtOtherComments">Any other comments or dietary restrictions?</label>
                <asp:TextBox ID="txtOtherComments" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>

            <label for="ddlMealFrequency">How many meals do you have per day?</label>
            <asp:DropDownList ID="ddlMealFrequency" runat="server" required>
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="1" Value="1" />
                <asp:ListItem Text="2" Value="2" />
                <asp:ListItem Text="3" Value="3" />
                <asp:ListItem Text="4" Value="4" />
                <asp:ListItem Text="5" Value="5" />
                <asp:ListItem Text="6" Value="6" />
                <asp:ListItem Text="7" Value="7" />
            </asp:DropDownList>

            <label for="ddlWaterIntake">How much water do you usually drink per day?</label>
            <asp:DropDownList ID="ddlWaterIntake" runat="server" required>
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="Less than 1 litre" Value="less than 1 litre" />
                <asp:ListItem Text="1-2 litres" Value="1-2 litres" />
                <asp:ListItem Text="2-3 litres" Value="2-3 litres" />
                <asp:ListItem Text="More than 3 litres" Value="more than 3 litres" />
            </asp:DropDownList>

            <label for="ddlExerciseFrequency">How often do you engage in physical exercise?</label>
            <asp:DropDownList ID="ddlExerciseFrequency" runat="server" required>
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="Rarely" Value="rarely" />
                <asp:ListItem Text="Occasionally" Value="occasionally" />
                <asp:ListItem Text="Regularly" Value="regularly" />
            </asp:DropDownList>

            <div class="radio-group">
                <asp:Label ID="lblFruits" runat="server" Text="Do you include fruits in your daily diet?"></asp:Label>
                <div class="radio-options">
                    <asp:RadioButton ID="rbFruitsYes" runat="server" Text="Yes" GroupName="fruitsOption" value="yes" required />
                    <asp:RadioButton ID="rbFruitsNo" runat="server" Text="No" GroupName="fruitsOption" value="no" />
                </div>
            </div>

            <div class="radio-group">
                <asp:Label ID="exerciseLabel" runat="server" Text="How often do you engage in physical exercise?"></asp:Label>
                <div class="radio-options">
                    <asp:RadioButton ID="rbExerciseRarely" runat="server" Text="Rarely" GroupName="exerciseFrequency" value="rarely" required />
                    <asp:RadioButton ID="rbExerciseOccasionally" runat="server" Text="Occasionally" GroupName="exerciseFrequency" value="occasionally" />
                    <asp:RadioButton ID="rbExerciseRegularly" runat="server" Text="Regularly" GroupName="exerciseFrequency" value="regularly" />
                </div>
            </div>

            <label for="txtWeight">Your Weight (in kg):</label>
            <asp:TextBox ID="txtWeight" runat="server" type="number" CssClass="form-control" required min="20" max="300"></asp:TextBox>

            <label for="txtHeight">Your Height (in cm):</label>
            <asp:TextBox ID="txtHeight" runat="server" type="number" CssClass="form-control" required min="100" max="300"></asp:TextBox>

            <asp:Button ID="SubmitButton" runat="server" Text="Submit Assessment" CssClass="btn-success btn-submit" OnClick="SubmitButton_Click" />

            <asp:Label ID="resultLabel" runat="server"></asp:Label>

        </form>
    </div>
</body>
</html>

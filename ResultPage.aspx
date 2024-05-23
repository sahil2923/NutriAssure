<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultPage.aspx.cs" Inherits="project_registration.ResultPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Result Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
        }

        h1 {
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
        }

        .circle-container {
            position: relative;
            width: 300px;
            height: 300px;
        }

        .circle {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            border: 2px solid #eee;
            position: absolute;
            top: 0;
            left: 0;
            background: conic-gradient(from 0deg, #73a9ff 0%, #73a9ff 25%, #98fb98 25%, #98fb98 50%, #ffd700 50%, #ffd700 75%, #ff6347 75%, #ff6347);
        }

        .value {
            position: absolute;
            font-size: 14px;
            font-weight: bold;
            color: #333;
            text-align: center;
            transform-origin: 50% 50%;
            cursor: pointer;
        }

        .value1 {
            top: 10%;
            left: 50%;
            transform: translateX(-150%);
        }

        .value2 {
            top: 50%;
            left: 10%;
            transform: translateY(150%);
        }

        .value3 {
            bottom: 10%;
            left: 50%;
            transform: translateX(100%);
        }

        .value4 {
            top: 50%;
            right: 10%;
            transform: translateY(-150%);
        }

        #messageBox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            display: none;
        }

        #messageBox p {
            margin: 0;
            font-size: 16px;
            color: #333;
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Result Page</h1>
            <div class="circle-container">
                <div class="circle"></div>
                <div class="line line1"></div>
                <div class="line line2"></div>
                <div class="line line3"></div>
                <div class="line line4"></div>
                <div class="value value1" data-message="A BMI between 20 and 22.4 falls within the normal weight range. This indicates that your weight is generally considered healthy for your height. To maintain your current weight status, continue practicing healthy eating habits and staying physically active. Regular check-ups with a healthcare provider can help monitor your overall health and well-being.">20 to 22.4</div>
                <div class="value value2" data-message="A BMI of 30 or above falls within the obese category. This suggests that your weight may pose health risks and indicates a higher likelihood of obesity-related health issues such as heart disease, diabetes, and joint problems. It's essential to consult with a healthcare professional to develop a plan for managing your weight and reducing health risks. This may include adopting a balanced diet, increasing physical activity, and seeking medical guidance for any underlying health conditions.">30 or above</div>
                <div class="value value3" data-message="A BMI between 26 and 29.9 falls within the overweight category. This indicates that you may be carrying excess weight, which could lead to health issues such as high blood pressure, heart disease, and diabetes. It's important to take steps to manage your weight through a combination of healthy eating habits, regular physical activity, and lifestyle changes. Consulting with a healthcare professional can provide personalized guidance and support in achieving a healthier BMI and reducing your risk of obesity-related health problems.">26 to 29.9</div>
                <div class="value value4" data-message="A BMI between 22.5 and 25.9 falls within the normal weight range. This indicates that your weight is generally considered healthy for your height. However, it's essential to maintain healthy lifestyle habits, including a balanced diet and regular exercise, to support overall well-being and prevent weight-related health issues. Keep up the good work and continue to prioritize your health through healthy habits and self-care.">22.5 to 25.9</div>
            </div>
            <div id="messageBox"></div>
             <asp:Literal ID="ResultMessageLiteral" runat="server"></asp:Literal>
        </div>
    </form>
<script>
    var valueElements = document.querySelectorAll('.value');
    var messageBox = document.getElementById('messageBox');

    valueElements.forEach(function (element) {
        element.addEventListener('mouseenter', function (event) {
            var message = event.target.dataset.message;
            messageBox.innerHTML = '<p>' + message + '</p>';
            messageBox.style.display = 'block';
        });

        element.addEventListener('mouseleave', function () {
            messageBox.style.display = 'none';
        });
    });

</script>
</body>
</html>

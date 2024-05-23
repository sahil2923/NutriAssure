<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="membershipaspx.aspx.cs" Inherits="project_registration.membershipaspx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pay Now</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"] {
            width: calc(100% - 10px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .premium-info {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .premium-info h3 {
            color: #007bff;
        }
        .premium-info p {
            color: #555;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Premium Membership</h2>
            <div>
                <label for="txtName1">Name:</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
            </div>
            <div>
                <label for="txtEmail1">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Enter your email"></asp:TextBox>
            </div>
            <div>
                <label for="txtContact1">Contact:</label>
                <asp:TextBox ID="txtContact" runat="server" placeholder="Enter your contact number"></asp:TextBox>
            </div>
            <asp:Button ID="btnPayNow" runat="server" Text="Pay Now" OnClick="Submit_Click" />
             <script type="text/javascript">
                 function OpenRazorpay(orderId, paymentId) {
                     var options = {
                         "key": "rzp_test_cvwiiVvHjyJrmr",
                         "amount": 100000, // Example amount
                         "currency": "INR",
                         "name": "NutriAssure",
                         "description": "Premium Membership",
                         "order_id": orderId,
                         "payment_id": paymentId,
                         "handler": function (response) {
                             // Redirect back to the page with payment response parameters
                             window.location.href = 'home.aspx?razorpay_payment_id=' + response.razorpay_payment_id + '&razorpay_order_id=' + response.razorpay_order_id;
                         }
                     };
                     var rzp = new Razorpay(options);
                     rzp.open();
                 }
             </script>

           <h3>Benefits of Premium Membership:</h3>
<p>Enjoy the following benefits with our Premium Membership:</p>
<ul>
    <li>Access exclusive content and features</li>
    <li>Receive personalized recommendations</li>
    <li>Participate in members-only events and promotions</li>
    <li>Connect with a community of like-minded individuals</li>
    <li>Get priority support and assistance</li>
</ul>

        </div>
    </form>
</body>
</html>

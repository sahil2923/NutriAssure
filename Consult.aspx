<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consult.aspx.cs" Inherits="project_registration.Consult" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" runat="server">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritional Consultation</title>
      <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        .consultation-container {
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

        p {
            text-align: center;
            color: #555;
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
        input[type="tel"],
        input[type="datetime-local"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="radio"] {
            margin-right: 8px;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .time-slot {
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="consultation-container">
            <h1>Book a Nutritional Consultation</h1>
            <p>Fill out the form below to schedule a consultation with our nutrition expert.</p>

         <asp:UpdatePanel runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <!-- Your form content here -->

                    <!-- Personal Information Section -->
                    <h2>Your Information</h2>
                    <label for="name">Your Name:</label>
                  <asp:TextBox ID="name" runat="server" CssClass="form-control" Required="true"></asp:TextBox>

                   <asp:Label ID="lblEmail" runat="server" AssociatedControlID="email" CssClass="form-control" Text="Your Email:" />
                    <asp:TextBox ID="email" runat="server" CssClass="form-control" Required="true" TextMode="Email"></asp:TextBox>

                    <label for="phone">Your Phone Number:</label>
                   <asp:TextBox ID="phone" runat="server" CssClass="form-control" Required="true" TextMode="Phone"></asp:TextBox>


                    <!-- Appointment Details -->
                    <h2>Appointment Details</h2>
                   <div class="time-slot">
    <label for="preferred-date">Preferred Date:</label>
    <asp:TextBox ID="preferredDate" runat="server" CssClass="form-control" TextMode="Date" Required="true" OnLoad="Page_Load"></asp:TextBox>
</div>

                    <div class="time-slot">
                        <label for="preferred-time">Preferred Time:</label>
                        <asp:DropDownList ID="preferredTime" runat="server" CssClass="form-control" Required="true">
                            <asp:ListItem Text="9:00 AM - 10:00 AM" Value="9:00 AM - 10:00 AM"></asp:ListItem>
                            <asp:ListItem Text="10:00 AM - 11:00 AM" Value="10:00 AM - 11:00 AM"></asp:ListItem>
                            <asp:ListItem Text="11:00 AM - 12:00 PM" Value="11:00 AM - 12:00 PM"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Appointment Type Section -->
                    <h2>Appointment Type</h2>
                    <label>
                        <asp:RadioButton ID="offlineRadioButton" runat="server" GroupName="appointment-type" Text="Offline" Required="true" />
                        <asp:RadioButton ID="onlineRadioButton" runat="server" GroupName="appointment-type" Text="Online" Required="true" />
                    </label>

                    <!-- Additional Information -->
                    <label for="message">Additional Information (optional):</label>
                    <asp:TextBox ID="message" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Width="501px"></asp:TextBox>

                    <!-- Submit Button -->
                  <asp:Button ID="bookAppointmentButton" runat="server" Text="Book Appointment" OnClick="BookAppointment_Click"/>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
          <script type="text/javascript">
                function OpenRazorpay(orderId,paymentId) {
                    var options = {
                        "key": "rzp_test_cvwiiVvHjyJrmr",
                        "amount": 50000, // Example amount
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
    </form>
</body>

</html>

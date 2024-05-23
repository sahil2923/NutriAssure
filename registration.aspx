<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="YourNamespace.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
     <style>
        body {
     margin: 0; 
    padding: 0; 
    height: 100vh;
    background-image: url('https://images.pexels.com/photos/204692/pexels-photo-204692.jpeg?auto=compress&cs=tinysrgb&w=600');
    background-repeat: no-repeat;
    background-size: cover;
    background-position:center;
    background-color: #f8f9fa;
    backdrop-filter: blur(5px); 
    background-color: rgba(255, 255, 255, 0.5);
}


        .container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

       .card {
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    margin: 20px; /* Add margin for spacing */
    padding: 5px; /* Add padding for content spacing */
}

/* Card header styles */
.card-header {
    background-color: #007bff;
    color: white;
    text-align: center;
    font-weight: bold;
    border-bottom: 1px solid #ddd;
    border-top-left-radius: 10px; /* Adjust border-radius for top corners */
    border-top-right-radius: 10px;
    padding: 10px; /* Add padding for header spacing */
}

/* Example of content styles inside the card */
.card-content {
    font-size: 16px;
    line-height: 1.6;
}

/* Example of footer styles inside the card */
.card-footer {
    text-align: right;
    padding-top: 10px;
    border-top: 1px solid #ddd;
}

        .card-body {
            padding: 20px;
            border-top: 1px solid #ddd; 

        .btn-register
         {
             background-color: #28a745;
             color: white;
         }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 align="center">Nutriassure</h1>
         <div class="auto-style9">
            <div class="row justify-content-center">
                <div class="auto-style3">
                    <div class="card">
                        <div class="card-header">
                            User Registration
                        </div>
                    </div>
                        <div class="auto-style4">
        <table class="auto-style8">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Name_Label" runat="server" Text="Enter name"></asp:Label>
                </td>
                <tr>
                <td>
                    <asp:TextBox ID="Name_TextBox" runat="server" Width="350px" Placeholder="Name" CssClass="form-control"></asp:TextBox>
                </td>
                    </tr>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator
                        ID="Name_RequiredFieldValidator"
                        runat="server"
                        ErrorMessage="Missing name"
                        ForeColor="Red"
                        ControlToValidate="Name_Textbox"
                        EnableClientScript="True" 
                        Display="Dynamic" 
                        SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
          
        
              <tr>
                <td class="auto-style7">
                    <asp:Label ID="Mobile_Label" runat="server" Text="Enter Mobile Number"></asp:Label>
                </td>
                <tr>
                <td>
                    <asp:TextBox ID="Mobile_TextBox" runat="server" CssClass="form-control" Width="350px" Placeholder="MobileNo" ></asp:TextBox>
                </td>
                    </tr>
                <td class="auto-style1">
                    <asp:RegularExpressionValidator
                        ID="Mobile_RegularExpressionValidator"
                        runat="server"
                        ErrorMessage="Incorrect mobile number"
                        ForeColor="Red"
                        ValidationExpression="\d{10}$"
                        ControlToValidate="Mobile_TextBox"
                        EnableClientScript="True" 
                        Display="Dynamic" 
                        SetFocusOnError="true">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator
                        ID="Mobile_RequiredFieldValidator"
                        runat="server"
                        ErrorMessage="Missing mobile number"
                        ForeColor="Red"
                        ControlToValidate="Mobile_Textbox"
                        EnableClientScript="True" 
                        Display="Dynamic" 
                        SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                </td>
                
            </tr>           
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Email_Label" runat="server" Text="Enter Email"></asp:Label>
                </td>
                <tr>
                <td>
                    <asp:TextBox ID="Email_TextBox" runat="server" CssClass="form-control" Width="350px" Placeholder="Email"></asp:TextBox>
                </td>
                    </tr>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="Email_TextBox" ForeColor="Red" ErrorMessage="Email is required." Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="Email_TextBox" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.com" ForeColor="Red" ErrorMessage="Enter a valid email address ending with '.com'." Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>                </td>
            </tr>



            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Password_Label" runat="server" Text="Enter password"></asp:Label>
                </td>
                  <tr>
                <td>
                    <asp:TextBox ID="Password_TextBox" runat="server" TextMode="Password" Width="350px" Placeholder="password" CssClass="form-control"></asp:TextBox>
                </td>
                      
                  </tr>
                <td>
                        <asp:RequiredFieldValidator
                        ID="pass_RequiredFieldValidator"
                        runat="server"
                        ErrorMessage="Missing password"
                        ForeColor="Red"
                        ControlToValidate="Password_TextBox"
                        EnableClientScript="True" 
                        Display="Dynamic" 
                        SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                </td>
                 
                   
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Reenter_Password_Label" runat="server" Text="Renter password"></asp:Label>
                </td>
                <tr>
                <td>
                    <asp:TextBox ID="Reenter_Password_TextBox" runat="server" TextMode="Password" CssClass="form-control" Width="350px" Placeholder="Reenter password"></asp:TextBox>
                </td>
                    </tr>
                <td class="auto-style1">
                    <asp:CompareValidator 
                        Display="Dynamic" 
                        SetFocusOnError="true" 
                        ID="Reenter_Password_TextBox_CompareValidator" 
                        runat="server" 
                        ErrorMessage="Password mismatch"
                        ForeColor="Red"
                        ControlToCompare="Password_TextBox"
                        ControlToValidate="Reenter_Password_TextBox"
                        EnableClientScript="True">
                        
                    </asp:CompareValidator>
                     <asp:RequiredFieldValidator
                        ID="reenter_RequiredFieldValidator"
                        runat="server"
                        ErrorMessage="Missing password"
                        ForeColor="Red"
                        ControlToValidate="Reenter_Password_TextBox"
                        EnableClientScript="True" 
                        Display="Dynamic" 
                        SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                   
                </td>
            </tr>
        </table>
        <asp:Button ID="Register_Button" runat="server" Text="Register" Width="115px" CssClass=" btn btn-success rounded-pill pl-3 pr-2 text-white" OnClick="Register_Click" />
       
            <asp:Label ID="alrduserlabel" runat="server" CssClass="pl-3 text-black-100"
            Text="Already Registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>">
            </asp:Label>
            <br >

             <asp:Label ID="lblMessage" runat="server" CssClass="success-message" EnableViewState="false" ForeColor="Green"></asp:Label>
         <br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
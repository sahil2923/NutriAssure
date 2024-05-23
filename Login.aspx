<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginPage2._Default" %>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
   
 <title>Login Page</title>
 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    
     <style>
body {
     margin: 0; 
    padding: 0; 
    height: 100vh;
    background-image: url('https://images.pexels.com/photos/1028599/pexels-photo-1028599.jpeg?auto=compress&cs=tinysrgb&w=600');
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
/* Basic card styles */
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
        }

        .btn-register {
            background-color: #28a745;
            color: white;
        }

        .font{
            font-weight:bold;
        }

       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 align="center">LOGIN PAGE</h1>
         <div class="auto-style9">
            <div class="row justify-content-center">
                <div class="auto-style3">
                    <div class="card">
                        <div class="card-header">
                            User Login
                        </div>
                    </div>
                        <div class="auto-style4">
                       
        <table class="auto-style8">
              <tr>
                <td class="auto-style7">
                    <asp:Label ID="Mobile_Label" runat="server" Text="Enter Mobile Number" CssClass="font"></asp:Label>
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
                        ControlToValidate="Mobile_TextBox"
                        EnableClientScript="True" 
                        Display="Dynamic" 
                        SetFocusOnError="true">
                    </asp:RequiredFieldValidator>
                </td>
                
            </tr>           
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Email_Label" runat="server" Text="Enter Email" CssClass="font"></asp:Label>
                </td>
                <tr>
                <td>
                    <asp:TextBox ID="Email_TextBox" runat="server" CssClass="form-control" Width="350px" Placeholder="Email"></asp:TextBox>
                </td>
                    </tr>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="Email_TextBox" ForeColor="Red" ErrorMessage="Email is required." Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="Email_TextBox" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ForeColor="Red" ErrorMessage="Enter a valid email address." Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </td>
            </tr>



            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Password_Label" runat="server" Text="Enter password" CssClass="font"></asp:Label>
                </td>
                  <tr>
                <td>
                    <asp:TextBox ID="Password_TextBox" runat="server" TextMode="Password" Width="350px" Placeholder="password" CssClass="form-control border"></asp:TextBox>
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
           
        </table>
        <asp:Button ID="Login_Button" runat="server" Text="Login" Width="115px" CssClass=" btn btn-success rounded-pill pl-3 pr-2 text-white" OnClick="Login_Click" />
        
         
             <asp:HyperLink ID="HyperLink1" runat="server"  CssClass=" btn btn-success rounded-pill pl-3 pr-2 text-white" NavigateUrl="~/forgotpass.aspx">Forgot Password</asp:HyperLink>
            <br >
            <asp:Label ID="alrduserlabel" runat="server" CssClass="pl-3 text-black-100"
            Text=" To Create account CLICK HERE <a href='registration.aspx' class='badge badge-info'>Register here..</a>">
            </asp:Label>
            <center>                              <asp:HyperLink ID="AdminLink" runat="server" NavigateUrl="AdminLogin.aspx" CssClass="Admin-link">Admin</asp:HyperLink>
</center>
            <br />
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
         
                    </div>
              
            </div>
        </div>
    </div>
    </form>
</body>
</html>

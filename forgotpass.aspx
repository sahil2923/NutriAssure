<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="CRUD.ForgotPassword" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Login Page</title>

     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    
     <style>
        body {
            background-color: #f8f9fa;
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
            font-weight: bold;
            border-bottom: 1px solid #ddd;
        }


        .card-body {
            padding: 20px;
            border-top: 1px solid #ddd;
        }

        .btn-register {
            background-color: #28a745;
            color: white;
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
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" Width="300"></asp:TextBox>
                            <br />
                                    <asp:Button ID="Forgot_Button" runat="server" Text="Forgot Password" Width="150px" CssClass=" btn btn-success rounded-pill pl-3 pr-2 text-white" OnClick="BtnForgotPassword_Click" />

                        </div>
                    </div>
                </div>
            </div>
        
    </form>
</body>
</html>
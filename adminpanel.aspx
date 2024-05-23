<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpanel.aspx.cs" Inherits="project_registration.adminpanel" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nutritional Website Admin Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #343a40;
            color: white;
        }

        .navbar-brand {
            color: forestgreen;
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-nav a {
            color: white;
            transition: color 0.3s;
        }

        .navbar-nav a:hover {
            color: #ffc107; /* Yellow color on hover */
        }

        .admin-info {
            text-align: right;
            padding: 10px;
            background-color: #343a40;
            color: white;
            font-size: 14px;
        }

        .container {
            margin-top: 20px;
        }

        .card {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .dashboard-section {
            background: linear-gradient(135deg, forestgreen, #6c757d); /* Gradient background */
            color: white;
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
            animation: fadeIn 1s ease-in-out; /* Fade in animation */
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .dashboard-item {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .dashboard-item h3 {
            color: black; /* Yellow color */
        }

        .dashboard-item .item-value {
            color: black;
            font-size: 24px;
            font-weight: bold;
        }

        .section-title {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .user-item, .membership-item {
            margin-bottom: 10px;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
        }

        .user-name, .membership-name {
            font-weight: bold;
        }

        .consultancy-item {
            margin-bottom: 10px;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
        }

        .consultancy-id,
        .consultancy-name,
        .consultancy-email,
        .consultancy-phone,
        .consultancy-date,
        .consultancy-time,
        .consultancy-type,
        .consultancy-info,
        .consultancy-created {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="#">Nutritional Website</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="#dashboard">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="#users">Users</a></li>
                        <li class="nav-item"><a class="nav-link" href="#membership">Membership</a></li>
                        <li class="nav-item"><a class="nav-link" href="#Consultancy">Consultancy</a></li> <!-- Corrected missing double quote -->
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Admin Information -->
        <div class="admin-info">
            <asp:Repeater ID="rptGuides" runat="server">
                <ItemTemplate>
                    <div class="admin-info">
                        Admin Name: <%# Eval("Admin_id") %><br />
                        Admin Password: <%# Eval("Admin_password") %>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="container">
            <!-- Dashboard Section -->
            <div class="dashboard-section" id="dashboard">
                <h2 class="section-title">Dashboard</h2>
                <div class="row">
                    <div class="col-md-6 col-lg-4">
                        <div class="dashboard-item">
                            <h3>Total Users</h3>
                            <span class="item-value"><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></span>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="dashboard-item">
                            <h3>Total Memberships</h3>
                            <span class="item-value"><asp:Label ID="lblTotalMemberships" runat="server" Text="0"></asp:Label></span>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="dashboard-item">
                            <h3>Total Consultancy</h3>
                            <span class="item-value"><asp:Label ID="lblTotalConsultancy" runat="server" Text="0"></asp:Label></span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Users Section -->
            <div class="dashboard-section" id="users">
                <h2 class="section-title">Users</h2>
                <asp:Repeater ID="rptUsers" runat="server">
                    <ItemTemplate>
                        <div class="user-item">
                            <span class="user-name"><%# Eval("FullName") %></span>
                            <span class="user-email"><%# Eval("Email") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Membership Section -->
            <div class="dashboard-section" id="membership">
                <h2 class="section-title">Membership</h2>
                <asp:Repeater ID="rptMemberships" runat="server">
                    <ItemTemplate>
                        <div class="membership-item">
                            <span class="membership-name"><%# Eval("Uname") %></span>
                            <span class="membership-type"><%# Eval("Email") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Consultancy Section -->
            <div class="dashboard-section" id="Consultancy">
                <h2 class="section-title">Consultancy Details</h2>
                <asp:Repeater ID="rptConsultancy" runat="server">
                    <ItemTemplate>
                        <div class="consultancy-item">
                            <span class="consultancy-id"><%# Eval("ConsultancyID") %></span>
                            <span class="consultancy-name"><%# Eval("Name") %></span>
                            <span class="consultancy-email"><%# Eval("Email") %></span>
                            <span class="consultancy-phone"><%# Eval("Phone") %></span>
                            <span class="consultancy-date"><%# Eval("PreferredDate") %></span>
                            <span class="consultancy-time"><%# Eval("PreferredTime") %></span>
                            <span class="consultancy-type"><%# Eval("AppointmentType") %></span>
                            <span class="consultancy-info"><%# Eval("AdditionalInformation") %></span>
                            <span class="consultancy-created"><%# Eval("CreatedAt") %></span>
                             <asp:Button ID="btnDeleteConsultancy" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("ConsultancyID") %>' OnClick="btnDeleteConsultancy_Click" />
                        </div> 
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- Bootstrap JS (if needed) -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </form>
</body>
</html>

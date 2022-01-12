<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage2.aspx.cs" Inherits="ProjectMain.MainPage2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">  
            img {  
                -webkit-filter: blur(4px);  
                filter: blur(4px);  
                width:1250px;
            }  
            #btnOrder
            {
                position:absolute;
                top : 25%;
                right : 75%;
            }
            #btnOrderView
            {
                position:absolute;
                top : 25%;
                right : 60%;
            }
            #btnOrderVehicle
            {
                position:absolute;
                top : 25%;
                right : 45%;
            }
            #btnPickOrder
            {
                position:absolute;
                top : 25%;
                right : 30%;
            }
            #welcome{
                position:absolute;
                top:0px;
                left:0px;
                font:200;
              color:deeppink;
              border:2px solid black;
            }
            .logout{
                position:absolute;
                top:10px;
                left:92%;
            }            
        </style>
</head>
<body>
<img src="Background.jpg" />
<p id="welcome" runat="server"></p>
    <form id="form1" runat="server">
        <li class="nav-item">
 <asp:Button class ="btn btn-primary nav-link active logout" Text="Logout" onClick="logoutBtn" runat="server" />
             </li>
        </form>
<button class="btn btn-lg btn-success" id="btnOrder" onclick="window.location.href='OrderForm.aspx'">Give an Order</button>
<button class="btn btn-lg btn-primary" id="btnOrderView" onclick="window.location.href='CustOrder.aspx'">View Your Orders</button>
<button class="btn btn-lg btn-dark" id="btnOrderVehicle" onclick="window.location.href='VehicleReg.aspx'">Register Vehicles</button>
<button class="btn btn-lg btn-info" id="btnPickOrder" onclick="window.location.href='PickOrder.aspx'">Pick your Order</button>

</body>
</html>

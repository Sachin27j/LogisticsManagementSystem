<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustOrder.aspx.cs" Inherits="ProjectMain.CustOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <title></title>
    <style>
     #gv_order{
            border : 5px solid black;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gv_order" runat="server" CssClass="table table-striped table-hover table-dark"></asp:GridView>
        </div>
    </form>
</body>
</html>

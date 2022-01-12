<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PickOrder.aspx.cs" Inherits="ProjectMain.PickOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <style type="text/css">
            .form-group{         
           width:300px;
            }
            #cards{
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                position:relative;
                top:0px;
                left:100px;
                height :150px;
                width:350px;
                background-color:lightgray;
                border-radius:35px;
                padding-left:15px;
                padding-top:10px;
            }
            
            #qr_div{
                visibility:hidden;
                height :350px;
                width: 300px;
                background-image:linear-gradient(to bottom right, #2193b0, #6dd5ed);
                margin-left:110px;
                border-radius:35px;
            }
            #hain{
                visibility:hidden;
            }
            .qrc{
                padding-left:25px;
            }
            
        </style>
        
</head>
<body>
    <p style="font-weight:bold;margin-left:110px;">Kindly Enter the Order ID</p>
    <form id="form1" runat="server">
        <div id="cards">            
           <div class="form-group">
                <label for="c_id">Order ID</label>
                <input type="number" class="form-control" id="o_id" placeholder="Order Id" runat="server"/>
           </div>
            <asp:Button class ="btn btn-primary" Text="Submit" ID="Button3" OnClick="OrderIdSubmit" runat="server" />
        </div>

    <br />
    <p id="orderText" runat="server" style="text-decoration:underline;margin-left:150px;"></p>
    <div id="qr_div" runat="server">
        <p id="ttt" style="margin-left:20px;" runat="server" ></p>
        <asp:Image class="qrc" ID="imgageQRCode" Width="100px"
               Height="100px" runat="server"
               Visible="false" /> <b /><br />
        <br />
            <asp:Button class ="btn btn-primary" Text="Submit" ID="nn" OnClick="btnQCGenerate_Click" Visible="false" runat="server" />
            <asp:Button class ="btn btn-success" Text="Check" ID="check" OnClick="compareQR" Visible="false" runat="server" />
        <br />
        <div id="match" class="alert alert-success" role="alert" runat="server">
        </div>
        <div id="nomatch" class="alert alert-danger" role="alert" runat="server">
        </div>
            </div>
        <asp:Button class="btn btn-primary" Text="Progress" ID="btnProgress" Visible="false" OnClick="ScrChange" runat="server" />
</form>
   </body>
</html>

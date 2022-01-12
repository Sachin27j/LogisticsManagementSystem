<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderForm.aspx.cs" Inherits="ProjectMain.OrderForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">  
            #back{  
                -webkit-filter: blur(4px);  
                filter: blur(4px);  
                width:1250px;
            }  
            .text-block {
  position: absolute;
  top: 25%;
  right: 40%;
  background-color: black;
  color: white;
  opacity:0.4;
  height:500px;
  padding-left: 20px;
  padding-right: 20px;
  border-radius:5px;
  padding-bottom:20px;
}
            #success{
                color:aquamarine;
                text-decoration:double;
            }
            .qrc{
                image-rendering: -webkit-optimize-contrast;
            }
        </style>
</head>
<body>
    <div id="qcdiv">
    <asp:Image class="qrc" ID="imgageQRCode" Width="100px"
               Height="100px" runat="server"
               Visible="false" /> <b /><br />
        </div>
    <form id="form1" runat="server">
        <img id="back" src="Background.jpg" />
        <div class="text-block">
    <div class="form-group">
    <label for="ord_c_id">Customer ID</label>
    <input type="text" class="form-control" id="ord_c_id" placeholder="Your ID" runat="server"/>
    </div>
    <div class="form-group">
    <label for="ord_weight">Weight Needed (in Ton)</label>
    <input type="number" class="form-control" id="ord_weight" placeholder="Weight" runat="server"/>
    </div>
        <div class="form-group">
         <label for="ord_sel1">Select Material:</label>
         <select class="form-control" id="ord_sel1" runat="server">
         <option>Steel Scrap</option>
         <option>Bran</option>
        <option>Gasoline</option>
        <option>Glycerol</option>
        </select>
        </div>
        <div class="form-group">
         <label for="ord_sel2">Select Scrapyard:</label>
         <select class="form-control" id="ord_sel2" runat="server">
         <option>Jamshedpur</option>
         <option>Kolkata</option>
        <option>Dhanbad</option>
        <option>Bokaro</option>
        </select>
        </div>
        <div id="btndiv">
  <asp:Button class ="btn btn-primary" Text="Submit" OnClick="OrderSubmit"  runat="server" />
            <p id="success" runat="server"></p>
            <p id="success2" runat="server"></p>
        </div>
       </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderProcess.aspx.cs" Inherits="ProjectMain.OrderProcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<head runat="server">
    <title></title>
    <style type="text/css">
        img {  
                -webkit-filter: blur(4px);  
                filter: blur(4px);  
                width:1250px;
                position:absolute;
            }  
        #orddet{
            height:150px;
        }
        #card1
        {
            position:absolute;
            width:250px;
            height:250px;
            border-radius:15px;
            border:5px solid black;
            background-image:linear-gradient(to bottom right, #2193b0, #6dd5ed);
            float:left;margin-right:10px;margin-left:45px;
            box-shadow: 5px 5px 5px black;
        }
        #card2
        {
            
            position:absolute;
            left:34%;
            width:250px;
            height:250px;
            border-radius:15px;
            border:5px solid black;
            background-image:linear-gradient(to bottom right, #2193b0, #6dd5ed);
            float:left;margin-right:10px;margin-left:15px;
            box-shadow: 5px 5px 5px black;
        }
        #card3
        {
            position:absolute;
            left:65%;
            width:250px;
            height:250px;
            border-radius:15px;
            border:5px solid black;
            background-image:linear-gradient(to bottom right, #2193b0, #6dd5ed);
            float:left;margin-right:10px;margin-left:15px;
            box-shadow: 5px 5px 5px black;
        }
        .sty
        {
            float : left;
            margin-top:50px;
            margin-left:35px;
            text-decoration:dashed;
            font-weight:bold;
        }
        #totwet{
            float : left;
            margin-top:50px;
            margin-left:50px;
            margin-right:1px;
            text-decoration:dashed;
            font-weight:bold;
        }
        #jumbo
        {
            position:absolute;
            background-image:linear-gradient(to bottom right, #FFDD3C, #FFEA61);
            border-radius:15px;
            border:5px solid black;
            height:500px;
            width:900px;
            margin-left:175px;
            margin-top:50px;
        }
        .pos
        {
         position:absolute;
         left:740px;
         top:430px;

        }
    </style>
</head>
<body>
    <img src="Background.jpg" />
    <form id="form1" runat="server">
        <div id="jumbo">
        <div id="orddet">
           <h3> <p id="totwet" runat="server" ></p>
            <p id="wetleft" class="sty" runat="server" ></p>
            <p id="not" class="sty" runat="server"></p>
           </h3>
        </div>
        <div id="card1">
            Vehicle 1
            <div class="form-group">
              <label for="v1">Enter Weight(in tons)</label>
              <input type="number" class="form-control" id="v1" placeholder="Enter Weight" runat="server"/>
                <p id="cap1"></p>
                <p id="gross1"></p>
            </div>
            
        </div>
        <div id="card2">
            Vehicle 2
            <div class="form-group">
              <label for="v2">Enter Weight(in tons)</label>
              <input type="number" class="form-control" id="v2" placeholder="Enter Weight" runat="server"/>
                <p id="cap2"></p>
            <p id="gross2"></p>
            </div>
            
        </div>
        <div id="card3">
            Vehicle 3
            <div class="form-group">
              <label for="v3">Enter Weight(in tons)</label>
              <input type="number" class="form-control" id="v3" placeholder="Enter Weight" runat="server"/>
              <p id="cap3"></p>
              <p id="gross3"></p>
            </div>
        </div>
            <asp:Button class ="btn btn-primary pos" Text="Save & Exit" ID="nn" OnClick="TakeOrder" Visible="true" runat="server" />
            <asp:Button class ="btn btn-primary pos" Text="Generate Invoice" ID="Button1" OnClick="TakeOrder" Visible="false" runat="server" />
      </div>
    </form>
</body>
</html>

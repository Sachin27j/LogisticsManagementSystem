<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleReg.aspx.cs" Inherits="ProjectMain.VehicleReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">
        #hmm{
            position : absolute;
            top : 5%;
            left : 5%;
        }
        #st
        {
            text-decoration:dashed;
            text-decoration-color:darkred;
            font-weight:bold;
        }
        img {  
                position:absolute;
                -webkit-filter: blur(4px);  
                filter: blur(4px);  
                width:1250px;
                height : 100%;
            }  
        #gv_active_order{
            border : 5px solid black;
        }
        .form-group{
          
           width:300px;
       }
        #kk{
            position:relative;
            top:200px;
        }
        #vehicle_reg
        {
            margin-top:50px;
            position : relative;
            top : 160px;
            height :750px;
            width : 400px;
            background-color:#FFCC33;
            border-radius: 15px;
            elevation:higher;
            padding-left:20px;
            border : 5px groove black;
        }
    </style>
</head>
<body>
    <img src="Background.jpg" />
    <div id="hmm">
    <p id="st">Your current active orders are :</p>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gv_active_order" runat="server" CssClass="table table-striped table-hover table-dark"></asp:GridView>
        
     <div class="alert alert-success" id="al" runat="server" visible="false" role="alert">
                 Successfully Registered above mentioned Vehicle(s).
                </div>
               <p id="kk">Please enter the vehicle numbers for the pick-up in this form below(must be exactly 10 letters):</p>
            <div id="vehicle_reg">
                <div class="form-group">
                <label for="c_id">Customer ID</label>
                <input type="number" class="form-control" id="c_id" placeholder="The Customer Id" runat="server"/>
                </div>

                <div class="form-group">
                <label for="o_id">Order ID</label>
                <input type="number" class="form-control" id="o_id" placeholder="The Order Id" runat="server"/>
                </div>

                <div class="form-group">
                <label for="vehi1">Vehicle 1</label>
                <input type="text" class="form-control" id="vehi1" placeholder="Vehicle 1" runat="server"/>
                </div>
                <div class="form-group">
                <label for="hc1">Holding Capacity</label>
                <input type="text" class="form-control" id="hc1" placeholder="Holding Capacity" runat="server"/>
                </div>
                <div class="form-group">
                <label for="vehi2">Vehicle 2</label>
                <input type="text" class="form-control" id="vehi2" placeholder="Vehicle 2(optional)" runat="server"/>
                </div>
                <div class="form-group">
                <label for="hc2">Holding Capacity</label>
                <input type="text" class="form-control" id="hc2" placeholder="Holding Capacity" runat="server"/>
                </div>
                <div class="form-group">
                <label for="vehi3">Vehicle 3</label>
                <input type="text" class="form-control" id="vehi3" placeholder="Vehicle 3(optional)" runat="server"/>
                </div>
                <div class="form-group">
                <label for="hc3">Holding Capacity</label>
                <input type="text" class="form-control" id="hc3" placeholder="Holding Capacity" runat="server"/>
                </div>
                <div id="btndiv">
                <asp:Button class ="btn btn-primary" Text="Submit" OnClick="VehicleSubmit" runat="server" />
                </div>
            </div>
        </div>
    </form>
    </div>
</body>
</html>

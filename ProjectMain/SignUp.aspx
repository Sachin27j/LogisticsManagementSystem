<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SgnUp.aspx.cs" Inherits="ProjectMain.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">  
        img {  
            position:absolute;
                -webkit-filter: blur(4px);  
                filter: blur(4px);  
                width:1250px;
            }  
       .form-group{
          
           width:300px;
       }     
       #decor
       {
           position :absolute;
           left : 400px;
            top : 120px;
           padding-left:20px;
           height:685px;
           width:350px;
           border : 5px solid black;
           background-image:linear-gradient(to bottom right, #06beb6, #48b1bf);
       }
    </style>
</head>
<body>
    <img src="Background.jpg" />
    <p id="matchUser" class="text text-danger" runat="server"></p>
    <p id="errorText" class="text text-danger" runat="server"></p>
    <p id="correctText" class="text text-success" runat="server"></p>
    <div id="decor" class="col-md-4">
    <form runat="server">
  <div class="form-group">
    <label for="nameSignUp">Name</label>
    <input type="text" class="form-control" id="nameSignUp" placeholder="Name" runat="server"/>
  </div>
  <div class="form-group">
    <label for="bdaySignUp">Birthday</label>
    <input type="date" id="bdaySignUp" runat="server" class="form-control"/>
  </div>
        <div class="form-group">
    <label for="mailSignup">Email address</label>
    <input type="email" class="form-control" id="mailSignUp" runat="server" aria-describedby="emailHelp" placeholder="Enter email"/>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="passwordSignUp">Password</label>
    <input type="password" class="form-control" id="passwordSignUp" runat="server" placeholder="Password"/>
  </div>
   <div class="form-group">
    <label for="passwordSignUpConfirm">Confirm Password</label>
    <input type="password" class="form-control" id="passwordSignUpConfirm" runat="server" placeholder="Confirm Password"/>
  </div>
    <div class="form-group">
        <label for="phoneSignUp">Phone Number</label>
        <input type="number" class="form-control" id="phoneSignUp" runat="server" placeholder="Phone Number" />
    </div>
        <div class="form-group">
        <label for="townSignUp">Town</label>
            <input type="text" class="form-control" id="townSignUp" runat="server" placeholder="Town" /> 
        </div>
        <div>
  <asp:Button class ="btn btn-primary" Text="Submit" onClick="SignUpSubmit" runat="server" />
            </div>
    </form>
        </div>
    
</body>
</html>

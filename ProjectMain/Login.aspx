<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectMain.Login" %>
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
       .form-group{
           width:300px;
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
 #btndiv
{
 margin-top:10px;
}     
    </style>
</head>
<body>
    <img src="Background.jpg" />
    <div class="text-block">
    <form runat="server">
        <div class="form-group">
    <p id="passwordNotMatch" runat="server"></p>
    <label for="mailLogin">Email address</label>
    <input type="email" class="form-control" id="mailLogin" aria-describedby="emailHelp" placeholder="Enter email" runat="server" />
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="passwordLogin">Password</label>
    <input type="password" runat="server" class="form-control" id="passwordLogin" placeholder="Password"/>
  </div>
  <div class="form-check">
    <input type="checkbox" runat="server" class="form-check-input" id="exampleCheck1"/>
    <label class="form-check-label" for="exampleCheck1">Keep me Logged In</label>
  </div>
        <div id="btndiv">
  <asp:Button class ="btn btn-primary" Text="Submit" OnClick="LoginSubmit" runat="server" />
        </div>
    </form>
        </div>
    
</body>
</html>

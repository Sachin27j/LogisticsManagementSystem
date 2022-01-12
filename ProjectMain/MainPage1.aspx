<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage1.aspx.cs" Inherits="ProjectMain.MainPage1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">
            body {
    height:100%;
    
}
#moreInfo {
    background-image:linear-gradient(to bottom right, #2193b0, #6dd5ed);
    border-radius:7px 4px;
    border:5px solid black;
}
.jumbotron{
    background-image:linear-gradient(to bottom right, #ffafbd, #ffc3a0);
    border:5px solid black;
    margin-top:7px;
}
h2{font-weight:bold;}
.body-content {padding-left: 15px;padding-right: 15px;}
#login{position:absolute; top:0; right:0;}
#signup{position:absolute; top:0; right:5;}
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <ul class="nav justify-content-end">
  <li class="nav-item">
      <asp:Button class ="btn btn-primary nav-link active" Text="Logout" onClick="logoutBtn" runat="server" />
  </li>
  <li class="nav-item">
    <a class="nav-link btn  btn-success" href="Login.aspx" style="margin-left:5px">Login</a>
  </li>
  <li class="nav-item">
    <a class="nav-link btn btn-danger" href="SignUp.aspx" style="margin-left:5px">Sign Up</a>
  </li>
</ul>
     
        <div class="jumbotron">
    <h1>About This Site</h1>
    <p class="lead">
        <b>This site enables you to order byproducts and then we will give you the scrapyard details from where you pick them
        up</b>
    </p>
    <p><a href="https://www.tatasteel.com/#" class="btn btn-primary btn-lg">Learn more about Tata Steel &raquo;</a></p>
</div>

<div class="row" id="moreInfo">
    <div class="col-md-4">
        <h2>About SNTI</h2>
        <p>
            Shavak Nanavati Technical Institute (SNTI), the erstwhile "Jamshedpur Technical Institute" (JTI) was established in 1921, with the inspiration of the Founder
            “Let the Indians learn to do things by themselves”.
        </p>
        <p><a class="btn btn-default" href="https://capabilitydevelopment.org/page/about-snti">Learn more &raquo;</a></p>
    </div>
    <div class="col-md-4">
        <h2>About byproducts</h2>
        <p>
            A by-product is a secondary unit produced in a joint production process that has little value in relation to the main product being produced. In other words,
            it’s a unit that is created inadvertently during the process of manufacturing another product.
        </p>
        <p><a class="btn btn-default" href="https://www.myaccountingcourse.com/accounting-dictionary/byproduct">Learn more &raquo;</a></p>
    </div>
    <div class="col-md-4">
        <h2>About .NET</h2>
        <p>.NET is a free, cross-platform, open source developer platform for building many different types of applications.</p>
        <p><a class="btn btn-default" href="https://dotnet.microsoft.com/learn/dotnet/what-is-dotnet">Learn more &raquo;</a></p>
    </div>
   </div>
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nextPage.aspx.cs" Inherits="ProjectMain.nextPage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">
        #lblQRCode
        {
            font-weight:bold;
            font-display:block;
            color:red;
        }
        #gv1{
            border : 5px solid black;
        }

        body {
    height:100%;
    padding-top: 50px;
    padding-bottom: 20px;
}

#moreInfo {
    background-color: aqua;
    border-radius:7px 4px;
    border:5px solid black;
}
.jumbotron{
    background-color:aqua;
    border:5px solid black;
    margin-top:7px;
}
h2{
    font-weight:bold;
}
/* Set padding to keep content from hitting the edges */
.body-content {
    padding-left: 15px;
    padding-right: 15px;
}
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-4">  
    <asp:GridView ID="gv1" runat="server" CssClass="table table-striped table-hover table-dark"></asp:GridView>
            <a href="QCCode.aspx">Click</a>
            </div>
    </form>
    <div class="jumbotron">
    <h1>About This Site</h1>
    <p class="lead">
        This site enables you to order byproducts and then we will give you the scrapyard details from where you pick them
        up
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
            A by product is a secondary unit produced in a joint production process that has little value in relation to the main product being produced. In other words,
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
</body>
</html>

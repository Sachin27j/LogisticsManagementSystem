<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddData.aspx.cs" Inherits="ProjectMain.AddData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style type="text/css">
       .form-group{
           margin : 0 auto;
           width:300px;
       }
        html body {
               background-image: linear-gradient(to bottom right, aqua,#66FF99);
           }
    </style>

    <title></title>
</head>
<body>
    
     
     <form runat="server">
  <div class="form-group">
    <label for="Id2">ID</label>
    <input type="number" runat="server" class="form-control" id="Id2" aria-describedby="emailHelp" placeholder="Enter Id">
    <small id="Id2" class="form-text text-muted">We'll never share your details with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="Id1">Name</label>
    <input type="text" class="form-control" runat="server" id="Id3" placeholder="Name">
  </div>
   <div class="form-group">
    <label for="bday">Birthday</label>
    <input type="date" id="bday" runat="server" class="form-control">
  </div>
  <div class="form-group form-check">
    <input type="radio" class="form-check-input" id="field" name="type" value="check" runat="server">
    <label class="form-radio-label"  runat="server" for="field">Field Agent</label>
  </div>
   <div class="form-group form-check">
    <input type="radio" class="form-check-input" id="desk" name="type" value="check" runat="server">
    <label class="form-radio-label" runat="server" for="desk">Desk Agent</label>
  </div>
         <div class="form-group">
    <label for="rmail">Email address</label>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" runat="server">
    <small id="ema" class="form-text text-muted" runat="server" >We'll never share your email with anyone else.</small>
  </div>
         <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" runat="server" id="password" placeholder="Password">
  </div>

        <div style="text-align:center">
         <asp:Button class ="btn btn-primary" Text="Submit"  runat="server" />
         </div>
             
</form>
    

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true"
   CodeBehind="QCCode.aspx.cs"
   Inherits="QRCodeSample.QCCode" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" Integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>

      <title>Sample ASP.NET application to Generate and
         Read QR Code from a Browser</title>
       <style type="text/css">
           #txtQCCode{
               border:5px solid black;
           }
           body {
               background-image: linear-gradient(to bottom right, red, yellow);
           }
       </style>
   </head>
   <body>
      <form id="QCFrom" runat="server">
         <div class="col-md-4">
            <asp:TextBox ID="txtQCCode" runat="server">
            </asp:TextBox>
            <asp:Button ID="btnQCGenerate" runat="server"
               Text="Create My QR Code"
               OnClick="btnQCGenerate_Click" />
            <hr/>
            <asp:Image ID="imgageQRCode" Width="100px"
               Height="100px" runat="server"
               Visible="false" /> <b /><br />
            <asp:Button ID="btnQCRead" Text="Read My QR Code"
               runat="server" OnClick="btnQCRead_Click" />
               <br /><br />
            <asp:Label ID="lblQRCode" runat="server">
            </asp:Label>
            
             <asp:Button class ="btn btn-primary" ID="check" Text="Lets Do This" OnClick="func" runat="server" />
          </div>
      </form>
   </body>
   </html>
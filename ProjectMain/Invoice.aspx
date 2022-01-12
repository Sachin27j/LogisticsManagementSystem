<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="ProjectMain.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="en">
  <head runat="server">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <meta charset="utf-8">
    <title>Example 1</title>
    <style type="text/css">
        .clearfix:after {
  content: "";
  display: table;
  clear: both;
}

a {
  color: #5D6975;
  text-decoration: underline;
}

body {
  position: relative;
  width: 21cm;  
  height: 29.7cm; 
  margin: 0 auto; 
  color: #001028;
  background: #FFFFFF; 
  font-family: Arial, sans-serif; 
  font-size: 12px; 
  font-family: Arial;
}

header {
  padding: 10px 0;
  margin-bottom: 30px;
}

#logo {
  text-align: center;
  margin-bottom: 10px;
}

#logo img {
  width: 90px;
}

h1 {
  border-top: 1px solid  #5D6975;
  border-bottom: 1px solid  #5D6975;
  color: #5D6975;
  font-size: 2.4em;
  line-height: 1.4em;
  font-weight: normal;
  text-align: center;
  margin: 0 0 20px 0;
  background: url(dimension.png);
}

#project {
  float: left;
}

#project span {
  color: #5D6975;
  text-align: right;
  width: 52px;
  margin-right: 10px;
  display: inline-block;
  font-size: 0.8em;
}

#company {
  float: right;
  text-align: right;
}

#project div,
#company div {
  white-space: nowrap;        
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  margin-bottom: 20px;
}

table tr:nth-child(2n-1) td {
  background: #F5F5F5;
}

table th,
table td {
  text-align: center;
}

table th {
  padding: 5px 20px;
  color: #5D6975;
  border-bottom: 1px solid #C1CED9;
  white-space: nowrap;        
  font-weight: normal;
}

table .service,
table .desc {
  text-align: left;
}

table td {
  padding: 20px;
  text-align: right;
}

table td.service,
table td.desc {
  vertical-align: top;
  font-size: 1.2em;
}

table td.unit,
table td.qty,
table td.total {
    vertical-align: top;
  font-size: 1.2em;
}

table td.grand {
  border-top: 1px solid #5D6975;;
}

#notices .notice {
  color: #5D6975;
  font-size: 1.2em;
}

footer {
  color: #5D6975;
  width: 100%;
  height: 30px;
  position: absolute;
  bottom: 0;
  border-top: 1px solid #C1CED9;
  padding: 8px 0;
  text-align: center;
}
    </style>
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="logo.jpg">
      </div>
      <h1>INVOICE</h1>
      <div id="company" class="clearfix">
        <div>Tata Steel Pvt. Ld</div>
        <div>Near Bistupur Roads,<br />Jamshedpur , 831001</div>
        <div> 022 6665 8282</div>
        <div><a href="mailto:company@example.com">sachinkmr34@gmail.com</a></div>
      </div>
      <div id="project">
        <div><span>PROJECT</span> Website development</div>
        <div><span>ID</span><span id="idno" runat="server" ></span></div>
        <div><span>CLIENT</span> <span id="name" runat="server"></span></div>
        <div><span>TOWN</span> <span id="town" runat="server"></span></div>
        <div><span>EMAIL</span><span id="email" runat="server"></span></div>
          <div><span>PHONE NO.</span><span id="pno" runat="server"></span></div>
        <div><span>DATE</span><span id="date" runat="server"></span></div>
      </div>
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service">MATERIAL</th>
            <th class="desc">SCRAPYARD LOCATION</th>
            <th class="service">RATE</th>
            <th class="service">QTY</th>
            <th class="service">TOTAL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="service" id="material" runat="server"></td>
            <td class="desc"><p id="scrapyard" runat="server"></p></td>
            <td class="service" id="rate" runat="server"></td>
            <td class="service" id="quantity" runat="server"></td>
            <td class="service" id="amount" runat="server"></td>
          </tr>
          <tr>
            <td class="service"></td>
            <td class="desc">Total Number of Trips taken : <p id="trips" runat="server"></p></td>
            <td class="unit"></td>
            <td class="qty"></td>
            <td class="total"></td>
          </tr>
          <tr>
              <td class="service"></td>
            <td class="desc">Vehicles Used :</td>
            <td class="unit"></td>
            <td class="qty"></td>
            <td class="total"></td>
          </tr>
          <tr>
            <td class="service"></td>
            <td class="desc"><p id="vehic1" runat="server"></p><p id="vehic2" runat="server"></p><p id="vehic3" runat="server"></p></td>
            <td class="unit"></td>
            <td class="qty"></td>
            <td class="total"></td>
          </tr>
          <tr>
            <td colspan="4">SUBTOTAL</td>
            <td class="service" id="amount1" runat="server" ></td>
          </tr>
          <tr>
            <td colspan="4">TAX 25%</td>
            <td class="service" id="tax" runat="server"></td>
          </tr>
          <tr>
            <td colspan="4" class="grand total">GRAND TOTAL</td>
            <td class="service" id="fullAmount" runat="server"></td>
          </tr>
        </tbody>
      </table>
      <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
      </div>
    </main>
    <footer>
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
  </body>
</html>
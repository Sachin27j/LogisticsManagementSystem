using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Data.SqlClient;
using System.Globalization;
using ProjectMain.Models;
using ZXing;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using System.Security.Cryptography;
using System.Text.RegularExpressions;

namespace ProjectMain
{
    public partial class PickOrder : System.Web.UI.Page
    {
        String oid;
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        
        protected void OrderIdSubmit(object sender, EventArgs e)
        {
       
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            oid = o_id.Value;
            Session["oid"] = oid;
            String query1 = "Select mat_req,weight_ordered,from_scrapyard from custorder where c_id=" + Session["id"] + " and o_id=" + oid;
            OracleCommand comm = new OracleCommand(query1, myConnection);
            OracleDataReader read = comm.ExecuteReader();
            String mat = " ", wei = " ", scr = " ";
            String scrap = "";
            if (read.Read())
            {
                mat = read[0].ToString();
                wei = read[1].ToString();
                scr = read[2].ToString();
            }
            if (scr.Equals("1"))
            {
                scrap = "Jamshedpur";
            }
            else if (scr.Equals("2"))
            {
                scrap = "Kolkata";
            }
            else if (scr.Equals("3"))
            {
                scrap = "Dhanbad";
            }
            else
            {
                scrap = "Bokaro";
            }
            if (mat.Equals(" ") || wei.Equals(" ") || scr.Equals(" "))
            {
                orderText.InnerText = "Invalid Order ID , please check again";
            }
            else
            {
                ttt.InnerText = "Please show your QR Code:";
                nn.Visible = true;
                qr_div.Style.Add("visibility", "visible");
                orderText.InnerText = "You have ordered " + wei + " ton(s) of " + mat + " which you will collect from " + scrap;
            }
            
        }
        private void GenerateMyQCCode(string QCText)
        {
            var QCwriter = new BarcodeWriter();
            QCwriter.Format = BarcodeFormat.QR_CODE;
            var result = QCwriter.Write(QCText);
            string path = Server.MapPath("~/images/MyQRImage.jpg");
            var barcodeBitmap = new Bitmap(result);

            using (MemoryStream memory = new MemoryStream())
            {
                using (FileStream fs = new FileStream(path,
                   FileMode.Create, FileAccess.ReadWrite))
                {
                    barcodeBitmap.Save(memory, ImageFormat.Jpeg);
                    byte[] bytes = memory.ToArray();
                    fs.Write(bytes, 0, bytes.Length);
                    barcodeBitmap.Dispose();
                    fs.Dispose();
                }
            }
            imgageQRCode.Visible = true;
            imgageQRCode.ImageUrl = "~/images/MyQRImage.jpg";           
        }
        protected void btnQCGenerate_Click(object sender, EventArgs e)
        {
            check.Visible = true;

            GenerateMyQCCode(Session["id"] + "00" + Session["oid"]);
        }
        protected void compareQR(object sender, EventArgs e)
        {
            var QCreader = new BarcodeReader();
            string QCfilename = Path.Combine(Request.MapPath
               ("~/images"), "MyQRImage.jpg");
            var QCresult = QCreader.Decode(new Bitmap(QCfilename));
            String decoded = "";
            if (QCresult != null)
            {
                decoded = QCresult.Text;
            }
            if (decoded.Equals(Session["id"] + "00" + Session["oid"]))
            {
                myConnection.ConnectionString = myConnectionString;
                myConnection.Open();
                match.InnerText = "Code Matched , You may enter!";
                String query1 = "Select weight_left from orderprocess where c_id=" + Session["id"] + " and o_id=" + Session["oid"] +" and rownum=1 order by weight_left";
                OracleCommand comm = new OracleCommand(query1, myConnection);
                OracleDataReader read = comm.ExecuteReader();
                String ans = "";
                if (read.Read())
                    ans = read[0].ToString();
                if (ans.Equals("0"))
                    Response.Redirect("Invoice.aspx");
                else
                    btnProgress.Visible = true;
            }
            else
            {
                nomatch.InnerText = "Sorry , Wrong QR Code";
            }
            myConnection.Close();
        }
        protected void ScrChange(object sender, EventArgs e)
        {
            Response.Redirect("OrderProcess.aspx");
        }
    }
}
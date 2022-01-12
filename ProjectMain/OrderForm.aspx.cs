using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Oracle.DataAccess.Client;
using System.Globalization;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using ZXing;

namespace ProjectMain
{
    public partial class OrderForm : System.Web.UI.Page
    {
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Welcome Id Number " + Session["id"]);

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
                }
            }
            imgageQRCode.Visible = true;
            imgageQRCode.ImageUrl = "~/images/MyQRImage.jpg";

        }
        protected void OrderSubmit(object sender, EventArgs e)
        {
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            String check = "Select count(*) from customer where id=" + ord_c_id.Value;
            OracleCommand comm = new OracleCommand(check, myConnection);
            OracleDataReader read = comm.ExecuteReader();
            if (read.Read())
            {
                String user = read[0].ToString();
                comm.Dispose();
                myConnection.Close();
                if (user.Equals("1"))
                {
                    myConnection.Open();
                    String query1 = "Select id from Scrapyard where location ='" + ord_sel2.Value.ToString() + "'";
                    OracleCommand comm2 = new OracleCommand(query1, myConnection);
                    comm2.Connection = myConnection;
                    read = comm2.ExecuteReader();
                    String scrap_id="";
                    if(read.Read())
                    scrap_id = read[0].ToString();
                    comm2.Dispose();
                    myConnection.Close();
                    myConnection.Open();
                    String query2 = "Insert into CustOrder Values(ord_id_seq.nextval," + ord_c_id.Value + ",'" + ord_sel1.Value.ToString() + "','" + ord_weight.Value.ToString() + "'," +scrap_id+ ",1)";
                    OracleCommand comm3 = new OracleCommand(query2, myConnection);   
                    read= comm3.ExecuteReader();
                    success.InnerText = "Order Placed Successfully";
                    success2.InnerText = "Please save this QR Code";
                    comm3.Dispose();
                    query1 = "Select max(o_id) from CustOrder where c_id=" + Session["id"];
                    comm2 = new OracleCommand(query1, myConnection);
                    comm2.Connection = myConnection;
                    read = comm2.ExecuteReader();
                    String ord_id = "";
                    if (read.Read())
                        ord_id = read[0].ToString();
                    comm2.Dispose();
                    GenerateMyQCCode(Session["id"]+"00"+ord_id);
                    myConnection.Close();
                    return;
                }
            }
        }
    }
}
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
using System.Configuration;

namespace ProjectMain
{
    public partial class OrderProcess : System.Web.UI.Page
    {
        String val = "";
        String mat = "", wei = "";
        String left = "";
        String oid;
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            String query1 = "Select mat_req,weight_ordered from custorder where c_id=" + Session["id"] + " and o_id=" + Session["oid"];
            OracleCommand comm = new OracleCommand(query1, myConnection);
            OracleDataReader read = comm.ExecuteReader();
            
            if(read.Read())
            {
                mat = read[0].ToString();
                wei = read[1].ToString();
            }
            String query2 = "Select count(c_id) from orderprocess where c_id=" + Session["id"] + " and o_id=" + Session["oid"];
             comm = new OracleCommand(query2, myConnection);
             read = comm.ExecuteReader();
            int ans = 0;
            
            if(read.Read())
            {
                val = read[0].ToString();
                comm.Dispose();
            }
            if(val.Equals("0"))
            {
                ans = Int16.Parse(wei);
                totwet.InnerText = "Total Weight : " + ans;
                wetleft.InnerText = "Weight Left : " + ans;
                not.InnerText = " Trip Number : 1";
                left = ans.ToString();
            }
            else
            {
                String query3= "Select total_weight,weight_left from orderprocess where c_id=" + Session["id"] + " and o_id=" + Session["oid"]+" and rownum<=1 order by weight_left";
                comm = new OracleCommand(query3, myConnection);
                read = comm.ExecuteReader();
                
                if (read.Read())
                {

                    left = read[1].ToString();
                    if (left.Equals("0"))
                    {
                        nn.Visible = false;
                        Button1.Visible = true;

                    }
                    else
                    {
                        totwet.InnerText = "Total Weight : " + read[0].ToString();
                        wetleft.InnerText = "Weight Left : " + left;
                        int tno = Int16.Parse(val) + 1;
                        not.InnerText = " Trip Number : " + tno;
                    }
                    
                }

            }

        }
        protected void TakeOrder(object sender, EventArgs e)
        {
            int val1 = v1.Value.Length==0?0:Int16.Parse(v1.Value);
            int val2 = v2.Value.Length == 0 ? 0:Int16.Parse(v2.Value);
            int val3 = v3.Value.Length == 0 ? 0:Int16.Parse(v3.Value);
            int wel = Int16.Parse(left);
            int total = Int16.Parse(wei);
            int newWeL = wel - (val1 + val2 + val3);
            String matr = mat;
            String query4 = "INSERT into orderprocess VALUES("+Session["id"]+","+Session["oid"]+","+total+","+newWeL+",'"+matr+"',"+val1+","+val2+","+val3+")";
            OracleCommand command = new OracleCommand(query4, myConnection);
            OracleDataReader reader = command.ExecuteReader();
            myConnection.Close();
            Response.Redirect("MainPage2.aspx");
        }
    }
}
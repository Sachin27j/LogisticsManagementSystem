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
    
    public partial class Invoice : System.Web.UI.Page
    {
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
           myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            String query1 = "Select * from customer where id=" + Session["id"];
            OracleCommand comm = new OracleCommand(query1, myConnection);
            OracleDataReader read = comm.ExecuteReader();
            String idno1 = "", name1 = "", dob1 = "", email1 = "", town1 = "", pno1 = "";
            if (read.Read())
            {
                idno1 = read[0].ToString();
                name1 = read[1].ToString();
                dob1 = read[2].ToString();
                email1 = read[3].ToString();
                town1 = read[5].ToString();
                pno1 = read[6].ToString();
            }
            query1 = "Select vehicle_no from vehicles where c_id =" + Session["id"] + " and o_id=" + Session["oid"] + " order by v_priority";
            comm = new OracleCommand(query1, myConnection);
            read = comm.ExecuteReader();
            List<string> vehi = new List<string>();
            while (read.Read())
            {
                vehi.Add(read[0].ToString());
            }
            String vehi1 = "", vehi2 = "", vehi3 = "";
            if(vehi.Count==3)
            {
                vehi1 = vehi[0];
                vehi2 = vehi[1];
                vehi3 = vehi[2];
            }
            else if(vehi.Count==2)
            {
                vehi1 = vehi[0];
                vehi2 = vehi[1];
            }
            else if(vehi.Count==1)
            {
                vehi1 = vehi[0];
            }
            query1 = "Select count(c_id) from orderprocess where c_id=" + Session["id"] + " and o_id=" + Session["oid"];
            comm = new OracleCommand(query1, myConnection);
            read = comm.ExecuteReader();
            String not = "";
            if(read.Read())
            {
                not = read[0].ToString();
            }
            query1 = "Select mat_req from orderprocess where c_id=" + Session["id"] + " and o_id=" + Session["oid"]+" and rownum=1";
            comm = new OracleCommand(query1, myConnection);
            read = comm.ExecuteReader();
            String mat = "";
            if(read.Read())
            {
                mat = read[0].ToString();
            }
            query1 = "Select val_per_ton from material where name='" + mat+"'";
            comm = new OracleCommand(query1, myConnection);
            read = comm.ExecuteReader();
            String val = "";
            if(read.Read())
            {
                val = read[0].ToString();
            }
            query1 = "Select weight_ordered from custorder where c_id=" + Session["id"] + " and o_id=" + Session["oid"];
            comm = new OracleCommand(query1, myConnection);
            read = comm.ExecuteReader();
            String wei = "";
            if (read.Read())
            {
                wei = read[0].ToString();
            }
            int valnum = Int16.Parse(val);
            int weight = Int16.Parse(wei);
            idno.InnerText = idno1;
            name.InnerText = name1;
            email.InnerText = email1;
            pno.InnerText = pno1;
            town.InnerText = town1;
            vehic1.InnerText = vehi1;
            vehic2.InnerText = vehi2;
            vehic3.InnerText = vehi3;
            trips.InnerText = not;
            material.InnerText = mat;
            rate.InnerText = val;
            quantity.InnerText = wei;
            amount.InnerText = (valnum*weight).ToString();
            amount1.InnerText= (valnum * weight).ToString();
            tax.InnerText = ((valnum * weight) / 4).ToString();
            fullAmount.InnerText = ((valnum * weight) + ((valnum * weight) / 4)).ToString();
            DateTime dateTime = DateTime.Today;
            date.InnerText = dateTime.ToString("dd/MM/yyyy");


        }

    }
}
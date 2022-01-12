using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Oracle.DataAccess.Client;
using System.Globalization;

namespace ProjectMain
{
    public partial class Login : System.Web.UI.Page
    {
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void LoginSubmit(object sender, EventArgs e)
        {
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            String query1 = "Select password,id from Customer where email='"+mailLogin.Value+"'";
            OracleCommand comm = new OracleCommand(query1, myConnection);
            OracleDataReader read = comm.ExecuteReader();
            String dbpass = "wrong";
            if (read.Read())
            {
                dbpass = read[0].ToString();
            }
            if(dbpass.Equals(passwordLogin.Value))
            {
                Response.Write("Logged in");
                Session["id"] = read[1].ToString();
                Response.Redirect("MainPage2.aspx");
            }
            else
            {
                passwordNotMatch.InnerText="Wrong Password , TRY AGAIN";
            }
            
            comm.Dispose();
            myConnection.Close();

        }
    }
}
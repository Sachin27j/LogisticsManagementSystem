using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Oracle.DataAccess.Client;


namespace ProjectMain
{
    public partial class AddData : System.Web.UI.Page
    {
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
        }
        protected void SubFunc(object sender, EventArgs e)
        {
            OracleCommand command;
            OracleDataAdapter adapter = new OracleDataAdapter();
            String id = Id2.Value;
            String name = Id3.Value;
            String dob = "12-Aug-1999";
            String type = "k";
            String sql;
            if (field.Checked)
            {
                type = "Field";
            }
            else if (desk.Checked)
            {
                type = "Desk";
            }
            String mail = email.Value;
            String pass = password.Value;
            sql = "INSERT into AGENT values(" + id + ", '" + name + "', '" + dob
 + "','" + type + "','" + mail + "','" + pass + "')";
            command = new OracleCommand(sql, myConnection);
            adapter.InsertCommand = new OracleCommand(sql, myConnection);
            adapter.InsertCommand.ExecuteNonQuery();

            command.Dispose();
            Response.Write("Connection MAde");
            myConnection.Close();

            /*var myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
            OracleConnection myConnection = new OracleConnection();
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            Response.Write("done");
            myConnection.Close();*/
        }
    }
}

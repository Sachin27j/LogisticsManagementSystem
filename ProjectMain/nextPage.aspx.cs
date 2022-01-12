using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;

namespace ProjectMain
{
    public partial class nextPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             //gv1.HeaderRow.TableSection = TableRowSection.TableHeader;
            // var myConnectionString = "DATA SOURCE = DESKTOP - 0SH7L88:1521/XE;USER ID = SYSTEM;PASSWORD = 12345678";
            var myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
            OracleConnection myConnection = new OracleConnection();
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
          /*  OracleCommand command;
            OracleDataAdapter adapter = new OracleDataAdapter();
            String sql = "";
            String id = "1";
            String name = "kuku";
            String dob = "27-Sep-2000";
            String type = "Field";
            String mail = "see.com";
            String pass = "password";

            sql = "INSERT into AGENT values(" + id +", '" + name + "', '" + dob
  + "','" + type + "','" + mail + "','" + pass + "')";
            command = new OracleCommand(sql, myConnection);
            adapter.InsertCommand = new OracleCommand(sql, myConnection);
            adapter.InsertCommand.ExecuteNonQuery();
            Response.Write("Done");
            command.Dispose();
            myConnection.Close();*/
            OracleDataAdapter SQLAdapter = new OracleDataAdapter("Select * from agent", myConnection);
            DataTable DT = new DataTable();

            SQLAdapter.Fill(DT);
            gv1.DataSource = DT;
            gv1.DataBind();
            myConnection.Close();
            //String sql = "Select * from agent";
            //OracleCommand command = new OracleCommand(sql, myConnection);
            //OracleDataReader reader = command.ExecuteReader(); 
            //if(reader.Read())
            //{
            // =reader.GetValue(1).ToString();
            //}

        }
        

    }
}

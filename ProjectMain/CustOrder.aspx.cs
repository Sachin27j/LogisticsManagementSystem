using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;

namespace ProjectMain
{
    public partial class CustOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
            OracleConnection myConnection = new OracleConnection();
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            OracleDataAdapter SQLAdapter = new OracleDataAdapter("Select * from CustOrder where c_id ="+Session["id"], myConnection);
            DataTable DT = new DataTable();

            SQLAdapter.Fill(DT);
            gv_order.DataSource = DT;
            gv_order.DataBind();
            myConnection.Close();
        }
    }
}
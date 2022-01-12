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

namespace ProjectMain
{
    public partial class VehicleReg : System.Web.UI.Page
    {
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();
        protected void Page_Load(object sender, EventArgs e)
        {           
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            OracleDataAdapter SQLAdapter = new OracleDataAdapter("Select * from CustOrder where c_id =" + Session["id"]+" and active_or_not=1", myConnection);
            DataTable DT = new DataTable();
            SQLAdapter.Fill(DT);
            gv_active_order.DataSource = DT;
            gv_active_order.DataBind();
            myConnection.Close();
        }
        protected void VehicleSubmit(object sender, EventArgs e)
        {
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            String cid = c_id.Value;
            String oid = o_id.Value;
            String v1 = vehi1.Value;
            String v2 = vehi2.Value.Length>0?vehi2.Value:" ";
            String v3 = vehi3.Value.Length > 0 ? vehi3.Value : " ";
            String c1 = hc1.Value;
            String c2 = hc2.Value;
            String c3 = hc3.Value;
            String query = "INSERT into Vehicles VALUES(" + cid + "," + oid + ",'" + v1 + "',1,"+c1+")";
            OracleCommand command = new OracleCommand(query, myConnection);
            OracleDataReader reader = command.ExecuteReader();
            if (!v2.Equals(" "))
            {
                query = "INSERT into Vehicles VALUES(" + cid + "," + oid + ",'" + v2 + "',2,"+c2+")";
                command = new OracleCommand(query, myConnection);
                reader = command.ExecuteReader();
            }            
            if (!v3.Equals(" "))
            {
                query = "INSERT into Vehicles VALUES(" + cid + "," + oid + ",'" + v3 + "'3,"+c3+")";
                command = new OracleCommand(query, myConnection);
                reader = command.ExecuteReader();
            }
            al.Visible = true;
            myConnection.Close();
        }
    }
}
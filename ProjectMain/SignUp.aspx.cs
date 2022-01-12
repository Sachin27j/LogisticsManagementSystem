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
    public partial class SignUp : System.Web.UI.Page
    {
        String myConnectionString = "user id=SYSTEM;password=12345678;data source=(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=DESKTOP-0SH7L88)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)))";
        OracleConnection myConnection = new OracleConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        protected void SignUpSubmit(object senfer ,EventArgs e)
        {
            
            myConnection.ConnectionString = myConnectionString;
            myConnection.Open();
            String check = "Select count(*) from Customer where email='" + mailSignUp.Value + "'";
            OracleCommand comm = new OracleCommand(check, myConnection);
            OracleDataReader read = comm.ExecuteReader();
            if(read.Read())
            {
                String user = read[0].ToString();
                if (user.Equals("1"))
                {
                    Response.Write(user);
                    matchUser.InnerText = "User Already Exists";
                    return;
                }
            }
            String p1 = passwordSignUp.Value.ToString();
            String p2 = passwordSignUpConfirm.Value.ToString();
           if(p1.Equals(p2))
            { 
                errorText.InnerText = "";
            }
            else
            {
                correctText.InnerText = "";
                errorText.InnerText = "Passwords Dont Match";
                return;
            }
            String query;
            DateTime dt = Convert.ToDateTime(bdaySignUp.Value.ToString());
            String date=dt.ToString("dd MMM yyyy");
            query = "Insert into Customer Values(id_seq.nextval,'" + nameSignUp.Value + "','" + date + "','" + mailSignUp.Value + "','" + passwordSignUp.Value + "','" + townSignUp.Value + "'," + phoneSignUp.Value + ")";
            OracleCommand command = new OracleCommand(query, myConnection);
            OracleDataReader reader = command.ExecuteReader();
            command.Dispose();
            myConnection.Close();
        }
    }
}
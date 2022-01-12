using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectMain
{
    public partial class MainPage1 : System.Web.UI.Page
    {
        String msg;
        protected void Page_Load(object sender, EventArgs e)
        {
           // msg = "Welcome " + (string)Session["id"];
            //Response.Write(msg);
        }
        protected void logoutBtn(object sender, EventArgs e)
        {
           Session.Abandon();
            msg = "";
        }

    }
}
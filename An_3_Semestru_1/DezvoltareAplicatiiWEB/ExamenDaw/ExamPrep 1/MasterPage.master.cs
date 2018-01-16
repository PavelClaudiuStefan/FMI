using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void onSearch(object sender, EventArgs e)
    {
        string denumire = textboxDenumire.Text;
        string producator = textboxProducator.Text;

        Response.Redirect("Search.aspx?Denumire=" + denumire + "&Producator=" + producator);
    }
}

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Behind : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BRandom_Click(object sender, EventArgs e)
    {
        Random r = new Random();
        int randomNumber = r.Next(100) + 1;
        LNumber.Text = randomNumber.ToString();
    }
}

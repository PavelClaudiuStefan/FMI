using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string denumire = Request.Params["Denumire"];
            string producator = Request.Params["Producator"];

            labelSearchTerm1.Text = "Denumire: " + denumire;
            labelSearchTerm2.Text = "Producator: " + producator;

            if (denumire != "" && producator != "")
            {
                //SmartphoneSqlDataSource.SelectCommand = "SELECT * FROM [Smartphone] WHERE Denumire LIKE '%@Denumire%' OR Producator LIKE '%@Producator%' ORDER BY IDOs, IDPhone";
                SmartphoneSqlDataSource.SelectCommand = "SELECT * FROM [Smartphone] WHERE Denumire LIKE '%" + denumire + "%' OR Producator LIKE '%" + producator + "%' ORDER BY IDOs, IDPhone";
            }
            else if (denumire != "")
            {
                //SmartphoneSqlDataSource.SelectCommand = "SELECT * FROM [Smartphone] WHERE Denumire LIKE '%@Denumire%' ORDER BY IDOs, IDPhone";
                SmartphoneSqlDataSource.SelectCommand = "SELECT * FROM [Smartphone] WHERE Denumire LIKE '%" + denumire + "%' ORDER BY IDOs, IDPhone";
            }
            else if (producator != "")
            {
                //SmartphoneSqlDataSource.SelectCommand = "SELECT * FROM [Smartphone] WHERE Producator LIKE '%@Producator%' ORDER BY IDOs, IDPhone";
                SmartphoneSqlDataSource.SelectCommand = "SELECT * FROM [Smartphone] WHERE Producator LIKE '%" + producator + "%' ORDER BY IDOs, IDPhone";
            }
            else
            {
                return;
            }
        }
    }
}
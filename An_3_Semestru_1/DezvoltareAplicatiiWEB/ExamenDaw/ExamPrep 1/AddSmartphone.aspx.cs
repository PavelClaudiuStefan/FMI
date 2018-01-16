using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSmartphone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        RangeValidator1.MinimumValue = DateTime.Today.Date.AddYears(-100).ToString("yyyy-MM-dd");
        RangeValidator1.MaximumValue = DateTime.Today.Date.ToString("yyyy-MM-dd");
    }

    protected void onSubmit(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            string osId = dropdownListOs.SelectedValue;
            string denumire = txtboxDenumire.Text;
            string data = txtboxData.Text;
            string producator = txtboxProducator.Text;
            string descriere = txtboxDescriere.Text;

            using (SqlCommand cmd = new SqlCommand("INSERT INTO [Smartphone] (IDOs,Denumire,Data,Producator,Descriere) VALUES(@osId,@denumire,@data,@producator,@descriere)", connection))
            {
                cmd.Parameters.AddWithValue("@osId", osId);
                cmd.Parameters.AddWithValue("@denumire", denumire);
                cmd.Parameters.AddWithValue("@data", data);
                cmd.Parameters.AddWithValue("@producator", producator);
                cmd.Parameters.AddWithValue("@descriere", descriere);

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
            Response.Redirect("Smartphones.aspx");
        }
    }
}
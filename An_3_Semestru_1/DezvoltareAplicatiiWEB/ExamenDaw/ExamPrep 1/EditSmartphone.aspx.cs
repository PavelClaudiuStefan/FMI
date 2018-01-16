using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditSmartphone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string smartphoneId = Request.Params["IDPhone"];
            fillForm(smartphoneId);
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        RangeValidator1.MinimumValue = DateTime.Today.Date.AddYears(-100).ToString("yyyy-MM-dd");
        RangeValidator1.MaximumValue = DateTime.Today.Date.ToString("yyyy-MM-dd");
    }

    private void fillForm(string id)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT IDOs, Denumire, Data, Producator, Descriere FROM Smartphone WHERE IDPhone = @id", connection))
            {
                cmd.Parameters.AddWithValue("id", id);
                try
                {
                    connection.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            dropdownListOs.SelectedValue = reader.GetInt32(0).ToString();
                            txtboxDenumire.Text = reader.GetSqlString(1).ToString();
                            txtboxData.Text = reader.GetDateTime(2).ToString("yyyy-MM-dd");
                            txtboxProducator.Text = reader.GetSqlString(3).ToString();
                            txtboxDescriere.Text = reader.GetSqlString(4).ToString();
                        }
                    }
                }
                catch (SqlException sqlException)
                {
                    System.Diagnostics.Debug.WriteLine(sqlException.ToString());
                }
            }
        }
    }

    protected void onSubmit(object sender, EventArgs e)
    {
        string phoneId = Request.Params["IDPhone"];
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            string osId = dropdownListOs.SelectedValue;
            string denumire = txtboxDenumire.Text;
            string data = txtboxData.Text;
            string producator = txtboxProducator.Text;
            string descriere = txtboxDescriere.Text;

            using (SqlCommand cmd = new SqlCommand("UPDATE [Smartphone] SET IDOs=@osId, Denumire=@denumire, Data=@data,Producator=@producator, Descriere=@descriere WHERE IDPhone=@id", connection))
            {
                cmd.Parameters.AddWithValue("@id", phoneId);
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
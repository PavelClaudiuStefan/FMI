using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnDelete(object sender, EventArgs e)
    {
        string id = Request.Params["IDPhone"];
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Smartphone WHERE IDPhone = @id", connection))
            {
                cmd.Parameters.AddWithValue("@id", id);

                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }
        Response.Redirect("Smartphones.aspx");
    }

    protected void OnCancel(object sender, EventArgs e)
    {
        Response.Redirect("Smartphones.aspx");
    }
}
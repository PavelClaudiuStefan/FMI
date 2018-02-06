using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string id = Request.Params["id"];
            if (id != null)
            {
                try
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Bands.mdf;Integrated Security=True");
                    string sql = "SELECT Name from Band Where ID = @id";

                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("id", id);

                    SqlDataReader r = cmd.ExecuteReader();
                    while (r.Read())
                    {
                        TBName.Text = r["Name"].ToString();
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    LAns.Text = ex.Message;
                }
            }
        }
    }
}
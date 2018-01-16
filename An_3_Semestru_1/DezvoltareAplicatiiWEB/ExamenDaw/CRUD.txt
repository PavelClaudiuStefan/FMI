/* Create **************************************************************************************************** Create */

protected void addSomething(object sender, EventArgs e)
{
    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    using (SqlConnection connection = new SqlConnection(connStr))
    {

        string nume = getNume();
        string prenume = getPrenume();

        using (SqlCommand cmd = new SqlCommand("INSERT INTO [PERSON] (nume,prenume) VALUES(@nume,@prenume)", connection))
        {
            cmd.Parameters.AddWithValue("@nume", nume);
            cmd.Parameters.AddWithValue("@prenume", prenume);

            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        Response.Redirect("Default.aspx");
    }
}




/* Read **************************************************************************************************** Read */

private string getSomething(string id)
{
    string username = "Error";
    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    using (SqlConnection connection = new SqlConnection(connStr))
    {
        using (SqlCommand cmd = new SqlCommand("SELECT something FROM TABLE WHERE id = @id", connection))
        {
            cmd.Parameters.AddWithValue("id", id);
            try
            {
                connection.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        username = reader.GetSqlString(0).ToString();
                    }
                }
            }
            catch (SqlException sqlException)
            {
                System.Diagnostics.Debug.WriteLine(sqlException.ToString());
            }
        }
    }
    return something;
}




/* Update **************************************************************************************************** Update */

protected void updateSomething(object sender, EventArgs e)
{
    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    using (SqlConnection connection = new SqlConnection(connStr))
    {
        int id = getId();
        string nume = getNume();
        string prenume = getPrenume();

        using (SqlCommand cmd = new SqlCommand("UPDATE [PERSON] SET nume=@nume, prenume=@prenume WHERE id=@id", connection))
        {
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@nume", nume);
            cmd.Parameters.AddWithValue("@prenume", prenume);

            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        Response.Redirect("Default.aspx");
    }
}




/* Delete **************************************************************************************************** Delete */

protected void deleteSomething(object sender, EventArgs e)
{
    string id = Request.Params["id"];
    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    using (SqlConnection connection = new SqlConnection(connStr))
    {
        using (SqlCommand cmd = new SqlCommand("DELETE FROM TABLE WHERE id = @id", connection))
        {
            cmd.Parameters.AddWithValue("@id", id);

            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
    }
    Response.Redirect("Default.aspx");
}
<%@ Page Language="c#" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="System.Data.SqlClient" %>

 <script runat="server">

// When page loads, indicate if it's in a postback
public void Page_Load(object s, EventArgs e) {
//  Response.Write("In Page_Load, Page.IsPostBack = " + Page.IsPostBack + "<br>");
  
  if (! Page.IsPostBack) {
    // Databind the drop down
    DropDown1.DataSource = GetSampleDataDR();
    DropDown1.DataValueField = "ID";
    DropDown1.DataTextField = "Name";
    DropDown1.DataBind();

    // Databind the list box
    ListBox1.DataBind();

    // Databind the list box to a data reader
    CheckboxList1.DataSource = GetSampleDataDR();
    CheckboxList1.DataValueField = "ID";
    CheckboxList1.DataTextField = "Name";
    CheckboxList1.DataBind();

    // Databind the radio button list
    RadiobuttonList1.DataSource = GetSampleDataDV();
    RadiobuttonList1.DataValueField = "ID";
    RadiobuttonList1.DataTextField = "Name";
    RadiobuttonList1.DataBind();
  }
}

IDataReader GetSampleDataDR() 
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Northwind.mdf;Integrated Security=True;User Instance=True");
    try
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT ID, Name FROM Category", con);
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        // con.Close();
        return dr;
    }
    catch (Exception ex)
    {
    Response.Write(ex.Message);
        return null;
    }
}

DataView GetSampleDataDV() 
{
    DataSet ds;

    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Northwind.mdf;Integrated Security=True;User Instance=True");
    try
    {
        con.Open();
        SqlDataAdapter adp = new SqlDataAdapter("SELECT ID, Name FROM Category", con);
        ds = new DataSet();
        adp.Fill(ds, "Categories");
        con.Close();
        return ds.Tables["Categories"].DefaultView;
    }
    catch (Exception ex)
    {
        return null;
    }
}

public void List_SelectedIndexChanged (object sender, System.EventArgs e) 
{
  ListControl control = ((ListControl)sender);
  if (control.SelectedIndex > -1)
    msg.Text = "You selected " + control.SelectedItem.Text + 
               ", Value = " + control.SelectedItem.Value;
  else
    msg.Text = "Value was unselected";
}

</script>

<html>
	<head>
		<title>DataBinding3.aspx</title>
	</head>
	<body>
    				
		<a href="DataBinding3.aspx">
			<h3>
				<font face="Verdana">Data Binding from a Database</font>
			</h3>
		</a>
		<form runat="server">
        
       

			<asp:Label id="msg" runat="server" />
			<p>
				<asp:DropDownList id="DropDown1" onSelectedIndexChanged="List_SelectedIndexChanged" autopostback="true" runat="server" />
			<p>
				<asp:ListBox id="ListBox1" onSelectedIndexChanged="List_SelectedIndexChanged" DataValueField="ID" DataTextField="Name" DataSource="<%# GetSampleDataDR() %>" autopostback="true" runat="server" />
			<p>
				<asp:CheckBoxList id="CheckboxList1" onSelectedIndexChanged="List_SelectedIndexChanged" autopostback="true" runat="server" />
			<p>
				<asp:RadioButtonList id="RadiobuttonList1" onSelectedIndexChanged="List_SelectedIndexChanged" autopostback="true" runat="server" />

		</form>
	</body>
</html>

<%@ Import Namespace="System.Collections" %>
<html>
	<head>
		<title>DataBinding2.aspx</title></head>
	<body>
		<a href="DataBinding2.aspx">
			<h3>
				<font face="Verdana">Data Binding Lists</font>
			</h3>
		</a>
		<form runat="server">
			<asp:DropDownList id="DropDown1" SelectedIndex=<%# 2 %> runat="server" />
			<p>
				<asp:ListBox id="ListBox1" SelectedIndex=<%# 2 %> runat="server" />
			<p>
				<asp:CheckBoxList id="CheckboxList1" SelectedIndex=<%# 1 %> runat="server" />
			<p>
				<asp:RadioButtonList id="RadiobuttonList1" SelectedIndex=<%# 1 %> runat="server" />
			<p>
				<asp:Button id="button1" text="Call Page.DataBind()" onClick="PageDataBind" runat="server" />
				<asp:Button id="button2" text="Call Bind DropDown1 to new data()" onClick="DropDown1DataBind" runat="server" />
				<asp:Button id="button3" text="Do Nothing" onClick="DoNothing" runat="server" />
				<script language="c#" runat="server">

// When page loads, indicate if it's in a postback
public void Page_Load(object s, EventArgs e) {
  Response.Write("In Page_Load, Page.IsPostBack = " + Page.IsPostBack + "<br>");
  
  if (! Page.IsPostBack) {
    // Databind the drop down
    string[] sArray1 = new string[] { "January", "February", "March", "April" };
    DropDown1.DataSource = sArray1;
    DropDown1.DataBind();

    // Databind the list box
    string[] sArray2 = new string[] { "2001", "2000", "1999", "1998", "1997", "1996", "1995" };
    ListBox1.DataSource = sArray2;
    ListBox1.DataBind();

    // Databind the checkbox list
    ArrayList sArrayList3 = new ArrayList();
    sArrayList3.Add("Red");
    sArrayList3.Add("Blue");
    sArrayList3.Add("Purple");
    CheckboxList1.DataSource = sArrayList3;
    CheckboxList1.DataBind();

    // Databind the list box
    Hashtable ht = new Hashtable();
    ht.Add(1, "one");
    ht.Add(2, "two");
    ht.Add(3, "three");
    ht.Add(4, "four");
    RadiobuttonList1.DataSource = ht;
    RadiobuttonList1.DataValueField = "Key";
    RadiobuttonList1.DataTextField = "value";
    RadiobuttonList1.DataBind();
  }
}

// Bind all controls on the page
public void PageDataBind(object sender, System.EventArgs e) {
  Page.DataBind();
}

// Bind just label1
public void DropDown1DataBind(object sender, System.EventArgs e) {
  string[] sArray = new string[] { "Sunday", "Monday", "Tuesday", "Wednesday" };
  DropDown1.DataSource = sArray;
  DropDown1.DataBind();
}

// Don't do anything: demonstrates that state is maintained
public void DoNothing(object sender, System.EventArgs e) {
}

				</script>
		</form>
	</body>
</html>

<%@ Page language="C#" %>
<html>
<head>
	<title>WebControls1.aspx</title>
</head>
<script runat="server">

public void Page_Init(object s, EventArgs e) 
{
	Response.Write("In Page_Init<br>");
}

public void Page_Load(object s, EventArgs e) 
{
	if (!Page.IsPostBack)
	{
		text1.Text = "abc";
	}
	Response.Write("In Page_Load, Page.IsPostBack = " + Page.IsPostBack + "<br>");
}

// This input text control event will be called only when the button is clicked
public void text1_TextChanged (object sender, System.EventArgs e) 
{
	Response.Write("In text1_TextChanged, text1.Text = " + text1.Text + "<br>");
}

public void checkbox1_CheckedChanged (object sender, System.EventArgs e) 
{
	Response.Write("In checkbox1_CheckedChanged, checkbox1.Checked = " + checkbox1.Checked + "<br>");
}

public void radio_CheckedChanged (object sender, System.EventArgs e) 
{
	RadioButton radio = (RadioButton)sender;
	Response.Write("In radio_CheckedChanged, " + radio.ID + ".Checked = " + radio.Checked + "<br>");
}

public void dropdown1_SelectedIndexChanged (object sender, System.EventArgs e) 
{
	Response.Write("In dropdown1_SelectedIndexChanged, dropdown1.SelectedItem.Text = " + dropdown1.SelectedItem.Text + "<br>");
}

public void listbox1_SelectedIndexChanged (object sender, System.EventArgs e) 
{
	Response.Write("In listbox1_SelectedIndexChanged, listbox1.SelectedItem.Text = " + listbox1.SelectedItem.Text + "<br>");
}

public void listbox2_SelectedIndexChanged (object sender, System.EventArgs e) 
{
	string s = "In listbox2_SelectedIndexChanged, listbox2.SelectedItems: ";
	foreach (ListItem li in listbox2.Items) 
	{
		if (li.Selected) s += li.Text + "(" + li.Value + ") ";
	}
	s += "<br>";
	Response.Write(s);
}

public void checkboxlist1_SelectedIndexChanged (object sender, System.EventArgs e) 
{
	string s = "In checkboxlist1_SelectedIndexChanged, checkboxlist1.SelectedItems: ";
	foreach (ListItem li in checkboxlist1.Items) 
	{
		if (li.Selected) s += li.Text + "(" + li.Value + ") ";
	}
	s += "<br>";
	Response.Write(s);
}

public void radiobuttonlist1_SelectedIndexChanged (object sender, System.EventArgs e) 
{
	Response.Write("In radiobuttonlist1_SelectedIndexChanged, radiobuttonlist1.SelectedItem.Text = " + radiobuttonlist1.SelectedItem.Text + "<br>");
}

// This button control event will be called when the button is clicked
public void button1_Click (object sender, System.EventArgs e) 
{
	Response.Write("In button1_Click, checkbox1.Checked = " + checkbox1.Checked + "<br>");
	label1.Text = "Submitted at " + DateTime.Now.ToLongTimeString();
}

</script>
<body>
	<form method="post" runat="server">
		<table>
			<tr>
				<td>
					<asp:textbox id="text1" onTextChanged="text1_TextChanged" value="initial value" runat="server" />
					<p></p>
						<asp:checkbox id="checkbox1" onCheckedChanged="checkbox1_CheckedChanged" runat="server" />
					<p></p>
						<asp:RadioButton id="radio1" GroupName="radioGroup" onCheckedChanged="radio_CheckedChanged" runat="server" />
						<asp:RadioButton id="radio2" GroupName="radioGroup" onCheckedChanged="radio_CheckedChanged" runat="server" />
					<p></p>
						<asp:DropDownList id="dropdown1" autopostback="true" onselectedIndexchanged="dropdown1_SelectedIndexChanged" runat="server">
							<asp:ListItem value="A">Value 1</asp:ListItem>
							<asp:ListItem value="B">Value 2</asp:ListItem>
							<asp:ListItem value="C">Value 3</asp:ListItem>
						</asp:DropDownList>
					<p></p>
						<asp:ListBox id="listbox1" Rows="4" onselectedIndexchanged="listbox1_SelectedIndexChanged" runat="server">
							<asp:ListItem value="A">Value 1</asp:ListItem>
							<asp:ListItem value="B">Value 2</asp:ListItem>
							<asp:ListItem value="C">Value 3</asp:ListItem>
							<asp:ListItem value="D">Value 4</asp:ListItem>
							<asp:ListItem value="E">Value 5</asp:ListItem>
							<asp:ListItem value="F">Value 6</asp:ListItem>
						</asp:ListBox>
					<p></p>
						<asp:ListBox id="listbox2" Rows="4" autopostback="true" SelectionMode="Multiple" onselectedIndexchanged="listbox2_SelectedIndexChanged" runat="server">
							<asp:ListItem value="A">Value 1</asp:ListItem>
							<asp:ListItem value="B">Value 2</asp:ListItem>
							<asp:ListItem value="C">Value 3</asp:ListItem>
							<asp:ListItem value="D">Value 4</asp:ListItem>
							<asp:ListItem value="E">Value 5</asp:ListItem>
							<asp:ListItem value="F">Value 6</asp:ListItem>
						</asp:ListBox>
					<p></p>
				</td>
				<td>
					<asp:CheckBoxList id="checkboxlist1" onselectedIndexchanged="checkboxlist1_SelectedIndexChanged" runat="server">
						<asp:ListItem value="A">Item 1</asp:ListItem>
						<asp:ListItem value="B">Item 2</asp:ListItem>
						<asp:ListItem value="C">Item 3</asp:ListItem>
						<asp:ListItem value="D">Item 4</asp:ListItem>
						<asp:ListItem value="E">Item 5</asp:ListItem>
					</asp:CheckBoxList>
					<p></p>
					<asp:RadioButtonList id="radiobuttonlist1" onselectedIndexchanged="radiobuttonlist1_SelectedIndexChanged" runat="server">
						<asp:ListItem value="A">Item 1</asp:ListItem>
						<asp:ListItem value="B">Item 2</asp:ListItem>
						<asp:ListItem value="C">Item 3</asp:ListItem>
						<asp:ListItem value="D">Item 4</asp:ListItem>
						<asp:ListItem value="E">Item 5</asp:ListItem>
					</asp:RadioButtonList>
				</td>
			</tr>
		</table>
		<p></p>
		<asp:Button id="button1" onClick="button1_Click" text="Submit" runat="server" />
		<p></p>
		<asp:Label id="label1" runat="server" />
	</form>
</body>
</html>

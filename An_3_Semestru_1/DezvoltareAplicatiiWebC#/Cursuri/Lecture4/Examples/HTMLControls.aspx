<%@ Page language="C#" %>
<html>
<head>
	<title>HTML Controls</title>
</head>
<script runat="server">

public void Page_Load(object s, EventArgs e) 
{
	if (!Page.IsPostBack) // First page load
	{
    	text1.Value = "abc";
  	}
  	Response.Write("In Page_Load: Page.IsPostBack = " + Page.IsPostBack + "<br>");
}

// This input text control event will be called only when the button is clicked
public void text1_Change(object sender, System.EventArgs e) 
{
	Response.Write("In text1_Change: text1.Value = " + text1.Value + "<br>");
}

public void checkbox1_Change(object sender, System.EventArgs e) 
{
	Response.Write("In checkbox1_Change: checkbox1.Checked = " + checkbox1.Checked + "<br>");
}

public void radio_Change(object sender, System.EventArgs e) 
{
	HtmlInputRadioButton radio = (HtmlInputRadioButton)sender;
	Response.Write("In radio_Change: " + radio.ID + ".Checked = " + radio.Checked + "<br>");
}

public void select1_Change(object sender, System.EventArgs e) 
{
	Response.Write("In select1_Change: select1.Value = " + select1.Value + "<br>");
}

// This button control event will be called when the button is clicked
public void button1_Click (object sender, System.EventArgs e) 
{
	Response.Write("In button1_Click: checkbox1.Checked = " + checkbox1.Checked + "<br>");
	div1.InnerText = "Submitted at " + DateTime.Now.ToLongTimeString();
}

</script>
<body>
	<form method="post" runat="server">
		<p></p>
		
		<input type="text" id="text1" onserverchange="text1_Change" value="initial value" runat="server">
		
		<p></p>
		
		<input type="checkbox" id="checkbox1" onserverchange="checkbox1_Change" runat="server">Check
		
		<p></p>
		
		<input type="radio" id="radio1" name="radioGroup" onserverchange="radio_Change" runat="server">1 &nbsp;
		<input type="radio" id="radio2" name="radioGroup" onserverchange="radio_Change" runat="server">2
		
		<p></p>

		<select id="select1" onserverchange="select1_Change" runat="server">
			<option value="A">
				Value 1</option>
			<option value="B">
				Value 2</option>
			<option value="C">
				Value 3</option>
		</select>
		
		<p></p>
			
		<input type="submit" id="button1" onserverclick="button1_Click" value="Submit" runat="server">
		
		<p></p>
		
		<div id="div1" runat="server" />
	</form>
</body>
</html>

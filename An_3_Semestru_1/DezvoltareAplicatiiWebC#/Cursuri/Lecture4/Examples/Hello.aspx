<%@ Page language="C#" %>
<html>
<head></head>
<script runat="server">
	public void B_Click (object sender, System.EventArgs e) 
	{
		Label1.Text = "Hello, the time is " + DateTime.Now;
	}
</script>
<body>
	<form method="post" runat="server">
		<asp:Button onclick="B_Click" Text="Say hello!" runat="server" /> 
		<p></p>
		<asp:Label id="Label1" runat="server" />
	</form>
</body>
</html>
<%@ Page language="C#" %>
<html>
	<head>
		<title>Maintaining State</title>
	</head>
	<body>
		<form method="post" runat="server">
			<input type="text" id="text1" value="initial value" runat="server" />
			<input type="text" id="text2" EnableViewState="false" value="initial value" runat="server" />
			<p></p>
			<input type="submit" id="button1" value="Check state" runat="server" />
		</form>
	</body>
</html>

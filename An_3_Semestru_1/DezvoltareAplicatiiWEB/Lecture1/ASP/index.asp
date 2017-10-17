<%@  Language=JavaScript %>
<%Response.Buffer=false%>
<html>
<head>
<title>Login</title>
</head>
<body>
<%
var passwd = {"ggeorgescu":"ok1", "iionescu":"ok2", "ppopescu":"ok3", "xxulescu":"ok4"};

var ntr;
var nr;

if (Request.Form("ntr").Count == 0)
{
%>
<h3>Login:</h3>

<form action="index.asp" method="post">
<input type="hidden" name="ntr" value="1" />
username:&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="usrname" size="20" maxlength="20" />
<br />
password:&nbsp;&nbsp;&nbsp;
<input type="password" name="password" size="20" maxlength="20" />
<input type="submit" value="Login" />
</form>
<%
}
else 
{
   if (Request.Form("password")(1) == passwd[Request.Form("usrname")(1)])
   {
%>
<h1>Login O.K.</h1>
<%
   }
   else
   {
      ntr = Request.Form("ntr")(1);
      nr = 10 - ntr;
      if (nr > 0)
      {
         ntr++;
%>
<h3>Login failed, you can try again <% Response.Write(nr) %> times:</h3>

<form action="index.asp" method="post">
<input type="hidden" name="ntr" value="<% Response.Write(ntr) %>" />
username:&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="usrname" size="20" maxlength="20" />
<br />
password:&nbsp;&nbsp;&nbsp;
<input type="password" name="password" size="20" maxlength="20" />
<input type="submit" value="Login" />
</form>
<%
      }
   }
}
%>
</body>
</html>

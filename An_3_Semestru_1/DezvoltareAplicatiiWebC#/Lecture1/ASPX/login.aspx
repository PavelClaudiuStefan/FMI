<%@ Page language="c#" Debug="true" %>
<html>
<head>
<title>Login</title>
</head>

<script runat="server">

static int nrtr;

static Hashtable passwd = new Hashtable();

public void Page_Load(object s, EventArgs e) 
{
  string usr = TheUser.Value;
  string pass = ThePassword.Value;
  string apass = (string) passwd[usr];

  int amr = 10 - nrtr;

  if (Page.IsPostBack)
  {
     if (String.Compare(apass, pass) == 0) 
     {
        this.Visible = false;
        Response.Write("<h1>Login O.K.</h1>");
     }
     else
     {
        if (amr > 0)
        {
           nrtr++;
           TheText.InnerText = "Login failed, you can try again " + amr + " times:";
        }
        else
        {
           this.Visible = false;
           Response.Write("<h1>Source:</h1>" + HttpRuntime.CodegenDir);
        }
     }
  }
  else
  {
     nrtr = 1;
     passwd = new Hashtable();
     passwd.Add("ggeorgescu", "ok1");
     passwd.Add("iionescu", "ok2");
     passwd.Add("ppopescu", "ok3");
     passwd.Add("xxulescu", "ok4");
  }
}

</script>

<body>

<form method="post" runat="server">
<h3 runat="server" id="TheText">Login:</h3>
username:&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" size="20" maxlength="20" runat="server" id="TheUser" />
<br />
password:&nbsp;&nbsp;&nbsp;
<input type="password" size="20" maxlength="20" runat="server" id="ThePassword" />
<input type="submit" value="Login" />

</form>

</body>
</html>



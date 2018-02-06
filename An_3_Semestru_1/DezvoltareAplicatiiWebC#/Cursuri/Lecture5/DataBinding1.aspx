<%@ Page Language="c#" %>
<script runat="server">

    // When page loads, indicate if it's in a postback
    public void Page_Load(object s, EventArgs e) {
       Response.Write("In Page_Load, Page.IsPostBack = " + Page.IsPostBack + "<br>");
    }
    
    // custID is a read-only property of this Page object
    string custID {
       get { return "Cust1123581121"; }
    }
    
    // Bind all controls on the page
    public void PageDataBind(object sender, System.EventArgs e) {
       Page.DataBind();
    }
    
    // Bind just label1
    public void Label1DataBind(object sender, System.EventArgs e) {
       label1.DataBind();
    }
    
    // Don't do anything: demonstrates that state is maintained
    public void DoNothing(object sender, System.EventArgs e) {
    }

</script>
<html>
<head>
    <title>DataBinding1.aspx</title>
</head>
<body>
    <a href="DataBinding1.aspx"> 
    <h3><font face="Verdana">Simple Data Binding</font> 
    </h3>
    </a> 
    <form runat="server">
        Customer: <%# custID %> 
        <p>
            1 + 2 = <%# "the result is " + (1 + 2) + ", the time is " + 
            DateTime.Now.ToLongTimeString() %>
        </p>
        <p>
            label1: 
            <asp:Label id="label1" runat="server" Text="<%# custID %>"></asp:Label>
        </p>
        <p>
            text1: 
            <asp:TextBox id="textbox1" runat="server"></asp:TextBox>
        </p>
        <p>
        </p>
        label2: 
        <asp:Label id="label2" runat="server" Text="<%# textbox1.Text %>"></asp:Label>
        <p>
        </p>
        <asp:Button id="button1" onclick="PageDataBind" runat="server" text="Call Page.DataBind()"></asp:Button>
        <asp:Button id="button2" onclick="Label1DataBind" runat="server" text="Call label1.DataBind()"></asp:Button>
        <asp:Button id="button3" onclick="DoNothing" runat="server" text="Do Nothing"></asp:Button>
    </form>
</body>
</html>

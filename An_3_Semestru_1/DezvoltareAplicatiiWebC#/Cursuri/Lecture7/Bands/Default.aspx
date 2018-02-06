<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ID], [Name], [Genre], [Year] FROM [Band]"></asp:SqlDataSource>
        
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <h2>My favorite bands from SQL</h2>
            </HeaderTemplate>
            <ItemTemplate>
                <table style="background-color: #eeeeee; width: 400px">
                    <tr>
                        <td>
                            <div style="width: 180px">
                            <img runat="server" alt="no image" style="height: 150px" src='<%# "Images/" + DataBinder.Eval(Container.DataItem, "ID") + ".jpg" %>' />
                            </div>
                        </td>
                        <td>
                            <h4><%# ((System.Data.DataRowView)Container.DataItem)["Name"] %> (<%# ((DataRowView)Container.DataItem)["Year"] %>)</h4>
                            <div>
                                Genre: <%# ((DataRowView)Container.DataItem)["Genre"] %>
                            </div>
                            <br />
                            <div>
                                Members:<br />
      
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand='<%# "SELECT [Name] FROM [Member] WHERE IDBand = " + DataBinder.Eval(Container.DataItem, "ID") %>'></asp:SqlDataSource>

                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                    <ItemTemplate><%# ((DataRowView)Container.DataItem)["Name"] %></ItemTemplate>
                                    <SeparatorTemplate><br /></SeparatorTemplate>
                                </asp:Repeater>
                                
                            </div>
                            <div>
                                <a runat="server" href='<%# "Edit.aspx?id=" + DataBinder.Eval(Container.DataItem, "ID") %>'>Edit</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SeparatorTemplate><hr /></SeparatorTemplate>
        </asp:DataList>

        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Bands.xml" XPath="/bands/band"></asp:XmlDataSource>
        
        <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1" >
            <HeaderTemplate>
                <h2>My favorite bands from XML</h2>
            </HeaderTemplate>
            <ItemTemplate>
                <table style="background-color: #eeeeee; width: 400px">
                    <tr>
                        <td>
                            <div style="width: 180px">
                            <img runat="server" alt="no image" style="height: 150px" src='<%# "Images/" + XPath("@ID") + ".jpg" %>' />
                            </div>
                        </td>
                        <td>
                            <h4><%# XPath("name") %> (<%# XPath("@year") %>)</h4>
                            <div>
                                Genre: <%# XPath("genre") %>
                            </div>
                            <br />
                            <div>
                                Members:<br />
                                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# XPathSelect("members/member") %>'>
                                    <ItemTemplate><%# XPath(".") %></ItemTemplate>
                                    <SeparatorTemplate><br /></SeparatorTemplate>
                                </asp:Repeater>
                            </div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <table style="background-color: #cccccc; width: 400px">
                    <tr>
                        <td>
                            <div style="width: 180px">
                            <img id="Img1" runat="server" alt="no image" style="height: 150px" src='<%# "Images/" + XPath("@ID") + ".jpg" %>' />
                            </div>
                        </td>
                        <td>
                            <h4><%# XPath("name") %> (<%# XPath("@year") %>)</h4>
                            <div>
                                Genre: <%# XPath("genre") %>
                            </div>
                            <br />
                            <div>
                                Members:<br />
                                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# XPathSelect("members/member") %>'>
                                    <ItemTemplate><%# XPath(".") %></ItemTemplate>
                                    <SeparatorTemplate><br /></SeparatorTemplate>
                                </asp:Repeater>
                            </div>
                        </td>
                    </tr>
                </table>
            </AlternatingItemTemplate>
            <SeparatorTemplate><hr /></SeparatorTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>

<%@ Page Title="Smartphones" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Smartphones.aspx.cs" Inherits="Smartphones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SmartphoneSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Smartphone] ORDER BY IDOs, IDPhone" />

    <asp:Repeater ID="SmartphoneRepeater" runat="server" DataSourceID="SmartphoneSqlDataSource">
        <HeaderTemplate>
            <table border="1">
                <tr>
                    <th scope="col" style="width: 100px">
                        Phone ID
                    </th>
                    <th scope="col" style="width: 50px">
                        Os ID
                    </th>
                    <th scope="col" style="width: 128px">
                        Denumire
                    </th>
                    <th scope="col" style="width: 100px">
                        Data
                    </th>
                    <th scope="col" style="width: 96px">
                        Producator
                    </th>
                    <th scope="col" style="width: 256px">
                        Descriere
                    </th>
                    <th scope="col" style="width: 80px">
                        Actions
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="labelPhoneId" runat="server" Text='<%# Eval("IDPhone") %>'/>
                </td>
                <td>
                    <asp:Label ID="labelOsId" runat="server" Text='<%# Eval("IDOs") %>'/>
                </td>
                <td>
                    <asp:Label ID="labelDenumire" runat="server" Text='<%# Eval("Denumire") %>'/>
                </td>
                <td>
                    <asp:Label ID="labelData" runat="server" Text='<%# Eval("Data", "{0:yyyy-MMM-dd}") %>'/>
                </td>
                <td>
                    <asp:Label ID="labelProducator" runat="server" Text='<%# Eval("Producator") %>'/>
                </td>
                <td>
                    <asp:Label ID="labelDescriere" runat="server" Text='<%# Eval("Descriere") %>'/>
                </td>
                <td>
                    <asp:HyperLink ID="linkEdit" runat="server" Text="Edit" NavigateUrl='<%# "EditSmartphone.aspx?IDPhone=" + Eval("IDPhone") %>' CssClass="link"/>
                    <asp:HyperLink ID="linkDelete" runat="server" Text="Delete" NavigateUrl='<%# "Delete.aspx?IDPhone=" + Eval("IDPhone") %>' CssClass="link"/>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
            <br /><br /><br />
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>


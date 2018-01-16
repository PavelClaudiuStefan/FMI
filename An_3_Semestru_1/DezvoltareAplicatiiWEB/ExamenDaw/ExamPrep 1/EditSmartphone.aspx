<%@ Page Title="Edit smartphone" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditSmartphone.aspx.cs" Inherits="EditSmartphone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
        <asp:DropDownList ID="dropdownListOs" runat="server" DataSourceID="OsSqlDataSource" DataTextField="Denumire" DataValueField="IDOs" />
        <asp:SqlDataSource ID="OsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IDOs], [Denumire] FROM [Os]"></asp:SqlDataSource>

        <br /><br />

        <asp:TextBox ID="txtboxDenumire" runat="server" placeholder="Denumire"/>
        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" ControlToValidate="txtboxDenumire"/>

        <br /><br />

        <asp:TextBox ID="txtboxData" runat="server" placeholder="Data" TextMode="Date"/>
        <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="*" ControlToValidate="txtboxData"/>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="That's the future bro!" ControlToValidate="txtboxData"/>

        <br /><br />
    
        <asp:TextBox ID="txtboxProducator" runat="server" placeholder="Producator"/>
        <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="*" ControlToValidate="txtboxProducator"/>

        <br /><br />

        <asp:TextBox ID="txtboxDescriere" runat="server" placeholder="Descriere"/>
        <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="*" ControlToValidate="txtboxDescriere"/>

        <br /><br />

        <asp:Button ID="buttonSubmit" runat="server" Text="Submit" OnClick="onSubmit"/>
    </asp:Panel>

</asp:Content>


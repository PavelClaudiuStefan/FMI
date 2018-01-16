<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="labelConfirm" runat="server" Text="Delete?"></asp:Label>

    <br /><br />

    <asp:Button ID="buttonDelete" runat="server" Text="Yes" OnClick="OnDelete"/>
    <asp:Button ID="buttonCancel" runat="server" Text="No" OnClick="OnCancel"/>

</asp:Content>


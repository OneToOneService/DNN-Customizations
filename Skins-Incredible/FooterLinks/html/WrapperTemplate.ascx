<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="~/HtmlTemplate/WrapperTemplate.ascx.cs"
    Inherits="CodingStaff.Modules.MenuBox.WrapperTemplate" %>
<%@ Register TagPrefix="uc" TagName="NodeItem" Src="NodeTemplate.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<ul>
    <asp:Repeater runat="server" ID="Menu">
        <ItemTemplate>
            <uc:NodeItem runat="server" Node="<%# Container.DataItem %>"></uc:NodeItem>
        </ItemTemplate>
    </asp:Repeater>
    <li>
        <dnn:USER runat="server" ID="dnnUSER" CssClass="user" />
    </li>
    <li>
        <dnn:LOGIN runat="server" ID="dnnLOGIN" CssClass="user" />
    </li>
</ul>

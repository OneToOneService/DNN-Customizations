<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="~/HtmlTemplate/WrapperTemplate.ascx.cs"
    Inherits="CodingStaff.Modules.MenuBox.WrapperTemplate" %>
<%@ Register TagPrefix="uc" TagName="NodeItem" Src="NodeTemplate.ascx" %>
<div id="main-nav" class="use-form-styles clearfix">
    <ul>
        <asp:Repeater runat="server" ID="Menu">
            <ItemTemplate>
                <uc:NodeItem runat="server" Node="<%# Container.DataItem %>"></uc:NodeItem>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>

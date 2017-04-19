<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Paging.ascx.cs" Inherits="WebSitesCreative.Modules.PostIt.Controls.Paging" %>
<%@ Import Namespace="WebSitesCreative.Modules.PostIt.Components.Helpers" %>
<asp:PlaceHolder ID="phPrev" runat="server"><a class="wsc_tag" href='<%=GetPrevUrl() %>'>
    <%= GetLocalized("cmdPrev")%></a> </asp:PlaceHolder>
<asp:Repeater ID="rptPaging" runat="server">
    <ItemTemplate>
        <asp:PlaceHolder ID="pnlDinamic" runat="server" Visible='<%# Convert.ToBoolean(Eval("IsLink"))%>'>
            <a class='<%#Convert.ToBoolean(Eval("First")) ? " First ":""%> <%#Convert.ToBoolean(Eval("Last")) ? " Last ":""%>'
                href='<%#GetPaggingUrl(Eval("PagingElementName").ToString()) %>'>
                <%# Eval("PagingElementName")%></a> </asp:PlaceHolder>
        <asp:PlaceHolder ID="pnlStatic" runat="server" Visible='<%# !Convert.ToBoolean(Eval("IsLink")) %>'>
            <span class='<%#Convert.ToBoolean(Eval("First")) ? " First ":""%> <%#Convert.ToBoolean(Eval("Last")) ? " Last ":""%> <%#Convert.ToBoolean(Eval("Current")) ? " Current ":""%>  <%#Convert.ToBoolean(Eval("Ellipsis")) ? " Ellipsis ":""%>'>
                <%# Eval("PagingElementName")%></span> </asp:PlaceHolder>
    </ItemTemplate>
</asp:Repeater>
<asp:PlaceHolder ID="phNext" runat="server"><a class="wsc_tag" href='<%=GetNextUrl() %>'>
    <%= GetLocalized("cmdNext")%></a> </asp:PlaceHolder>

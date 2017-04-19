<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="../../Controls/Paging/Paging.ascx.cs" Inherits="WebSitesCreative.Modules.Banner.Controls.Paging.Paging" %>
<%@ Import Namespace="WebSitesCreative.Modules.Banner.Controls.Paging" %>
<div class="clear"></div>
<div class="pagination">
<asp:PlaceHolder ID="phPrev" runat="server"><a class="wsc_tag" href='<%=GetPrevUrl() %>'>
    <%= GetLocalized("cmdPrev")%></a> </asp:PlaceHolder>
<asp:Repeater ID="rptPaging" runat="server">
    <ItemTemplate>
        <asp:PlaceHolder ID="pnlDinamic" runat="server" Visible='<%# ((PagingElementType)Eval("PagingElementType") == PagingElementType.Number)%>'>
            <a class='<%#Convert.ToBoolean(Eval("First")) ? " First ":""%> <%#Convert.ToBoolean(Eval("Last")) ? " Last ":""%>'
                href='<%#GetPagingUrl(Eval("PagingElementName").ToString()) %>'>
                <%# Eval("PagingElementName")%></a> </asp:PlaceHolder>
        <asp:PlaceHolder ID="pnlStatic" runat="server" Visible='<%# ((PagingElementType)Eval("PagingElementType") != PagingElementType.Number) %>'>
            <a class='<%#Convert.ToBoolean(Eval("First")) ? " First ":""%> <%#Convert.ToBoolean(Eval("Last")) ? " Last ":""%> <%#((PagingElementType)Eval("PagingElementType") == PagingElementType.Current) ? " active ":""%>  <%#((PagingElementType)Eval("PagingElementType") == PagingElementType.Ellipsis) ? " Ellipsis ":""%>'>
                <%# Eval("PagingElementName")%></a> </asp:PlaceHolder>
    </ItemTemplate>
</asp:Repeater>
<asp:PlaceHolder ID="phNext" runat="server"><a class="wsc_tag" href='<%=GetNextUrl() %>'>
    <%= GetLocalized("cmdNext")%></a> </asp:PlaceHolder>
</div>
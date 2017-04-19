<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Tags.ascx.cs" Inherits="WebSitesCreative.Modules.Banner.Controls.Tags" %>
<div class="wsc_controls">
    <ul id="portfolio-items-filter" class="wsc_tags">
    <li>Categories</li>
    <li><a data-categories="*" class="active">All</a></li>
        <asp:Repeater runat="server" ID="rptTags">
            <ItemTemplate>
                <li>
                    <a data-categories='<%# Eval("Name")%>'  > <%# Eval("Name")%> (<%# Eval("Count") %>)</a>   
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <div class="clear"></div>
</div>


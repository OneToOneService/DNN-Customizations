<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RssSubscribe.ascx.cs" Inherits="WebSitesCreative.Modules.PostIt.Controls.RssSubscribe" %>
<%@ Import Namespace="WebSitesCreative.Modules.PostIt.Components.Helpers" %>

<div class="wsc_postit_subscribe">
    <a href="<%= LinkToRss %>">
        <img src="<%= ResolveUrl(UIHelper.GetUIFileUrl("images/rss.png")) %>" alt="<%= GetLocalized("imgSubscribe.Alt") %>" />    
    </a>
</div>
<div class="wsc_postit_clear"></div>
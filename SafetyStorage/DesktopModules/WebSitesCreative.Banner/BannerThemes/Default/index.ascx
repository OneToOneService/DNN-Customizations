<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="../../Controls/BannerThemeControl/BannerThemeControl.ascx.cs"
    Inherits="WebSitesCreative.Modules.Banner.Controls.BannerThemeControl"  %>
<%@ Import Namespace="WebSitesCreative.Modules.Banner.Components.Helpers" %>
<%@ Register TagPrefix="cs" Namespace="WebSitesCreative.Modules.Banner.Controls"
    Assembly="WebSitesCreative.Modules.Banner" %>
<script runat="server" language="C#">
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterJS("scripts/jquery.nivo.slider.pack.js");

        RegisterCss("styles/nivo-slider.css");

        RegisterCss("styles/" + GetSetting("nivosliderstyles") + "/style.css");

    }
</script>
<cs:InlineScript runat="server">
    <script type="text/javascript" language="javascript">
        $(window).load(function () {
            $('.slider<%=ModuleId%>').nivoSlider({ pauseTime:<%=GetSetting("nivosliderdelay") %>, animSpeed :<%=GetSetting("nivosliderduration") %> });
        });
    </script>
</cs:InlineScript>
<cs:InlineStyle runat="server">
    <style type="text/css">
        #wrapper
        {
            height: <%= Height + 40 %>px;
            margin-top: <%=GetSetting("HSpace") %>px;
            margin-bottom: <%=GetSetting("HSpace") %>px;
        }
        .nivoSlider
        {
            position: relative;
            width: <%= Width %>px;
            height: <%= Height %>px;
        }
        .nivoSlider img
        {
            position: absolute;
            top: 0px;
            max-height: <%= Height %>px;
            max-width: <%= Width %>px;
            left: 0px;
            display: none;
        }
        .nivoSlider a
        {
            border: 0;
            display: block;
        }
        
        .nivo-caption p
        {
            color: White;
        }
    </style>
</cs:InlineStyle>
<div id="wrapper">
    <div class="slider-wrapper theme-<%=GetSetting("nivosliderstyles") %>">        
        <div class="ribbon">
        </div>
        <div class="nivoSlider slider<%=ModuleId%>">
            <asp:Repeater ID="rptrImages" runat="server">
                <ItemTemplate>
                    <asp:PlaceHolder ID="pnlDinamic" runat="server"  Visible='<%# (bool)Eval("IsImageSlide") %>'>
                        <a href="<%# Eval("Url") %>">
                            <img src='<%# FilesHelper.GetFileUrl(ModuleId, Eval("ResizedImageName").ToString()) %>'
                            width='<%=Width %>' title='<%# Eval("Title")%>' /></a> </asp:PlaceHolder>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="htmlcaption" class="nivo-html-caption">
        </div>
    </div>
</div>
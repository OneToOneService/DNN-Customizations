<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="../../Controls/BannerThemeControl/BannerThemeControl.ascx.cs"
    Inherits="WebSitesCreative.Modules.Banner.Controls.BannerThemeControl" %>
<%@ Import Namespace="WebSitesCreative.Modules.Banner.Components.Helpers" %>
<%@ Register TagPrefix="cs" Namespace="WebSitesCreative.Modules.Banner.Controls"
    Assembly="WebSitesCreative.Modules.Banner" %>
<script runat="server" language="C#">
  
</script>
<cs:InlineStyle ID="InlineStyle1" runat="server">
    <style type="text/css">
        
    </style>
</cs:InlineStyle>
<cs:InlineScript runat="server">
    <script type="text/javascript" language="javascript">


     (function () {

         var $carousel = $('.projects-carousel.wsc-carousel<%=ModuleId%>');

        if ($carousel.length) {

            var scrollCount;

            if ($(window).width() < 480) {
                scrollCount = 1;
            } else if ($(window).width() < 768) {
                scrollCount = 2;
            } else if ($(window).width() < 960) {
                scrollCount = 3;
            } else {
                scrollCount = 4;
            }

            $carousel.jcarousel({
                animation: <%=GetSetting("Speed") %>,
                easing: 'easeOutCubic',
                scroll: scrollCount
            });

        }

    })();
        
    </script>
</cs:InlineScript>



<ul class="projects-carousel wsc-carousel<%=ModuleId%> clearfix">
  <asp:Repeater ID="rptrImages" runat="server">
        <ItemTemplate>
            <asp:PlaceHolder ID="pnlDinamic" runat="server" Visible='<%# ((bool)Eval("IsImageSlide")) %>'>

                <li>
                    <a href="<%# Eval("Url")%>">
                        <img alt="" src="<%# FilesHelper.GetFileUrl(ModuleId, Eval("ResizedImageName").ToString()) %>" />
                        <h5 class="title"><%# Eval("Title")%></h5>
                        <span class="categories">
                            <%#  String.Join(" / ", ((string[])Eval("SplittedTags"))) %>
                        </span>
                    </a>
                </li>
            </asp:PlaceHolder>
        </ItemTemplate>
    </asp:Repeater>
</ul>    
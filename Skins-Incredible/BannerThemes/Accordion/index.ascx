<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="../../Controls/BannerThemeControl/BannerThemeControl.ascx.cs"
    Inherits="WebSitesCreative.Modules.Banner.Controls.BannerThemeControl" %>
<%@ Import Namespace="WebSitesCreative.Modules.Banner.Components.Helpers" %>
<%@ Register TagPrefix="cs" Namespace="WebSitesCreative.Modules.Banner.Controls"
    Assembly="WebSitesCreative.Modules.Banner" %>
<cs:InlineScript runat="server">
    <script type="text/javascript" language="javascript">
        jQuery(document).ready(function ($) {
            (function () {

                var $container = $('.wsc_accordion<%=ModuleId%> .acc-container'),
			$trigger = $('.wsc_accordion<%=ModuleId%> .acc-trigger');

                $container.hide();
                $trigger.first().addClass('active').next().show();

                var fullWidth = $container.outerWidth(true);
                $trigger.css('width', fullWidth);
                $container.css('width', fullWidth);

                $trigger.on('click', function (e) {
                    if ($(this).next().is(':hidden')) {
                        $trigger.removeClass('active').next().slideUp(<%=GetSetting("Speed") %>);
                        $(this).toggleClass('active').next().slideDown(<%=GetSetting("Speed") %>);
                    }
                    e.preventDefault();
                });

                // Resize
                $(window).on('resize', function () {
                    fullWidth = $container.outerWidth(true)
                    $trigger.css('width', $trigger.parent().width());
                    $container.css('width', $container.parent().width());
                });

            })();
        });
    </script>

</cs:InlineScript>
<cs:InlineStyle runat="server">
    <style type="text/css">
        
    </style>
</cs:InlineStyle>

<div class=" wsc_accordion<%=ModuleId%>">

    <asp:Repeater ID="rptrImages" runat="server">
        <ItemTemplate>
            <asp:PlaceHolder ID="PlaceHolder" runat="server" Visible='<%# !((bool)Eval("IsImageSlide")) %>'>
                <span class="acc-trigger">
                    <a href="#"><%# Eval("Title")%></a>
                </span>
                <div class="acc-container">
                    <div class="content"><%# Eval("Text")%></div>
                </div>
            </asp:PlaceHolder>
        </ItemTemplate>
    </asp:Repeater>

 </div>

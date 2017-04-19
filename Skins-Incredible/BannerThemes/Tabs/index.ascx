<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="../../Controls/BannerThemeControl/BannerThemeControl.ascx.cs"
    Inherits="WebSitesCreative.Modules.Banner.Controls.BannerThemeControl" %>
<%@ Import Namespace="WebSitesCreative.Modules.Banner.Components.Helpers" %>
<%@ Register TagPrefix="cs" Namespace="WebSitesCreative.Modules.Banner.Controls"
    Assembly="WebSitesCreative.Modules.Banner" %>
<cs:InlineScript runat="server">
    <script type="text/javascript" language="javascript">
        jQuery(document).ready(function ($) {
            (function () {

                var $tabsNav = $('.tabs-nav.wsc_tabs<%=ModuleId%>'),
			$tabsNavLis = $tabsNav.children('li'),
			$tabContent = $('.tab-content');

                $tabContent.hide();
                $tabsNavLis.first().addClass('active').show();
                $tabContent.first().show();

                $tabsNavLis.on('click', function (e) {
                    var $this = $(this);

                    $tabsNavLis.removeClass('active');
                    $this.addClass('active');
                    $tabContent.hide();

                    $($this.find('a').attr('href')).fadeIn();

                    e.preventDefault();
                });

            })();
        });

           
    </script>
</cs:InlineScript>
<cs:InlineStyle runat="server">
    <style type="text/css">
        
    </style>
</cs:InlineStyle>
<ul class="tabs-nav wsc_tabs<%=ModuleId%>">
    <asp:Repeater ID="rptrImages" runat="server">
        <ItemTemplate>
            <asp:PlaceHolder ID="PlaceHolder" runat="server" Visible='<%# !((bool)Eval("IsImageSlide")) %>'>
                <li><a href="#tab<%# (Container.ItemIndex + 1)%>">
                    <%# Eval("Title")%></a> </li>
            </asp:PlaceHolder>
        </ItemTemplate>
    </asp:Repeater>
</ul>
<div class="tabs-container">
    <asp:Repeater ID="rptrImages2" runat="server">
        <ItemTemplate>
            <asp:PlaceHolder ID="pnlTextSlide2" runat="server" Visible='<%# !((bool)Eval("IsImageSlide")) %>'>
                <div class="tab-content" id="tab<%# (Container.ItemIndex + 1)%>">
                    <%# Eval("Text")%>
                </div>
            </asp:PlaceHolder>
        </ItemTemplate>
    </asp:Repeater>
</div>

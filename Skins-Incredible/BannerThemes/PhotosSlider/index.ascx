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

<script runat="server" language="C#">
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterJS("scripts/jquery.smartStartSlider.min.js");
    }
</script>

<cs:InlineScript runat="server">
    <script type="text/javascript" language="javascript">
        (function () {

            var $slider = $('#photos-slider<%=ModuleId%>');

            if ($slider.length) {

                $('#photos-slider<%=ModuleId%>').smartStartSlider({
                    pos: 0,
                    hideContent: false,
                    contentPosition: '<%=GetSetting("Layout") %>',
                    timeout: <%=GetSetting("Timeout") %>,
                    pause: false,
                    pauseOnHover: true,
                    type: {
                        mode: '<%=GetSetting("Effect") %>',
                        speed: <%=GetSetting("Speed") %>,
                        easing: 'easeInOutExpo',
                        seqfactor: 100
                    }
                });

            }

        })();  
    </script>
</cs:InlineScript>


<section id="photos-slider<%=ModuleId%>" class="ss-slider show-content-onhover">

    <asp:Repeater ID="rptrImages" runat="server">
        <ItemTemplate>
            <asp:PlaceHolder ID="pnlDinamic" runat="server" Visible='<%# ((bool)Eval("IsImageSlide")) %>'>

                <article class="slide">
                    <a href="<%# Eval("Url") %>">
                    <img src='<%# FilesHelper.GetFileUrl(ModuleId, Eval("ResizedImageName").ToString()) %>' class="slide-bg-image"/>
                    </a>
                    <div class="slide-button image">
                        <img src='<%# FilesHelper.GetFileUrl(ModuleId, Eval("ResizedImageName").ToString()) %>' />
                    </div>

                    <div class="slide-content">
                        <h4><%# Eval("Title")%> <a href="<%# Eval("Url") %>">Learn More</a></h4>
                    </div>

                </article><!-- end .slide -->

            </asp:PlaceHolder>

            <asp:PlaceHolder ID="pnlTextSlide" runat="server" Visible='false'>
                <%# Eval("Text") %>
            </asp:PlaceHolder>

        </ItemTemplate>
    </asp:Repeater>
</section>
<!-- end #photos-slider -->

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

            var $slider = $('#features-slider.features-slider<%=ModuleId%>');

            if ($slider.length) {

                $('#features-slider.features-slider<%=ModuleId%>').smartStartSlider({
                    pos: 0,
                    hideContent: true,
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


<section id="features-slider" class="ss-slider features-slider<%=ModuleId%>">
<asp:Repeater ID="rptrImages" runat="server">
    <ItemTemplate>
        <asp:PlaceHolder ID="pnlDinamic" runat="server" Visible='<%# ((bool)Eval("IsImageSlide")) %>'>
		    <article class="slide">
		
			    <img src="<%# FilesHelper.GetFileUrl(ModuleId, Eval("ResizedImageName").ToString()) %>" alt="" class="slide-bg-image" />
			
			    <div class="slide-button">
				    <span class="dropcap"><%# (Container.ItemIndex + 1)%></span>
				    <h5><%# Eval("Title")%></h5>
				    <%--<span class="description"></span>--%>
                    
			    </div>
		
			    <div class="slide-content">
	                <h2><%# Eval("Title")%></h2>
                    <%# Eval("Description")%>
			    </div>
			
		    </article><!-- end .slide (Responsive Layout) -->
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="pnlTextSlide" runat="server" Visible='false'>
            <%# Eval("Text") %>
        </asp:PlaceHolder>
    </ItemTemplate>
</asp:Repeater>
</section><!-- end #features-slider -->



<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="../../Controls/BannerThemeControl/BannerThemeControl.ascx.cs"
    Inherits="WebSitesCreative.Modules.Banner.Controls.BannerThemeControl" %>
<%@ Import Namespace="WebSitesCreative.Modules.Banner.Components.Helpers" %>
<%@ Register TagPrefix="cs" Namespace="WebSitesCreative.Modules.Banner.Controls"
    Assembly="WebSitesCreative.Modules.Banner" %>
<%@ Register TagPrefix="wsc" TagName="Paging" Src="Paging.ascx" %>
<%@ Register TagPrefix="tags" TagName="Tags" Src="Tags.ascx" %>
<script runat="server" language="C#">
    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<cs:InlineScript runat="server">
    <script type="text/javascript" language="javascript">
        $(window).load(function () {

        });
    </script>
</cs:InlineScript>
<cs:InlineStyle runat="server">
    <style type="text/css">
        #portfolio-items a img
        {
            width: 100%;
          /*  height: 100%;*/
        }
         #portfolio-items a.project-meta .description
        {
            color:#909090;
        }
         #portfolio-items a.project-meta .description p
         {
             margin-bottom:10px;
             margin-top:5px;
         }
    </style>
</cs:InlineStyle>
<% if (GetSetting("Mode") == "categories")
   {%>
<tags:Tags ID="Tags1" runat="server" />
<%} %>
<section id="portfolio-items" class="clearfix">

<asp:Repeater ID="rptrImages" runat="server">
    <ItemTemplate>
        <asp:PlaceHolder ID="pnlDinamic" runat="server" Visible='<%# ((bool)Eval("IsImageSlide")) %>'>
		<article class="<%#(GetSetting("prtfGalleryLayout"))%>" data-categories="<%#  String.Join(" ", ((string[])Eval("SplittedTags"))) %>" >

			<a  href="<%# (Eval("Url") == "" || GetSetting("prtfGalleryDescription") == "wsc_title_hide") ? FilesHelper.GetFileUrl(ModuleId, Eval("ImageName").ToString()) : Eval("Url") %>" rel="<%# (GetSetting("prtfGalleryDescription") == "wsc_title_hide") ? "gallery" : "" %>" class="<%# (Eval("Url") == "" || GetSetting("prtfGalleryDescription") == "wsc_title_hide") ? "single-image" : "wsc_img_link" %>" title="">
				<img src="<%# FilesHelper.GetFileUrl(ModuleId, Eval("ResizedImageName").ToString()) %>" alt="" >
			</a>


            <%if (GetSetting("prtfGalleryDescription") == "wsc_title_show")
              { %>

			<a href="<%# Eval("Url") %>" class="project-meta">
				<h5 class="title"><%# Eval("Title")%></h5>
                <h6 class="description"><%# Eval("Description")%></h6>
				<span class="categories">
                    <asp:Repeater runat="server" ID="rptTags" DataSource='<%# Eval("SplittedTags") %>'>
                          <ItemTemplate>                                
                                <%# Container.DataItem %>                                    
                          </ItemTemplate>
                    </asp:Repeater>
                 </span>
			</a>

            <%} %>
			
		</article><!-- end .one-third (Altered) -->
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="pnlTextSlide" runat="server" Visible='false'>
            <%# Eval("Text") %>
        </asp:PlaceHolder>

    </ItemTemplate>
</asp:Repeater>

</section>
<% if (GetSetting("Mode") == "paging")
   {%>
<wsc:Paging ID="ucPaging" runat="server"></wsc:Paging>
<%} %>
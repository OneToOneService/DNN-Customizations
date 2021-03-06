<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%--<%@ Register TagPrefix="cs" TagName="MENUBOX" Src="~/DesktopModules/CodingStaff.MenuBox/MenuBoxSkinObject.ascx" %>--%>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<script type="text/javascript" src='<%= TemplateSourceDirectory %>/js/yepnope.1.5.4-min.js'></script> 
<!--[if !lte IE 6]><!-->
<link rel="stylesheet" href="<%= TemplateSourceDirectory %>/css/style.css" media="screen" />
<!--If you want to apply another existing color theme
    Change 'default' to the one of the offered color scheme: 'cyan', 'green', 'maroon', etc.
    or create your one
    -->
<link rel="stylesheet" href="<%= TemplateSourceDirectory %>/css/color_themes/slateblue.css" media="screen" />

<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,600,300,800,700,400italic|PT+Serif:400,400italic" />
<link rel="stylesheet" href="<%= TemplateSourceDirectory %>/css/fancybox.min.css" media="screen" />
<link rel="stylesheet" href="<%= TemplateSourceDirectory %>/css/mediaelementplayer.min.css" media="screen" />
<!--<![endif]-->
<!--[if lte IE 6]>
		<link rel="stylesheet" href="//universal-ie6-css.googlecode.com/files/ie6.1.1.css" media="screen, projection">
	<![endif]-->
<!--[if lt IE 9]>
		<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<div class="not-ie no-js">
    <!--<![endif]-->
<div id="body_pattern"  class="">
        <!-- Top section -->
<header id="top">
	<div class="container">
			<!--#include file="CommonParts/contacts.ascx"-->


      
        <div class="use-form-styles wsc_search">
             <dnn:SEARCH runat="server" ID="SEARCH1" CssClass="ServerSkinWidget" UseDropDownList="true" Submit="" />
        </div>
      
      <div class="clear"></div>
	</div>
</header>
<!-- // Top section -->
<!-- iService Chat Badge on Bottom -->
<iframe src="https://1to1.iservicecrm.com/f/83" style="position:fixed; left:0; z-index:10000; width:55px; bottom:0;padding:0;margin:0;" height="220" frameBorder="0" allowtransparency="true"></iframe>
<!-- /Chat Badge -->
    <header id="header" class="container clearfix">

    <!--Logo-->
    <div id="logo">
	<dnn:LOGO runat="server" ID="dnnLOGO" />
    </div>
    <!--End logo-->

    <!-- Main Menu-->
       <%--<cs:MENUBOX runat="server" ID="menuBoxMain" SkinId="nav-main" SkinLocation="Skin" />--%>
	   <dnn:MENU ID="MENU" MenuStyle="dnn-nav-main" runat="server"></dnn:MENU>
    <!-- End Main Menu -->
	
	
</header>
    <!-- end #header -->
    <section id="content" class="container clearfix">

    <div class="" id="BannerPane" runat="server"> 
    </div>
    <div class="clear"></div>

    <div class="wsc_pane ContantPane" id="ContentPane" runat="server"> 
    </div>
    <div class="clear"></div>

    <div class="ProfilePanes">
        <div class=" one-fourth">
            <div class="LeftPaneProfile" id="LeftPaneProfile" runat="server"></div>
            <div class="RightPaneProfile" id="RightPaneProfile" runat="server"></div>
        </div>
        <div class="three-fourth last">
            <div class="HeaderPaneProfile" id="HeaderPaneProfile" runat="server"></div>
            <div class="ContentPaneProfile" id="ContentPaneProfile" runat="server"></div>
        </div>
        <div class="clear"></div>
    </div>

    <div class="one-half" id="LeftHalfPane" runat="server" >
    </div>
     <div class="one-half last" id="RightHalfPane" runat="server" >
    </div>
    <div class="clear"></div>

    <div class="one-third" id="LeftNarrowPane2" runat="server">
    </div>
    <div class="one-third" id="MiddleNarrowPane" runat="server">
    </div>
    <div class="one-third last" id="RightNarrowPane2" runat="server">
    </div>
    <div class="clear"></div>

    <div class="two-third" id="LeftWidePane" runat="server">	
	</div>
	<div class="one-third last" id="RightNarrowPane" runat="server">
	</div>
	<div class="clear"></div>

    <div class="one-third" id="LeftNarrowPane" runat="server">	
	</div>
	<div class="two-third last" id="RightWidePane" runat="server">
	</div>
	<div class="clear"></div>

    <div class="one-fourth" id="NarrowPane0" runat="server">
    </div>
    <div class="one-fourth" id="NarrowPane25" runat="server">
    </div>
    <div class="one-fourth" id="NarrowPane50" runat="server">
    </div>
    <div class="one-fourth last" id="NarrowPane75" runat="server">
    </div>
    <div class="clear"></div>

    <div class="three-fourth" id="LeftWidePane75" runat="server">
    </div>
    <div class="one-fourth last" id="RightNarrowPane25" runat="server">
    </div>
    <div class="clear"></div>
    
    <div class="one-fourth" id="LeftNarrowPane25" runat="server">
    </div>
    <div class="three-fourth last" id="RightWidePane75" runat="server">
    </div>
    <div class="clear"></div>


    <div class="one-fourth" id="BottomPane0" runat="server">
    </div>
    <div class="one-fourth" id="BottomPane25" runat="server">
    </div>
    <div class="one-fourth" id="BottomPane50" runat="server">
    </div>
    <div class="one-fourth last" id="BottomPane75" runat="server">
    </div>
    <div class="clear"></div>
     </section>
    <!-- end #content -->
    <footer id="footer" class="clearfix">

	<div class="container">

		    <div class="one-third wsc_pane" id="PreFooterLeftPane" runat="server">
            </div>
            <div class="one-third wsc_pane" id="PreFooterMiddlePane" runat="server">
            </div>
            <div class="one-third wsc_pane last" id="PreFooterRightPane" runat="server">
            </div>
            <div class="clear"></div>

            <div class="one-fourth wsc_pane" id="PreFooterPane0" runat="server">
            </div>
            <div class="one-fourth wsc_pane" id="PreFooterPane25" runat="server">
            </div>
            <div class="one-fourth wsc_pane" id="PreFooterPane50" runat="server">
            </div>
            <div class="one-fourth wsc_pane last" id="PreFooterPane75" runat="server">
            </div>
            <div class="clear"></div>

	</div><!-- end .container -->

    </footer>
    <!-- end #footer -->
    <footer id="footer-bottom" class="clearfix">

	<div class="container">

		<div class="footer-links">
        			<!--#include file="CommonParts/social.ascx"-->
                </div>
		<div>
                     <ul class="footer-copyright">
			<li><dnn:COPYRIGHT ID="FooterCopyright" runat="server" /></li>
	              </ul>
                </div>

		<div id="Login">
                     <dnn:LANGUAGE runat="server" ID="dnnLANGUAGE" ShowLinks="True" ShowMenu="False" UseDropDownList="true"/>
                     <dnn:USER ID="USER" runat="server" LegacyMode="false" /> 
                     <dnn:LOGIN ID="LOGIN" CssClass="LoginLink" runat="server" LegacyMode="false" />
                </div>
		
		<div class="clear"></div>

        <div class="clear"></div>

	</div><!-- end .container -->

    </footer>
    <!-- end #footer-bottom -->

</div>
</div>
<!--#include file="CommonParts/switcher.ascx"-->

    <!-- Visual Visitor Script -->
<script type="text/javascript">
var vv_account_id = 'y5Eh5zyOtl';
var vv_BaseURL = (("https:" == document.location.protocol) ? "https://frontend.id-visitors.com/FrontEndWeb/" : "http://frontend.id-visitors.com/FrontEndWeb/");
(function () {
var va = document.createElement('script'); va.type = 'text/javascript'; va.async = true; va.src = vv_BaseURL + 'Scripts/liveVisitAsync.js'; var sv = document.getElementsByTagName('script')[0]; sv.parentNode.insertBefore(va, sv); })(); </script>

<%----------------------------------- JAVA SCRIPT ----%>
<%--- Custom Scripts ----%>
<%--<script src="<%= TemplateSourceDirectory %>/js/jquery.min.js"></script>--%>

<script type="text/javascript">
    var skinPath = "<%= TemplateSourceDirectory %>";
</script>

<!--[if !lte IE 6]><!-->
    <!--#include file="CommonParts/AddScripts.ascx"-->
    	<script id='js-dispatcher' type="text/javascript" src="<%= TemplateSourceDirectory %>/js/custom.js"></script>

<!--<![endif]-->

<dnn:STYLES runat="server" ID="StylesIE6" Name="IE6Minus" StyleSheet="css/ie6skin.css"
    Condition="IE 6" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="StylesIE7" Name="IE7Minus" StyleSheet="css/ie7skin.css"
    Condition="IE 7" UseSkinPath="true" />
<dnn:STYLES runat="server" ID="StylesIE8" Name="IE8Minus" StyleSheet="css/ie8skin.css"
    Condition="IE 8" UseSkinPath="true" />


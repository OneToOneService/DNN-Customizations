<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewPost.ascx.cs" Inherits="WebSitesCreative.Modules.PostIt.ViewPost" %>
<%@ Import Namespace="WebSitesCreative.Modules.PostIt.Components.Helpers" %>
<%@ Register TagPrefix="cust" TagName="AudioPlayer" Src="Controls/AudioPlayer.ascx" %>
<%if (IsEditable)
  { %>
<script type="text/javascript" language="javascript">
(function($) {
    $(document).ready(function () {
            $('p.wsc_post_summary').editableText({
                change: function(element, oldValue, newValue){
                    $.ajax({
                        type: "POST",
                        url: '<%= TemplateSourceDirectory %>/InPlaceEditingService.asmx/SaveSummary',
                        data: JSON.stringify({ summary: newValue , postId: <%=Post.ItemId %>, moduleId: <%=ModuleId %>, portalId: <%=PortalId %>, tabId: <%=TabId %>}),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data, status) { 
                            if(data.d == false){ 
                                element.html(oldValue);
                            }
                        },
                        error: function () { element.html(oldValue); }
                    });
                }
            });
        
            $('div.wsc_post_content').editableText({
                change: function(element, oldValue, newValue){
                    $.ajax({
                        type: "POST",
                        url: '<%= TemplateSourceDirectory %>/InPlaceEditingService.asmx/SaveContent',
                        data: JSON.stringify({ content: newValue , postId: <%=Post.ItemId %>, moduleId: <%=ModuleId %>, portalId: <%=PortalId %>,tabId: <%=TabId %>}),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data, status) { 
                            if(data.d == false){ 
                                element.html(oldValue);
                            }
                        },
                        error: function () { element.html(oldValue); }
                    });
                }
            });
    });
    })(jQueryWSC171);
</script>
<%} %>
<div class="wsc_pi_detailed_view wsc_posts_common">
    <div class="wsc_pi_post_header">
        <%if (Post != null)
          { %>
        <div class="wsc_pi_post_controls">
            <a runat="server" id="lnkEdit"><span><strong>
                <%= GetLocalized("Edit") %></strong></span></a>
            <asp:LinkButton runat="server" ID="lnkDelete" OnCommand="lnkDelete_Command"><span><strong><%= GetLocalized("Delete") %></strong></span></asp:LinkButton>
            <asp:LinkButton runat="server" ID="lnkChangePublish" OnCommand="lnkChangePublish_Command"><span><strong><%= Post.Published ? GetLocalized("Unpublish") : GetLocalized("Publish")%></strong></span></asp:LinkButton>
            <asp:Label runat="server" ID="lblUnpublish" CssClass="NormalRed" resourcekey="UnpublishedStatus"></asp:Label>
        </div>
        <h2 class="wsc_title">
            <%=Post.Title%></h2>
        <span class="wsc_pi_feed_info"><span class="wsc_text_posted">
            <%=GetLocalized("Posted")%></span> <span class="wsc_info_date">
                <%= Post.Date.ToShortDateString()%></span> <span class="wsc_text_by">
                    <%=GetLocalized("ByUser")%></span> <span class="wsc_info_author">
                        <%= Post.CreatedByUserName %></span> <span class="wsc_tags_cloug">
                            <%if (!String.IsNullOrEmpty(Post.Tags))
                              { %>
                            <%=GetLocalized("InTags")%>
                            <asp:Repeater ID="rptTagsUp" runat="server">
                                <ItemTemplate>
                                    <a class="wsc_tag" href='<%# UrlsHelper.GetTagUrl((String)Container.DataItem, TabId) %>'>
                                        <%# Container.DataItem%></a>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%} %>
                        </span></span>
    </div>
    <cust:AudioPlayer runat="server" id="audioPlayer_File">
    </cust:AudioPlayer>
    <div class="wsc_pi_body">
        <asp:PlaceHolder ID="imageWrapper" runat="server">
            <div class="wsc_image_frame imgLeft wsc_pi_img_frame wsc_img_<%=PostItSettings.ImageAlign.ToString().ToLower() %>">
                <div class="wsc_frame_tl">
                    <div class="wsc_frame_tr">
                        <div class="wsc_frame_tc">
                        </div>
                    </div>
                </div>
                <div class="wsc_frame_cl">
                    <div class="wsc_frame_cr">
                        <div class="wsc_frame_cc">
                            <img runat="server" id="imgPostImage" alt="image" class="post-image" />
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wsc_frame_bl">
                    <div class="wsc_frame_br">
                        <div class="wsc_frame_bc">
                        </div>
                    </div>
                </div>
            </div>
        </asp:PlaceHolder>
        <p class='wsc_post_summary'>
            <%=Post.Summary%></p>
        <div class='wsc_post_content'>
            <%=HttpUtility.HtmlDecode(Post.Content)%></div>
    </div>
    <div class="wsc_pi_footer">
        <div class="wsc_tags_cloug">
            <%if (!String.IsNullOrEmpty(Post.Tags))
              { %>
            <%=GetLocalized("Tags")%>
            <asp:Repeater ID="rptTagsBottom" runat="server">
                <ItemTemplate>
                    <a class="wsc_tag" href='<%# UrlsHelper.GetTagUrl((String)Container.DataItem, TabId) %>'>
                        <%# Container.DataItem%></a>
                </ItemTemplate>
            </asp:Repeater>
            <%} %>
        </div>
        <div class="wsc_pi_add_this">
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style ">
                <a class="addthis_button_facebook_like"></a><a class="addthis_button_tweet"></a>
                <%= "<a class=\"addthis_button_google_plusone\" g:plusone:size=\"medium\"></a>" %>
                <a class="addthis_counter addthis_pill_style"></a>
            </div>
            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4da1e93b20cd565d"></script>
            <!-- AddThis Button END -->
        </div>
    </div>
    <%}
          else
          { %>
    <%=GetLocalized("PostNotFound")%>
    <%} %>
</div>

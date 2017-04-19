<%@ Control Language="C#" Inherits="WebSitesCreative.Modules.PostIt.ViewPostIt" AutoEventWireup="true"
    CodeBehind="ViewPostIt.ascx.cs" %>
<%@ Import Namespace="WebSitesCreative.Modules.PostIt.Components.Helpers" %>
<%@ Register TagPrefix="wsc" TagName="ViewPost" Src="ViewPost.ascx" %>
<%@ Register TagPrefix="wsc" TagName="RssSubscribe" Src="Controls/RssSubscribe.ascx" %>
<%@ Register TagPrefix="wsc" TagName="Paging" Src="Controls/Paging.ascx" %>
<wsc:RssSubscribe runat="server">
</wsc:RssSubscribe>
<asp:MultiView runat="server" ID="mvContent">
    <asp:View runat="server" ID="viewPostsFeed">
        <%if (IsEditable)
          { %>
        <script type="text/javascript" language="javascript">
          (function($) {
            $(document).ready(function() {

              $('p.wsc_post_summary').editableText({
                change: function(element, oldValue, newValue) {
                  var postId = $('input[type="hidden"]', $(element).parent())[0].value;
                  $.ajax({
                    type: "POST",
                    url: '<%= TemplateSourceDirectory %>/InPlaceEditingService.asmx/SaveSummary',
                    data: JSON.stringify({ summary: newValue, postId: postId, moduleId: <%=ModuleId %>, portalId: <%=PortalId %>, tabId: <%=TabId %> }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(data, status) {
                      if (data.d == false) {
                        element.html(oldValue);
                      }
                    },
                    error: function() { element.html(oldValue); }
                  });
                }
              });
            });
          })
        </script>
        <%} %>
        <div class="wsc_posts_list wsc_posts_common">
            <asp:Repeater runat="server" ID="rptPosts" OnItemDataBound="rptPosts_ItemDataBound">
                <ItemTemplate>
                    <div class="wsc_post_item">
                        <div class="wsc_pi_post_header">
                            <div class="wsc_pi_post_controls">
                                <asp:LinkButton CssClass="wsc_pi_button wsc_pi_control_button" runat="server" ID="lnkEditPost"
                                    OnCommand="lnkEdit_Command" CommandArgument='<%# Eval("ItemId") %>' Visible='<%# IsEditable %>'><span><strong><%= GetLocalized("Edit") %></strong></span></asp:LinkButton>
                                <asp:LinkButton CssClass="wsc_pi_button wsc_pi_control_button" runat="server" ID="lnkDelete"
                                    OnCommand="lnkDelete_Command" CommandArgument='<%# Eval("ItemId") %>' Visible='<%# IsEditable %>'><span><strong><%= GetLocalized("Delete") %></strong></span></asp:LinkButton>
                                <asp:LinkButton CssClass="wsc_pi_button wsc_pi_control_button" runat="server" ID="lnkChangePublish"
                                    OnCommand="lnkChangePublish_Command" CommandArgument='<%# Eval("ItemId") %>'
                                    Visible='<%# IsEditable %>'><span><strong> <%# ((bool)Eval("Published")) ? GetLocalized("Unpublish") : GetLocalized("Publish") %></strong></span></asp:LinkButton>
                                <asp:Label CssClass="NormalRed" runat="server" ID="lblUnpublish" resourcekey="UnpublishedStatus"
                                    Visible='<%# !(bool)Eval("Published") %>'></asp:Label>
                            </div>
                            <h2 class="wsc_title">
                                <a href='<%# UrlsHelper.GetPostUrl(Eval("Url") as string, TabId) %>'>
                                    <%# Eval("Title") %></a>
                                    <span runat='server' visible='<%# Eval("HasAudio") %>'>
                                      <img src="<%= ResolveUrl(UIHelper.GetUIFileUrl("images/audio.png")) %>" style="width: 16px" alt='Audio' />
                                    </span>
                                    </h2>
                            <span class="wsc_pi_feed_info"><span class="wsc_text_posted">
                                <%=GetLocalized("Posted")%></span> <span class="wsc_info_date">
                                    <%# ((DateTime)Eval("Date")).ToShortDateString() %></span> <span class="wsc_text_by">
                                        <%=GetLocalized("ByUser")%></span> <span class="wsc_info_author">
                                            <%# Eval("CreatedByUserName") %></span> <span class="wsc_tags_cloug">
                                                <asp:PlaceHolder runat="server" Visible='<%# !String.IsNullOrEmpty((String)Eval("Tags")) %>'>
                                                    <%=GetLocalized("InTags")%>
                                                    <asp:Repeater DataSource='<%# Eval("SplittedTags") %>' runat="server">
                                                        <ItemTemplate>
                                                            <a class="wsc_tag" href='<%# UrlsHelper.GetTagUrl((String)Container.DataItem, TabId) %>'>
                                                                <%# Container.DataItem%></a>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </asp:PlaceHolder>
                                            </span><span class="wsc_comments_count"><a href='<%# UrlsHelper.GetPostUrl(Eval("Url") as string, TabId)%>#disqus_thread'>
                                            </a></span></span>
                            <div class="clear">
                            </div>
                        </div>
                        <asp:PlaceHolder runat="server" Visible='<%# !String.IsNullOrEmpty(Eval("Image") as string) %>'>
                            <div class="wsc_image_frame imgLeft wsc_img_<%=PostItSettings.ImageAlign.ToString().ToLower() %>">
                                <div class="wsc_frame_tl">
                                    <div class="wsc_frame_tr">
                                        <div class="wsc_frame_tc">
                                        </div>
                                    </div>
                                </div>
                                <div class="wsc_frame_cl">
                                    <div class="wsc_frame_cr">
                                        <div class="wsc_frame_cc">
                                            <a href='<%# UrlsHelper.GetPostUrl(Eval("Url") as string, TabId) %>'>
                                                <img src='<%# FilesHelper.GetFileUrl(ModuleId, Eval("Image") as string) %>' runat="server"
                                                    id="img" alt='<%# Eval("Title") %>' title='<%# Eval("Title") %>' /></a>
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
                        <div>
                            <asp:HiddenField ID="hfPostId" runat="server" Value='<%#Eval("ItemId") %>' />
                            <p class="wsc_post_summary">
                                <%# Eval("Summary") %></p>
                        </div>
                        <p>
                            <a class="button wsc_pi_button wsc_readmore" href='<%# UrlsHelper.GetPostUrl(Eval("Url") as string, TabId) %>'>
                                <span><strong>
                                    <%= GetLocalized("ViewMore") %></strong></span></a></p>
                        <div class="wsc_clear">
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="posts-paging">
                <wsc:Paging ID="Paging" runat="server">
                </wsc:Paging>
            </div>
        </div>
    </asp:View>
    <asp:View runat="server" ID="viewPost">
        <wsc:ViewPost runat="server" id="viewPostControl">
        </wsc:ViewPost>
    </asp:View>
</asp:MultiView>

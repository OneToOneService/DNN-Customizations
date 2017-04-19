<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AudioPlayer.ascx.cs"
  Inherits="WebSitesCreative.Modules.PostIt.Controls.AudioPlayer" %>
<%@ Import Namespace="WebSitesCreative.Modules.PostIt.Components.Helpers" %>
<% if (!String.IsNullOrEmpty(AudioFile.Mp3FileName) || !String.IsNullOrEmpty(AudioFile.OggFileName))
   { %>
<script type="text/javascript">
  audiojs.events.ready(function () {
    audiojs.createAll();
  });

</script>
<div id="<%= ClientID %>">
  <audio id="audiojs_<%= ClientID %>" preload="none">
    <% if (!String.IsNullOrEmpty(AudioFile.Mp3FileName))
       { %>
    <source src="<%= FilesHelper.GetFileUrl(ModuleId, AudioFile.Mp3FileName) %>" type="audio/mp3"></source>
    <% } %>
    <% if (!String.IsNullOrEmpty(AudioFile.OggFileName))
       {%>
    <source src="<%= FilesHelper.GetFileUrl(ModuleId, AudioFile.OggFileName) %>" type="audio/ogg"></source>
    <% } %>
  </audio>
  <br />
  <div style="clear: both;">
  </div>
</div>
<% } %>
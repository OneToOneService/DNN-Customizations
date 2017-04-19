<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NodeTemplate.ascx.cs" Inherits="CodingStaff.Modules.MenuBox.NodeTemplate" %>
<li >
    <a title="<%= Node.Text %>" href="<%= ( Node.Enabled ? Node.NavigateURL : "#") %>"><%= Node.Text %></a>    
   
</li>

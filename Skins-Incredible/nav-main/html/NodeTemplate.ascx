<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NodeTemplate.ascx.cs" Inherits="CodingStaff.Modules.MenuBox.NodeTemplate" %>
<li class='<%=(IsActive ? "current" : "") %>'>
    <a title="<%= Node.Text %>" href="<%= ( Node.Enabled ? Node.NavigateURL : "#") %>"><%= Node.Text %></a>    
    <% if (HasChildren)
     {%>
         <ul>
             <asp:PlaceHolder runat="server" ID="phChildNodes"></asp:PlaceHolder>
         </ul>
   <%} %>
</li>

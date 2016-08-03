<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Registration.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <span id="spnMessage" runat="server"></span>
        <asp:Button ID="btnLogput" runat="server" Text="LogOut" OnClick="btnLogOut_Click" />
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Registration.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 515px; height: 360px">
        <table align="Center" style="height: 144px">
            <tr>
                <td>
                    <span id="spnMessage" runat="server" style="font-size:25px;" >Reset Password</span>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    New Password* :<br />
                    <asp:TextBox ID="txtNewPassword" runat="server" Width="172px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password* :<br />
                    <asp:TextBox ID="txtConfPassword" runat="server" Width="170px"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnReset" runat="server" Text="Reset Password" BackColor="Lime" Width="115px" OnClick="btnReset_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

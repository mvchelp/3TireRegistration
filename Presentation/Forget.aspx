<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="Registration.Forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script>
        function Validation()
        {
            Field = "";

            var email = $("#MainContent_txtEmail");

            if (email != null && (email.val() == "" || email.val() == null)) {
                Field = Field + "Email is Required" + "<br/>";
            }
            else {
                var emailAddress = email.val();
                var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
                var id = pattern.test(emailAddress);
                if (id == false) {
                    Field = Field + "Plese Enter Valid Email Address" + "<br/>"
                }
            }

            if (Field.length > 0) {
                $("#MainContent_spnMessage").html(Field);
                return false;
            } else { return true; }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <span id="spnMessage" runat="server" style="color:red;"></span>
            </tr>
            <tr>
                <td>
                    Enter Your Email :<br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="211px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

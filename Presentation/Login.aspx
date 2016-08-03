<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Registration.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script>
        $(document).ready(function () {
            initControl();
        });

        function initControl() {

        }

        function validation() {

            Field = "";

            var email = $("#MainContent_txtEmail");
            var Password = $("#MainContent_txtPassword");

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

            if (Password != null && (Password.val() == "" || Password.val() == null)) {
                Field = Field + "Please Enter Password" + "<br/>";
            }

            if (Field.length > 0) {
                $("#MainContent_spnError").html(Field);
                return false;
            } else { return true; }
        }

        function clearControl() {
            initControl();
            $("#MainContent_txtEmail").val("");
            $("#MainContent_txtPassword").val("");
            $("#MainContent_spnError").html("");
            return false;
        }
    </script>
    <link href="Content/Login.css" rel="stylesheet" />
    <div style="margin:50px 400px 200px 100px; background-color:lightgrey; height: 335px; width: 498px;">
            <table align ="Center">
                <tr>
                    <td>
                        <span id="spnError" runat="server" style="color:red;"></span>
                    </td>
                </tr>
                <tr>
                    <td style="width: 320px">
                        <h2>Login</h2>
                    </td>
                </tr>
                <tr>
                    <td style="width: 320px">
                        Email : <br />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="login-box" MaxLength="50" Width="220px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 320px">
                        Password : <br />
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="16" CssClass="login-box" Width="220px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 320px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 320px">
                        <asp:ImageButton ID="btnLogin" OnClientClick="return validation();" runat="server" ImageUrl="~/Images/login.png" OnClick="btnLogin_Click" />
                        &nbsp;
                        <asp:ImageButton ID="btnSignUp"  ImageUrl="~/Images/signup.png" runat="server" OnClick="btnSignUp_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 320px">
                        <a id="Forgetpass" href="Forget.aspx" style="color:black;">Forget Password?</a>
                    </td>
                </tr>
            </table>
    </div>
</asp:Content>

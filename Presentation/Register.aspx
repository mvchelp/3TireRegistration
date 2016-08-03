<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Registration.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script>
        function validation() {

            Field = "";

            var fname = $("#MainContent_txtFname");
            var lname = $("#MainContent_txtLname");
            var gender = $("#MainContent_rdoGender");
            var email = $("#MainContent_txtEmail");
            var password = $("#MainContent_txtPassword");

            if (fname != null && (fname.val() == "" || fname.val() == null)) {
                Field = Field + "FirstName is Required" + "<br/>";
            }

            if (lname != null && (lname.val() == "" || lname.val() == null)) {
                Field = Field + "LastName is Required" + "<br/>";
            }

            if (gender != null && (gender.find("input:checked").length == '0' || gender.val() == null)) {
                Field = Field + "Please Select Your Gender" + "<br/>";
            }

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

            if (password != null && (password.val() == "" || password.val() == null)) {
                Field = Field + "Password is Required" + "<br/>";
            }

            if (Field.length > 0) {
                $("#MainContent_spnError").html(Field);
                return false;
            } else { return true; }
        }

        function clearControl() {
            $("#MainContent_txtFname").val("");
            $("#MainContent_txtLname").val("");
            $("#MainContent_rbGender").find('input:radio').removeAttr('checked');
            $("#MainContent_txtEmail").val("");
            $("#MainContent_txtPassword").val("");
            $("#MainContent_spnMessage").html("");
            return false;
        }
    </script>
    <link href="Content/register.css" rel="stylesheet" />
    <div style="margin: 50px 400px 200px 100px; background-color: lightgrey; height: 500px; width: 500px;">
        <table align="Center">
            <tr>
                <td>
                    <span id="spnMessage" runat="server" style="color:red;" ></span>"
                </td>
            </tr>
            <tr>
                <td>
                    <h2 style="color: blue">Registration</h2>
                </td>
            </tr>
            <tr>
                <td>FirstName* :<br />
                    <asp:TextBox ID="txtFname" runat="server" CssClass="textbox" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Lastname* :<br />
                    <asp:TextBox ID="txtLname" runat="server" CssClass="textbox" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Gender :<br />
                    <asp:RadioButtonList ID="rdoGender" runat="server" Height="16px" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>EmailId* :<br />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" MaxLength="50" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password* :<br />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" MaxLength="16" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="btnRegister" OnClientClick="return validation();" runat="server" ImageUrl="~/Images/Register.png" Width="85px" OnClick="btnRegister_Click" />
                    &nbsp;
                    <asp:ImageButton ID="btnCancel" OnClientClick="return clearControl();" runat="server" ImageUrl="~/Images/Cancel.png" Height="26px" Width="84px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

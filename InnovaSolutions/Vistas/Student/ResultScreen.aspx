<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultScreen.aspx.cs" Inherits="InnovaSolutions.Vistas.Student.ResultScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #btn_ok {
            background-color: #6495ED; 
            text-align:right;
            color: white;
            border-style: ridge;
            border-color: inherit;
            border-width: medium;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            -webkit-transition-duration: 0.4s; 
            transition-duration: 0.4s;
            background-color: #6495ED; 
            color: white;
            margin-left: 37px;
        }</style>

</head>
<body style ="margin-left:300px; width: 926px;border-style:solid; height: 176px;">
    <form id="form1" runat="server">
        <div style="height: 116px"> 
            <p style="margin-left: 400px">
                &nbsp;</p>
            <p style="margin-left: 400px;font-size:large">
            Su calificación es: <asp:Label ID="lbl_result" runat="server" Text=""></asp:Label>
            </p>
            <p style="margin-left: 400px;font-size:large">
                <br />
            <asp:Button ID="btn_ok" runat="server" Text="Volver" OnClick="btn_ok_Click" Height="54px" Width="120px" />
            </p>
        </div>
    </form>
</body>
</html>

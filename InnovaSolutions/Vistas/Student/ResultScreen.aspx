<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="ResultScreen.aspx.cs" Inherits="InnovaSolutions.Vistas.Student.ResultScreen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="div_form" runat="server" style ="border-style:solid; height: 176px;">
        <div style="height: 116px; text-align:center;"> 
            <p style="">
                &nbsp;</p>
            <p style="font-size:large">
            Su calificación es: <asp:Label ID="lbl_result" runat="server" Text=""></asp:Label>
            </p>
            <p style="font-size:large">
                <br />
            <asp:Button ID="btn_ok" runat="server" Text="Volver" OnClick="btn_ok_Click" Height="54px" Width="120px" />
            </p>
            <br />
            <asp:Image ID="Image1" runat="server" Height="200px" Width="415px" />
        </div>
    </div>
</asp:Content>

<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="BorrarExamen.aspx.cs" Inherits="InnovaSolutions.Vistas.Student.BorrarExamen" %>
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
                El examen <asp:Label ID="lbl_exam" runat="server" Text=""></asp:Label>&nbsp;Se eliminará<br />
                ¿Desea Continuar?
            </p>
            <p style="font-size:large">
                <br />
            <asp:Button ID="btn_nope" runat="server" Text="Cancelar" OnClick="btn_nope_Click" Height="54px" Width="120px" CssClass=""/>
            <asp:Button ID="btn_ok" runat="server" Text="Eliminar" OnClick="btn_ok_Click" Height="54px" Width="120px" CssClass=""/>
            </p>
        </div>
    </div>
</asp:Content>

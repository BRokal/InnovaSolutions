<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="InnovaSolutions.Vistas.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 252px;
            width: 316px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="div_form" runat="server" style="height: 591px; border-style: solid; text-align:center">
        <p style="margin-top:30px">
            <asp:Button ID="btnEliminar" CssClass="btn btn-primary" runat="server" OnClick="btnEliminar_Click" Text="Eliminar Usuarios" Width="202px" />
            <br /><br />
            <asp:Button ID="btnCrear_Examen" CssClass="btn btn-primary" runat="server" OnClick="btnCrear_Examen_Click" Text="Crear Examen" Width="202px" />
            <br /><br />
            <asp:Button ID="btnLista" CssClass="btn btn-primary" runat="server" OnClick="btnLista_Click" Text="Lista de Examenes" Width="202px" />
            <br /><br />
        </p>
        <div style="">
            <asp:Button ID="BtnVolver" CssClass="btn btn-primary" runat="server" OnClick="BtnVolver_Click" Text="Volver" Width="202px" />
        
        </div>
        
        <br />

        <asp:Label ID="labMostrar" runat="server"></asp:Label>
        <asp:Image ID="Image1" runat="server" Height="200px" Width="415px" />
        <p class="Image1">
            </p>
    </div>
</asp:Content>

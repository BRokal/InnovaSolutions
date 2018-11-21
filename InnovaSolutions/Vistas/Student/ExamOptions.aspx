<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="ExamOptions.aspx.cs" Inherits="InnovaSolutions.Vistas.Student.ExamOptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="div_form" runat="server" style ="border-style:solid; height: 476px;">
        <div style="height: 116px; text-align:center;"> 
            <p style="">
                &nbsp;</p>
            <p style="font-size:large">
                Examen Seleccionado: <asp:Label ID="lbl_name" runat="server" Text=""></asp:Label> <br />
                Seleccione la cantidad de Preguntas: <br />
                <input id="txt_cant" type="number" runat="server" min="1"/>
            </p>
            <p style="font-size:large">
                <br />
                <asp:Button ID="btn_go_back" runat="server" Text="Volver" OnClick="btn_go_back_Click" />
                <asp:Button ID="btn_go" runat="server" Text="Continuar" OnClick="btn_go_Click" />
            </p>
            <br />
            <asp:Image ID="Image1" runat="server" Height="200px" Width="415px" />
        </div>
    </div>
</asp:Content>

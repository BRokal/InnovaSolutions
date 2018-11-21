<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="InnovaSolutions.Registrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .register_form{
            height: 652px; 
            border-style: solid; 
            background-color:white; 
            text-align:center;
            width:80%;
            margin-left:10%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div id="div_form" class="container" runat="server" style="text-align:center">
        <div aria-required="False" class="register_form" >

            <br />
            <div style="text-align:center">
                <h1 style="background-color:antiquewhite;">
                    Registro
                </h1>
            </div>
            Nuevo Usuario:<br />
            <asp:TextBox ID="txtUsuario" CssClass="form-control" style="width: 80%; margin-left:10%" runat="server"></asp:TextBox>
            <br />
            
            Contraseña:<br />
            <asp:TextBox ID="txtContrasena" CssClass="form-control" style="width: 80%; margin-left:10%" runat="server" TextMode="Password"></asp:TextBox>
            <br />
             Confirmar Contraseña<br />
            <asp:TextBox ID="txtConfirmar" CssClass="form-control" style="width: 80%; margin-left:10%" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            
            Tipo:
            <br />

            <asp:DropDownList ID="ddlTipo" runat="server">
                <asp:ListItem Selected="True" Value="ddlEstudiante">Estudiante</asp:ListItem>
                <asp:ListItem Value="ddlProfesor">Profesor</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Membresía:
            <br />
             <asp:DropDownList ID="ddlMembresia" runat="server">
                <asp:ListItem Selected="True" Value="ddlGratis">Gratis</asp:ListItem>
                <asp:ListItem Value="ddlPremium">Premium</asp:ListItem>
            </asp:DropDownList>
            
            <br />
            <br />
            <br />
            <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" OnClick="btnRegistrar_Click" Text="Registrar" Width="150px" />
            <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-primary" OnClick="btnVolver_Click" Text="Volver" Width="150px"/>
            <br />
            <br />
            <br />

            <asp:Label ID="labMostrar" runat="server"></asp:Label>
        </div>
        <p style="">
            
            </p>
    </div>
</asp:Content>

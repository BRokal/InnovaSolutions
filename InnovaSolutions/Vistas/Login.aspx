<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InnovaSolutions.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />

	<!-- text fonts -->
	<link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />

	<!-- ace styles -->
	<link rel="stylesheet" href="../assets/css/ace.min.css" />
	<link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />
    <title></title>
    <style type="text/css">
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="div_form" class="container" runat="server" style="">
        <div>
            <h1 style="background-color:cornflowerblue;">
                Innova<span class="white" id="id-text2">Solutions</span>

            </h1>
        </div>
        <p style="font-size:large">
            Usuario:</p>
        <p style="">
            
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" OnTextChanged="txtUsuario_TextChanged" style="max-width:400px;" ></asp:TextBox>
            </p>
        <p style="font-size:large">
            Contraseña:
        </p>
        <p style="">
            
            <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" style="max-width:400px;"></asp:TextBox>
        </p>
        <p>
            
            <asp:Button ID="btnIniciar" runat="server" CssClass="btn btn-primary" OnClick="btnIniciar_Click1" Text="Iniciar" Width="164px" />
            <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" OnClick="btnRegistrar_Click" Text="Crear Cuenta" Width="164px" />
        
        </p>
        <p style="">
            
            <asp:Label ID="labMostrar" runat="server"></asp:Label>
        </p>
    </div>
</asp:Content>

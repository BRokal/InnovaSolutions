<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrarUsuario.aspx.cs" Inherits="InnovaSolutions.Vistas.AdministrarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
.heading { color: #6495ED;background-color:white }
    </style>
    
</head>
<body style="width: 100%; border-style: solid">
    <form id="form1" runat="server">
        <div>
            <div>
            <h1 class ="heading"style="width: 292px; font-size:x-large; background-color:;">
								    Administración <span class="white" id="id-text2">de usuario</span></h1>
        </div>
            <%-- 
                Esta vista funciona para eliminar Usuarios, en eel futuro servirá para otras características de Administración
                El usuario debe incluír el nombre de Usuario que quiere eliminar, el botón elimina el usuario
            --%>
            <br />
            
            Nombre del Usuario:&nbsp <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
            <br />
            
            <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
        </div>
        <p style="">
        <br />
        
        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
            </p>
        <p style="">
        
<asp:Label ID="labMostrar" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrarUsuario.aspx.cs" Inherits="InnovaSolutions.Vistas.AdministrarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- 
                Esta vista funciona para eliminar Usuarios, en eel futuro servirá para otras características de Administración
                El usuario debe incluír el nombre de Usuario que quiere eliminar, el botón elimina el usuario
            --%>
            <br />
            <br />
            Nombre del Usuario:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
        </div>
        <br />
        <br />
        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="labMostrar" runat="server"></asp:Label>
    </form>
</body>
</html>

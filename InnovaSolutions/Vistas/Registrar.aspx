<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="InnovaSolutions.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #txtUsuario{
           border:2px solid #456879;
	       border-radius:10px;
	       height: 22px;
	       width: 230px;
        }
        #txtContrasena{
           border:2px solid #456879;
	       border-radius:10px;
	       height: 22px;
	       width: 230px;
        }
        #txtConfirmar{
           border:2px solid #456879;
	       border-radius:10px;
	       height: 22px;
	       width: 230px;
        }
        #txtId{
           border:2px solid #456879;
	       border-radius:10px;
	       height: 22px;
	       width: 230px;
        }
        #btnRegistrar {
           background-color: #228B22; 
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
            background-color: #228B22; 
            color: white;
        }
        #btnVolver {
           background-color: #6495ED; 
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
            background-color: #B22222; 
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align:center">
        <div aria-required="False" style="height: 652px; border-style: solid;background-color:white; text-align:center; max-width:500px" >

            <br />
            <div style="text-align:center">
                <h1 style="width: 129px; background-color:antiquewhite;">
                    Registro
                </h1>
            </div>
            Nuevo Usuario:<br />
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            <br />
            <br />
            
            Contraseña:<br />
            <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
             Confirmar Contraseña<br />
            <asp:TextBox ID="txtConfirmar" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            Identificación:<br />
            <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
            <br />
            <br />
            
            Tipo :<br />
            <br />

            <asp:DropDownList ID="ddlTipo" runat="server">
                <asp:ListItem Selected="True" Value="ddlEstudiante">Estudiante</asp:ListItem>
                <asp:ListItem Value="ddlProfesor">Profesor</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Membresía: <br />
            <br />
             <asp:DropDownList ID="ddlMembresia" runat="server">
                <asp:ListItem Selected="True" Value="ddlGratis">Gratis</asp:ListItem>
                <asp:ListItem Value="ddlPremium">Premium</asp:ListItem>
            </asp:DropDownList>
            
            <br />
            <br />
            <br />
            <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" Width="150px" />
            <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" Width="150px"/>
            <br />
            <br />
            <br />

            <asp:Label ID="labMostrar" runat="server"></asp:Label>
        </div>
        <p style="">
            
            </p>
    </form>
</body>
</html>

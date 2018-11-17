<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="InnovaSolutions.Vistas.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 252px;
            width: 316px;
        }
        #btnEliminar {
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
            background-color:	#6495ED; 
            color: white;
        }
        #btnCrear_Examen {
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
            background-color: 	#6495ED; 
            color: white;
        }
        #btnIniciar {
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
            background-color:  	#6495ED; 
            color: white;
        }
        #btnLista {
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
            background-color:	#6495ED; 
            color: white;
        }
        #BtnVolver {
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
            background-color:  	 	#6495ED; 
            color: white;
        }
    </style>
</head>
<body style="height: 591px; border-style: solid; text-align:center">
    <form id="form1" runat="server">
        <p style="margin-top:30px">
            <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar Usuarios" Width="202px" />
        
            <asp:Button ID="btnCrear_Examen" runat="server" OnClick="btnCrear_Examen_Click" Text="Crear Examen" Width="202px" />
        
            <asp:Button ID="btnLista" runat="server" OnClick="btnLista_Click" Text="Lista de Examenes" Width="202px" />
        
        </p>
        <div style="">
            <asp:Button ID="BtnVolver" runat="server" OnClick="BtnVolver_Click" Text="Volver" Width="202px" />
        
        </div>
        
        <br />

        <asp:Label ID="labMostrar" runat="server"></asp:Label>
        <p class="Image1">
            </p>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InnovaSolutions.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />

	<!-- text fonts -->
	<link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />

	<!-- ace styles -->
	<link rel="stylesheet" href="../assets/css/ace.min.css" />
	<link rel="stylesheet" href="../assets/css/ace-rtl.min.css" />
    <title></title>
    <style type="text/css">
        #btnRegistrar {
            background-color: #6495ED; 
            text-align:right;
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
            background-color: #6495ED; 
            color: white;
            /*margin-left: 37px;*/
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
            background-color: #6495ED; 
            color: white;
            /*margin-left: 416px;*/
        }
        #txtUsuario {
           border:2px solid #456879;
	       border-radius:10px;
	       height: 22px;
	       width: 230px;
        }
        #txtContrasena {
           border:2px solid #456879;
	       border-radius:10px;
	       height: 22px;
	       width: 230px;
        }
 </style>
</head>
<body style="height: 386px; border-style: solid;">

    <form id="form1" runat="server" style="text-align: center">
        <div>
            <h1 style="background-color:cornflowerblue;">
                Innova<span class="white" id="id-text2">Solutions</span>

            </h1>
        </div>
        <p style="font-size:large">
            Usuario:</p>
        <p style="">
            
            <asp:TextBox ID="txtUsuario" runat="server" OnTextChanged="txtUsuario_TextChanged" style="" ></asp:TextBox>
            </p>
        <p style="font-size:large">
            Contraseña:
        </p>
        <p style="">
            
            <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" style="" Width=""></asp:TextBox>
        </p>
        <p>
            
            <asp:Button ID="btnIniciar" runat="server" OnClick="btnIniciar_Click1" Text="Iniciar" Width="164px" />
            <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" Width="164px" />
        
        </p>
        <p style="">
            
            <asp:Label ID="labMostrar" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>

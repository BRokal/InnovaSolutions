using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InnovaSolutions
{
    public partial class Login : System.Web.UI.Page
    {
        Conexion con = new Conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            //con.Probar();
        }

        protected void btnIniciar_Click1(object sender, EventArgs e)
        {
            bool entrar = con.Iniciar(txtUsuario.Text, txtContrasena.Text);
            if (entrar)
            {
                /*
                switch (Conexion.Usuario_Tipo)
                {
                    case "E":
                        Response.Redirect("Student/ListExams.aspx");
                        break;
                    case "P":
                        Response.Redirect("Teacher/MenuExams.aspx");
                        break;
                    case "A":
                        Response.Redirect("Admin/AdministrarUsuario.aspx");
                        break;
                }
                */
                Response.Redirect("Menu.aspx");
            }
            else
            {
                labMostrar.Text = "No existe este usuario";
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrar.aspx");
        }

        protected void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
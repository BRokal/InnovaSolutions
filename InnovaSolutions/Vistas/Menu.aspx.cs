using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Image Image1 = new Image();
            Image1.ImageUrl = "/Imagenes/Amazon.png";
            if (Conexion.Membresia_Conectado == "Gratis")
            {
                Image1.Visible = true;
            }
            else
            {
                Image1.Visible = false;
            }
            
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (Conexion.Tipo_Conectado == "A")
            {
                Response.Redirect("Admin/AdministrarUsuario.aspx");
            }
            else
            {
                labMostrar.Text = "Solo Administradores pueden entrar";
            }
        }

        protected void BtnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnCrear_Examen_Click(object sender, EventArgs e)
        {
            if (Conexion.Tipo_Conectado == "P")
            {
                Response.Redirect("Teacher/MenuExams.aspx");
            }
            else
            {
                labMostrar.Text = "Solo Profesores pueden entrar";
            }
        }

        protected void btnLista_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student/ListExams.aspx");
        }
    }
}
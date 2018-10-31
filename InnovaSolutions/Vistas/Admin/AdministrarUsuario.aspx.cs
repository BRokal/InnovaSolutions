using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas
{
    public partial class AdministrarUsuario : System.Web.UI.Page
    {
        /*
         * Esta clase se encarga de la Administración de los Usuarios, hasta el momento solo incluye
         * La opción de eliminar usuarios
         */
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            /*
             * Llama al método eliminar que elimina al usuario.
             * Notifica al Usuario ependiendo de la respuesta
             */
            int eliminar = 0;
            Conexion con = new Conexion();
            if(txtNombre.Text.Trim() == "")
            {
                labMostrar.Text = "No ha ingresado ningún nombre";
            }
            else
            {
                eliminar = con.Eliminar_Usuario(txtNombre.Text);
            }
            if(eliminar > 0)
            {
                labMostrar.Text = "Usuario eliminado";
            }
            else
            {
                labMostrar.Text = "Usuario no encontrado";

            }
  
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions
{
    public partial class Registrar : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Probar();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                int num = Int32.Parse(txtId.Text);
                if (txtUsuario.Text.Trim() == "" || txtContrasena.Text.Trim() == "" || txtConfirmar.Text.Trim() == "")
                {
                    labMostrar.Text = "Debe llenar todos los espacios";
                }
                else if (txtContrasena.Text.Trim() != txtConfirmar.Text.Trim())
                {
                    labMostrar.Text = "Las contraseñas no coinciden";
                }
                else
                {
                    labMostrar.Text = con.Insertar(txtUsuario.Text, txtContrasena.Text, ddlTipo.SelectedItem.Text, num);
                }
            }
            catch (Exception error)
            {
                labMostrar.Text = "Ingrese solamente números en Id";
            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
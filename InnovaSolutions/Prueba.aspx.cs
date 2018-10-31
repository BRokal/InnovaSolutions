using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions
{
    public partial class Prueba : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Probar();
            txtIdUsuario.Text = Conexion.Usuario_Conectado;
        }

        protected void btnTouchMe_Click(object sender, EventArgs e)
        {
            try
            {
                int id_usuario = Int32.Parse(txtIdUsuario.Text);
                int id_examen = Int32.Parse(txtIdExamen.Text);
                int nota = Int32.Parse(txtNota.Text);
                if (txtIdUsuario.Text.Trim() == "" || txtIdExamen.Text.Trim() == "" || txtNota.Text.Trim() == "")
                {
                    labMostrar.Text = "Debe llenar todos los espacios";
                }
                else
                {
                    labMostrar.Text = con.Insertar_Examen(id_usuario, id_examen, nota);
                }
            }
            catch (Exception error)
            {
                labMostrar.Text = error.Message;

            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
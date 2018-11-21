using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas
{
    public partial class ListExams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void grid_exams_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grid_exams_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            /*
             * Selecciona un examen y lo dirige a éste
             */
            string[] selected = Convert.ToString(e.CommandArgument).Split(',');
            string id = Convert.ToString(selected[0]);
            string name = Convert.ToString(selected[1]);
            Response.Redirect("./ExamOptions.aspx?testId=" + id + "&examName=" + name);
        }
    }
}
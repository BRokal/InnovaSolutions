using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas.Student
{
    public partial class ResultScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_result.Text = Request.QueryString["score"];
            Image1.ImageUrl = "/Imagenes/Pilsen.png";
            if (Conexion.Membresia_Conectado == "Gratis")
            {
                Image1.Visible = true;
            }
            else
            {
                Image1.Visible = false;
            }
        }

        protected void btn_ok_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListExams.aspx");
        }
    }
}
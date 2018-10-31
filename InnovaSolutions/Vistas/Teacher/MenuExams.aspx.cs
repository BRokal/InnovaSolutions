using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas
{
    public partial class MenuExams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearExamen.aspx");
        }

        protected void grid_exams_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int selected = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("./EditarExamen.aspx?Exam=" + selected);
        }
    }
}
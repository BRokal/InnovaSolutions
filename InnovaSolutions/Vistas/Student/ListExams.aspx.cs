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

        }

        protected void grid_exams_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grid_exams_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            /*
             * Selecciona un examen y lo dirige a éste
             */
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("./ResponderExamen.aspx?testId=" + id);
        }
    }
}
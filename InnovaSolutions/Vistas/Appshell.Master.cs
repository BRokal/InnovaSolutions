using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas
{
    public partial class Appshell : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void home_link_Click(object sender, EventArgs e)
        {
            restore();
            openList(no_list);
            openPage("/Vistas/Login.aspx");
        }

        protected void exam_link_Click(object sender, EventArgs e)
        {
            restore();
            openList(exam_list);
        }

        protected void teacher_link_Click(object sender, EventArgs e)
        {
            restore();
            openList(teacher_list);
        }

        protected void account_link_Click(object sender, EventArgs e)
        {
            restore();
            openList(account_list);
        }

        protected void admin_link_Click(object sender, EventArgs e)
        {
            restore();
            openList(no_list);
            openPage("/Vistas/Admin/AdministrarUsuario.aspx");
        }

        #region Submenús
        protected void list_exams_link_Click(object sender, EventArgs e) { openPage("/Vistas/Student/ListExams.aspx"); }
        protected void my_exams_link_Click(object sender, EventArgs e) { Response.Write("Próximamente"); }
        protected void list_teacher_link_Click(object sender, EventArgs e) { openPage("/Vistas/Teacher/MenuExams.aspx"); }
        protected void create_exam_link_Click(object sender, EventArgs e) { openPage("/Vistas/Teacher/CrearExamen.aspx"); }
        protected void signup_account_link_Click1(object sender, EventArgs e) { openPage("/Vistas/Registrar.aspx"); }
        protected void login_account_link_Click1(object sender, EventArgs e) { openPage("/Vistas/Login.aspx"); }
        protected void logout_account_link_Click1(object sender, EventArgs e) { LogOut(); }
        #endregion

        void restore()
        {
            //CODIGO PROVISIONAL
            no_list.Attributes["class"] += " hidden";
            exam_list.Attributes["class"] += " hidden";
            teacher_list.Attributes["class"] += " hidden";
            account_list.Attributes["class"] += " hidden";

            /*
            for (int i = 0; i < subclasses.Controls.Count; i++)
            {
                HtmlGenericControl got = (HtmlGenericControl)subclasses.Controls[i];
            }
            */
        }

        void LogOut()
        {
            Conexion.LogOut();
            openPage("/Vistas/Login.aspx");
        }

        void openList(HtmlGenericControl got)
        {
            got.Attributes.Add("class", got.Attributes["class"].ToString().Replace("hidden", ""));
        }

        void openPage(string site)
        {
            Response.Redirect(site);
        }
    }
}
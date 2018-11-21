using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas.Student
{
    public partial class BorrarExamen : System.Web.UI.Page
    {
        public SqlConnection conex = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True;");

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_exam.Text = Request.QueryString["Name"];
        }

        protected void btn_ok_Click(object sender, EventArgs e)
        {
            deleteExam(Request.QueryString["Exam"]);
        }

        protected void btn_nope_Click(object sender, EventArgs e)
        {
            Response.Redirect("./MenuExams.aspx");
        }

        void deleteExam(string exam)
        {
            try
            {
                SqlCommand com;
                conex.Open();
                com = conex.CreateCommand();

                com.CommandText = "DELETE FROM Pregunta WHERE Id_Examen = " + exam +
                    "DELETE FROM Complecion WHERE Id_Examen = " + exam +
                    "DELETE FROM Examen WHERE Id_Examen = " + exam + ";";
                com.ExecuteNonQuery();

                com.Cancel();
                conex.Close();
                Response.Write("<script>alert('Elemento Borrado con éxito');</script>");
                Response.Redirect("./MenuExams.aspx");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex + " But hey, you can always try again :)");
            }
        }
    }
}
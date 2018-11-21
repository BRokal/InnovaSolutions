using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas.Student
{
    public partial class ExamOptions : System.Web.UI.Page
    {
        public SqlConnection conex = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True;");
        string cant = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            loadExamInfo();            
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
        
        protected void btn_go_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("./ListExams.aspx");
        }

        protected void btn_go_Click(object sender, EventArgs e)
        {
            string selectedCant = txt_cant.Value.Equals("") ? cant : txt_cant.Value;
            Response.Redirect("./ResponderExamen.aspx?testId=" + Request.QueryString["testId"] + "&cant=" + selectedCant);
        }

        void loadExamInfo()
        {
            lbl_name.Text = Request.QueryString["examName"];
            SqlCommand com;

            conex.Open();
            com = conex.CreateCommand();
            com.CommandText = "SELECT COUNT(Id_pregunta) " +
                "FROM Pregunta " +
                "WHERE ID_Examen = " + Request.QueryString["testId"]; //Obtiene la cantidad de preguntas del Examen
            cant = Convert.ToString(com.ExecuteScalar());

            txt_cant.Attributes.Add("placeholder", cant);
            txt_cant.Attributes.Add("max", cant); //la cantidad de preguntas es el valor máximo de el seleccionador
        }
    }
}
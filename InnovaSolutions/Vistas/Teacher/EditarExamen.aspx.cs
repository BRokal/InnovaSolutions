using InnovaSolutions.Objetos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas.Teacher
{
    public partial class EditarExamen : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        public SqlConnection conex = new SqlConnection("Data Source=KEVIN_PC\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True;");
        
        List<string> exam = new List<string>();
        
        public string examOut = "";
        string test = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            test = Request.QueryString["Exam"];
            LoadExam();
        }

        protected void btn_finish_Click(object sender, EventArgs e)
        {
            Finish();
        }

        void LoadExam()
        {
            try
            {
                SqlCommand com;

                conex.Open();
                com = conex.CreateCommand();
                com.CommandText = "SELECT Nombre FROM Examen WHERE ID_Examen = " + test;
                txt_title.Text = (string)com.ExecuteScalar();

                com.CommandText = "SELECT * FROM Pregunta WHERE ID_Examen = " + test;
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable dt = new DataTable();
                da.Fill(dt);

                foreach (DataRow p in dt.Rows)
                {
                    string jsond = JsonConvert.SerializeObject(new
                    {
                        pregunta = p["Pregunta"].ToString(),
                        respuestas = p["Respuestas"].ToString().Split(','),
                        correcta = Convert.ToInt32(p["Correcta"].ToString()),
                        grafico = p["Grafico"].ToString()
                    }
                    );
                    exam.Add(jsond);
                }
                examOut = String.Join("▄", exam.ToArray());

                com.Cancel();
                conex.Close();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e + " But hey, you can always try again :)");
                throw;
            }
        }

        void Finish()
        {
            try
            {
                SqlCommand com;
                string ph = "Place Holder";

                conex.Open();
                com = conex.CreateCommand();
                com.CommandText =
                    "UPDATE Examen SET " +
                    "Nombre = '" + txt_title.Text + "' " +
                    "WHERE ID_Examen = " + test + "; " +
                    "DELETE FROM Pregunta " +
                    "WHERE ID_Examen = " + test;
                com.ExecuteNonQuery();

                foreach (string jsonGot in hf_hook.Value.Split('▄'))
                {
                    Pregunta p = JsonConvert.DeserializeObject<Pregunta>(jsonGot);
                    string cmd =
                        "INSERT INTO Pregunta VALUES (" +
                        test + ", " +
                        "'" + p.pregunta + "', " +
                        "'" + string.Join(",", p.respuestas) + "', " +
                        p.correcta + ", " +
                        "'" + p.grafico + "');";

                    System.Diagnostics.Debug.WriteLine(cmd);
                    com.CommandText = cmd;
                    com.ExecuteNonQuery();
                }

                com.Cancel();
                conex.Close();
                Response.Write("<script>alert('Done');</script>");
                Response.Redirect("MenuExams.aspx");
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e + " But hey, you can always try again :)");
                throw;
            }
        }
    }
}
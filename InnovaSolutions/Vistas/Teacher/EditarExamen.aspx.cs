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
        public SqlConnection conex = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True;");
        
        List<string> exam = new List<string>();
        
        public string examOut = "";
        public string gotIds = "";
        public string gotCats = "";
        string test = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            test = Request.QueryString["Exam"];
            LoadCategories();
            LoadExam();

            Image1.ImageUrl = "/Imagenes/Sony.png";
            if (Conexion.Membresia_Conectado == "Gratis")
            {
                Image1.Visible = true;
            }
            else
            {
                Image1.Visible = false;
            }
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
                        grafico = p["Grafico"].ToString(),
                        id_categoria = p["Id_Categoria"].ToString()
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
            }
        }

        void Finish()
        {
            try
            {
                if (hf_hook.Value.Equals(""))
                {
                    Response.Write("<script>alert('El valor regresado es nulo\n" +
                        "introduzca los datos una vez mas');</script>\n" +
                        "si esto sucede a menudo contactese con el proveedor");
                }
                else
                {
                    string cant = txt_cant.Value;
                    if (string.IsNullOrWhiteSpace(cant)) { cant = "0"; }

                    SqlCommand com;
                    string ph = "Place Holder";

                    conex.Open();
                    com = conex.CreateCommand();
                    com.CommandText =
                        "UPDATE Examen SET " +
                        "Nombre = '" + txt_title.Text + "', " +
                        "Cantidad = " + cant + " " +
                        "WHERE ID_Examen = " + test + "; " +
                        "DELETE FROM Pregunta " +
                        "WHERE ID_Examen = " + test;
                    com.ExecuteNonQuery();

                    foreach (string jsonGot in hf_hook.Value.Split('▄'))
                    {
                        Pregunta p = JsonConvert.DeserializeObject<Pregunta>(jsonGot);
                        string cmd =
                            "SET QUOTED_IDENTIFIER OFF " +
                            "INSERT INTO Pregunta VALUES (" +
                            test + ", " +
                            p.id_categoria + ", " +
                            "'" + p.pregunta + "', " +
                            "'" + string.Join(",", p.respuestas) + "', " +
                            p.correcta + ", " +
                            "\"" + p.grafico + "\");";

                        System.Diagnostics.Debug.WriteLine(cmd);
                        com.CommandText = cmd;
                        com.ExecuteNonQuery();
                    }

                    com.Cancel();
                    conex.Close();
                    Response.Write("<script>alert('Done');</script>");
                    Response.Redirect("MenuExams.aspx");
                }
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e + " But hey, you can always try again :)");
            }
        }

        void LoadCategories()
        {
            List<string> ids = new List<string>();
            List<string> cats = new List<string>();
            SqlCommand com;

            conex.Open();
            com = conex.CreateCommand();
            com.CommandText = "SELECT * FROM Categorias";
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);

            foreach (DataRow c in dt.Rows)
            {
                ids.Add(c["Id_Categoria"].ToString());
                cats.Add(c["Nombre"].ToString());
            }
            gotIds = String.Join("▄", ids.ToArray());
            gotCats = String.Join("▄", cats.ToArray());

            com.Cancel();
            conex.Close();
        }
    }
}
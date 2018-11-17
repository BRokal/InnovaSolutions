using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

using Newtonsoft.Json;
using InnovaSolutions.Objetos;
using System.Data.SqlClient;

namespace InnovaSolutions
{
    public partial class ResponderExamen : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        public SqlConnection conex = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True;");

        List<string> exam = new List<string>();
        List<int> answers = new List<int>();

        public string examOut = "";
        string user = Conexion.Id_Conectado;
        string test = "";
        int current = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            test = Request.QueryString["testId"];
            if (!IsPostBack)
            {
                LoadExam();
            }
        }

        protected void Responder_Click(object sender, EventArgs e)
        {

        }

        protected void btn_finish_Click(object sender, EventArgs e)
        {
            /*
             * Ese método se llama después de finish() en el lado del cliente cuando el examen se acaba
             */

            decimal cant = 0; //Cantidad de prteguntas
            decimal right = 0; //Cantidad de respuestas correctas
            decimal score = 0; //Nota final
            System.Diagnostics.Debug.WriteLine(hf_hook.Value);

            //Para cada respuesta, aumente uno a cant y uno a right solamente si la respuesta es true
            string[] answers = hf_hook.Value.Split(',');
            foreach(string a in answers)
            {
                cant++;
                if (a.Equals("true"))
                {
                    right++;
                }
            }
            score = (right / cant) * 100m; //Se calcula la nota final

            //Se obtiene el usuario regustrado y el id del examen realizado
            int id_usuario = Int32.Parse(user);
            int id_examen = Int32.Parse(test);
            int nota = Convert.ToInt32(score);
            if (user.Trim() == "" || test.Trim() == "")
            {
                Response.Write("<script>alert('Debe llenar todos los espacios');</script>");
            }
            else
            {
                //Se llama al método que inserta la complecion del examen al sistema
                Response.Write("<script>alert('" + con.Insertar_Examen(id_usuario, id_examen, nota) + "');</script>");
                Response.Redirect("ResultScreen.aspx?score=" + score);
            }
        }

        void LoadExam()
        {
            //Método para cargar el examen
            //Se llama al comenzar la clase

            SqlCommand com;

            conex.Open();
            com = conex.CreateCommand();
            com.CommandText = "SELECT * FROM Pregunta WHERE ID_Examen = " + test; //Se seleccionan las preguntas de SQL
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);

            //Para cada registro encontrado se genera un JSON con la información de este
            foreach (DataRow p in dt.Rows)
            {
                if (!p["Pregunta"].Equals(""))
                {
                    string jsond = JsonConvert.SerializeObject(new
                    {
                        pregunta = p["Pregunta"].ToString(),
                        respuestas = p["Respuestas"].ToString().Split(','),
                        correcta = Convert.ToInt32(p["Correcta"].ToString()),
                        grafico = p["grafico"].ToString()
                    }
                    );
                    exam.Add(jsond);
                }
            }
            //Se envía un string al lado de cliente
            examOut = String.Join("▄", exam.ToArray());

            com.Cancel();
            conex.Close();
        }
    }
}

/*
SqlCommand com;
conex.Open();
com = conex.CreateCommand();



com.Cancel();
conex.Close();

here_answers.Controls.Add(new Literal() { Text = "<hr />" });
*/

/*
Pregunta got = new Pregunta
(
p["Pregunta"].ToString(),
p["Respuestas"].ToString().Split(','),
Convert.ToInt32(p["Correcta"].ToString())
);
exam.Add(got);
jsond = Newtonsoft.Json.JsonConvert.SerializeObject(got);

    System.Diagnostics.Debug.WriteLine("");

    Response.Write("<script>alert('');</script>");
*/

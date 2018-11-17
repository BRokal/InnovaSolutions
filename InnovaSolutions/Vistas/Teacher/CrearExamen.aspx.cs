using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

using Newtonsoft.Json;
using InnovaSolutions.Objetos;
using System.Data;

namespace InnovaSolutions
{
    public partial class CrearExamen : System.Web.UI.Page
    {
        public SqlConnection conex = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True;");

        public string gotIds = "";
        public string gotCats = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCategories();
        }

        protected void btn_finish_Click(object sender, EventArgs e)
        {
            try
            {
                string cant = txt_cant.Value;
                if (string.IsNullOrWhiteSpace(cant)) { cant = "0"; }

                SqlCommand com;
                string ph = "Place Holder";

                conex.Open();
                com = conex.CreateCommand();
                com.CommandText =
                    "INSERT INTO Examen VALUES (" +
                    "'" + txt_title.Text + "', " +
                    "'" + ph + "', " +
                    cant + ");" +
                    "SELECT TOP 1 ID_Examen FROM Examen " +
                    "ORDER BY ID_Examen DESC;";
                int currentId = (int)com.ExecuteScalar();

                foreach (string jsonGot in hf_hook.Value.Split('▄'))
                {
                    Pregunta p = JsonConvert.DeserializeObject<Pregunta>(jsonGot);
                    string cmd =
                        "INSERT INTO Pregunta VALUES (" +
                        currentId + ", " +
                        p.id_categoria + ", " +
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
            catch (Exception err)
            {
                System.Diagnostics.Debug.WriteLine(err + " But hey, you can always try again :)");
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

/*
    System.Diagnostics.Debug.WriteLine("");

    Pregunta p = new JavaScriptSerializer().Deserialize<Pregunta>(jsonGot);
*/

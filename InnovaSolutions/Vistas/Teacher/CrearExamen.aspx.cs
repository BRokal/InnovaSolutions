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

namespace InnovaSolutions
{
    public partial class CrearExamen : System.Web.UI.Page
    {
        public SqlConnection conex = new SqlConnection("Data Source=KEVIN_PC\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True;");


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_finish_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand com;
                string ph = "Place Holder";

                conex.Open();
                com = conex.CreateCommand();
                com.CommandText =
                    "INSERT INTO Examen VALUES (" +
                    "'" + txt_title.Text + "', " +
                    "'" + ph + "');" +
                    "SELECT TOP 1 ID_Examen FROM Examen " +
                    "ORDER BY ID_Examen DESC;";
                int currentId = (int)com.ExecuteScalar();

                foreach (string jsonGot in hf_hook.Value.Split('▄'))
                {
                    Pregunta p = JsonConvert.DeserializeObject<Pregunta>(jsonGot);
                    string cmd =
                        "INSERT INTO Pregunta VALUES (" +
                        currentId + ", " +
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
                throw;
            }
        }
    }
}

/*
    System.Diagnostics.Debug.WriteLine("");

    Pregunta p = new JavaScriptSerializer().Deserialize<Pregunta>(jsonGot);
*/

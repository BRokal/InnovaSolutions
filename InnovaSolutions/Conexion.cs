using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace InnovaSolutions
{
    class Conexion
    {
        public static string Usuario_Conectado;
        public static string Usuario_Tipo;
        string connex = "Data Source=KEVIN_PC\\SQLEXPRESS;Initial Catalog = InnovaSolutions; Integrated Security = True";
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

        public void Probar()
        {
            try
            {
                
            }
            catch (Exception error)
            {

            }
        }

        public string Insertar(string usuario, string contrasena, string tipo, int id)
        {
            string msj;
            bool existe = false;

            con = new SqlConnection(connex);
            con.Open();
            try
            {
                cmd = new SqlCommand("Select * from Usuario where nombre= '" + usuario + "'",con);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    existe = true;
                }
                dr.Close();
                if (existe == false)
                {
                    switch (tipo)
                    {
                        case "Estudiante":
                            tipo = "E";
                            break;
                        case "Profesor":
                            tipo = "P";
                            break;
                        case "Administrador":
                            tipo = "A";
                            break;
                    }
                    cmd = new SqlCommand("Insert into Usuario(Nombre, Contrasena, Tipo, Id_Usuario) values('" + usuario + "', '" + contrasena + "', '"+ tipo +"', "+id+" )", con);
                    cmd.ExecuteNonQuery();
                    msj = "Usuario registrado";
                }
                else
                {
                    msj = "Este usuario ya existe";
                }
            }
            catch(Exception error)
            {
                msj = "NO se conecto: " + error.Message;
            }

            con.Close();
            return msj;
        }

        public bool Iniciar(string usuario, string contrasena)
        {
            bool existe = false;

            con = new SqlConnection(connex);
            con.Open();
            try
            {
                cmd = new SqlCommand("Select * from Usuario where Nombre= '" + usuario + "' and Contrasena= '" + contrasena + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    existe = true;
                    Usuario_Tipo = dt.Rows[0]["Tipo"].ToString();
                    cmd.CommandText = "SELECT Id_Usuario FROM Usuario WHERE Nombre= '" + usuario + "'";
                    Usuario_Conectado = cmd.ExecuteScalar().ToString();
                }
            }
            catch(Exception error)
            {
                
            }

            con.Close();
            return existe;
        }

        public string Insertar_Examen(int usuario, int examen, int nota)
        {
            con = new SqlConnection(connex);
            con.Open();

            string msj;
            try
            {
                    cmd = new SqlCommand("Insert into Complecion(Id_Usuario, Id_Examen, Nota) values(" + usuario + ", " + examen + ", " + nota + ")", con);
                    cmd.ExecuteNonQuery();
                    msj = "Nota registrada";
            }
            catch (Exception error)
            {
                msj = "No se conectó: " + error.Message;
            }

            con.Close();
            return msj;
        }

        public int Eliminar_Usuario(string usuario)
        {
            int eliminar = 0;

            con = new SqlConnection(connex);
            con.Open();
            try
            {
                cmd = new SqlCommand("SELECT Id_Usuario FROM Usuario WHERE Nombre= '" + usuario + "'", con);
                string id = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand(
                    "Delete FROM Complecion WHERE Id_Usuario= " + id + "; " +
                    "Delete FROM Usuario WHERE Id_Usuario= " + id, con);
                eliminar = cmd.ExecuteNonQuery();
            }
            catch (Exception error)
            {

            }
            con.Close();
            return eliminar;
        }
    }
}
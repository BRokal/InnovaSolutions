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
        public static string Id_Conectado;
        public static string Tipo_Conectado;
        public static string Membresia_Conectado;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

        public string Insertar(string usuario, string contrasena, string tipo, int id, string membresia)
        {
            string msj;
            bool existe = false;

            con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True");
            con.Open();
            try
            {
                cmd = new SqlCommand("Select * from Usuario where nombre= '" + usuario + "'", con);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    existe = true;
                }
                dr.Close();
                if (existe == false)
                {
                    if (tipo == "Estudiante")
                    {
                        tipo = "E";
                    }
                    else
                    {
                        tipo = "P";
                    }
                    cmd = new SqlCommand("Insert into Usuario(Nombre, Contrasena, Tipo, IsPremium) values('" + usuario + "', '" + contrasena + "', '" + tipo + "', '" + membresia + "' )", con);
                    cmd.ExecuteNonQuery();
                    msj = "Usuario registrado";
                }
                else
                {
                    msj = "Este usuario ya existe";
                }
            }
            catch (Exception error)
            {
                msj = "NO se conecto: " + error.Message;
            }

            con.Close();
            return msj;
        }

        public bool Iniciar(string usuario, string contrasena)
        {
            bool existe = false;

            con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True");
            con.Open();
            try
            {
                cmd = new SqlCommand("Select * from Usuario where Nombre= '" + usuario + "'and Contrasena= '" + contrasena + "'", con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    existe = true;
                }
                dr.Close();

                cmd.CommandText = "SELECT Id_Usuario FROM Usuario WHERE Nombre= '" + usuario + "'";
                Id_Conectado = cmd.ExecuteScalar().ToString();

                cmd.CommandText = "SELECT Tipo FROM Usuario WHERE Nombre= '" + usuario + "'";
                Tipo_Conectado = cmd.ExecuteScalar().ToString();

                cmd.CommandText = "SELECT IsPremium FROM Usuario WHERE Nombre= '" + usuario + "'";
                Membresia_Conectado = cmd.ExecuteScalar().ToString();


            }
            catch (Exception error)
            {

            }
            con.Close();
            return existe;
        }
        public string Insertar_Examen(int usuario, int examen, int nota)
        {
            con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True");
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

            con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=InnovaSolutions;Integrated Security=True");
            con.Open();
            try
            {
                cmd = new SqlCommand("Delete FROM Usuario WHERE Nombre= '" + usuario + "'", con);
                eliminar = cmd.ExecuteNonQuery();

                dr.Close();

            }
            catch (Exception error)
            {

            }
            con.Close();
            return eliminar;
        }
    }
}
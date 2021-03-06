﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InnovaSolutions.Vistas
{
    public partial class MenuExams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Image1.ImageUrl = "/Imagenes/Wansos.png";
            if (Conexion.Membresia_Conectado == "Gratis")
            {
                Image1.Visible = true;
            }
            else
            {
                Image1.Visible = false;
            }
        }

        protected void btn_new_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearExamen.aspx");
        }

        protected void grid_exams_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] selected = Convert.ToString(e.CommandArgument).Split(',');
            switch (e.CommandName)
            {
                case "ChangeExam":
                    Response.Redirect("./EditarExamen.aspx?Exam=" + selected[0]);
                    break;
                case "DeleteExam":
                    Response.Redirect("./BorrarExamen.aspx?Exam=" + selected[0] + "&Name=" + selected[1]);
                    break;
            }
        }
    }
}
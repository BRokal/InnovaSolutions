using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InnovaSolutions.Objetos
{
    public class Pregunta
    {
        /*
         * Objeto que Contiene la información de cada pregunta
         */
        public string pregunta { get; set; }
        public string[] respuestas { get; set; }
        public int correcta { get; set; }
        public string grafico { get; set; }

        public Pregunta(string pregunta, string[] respuestas, int correcta, string grafico)
        {
            this.pregunta = pregunta;
            this.respuestas = respuestas;
            this.correcta = correcta;
            this.grafico = grafico;
        }
    }
}
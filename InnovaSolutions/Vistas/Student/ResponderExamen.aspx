<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResponderExamen.aspx.cs" Inherits="InnovaSolutions.ResponderExamen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #TextArea1 {
            height: 193px;
            width: 404px;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- 
                Formulario Para Responder Examen.
                El estudiante se le muestra aleatoriamente uno de los exámenes de la 
            --%>
            <label id="lbl_question"></label><br />
            <div id="here_image"></div>
            <br />
            <div id="here_radios"></div>
            <br />
            <input id="btn_next" type="button" value="Siguiente" onclick="answer()" />
            <asp:Button ID="btn_finish" runat="server" Text="Terminar" class="hidden" OnClientClick="finish()" OnClick="btn_finish_Click" />
            <asp:HiddenField ID="hf_hook" runat="server" />
        </div>
    </form>

    <%-- CLIENT CODE --%>
    <script>
        var exam = []; //Contiene JSONs con examenes
        var answers = []; //Las respuestas dadas por el estudiante
        var results = []; //Un arreglo con booleanos que representa cuales preguntas fueron correctas
        var current = 0; //Representa la pregunta actual
        check();
        loadQuestion(0);

        //Llena el Arreglo con el string "examOut" en el servidor
        function check() {
            '<%=examOut%>'.split("▄").forEach(function (element) {
                exam.push(JSON.parse(element));
            });
            exam = shuffle(exam);
        }
        
        //Obtiene un arreglo y lo baraja
        function shuffle(array) {
            //https://bost.ocks.org/mike/shuffle/
            var m = array.length, t, i;

            // While there remain elements to shuffle…
            while (m) {

                // Pick a remaining element…
                i = Math.floor(Math.random() * m--);

                // And swap it with the current element.
                t = array[m];
                array[m] = array[i];
                array[i] = t;
            }

            return array;
        }

        //Carga una Pregunta, obtiene un index que es el número de la pregunta dentro del arreglo
        function loadQuestion(index) {
            var got = exam[index];
            var img = new Image();

            //Obtiene la imagen del JSON
            img.src = got.grafico;
            img.style.height = "150px";
            img.style.width = "300px";

            here_image.append(got.grafico);
            lbl_question.innerHTML = got.pregunta; //Muestra la Pregunta
            here_image.appendChild(img); //Muestra la imagen.

            //Obtiene las Posibles respuestas, crea un Radio Button para cada una
            var i = 0;
            got.respuestas.forEach(function (e) {
                var radio = document.createElement("input"); 
                radio.value = i;
                radio.id = "rb_answer" + i++;
                radio.type = "radio";
                radio.name = "options";
                here_radios.appendChild(radio);
                here_radios.append(e);
                here_radios.append(document.createElement("br"));
            });
        }

        function answer() {
            //Se llama cuando el botón de responder se cliquea

            current++ //Se aumenta el numero de la pregunta por uno

            //Se añade la respuesta al queue de respuestas
            var radios = here_radios.getElementsByTagName("input");
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    answers.push(radios[i].value);
                }
            }

            //Se limpian los campos
            document.getElementById("here_radios").innerHTML = "";
            document.getElementById("here_image").innerHTML = "";

            //Si era la última pregunta entonces se muestra el botón de finalización
            //Si no, entonces se carga la siguiente pregunta basado en "current"
            if (current >= exam.length) {
                lbl_question.innerHTML = "Terminó el Examen!";
                document.getElementById("btn_next").className = "hidden";
                document.getElementById("btn_finish").className = "";
            }
            else {
                loadQuestion(current);
            }
        }

        function finish() {
            //Función para terminar el examen
            //Se llama cuando el examen termina
            //Toma y evalúa cada respuesta, empuja un true al arreglo de resultados si la respuesta es correcta y un false si no
            //Se asigna a un comunicador cliente-servidor el arreglo de repsuestas

            for (var i = 0; i < exam.length; i++) {
                results[i] = (exam[i].correcta == answers[i]);
            }
            hf_hook.value = results.toString();
        }
    </script>
</body>
</html>

<%--
<asp:RadioButtonList ID="rbl_respuestas" runat="server">
    <asp:ListItem Value="0">Respuesta 1</asp:ListItem>
    <asp:ListItem Value="1">Respuesta 2</asp:ListItem>
    <asp:ListItem Value="2">Respuesta 3</asp:ListItem>
</asp:RadioButtonList>
<br />

<asp:RadioButton GroupName="answers" ID="rdb_answer1" runat="server" Text="AAA"/><br />
<asp:RadioButton GroupName="answers" ID="RadioButton1" runat="server" Text="AAA"/><br />
<asp:RadioButton GroupName="answers" ID="RadioButton2" runat="server" Text="AAA"/><br />

var jsond = '<%=jsond%>';
var obtJson = JSON.parse(jsond);
alert(obtJson.pregunta);

<asp:Button ID="btn_answer" runat="server" Text="Responder" OnClick="Responder_Click" />

    alert(JSON.stringify(exam[0]));
--%>
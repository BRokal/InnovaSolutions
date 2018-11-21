<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="ResponderExamen.aspx.cs" Inherits="InnovaSolutions.ResponderExamen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #TextArea1 {
            height: 193px;
            width: 404px;
        }

        .hidden {
            display: none;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="div_form" runat="server" style="border-style:solid;">
        <div class="container" style="width:70%; margin-left:15%">
            <%-- 
                Formulario Para Responder Examen.
                El estudiante se le muestra aleatoriamente uno de los exámenes de la 
            --%>
            <div style="text-align: left; width: 100%">
                <label id="lbl_question"></label><br />
                <div id="here_image"></div>
                <br />
                <div id="here_radios"></div>
                <br />
            </div>
            
            <input id="btn_next" type="button" value="Siguiente" onclick="answer()" />
            <asp:Button ID="btn_finish" runat="server" Text="Terminar" CssClass="hidden" OnClientClick="javascript:return finish();" OnClick="btn_finish_Click" />

            <asp:HiddenField ID="hf_hook" runat="server" />
            <br />
            <asp:Image ID="Image1" runat="server" Height="200px" Width="415px" />
        </div>
    </div>

    <%-- CLIENT CODE --%>
    <script>
        var exam = []; //Contiene JSONs con examenes
        var answers = []; //Las respuestas dadas por el estudiante
        var results = []; //Un arreglo con booleanos que representa cuales preguntas fueron correctas
        var current = 0; //Representa la pregunta actual
        var questionCant = <%=questionCant%>;
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
            if (current >= exam.length || current >= questionCant) {
                lbl_question.innerHTML = "Terminó el Examen!";
                document.getElementById("btn_next").className = "hidden";
                alert("<%=btn_finish.ClientID%>" + document.getElementById("<%=btn_finish.ClientID%>"));
                document.getElementById("<%=btn_finish.ClientID%>").className = "";
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

            var hf_hook = document.getElementById("<%=hf_hook.ClientID%>");

            alert(hf_hook + ", " + !hf_hook.value);
            while (!hf_hook.value) {
                for (var i = 0; i < questionCant; i++) {
                    results[i] = (exam[i].correcta == answers[i]);
                }
                hf_hook.value = results.toString();
                alert(hf_hook.value);
            }
            return true;
        }
    </script>
</asp:Content>

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
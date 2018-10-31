<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarExamen.aspx.cs" Inherits="InnovaSolutions.Vistas.Teacher.EditarExamen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #txt_question {
            height: 184px;
            width: 472px;
        }

        .answerBox{
            width: 400px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Título del Examen: <asp:TextBox ID="txt_title" runat="server"></asp:TextBox><br />
            <textarea id="txt_question"></textarea> <br />
            <div id="here_radios">
                <input id="rb_answer0" type="radio" name="answerBtn" value="0" class="answerBtn"/> <input id="txt_answer0" type="text" class="answerBox" /> <br />
                <input id="rb_answer1" type="radio" name="answerBtn" value="1" class="answerBtn"/> <input id="txt_answer1" type="text" class="answerBox" /> <br />
                <input id="rb_answer2" type="radio" name="answerBtn" value="2" class="answerBtn"/> <input id="txt_answer2" type="text" class="answerBox" /> <br />
            </div>
            <br />
            <input id="file_img" type="file" accept="image/*" /><br />
            <div id="prueba"></div>
            <br />
            <input id="btn_back" type="button" value="Pregunta Anterior" onclick="goBack()"/>
            <input id="btn_next" type="button" value="Siguiente Pregunta" onclick="saveJson(false, saveJsonTwo)" /><br />
            <asp:Button ID="btn_finish" runat="server" Text="Terminar" OnClientClick="return saveJson(true, saveJsonTwo)" OnClick="btn_finish_Click" />
        </div>
        <asp:HiddenField ID="hf_hook" runat="server" />
    </form>

    <%-- CLIENT CODE --%>
    <script>
        var exam = [];
        var index = 0;
        var storedImage = "";
        var loading = false;
        check();
        populate(0);

        function check() {
            '<%=examOut%>'.split("▄").forEach(function (element) {
                exam.push(JSON.parse(element));
            });
        }

        function saveJson(end, callback) {
            if (txt_question.value != "") {
                var data = {}
                var gotAnswers = [];
                var radios = here_radios.getElementsByClassName("answerBtn");
                var boxes = here_radios.getElementsByClassName("answerBox");

                data["pregunta"] = txt_question.value;
                data["correcta"] = "0";
                for (var i = 0; i < radios.length; i++) {
                    gotAnswers.push(boxes[i].value);
                    if (radios[i].checked) {
                        data["correcta"] = radios[i].value;
                    }
                    boxes[i].value = "";
                }
                data["respuestas"] = gotAnswers;
                txt_question.value = "";

                if (file_img.files && file_img.files[0]) {
                    var graphic = file_img.files[0];
                    var FR = new FileReader();

                    loading = true;
                    document.getElementById("prueba").innerHTML = "Cargando";
                    FR.onloadend = function () {
                        data["grafico"] = FR.result;
                        loading = false;
                        document.getElementById("prueba").innerHTML = "";
                        return callback(data, end);
                    }
                    FR.readAsDataURL(graphic);
                }
                else {
                    data["grafico"] = storedImage;
                    saveJsonTwo(data, end);
                }
            }
            else {
                alert('Por favor escriba la Pregunta');
                return false;
            }
        }

        function saveJsonTwo(data, end) {
            file_img.value = "";

            exam[index] = data;
            index++;

            if (typeof exam[index] !== 'undefined') {
                populate(index);
            }
            else {
                storedImage = "";
            }

            if (end) {
                cstest();
            }

            return true;
        }

        function goBack() {
            if (index > 0) {
                index--;
                populate(index);
            }
        }

        function populate(index) {
            var radios = here_radios.getElementsByClassName("answerBtn");
            var boxes = here_radios.getElementsByClassName("answerBox");

            txt_question.value = exam[index].pregunta;
            for (var i = 0; i < exam[index].respuestas.length; i++) {
                boxes[i].value = exam[index].respuestas[i];
                radios[i].checked = (exam[index].correcta == i);
            }
            storedImage = exam[index].grafico;
            alert(storedImage);
        }
        <%-- BUG: Los radio button no defaultean correctamente --%>

        function cstest() {
            var data = [];
            exam.forEach(function (e) {
                alert(e["pregunta"]);
                if (e["pregunta"] != "" && e["pregunta"] != null) {
                    data.push(JSON.stringify(e));
                }
            });
            hf_hook.value = data.join("▄");
        }
    </script>
</body>
</html>

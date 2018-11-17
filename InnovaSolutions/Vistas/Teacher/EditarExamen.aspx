<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarExamen.aspx.cs" Inherits="InnovaSolutions.Vistas.Teacher.EditarExamen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .column {
            float: left;
            width: 50%;
            height: 126px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        #txt_question {
            height: 184px;
            width: 472px;
        }

        .answerBox{
            width: 400px;
        }
        #txt_title {
            border: 2px solid #456879;
            border-radius: 10px;
            }
        #txt_cant {
            border: 2px solid #456879;
            border-radius: 10px;
            height: 22px;
            width: 289px;
        } #txt_answer0{border: 2px solid #456879;
            border-radius: 10px;
            height: 22px;
            width: 230px;}

          #txt_answer1{border: 2px solid #456879;
            border-radius: 10px;
            height: 22px;
            width: 230px;}
          #txt_answer2{border: 2px solid #456879;
            border-radius: 10px;
            height: 22px;
            width: 230px;}
          #btn_back {
           background-color: #6495ED; 
            color: white;
            border-style: ridge;
            border-color: inherit;
            border-width: medium;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 10px;
            -webkit-transition-duration: 0.4s; 
            transition-duration: 0.4s;
            background-color: #6495ED; 
            color: white;
        }
          #btn_next {
           background-color: #6495ED; 
            color: white;
            border-style: ridge;
            border-color: inherit;
            border-width: medium;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 10px;
            -webkit-transition-duration: 0.4s; 
            transition-duration: 0.4s;
            background-color: #6495ED; 
            color: white;
        }
          #btn_finish {
           background-color: #6495ED; 
            color: white;
            border-style: ridge;
            border-color: inherit;
            border-width: medium;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 10px;
            -webkit-transition-duration: 0.4s; 
            transition-duration: 0.4s;
            background-color: #6495ED; 
            color: white;
        }
          .heading { color: #6495ED;background-color:white }
        
        #slct_pregunta {
            width: 384px;
        }
        
        #txt_find {
            width: 245px;
        }
        
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div style="border-style: solid; height: 670px; text-align:center">
            <div>
                <h1 class ="heading" style ="width: 252px; background-color:white;margin-top:10px">Editar exámen </h1>
        </div>
            <p style="font-size:large">
            Título del Examen: <asp:TextBox ID="txt_title" runat="server" Width="314px"></asp:TextBox><br />
            Cantidad de Preguntas <input type="number" id="txt_cant" runat="server" /><br /><br />
            Buscar Pregunta Por categoría:<select id="slct_categories2" name="slct_categories" onchange="pushQuestions()"></select>
            <br />
            <select id="slct_pregunta" size="10" name="D1" onchange="questionChange()"></select><br /><br />
            <textarea id="txt_question"></textarea> <br />
            
            </p>
            <div class="row">
                <div class="column" style="text-align:right;">
                    <div id="here_radios">
                    <input id="rb_answer0" type="radio" name="answerBtn" value="0" class="answerBtn"/> <input id="txt_answer0" type="text" class="answerBox" />&nbsp;&nbsp;&nbsp;<br />
                    <input id="rb_answer1" type="radio" name="answerBtn" value="1" class="answerBtn"/> <input id="txt_answer1" type="text" class="answerBox" />&nbsp;&nbsp;&nbsp;<br />                
                    <input id="rb_answer2" type="radio" name="answerBtn" value="2" class="answerBtn"/> <input id="txt_answer2" type="text" class="answerBox" />&nbsp;&nbsp;&nbsp;<br />
                    </div>
                </div>
                <div class="column" style="text-align:left;">
                    <input id="file_img" type="file" accept="image/*" /><br />
                    <select id="slct_categories1" name="slct_categories"></select>
                </div>
            </div>
            <input id="btn_back" type="button" value="Pregunta Anterior" onclick="goBack()"/>
            <input id="btn_next" type="button" value="Guardar Pregunta" onclick="saveJson(false, saveJsonTwo)" /><br />
            <div id="prueba"></div><br />
            <asp:Button ID="btn_finish" runat="server" Text="Terminar" OnClientClick="return saveJson(true, saveJsonTwo)" OnClick="btn_finish_Click" />
        
            <asp:HiddenField ID="hf_hook" runat="server" />
        
        </div>
        <div style="margin-left: 560px">
        </div>
    </form>

    <%-- CLIENT CODE --%>
    <script>
        var exam = [];
        var index = 0;
        var storedImage = "";
        var loading = false;
        check();
        getCategories();
        populate(0);

        function check() {
            '<%=examOut%>'.split("▄").forEach(function (element) {
                exam.push(JSON.parse(element));
            });
            pushQuestions();
        }

        function getCategories() {
            var cats = '<%=gotCats%>'.split("▄");
            var ids = '<%=gotIds%>'.split("▄");
            var select = document.getElementsByName("slct_categories");

            for (var i = 0; i < cats.length; i++) {
                var newOption = document.createElement("option");
                newOption.value = ids[i];
                newOption.text = cats[i];
                select[0].add(newOption);

                var newOption2 = document.createElement("option");
                newOption2.value = ids[i];
                newOption2.text = cats[i];
                select[1].add(newOption2);
            }
        }

        function questionChange() {
            index = document.getElementById('slct_pregunta').value;
            populate(index);
        }
        
        function pushQuestions() {
            var select = document.getElementById("slct_pregunta");
            var filter = document.getElementById("slct_categories2");
            
            for (var x = select.options.length - 1; x >= 0; x--) {
                select.remove(x);
            }

            var i = 0;

            exam.forEach(function (e) {
                if (filter.selectedIndex < 0 || e["id_categoria"] == filter.options[filter.selectedIndex].value) {
                    var newOption = document.createElement("option");
                    newOption.value = i;
                    newOption.text = i + 1;
                    select.add(newOption);
                }
                i++;
            });
        }

        function saveJson(end, callback) {
            if (txt_question.value != "") {
                var data = {}
                var gotAnswers = [];
                var radios = here_radios.getElementsByClassName("answerBtn");
                var boxes = here_radios.getElementsByClassName("answerBox");
                var categoryList = document.getElementById("slct_categories1");

                data["id_categoria"] = categoryList.options[categoryList.selectedIndex].value;

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
            slct_categories1.selectedIndex = exam[index].id_categoria - 1;

            storedImage = exam[index].grafico;
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
            alert(hf_hook.value);
        }
    </script>
</body>
</html>

<%-- if (filter.selectedIndex >= 0) {
                alert(filter.options[filter.selectedIndex]);
            }
            else {
                alert("Nothing");
            }

    if (filter.selectedIndex >= 0) {
                    alert(e["id_categoria"] + ", " + filter.options[filter.selectedIndex].value);
                }
                else {
                    alert("Nothing");
                }
            */--%>
            

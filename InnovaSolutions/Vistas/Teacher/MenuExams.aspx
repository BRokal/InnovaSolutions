<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuExams.aspx.cs" Inherits="InnovaSolutions.Vistas.MenuExams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #btn_new {
           background-color: #6495ED; 
            color: white;
            border-style: ridge;
            border-color: inherit;
            border-width: medium;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            -webkit-transition-duration: 0.4s; 
            transition-duration: 0.4s;
            background-color: #6495ED; 
            color: white;
        }
         .heading { color: #6495ED;background-color:white }
    </style>
</head>
<body style="border-style:solid;">
    <form id="form1" runat="server" style="text-align:center">
        <div style="">
            <div>
             <h1 class ="heading"style="width: 273px; background-color:white;margin-top:20px">Menú de exámenes</h1>
        </div>
            <br />
            
            <asp:Button ID="btn_new" runat="server" Text="Crear Nuevo Examen" OnClick="btn_new_Click" />
            <br /><br />
            <asp:GridView ID="grid_exams" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Examen" DataSourceID="Innova" OnRowCommand="grid_exams_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None" style="" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_Examen" HeaderText="Identificador" InsertVisible="False" ReadOnly="True" SortExpression="ID_Examen" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button 
                                ID="Button1" 
                                runat="server" 
                                Text="Editar"
                                CommandName="ChangeExam"
                                CommandArgument='<%# Eval("ID_Examen") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="Innova" runat="server" ConnectionString="<%$ ConnectionStrings:InnovaSolutionsConnectionString %>" SelectCommand="SELECT * FROM [Examen]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

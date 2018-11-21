<%@ Page Language="C#" MasterPageFile="~/Vistas/Appshell.Master" AutoEventWireup="true" CodeBehind="MenuExams.aspx.cs" Inherits="InnovaSolutions.Vistas.MenuExams" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
         .heading { color: #6495ED;background-color:white }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="div_form" runat="server" style="text-align:center; border-style:solid;">
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
                                CommandArgument='<%# Eval("ID_Examen") + "," + Eval("Nombre") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button 
                                ID="Button2" 
                                runat="server" 
                                Text="Eliminar"
                                CommandName="DeleteExam"
                                CommandArgument='<%# Eval("ID_Examen") + "," + Eval("Nombre") %>' />
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
            <br />
            <asp:Image ID="Image1" runat="server" Height="200px" Width="415px" />
        </div>
    </div>
</asp:Content>

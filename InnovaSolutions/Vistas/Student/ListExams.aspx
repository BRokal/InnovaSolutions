<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListExams.aspx.cs" Inherits="InnovaSolutions.Vistas.ListExams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- 
                Lista los exámenes para que el usuario pueda escoger uno para hacer.
            --%>
            <asp:GridView ID="grid_exams" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Examen" DataSourceID="Innova" OnRowCommand="grid_exams_RowCommand" OnSelectedIndexChanged="grid_exams_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID_Examen" HeaderText="ID_Examen" InsertVisible="False" ReadOnly="True" SortExpression="ID_Examen" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button 
                                ID="Button1" 
                                runat="server" 
                                Text="Hacer"
                                CommandName="DoExam"
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

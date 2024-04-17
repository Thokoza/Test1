<%@ Page Title="UserForm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="Test1.UserForm" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 id="title"><%: Title %></h2>
 <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>  
        <div>  
            <br />  
            <asp:table style="width: 100%;" runat="server">  
                <asp:tablerow>  
                    <asp:tablecell class="auto-style1">Name:</asp:tablecell>  
                    <asp:tablecell>  
                        <asp:TextBox ID="tbName" runat="server" type="text"></asp:TextBox>  
                    </asp:tablecell>
                    <asp:TableCell>
                          <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="tbName" ErrorMessage="* Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:tablerow>  
                <asp:tablerow>  
                    <asp:tablecell class="auto-style1">Surname:</asp:tablecell>  
                    <asp:tablecell>  
                        <asp:TextBox ID="tbSurname" runat="server" type="text"></asp:TextBox>  
                    </asp:tablecell>
                      <asp:TableCell>
                      <asp:RequiredFieldValidator ID="reqSurname" runat="server" ControlToValidate="tbSurname" ErrorMessage="* Required" ForeColor="Red"></asp:RequiredFieldValidator>
                       </asp:TableCell>
                </asp:tablerow>  
                <asp:tablerow>  
                    <asp:tablecell class="auto-style1">Cellphone Number:</asp:tablecell>  
                    <asp:tablecell>  
                        <asp:TextBox ID="tbCellNo" runat="server"  type="number" MaxLength="10"></asp:TextBox>  
                    </asp:tablecell>
                      <asp:TableCell>
                  <asp:RequiredFieldValidator ID="reqCellNo" runat="server" ControlToValidate="tbCellNo" ErrorMessage="* Required" ForeColor="Red"></asp:RequiredFieldValidator>
                     &nbsp;<asp:RegularExpressionValidator ID="reqExCellNo" ControlToValidate="tbCellNo" runat="server" ErrorMessage="*Only numeric values allowed" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                   </asp:TableCell>
                </asp:tablerow>  
                <asp:tablerow>  
                    <asp:tablecell class="auto-style1"> </asp:tablecell>  
                    <asp:tablecell>  
                        <asp:Button ID="btnSubmit"  runat="server" Text="Submit"  OnClick="btnSubmit_Click" />  
                    </asp:tablecell>  
                </asp:tablerow>  
            </asp:table>  
           <br />
            <br />
            <br />
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" OnRowCancelingEdit="gvUsers_RowCancelingEdit"  OnRowEditing="gvUsers_RowEditing"  OnRowUpdating="gvUsers_RowUpdating" OnRowDeleting="gvUsers_RowDeleting">  
                 <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>
                    </EditItemTemplate>
                </asp:TemplateField>
                      <asp:TemplateField>
                      <ItemTemplate>
                          <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete"/>
                      </ItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Surname">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Surname" runat="server" Text='<%#Eval("Surname") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSurname" runat="server" Text='<%#Eval("Surname") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="CellNo">
                <ItemTemplate>
                    <asp:Label ID="lbl_CellNo" runat="server" Text='<%#Eval("CellNo") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtCellNo" runat="server" Text='<%#Eval("CellNo") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#2b6600" ForeColor="#ffffff"/>
            <RowStyle BackColor="#c6e7b6"/>
            </asp:GridView>  
        </div>  
</body>
</html>
</asp:Content>




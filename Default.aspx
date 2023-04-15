<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%--<form id="form1" runat="server">
    <div>
    <asp:Label runat="server" Text="User Name"></asp:Label>
      
    </div>
    </form>--%>
       
        <form id="form1" runat="server">
        <div align="center" style="margin-top:25px" >
            <div style="border: 1px Solid #0094ff; width: 70%;">
                <table>
                    <tr>
                        <td colspan="3" align="center">
                            <h1>Employee Management System</h1>
                        </td>
                    </tr>
                    <tr>
                        <td>First Name
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtFirstName"  ></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>Last Name
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtLastName"  ></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>Phone Number
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPhoneNumber" ></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Email Address
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtEmailAddress"  ></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>Salary
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtSalary"  ></asp:TextBox>
                        </td>
                        
                    </tr>
                    
                    <tr>
                        
                        <td colspan="3" align="center">
                            <br />
                       
                            <asp:Button runat="server" ID="btnAddEmployee" Text="Add"  Style = " height :26px Width=37px color:blue" OnClick="btnAddEmployee_Click1"></asp:button>
                        </td>
                        
                       
                    </tr>
                    <tr>
                         <td colspan="3" align="center">
                            <br />
                       
                            <asp:Button runat="server" ID="Button1" Text="conection check button"  Style = " height :26px Width=37px font-color:blue" OnClick="Button1_Click1"></asp:button>
                        </td>
                    </tr>

                   

                    <%--<tr>
                         <td colspan="3" align="center">
                            <br />
                               <asp:Button runat="server" ID="Button3" Text="Show Data"  Style = " height :26px Width=37px " OnClick="Button1_Click3"></asp:button>
                        </td>
                    </tr>--%>
                   

                    <tr>
                    <td>  
                            <asp:Label ID="Label1" runat="server" Text="" style="align:center;   "></asp:Label>  
                        </td>
                        </tr>
                </table>

                
            </div>
        </div>

            <div style="margin:20px 0px 20px 120px; overflow-y: scroll; height: 200px; border: 1px Solid red; width: 1130px;  ">
                
                <asp:GridView ID="GridView1" runat="server" Width="600px"  align="Center"
                     AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" onRowEditing="GridView1_RowEditing" 
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                    OnRowUpdating="GridView1_RowUpdating"
                    DataKeyNames='id'>
                    
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="id" ReadOnly="true" />

                        <asp:TemplateField HeaderText="First Name"> 
                            <ItemTemplate> 
                                <asp:Label runat='server' Text='<%#Eval("fname")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate> 
                                    <asp:TextBox runat="server" id="txtFirstName" Text='<%#Bind("fname")%>'> </asp:TextBox> 
                            </EditItemTemplate>
                        </asp:TemplateField>
                       <%--<asp:BoundField HeaderText="First Name" DataField="fname" /> --%>

                         <asp:TemplateField HeaderText="Last Name"> 
                            <ItemTemplate> 
                                <asp:Label runat='server' Text='<%#Eval("lname")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate> 
                                    <asp:TextBox runat="server" id="txtLastName" Text='<%#Bind("lname")%>'> </asp:TextBox> 
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField HeaderText="Last Name" DataField="lname" />--%>



                         <asp:TemplateField HeaderText="Phone Number"> 
                            <ItemTemplate> 
                                <asp:Label runat='server' Text='<%#Eval("phoneNo")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate> 
                                    <asp:TextBox runat="server" id="txtPhoneNumber" Text='<%# Bind("phoneNo")%>'> </asp:TextBox> 
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField HeaderText="Phone Number" DataField="phoneNo" />--%>

                        <asp:TemplateField HeaderText="Email"> 
                            <ItemTemplate> 
                                <asp:Label runat='server' Text='<%#Eval("email")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate> 
                                    <asp:TextBox runat="server" id="txtEmailAddress" Text='<%# Bind("email")%>'> </asp:TextBox> 
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField HeaderText="Email" DataField="email" />--%>

                        <asp:TemplateField HeaderText="Salary"> 
                            <ItemTemplate> 
                                <asp:Label runat='server' Text='<%#Eval("salary")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate> 
                                    <asp:TextBox runat="server" id="txtSalary" Text='<%# Bind("salary")%>'> </asp:TextBox> 
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField HeaderText="Salary" DataField="salary" />--%>

                        <asp:CommandField showDeleteButton="true" HeaderText="Remove Data" />

                        <asp:CommandField ShowEditButton="true" HeaderText="Edit Data" />
                    
                        </Columns>
                    <EditRowStyle BorderStyle="Solid" />
                    

                </asp:GridView>
              
            

            </div>
              
                         
    </form>
            
       
</body>
</html>

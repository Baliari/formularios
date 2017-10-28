<%@ Page Title="" Language="C#" MasterPageFile="~/default.Master" AutoEventWireup="true"
    CodeBehind="formdesign.aspx.cs" Inherits="Gestion2.WebForm1" %>

<asp:Content ID="contanido1" ContentPlaceHolderID="contenido" runat="server">
    <script type="text/javascript">
   
   function eventoondragover(ev) {
        //Cancelar el evento que impide que podamos soltar el elemento drag
       ev.preventDefault();
       }

  function event_drop(ev) { 
            var data = ev.dataTransfer.getData("text")
           // document.title = data.toString();
            var s_id = ev.target.id;
            <%=GetPostBackScript("dropcontrol")%>
   }

   function dragstart_handler(ev) {
       // Set the drag effect to copy
       aspnetForm.<%=GetControlName("hidden_draggedObjectName")%>.value = ev.currentTarget.id;
       ev.dataTransfer.dropEffect = "copy";
       ev.dataTransfer.setData("text", ev.currentTarget.id);
       //var objeto = document.getElementsByName(ev.currentTarget.id);
       
   }

   function onSuccess(result) {
       alert(result);
   }

   function onFailure(error) {
       alert(error);
   }

   function onClick(ev)
   {
           var s_id = ev.target.id;
           if(ev.srcElement.tagName=="DIV")
           {
           aspnetForm.<%=GetControlName("hidden_selecteddiv")%>.value = s_id;
           <%=GetPostBackScript("selectdiv")%>
           }
   }
    
    </script>
    <table style="width: 100%">
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td colspan="2" rowspan="5">
                <asp:Panel ID="panelFormulario" runat="server" CssClass="formulario" ondragover="eventoondragover(event);"
                    ondrop="event_drop(event);">
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <table class="designermenu">
                    <tr>
                        <td colspan="2" class="designermenutitle">
                            Campos
                        </td>
                    </tr>
                    <tr>
                        <td class="designmenuicon">
                            <div id="ctrl_label" ondragstart="dragstart_handler(event);" draggable="true">
                                <img alt="" src="resources/pic_label.PNG" style="width: 28px; height: 21px" /></div>
                        </td>
                        <td class="designmenutext">
                            Titulo
                        </td>
                    </tr>
                    <tr>
                        <td class="designmenuicon">
                            <div id="ctrl_text" ondragstart="dragstart_handler(event);" draggable="true">
                                <img alt="" src="resources/pic_texbox.PNG" style="width: 28px; height: 21px" /></div>
                        </td>
                        <td class="designmenutext">
                            Campo de Texto
                        </td>
                    </tr>
                    <tr>
                        <td class="designmenuicon">
                            <div id="ctrl_combo" ondragstart="dragstart_handler(event);" draggable="true">
                                <img alt="" src="resources/pic_combo.PNG" style="width: 26px; height: 22px" /></div>
                        </td>
                        <td class="designmenutext">
                            Opciones descolgables
                        </td>
                    </tr>
                    <tr>
                        <td class="designmenuicon">
                            <div id="ctrl_list" ondragstart="dragstart_handler(event);" draggable="true">
                                <img alt="" src="resources/pic_listbox.PNG" style="width: 28px; height: 22px" /></div>
                        </td>
                        <td class="designmenutext">
                            Lista de opciones
                        </td>
                    </tr>
                    <tr>
                        <td class="designmenuicon">
                            <div id="ctrl_check" ondragstart="dragstart_handler(event);" draggable="true">
                                <img alt="" src="resources/pic_CheckBox.PNG" style="width: 22px; height: 19px" /></div>
                        </td>
                        <td class="designmenutext">
                            Casilla de opción
                        </td>
                    </tr>
                    <tr>
                        <td class="designmenuicon">
                            <div id="ctrl_calendar" ondragstart="dragstart_handler(event);" draggable="true">
                                <img alt="" src="resources/pic_calendario.PNG" style="width: 22px; height: 19px" /></div>
                        </td>
                        <td class="designmenutext">
                            Calendario
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: left; vertical-align: middle;">
                <table class="propertiesmenu" style="width: 150px">
                    <tr>
                        <td colspan="2" class="designermenutitle">
                            Propiedades
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 23px">
                            Columnas
                        </td>
                        <td style="height: 23px">
                            <asp:RadioButton ID="rdb1Col" runat="server"
                                Text="1" TextAlign="Left" GroupName="columnas" />
                            <asp:RadioButton ID="rdb2Col" runat="server"
                                Text="2" TextAlign="Left" GroupName="columnas" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Color de Fondo
                        </td>
                        <td>
                            <asp:TextBox ID="txtColorFondo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                    <td colspan="2" style="text-align: center">
                        Confirmar<br />
                        <asp:ImageButton ID="Aplicar_Cambios_Div" runat="server" ImageUrl="~/resources/send.png" 
                            Width="30px" onclick="Aplicar_Cambios_Div_Click" /></td>
                    </tr>
                    <tr><td colspan=2></td></tr>
                    <tr>Control<td></td><td>
                        <asp:DropDownList ID="listaControles" runat="server">
                        </asp:DropDownList>
                    </td></tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="height: 62px">
            </td>
            <td style="height: 62px">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="addControl" runat="server" Text="addControl" OnClick="addControl_Click"
                    Style="display: none;" />
                <asp:Button ID="selectControl" runat="server" Text="selectControl" OnClick="selectControl_Click"
                    Style="display: none;" />
            </td>
            <td>
                <asp:HiddenField ID="hidden_selecteddiv" runat="server" />
                <asp:HiddenField ID="hidden_draggedObjectName" runat="server" />
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

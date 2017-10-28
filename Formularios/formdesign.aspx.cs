using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace Gestion2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        List<System.Web.UI.WebControls.Panel> celdas = new List<Panel>();
        Panel currentDiv = null;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["CONTROLES"] != null)
                celdas = (List<System.Web.UI.WebControls.Panel>)Session["CONTROLES"];
            else
            {
                for (int x = 0; x < 40; x++)
                {
                    System.Web.UI.WebControls.Panel div = new Panel();
                    //System.Web.UI.HtmlControls.HtmlGenericControl div = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                    div.ID = string.Format("div{0}", x);
                    div.Attributes.Add("onclick", "javascript:onClick(event);");
                    div.Attributes.Add("runat", "server");
                    div.Attributes.Add("class", "divcontrol");
                    div.EnableViewState = true;
                    div.ViewStateMode = System.Web.UI.ViewStateMode.Enabled;
                    div.Attributes.Add("class", "divcontrol col2");
                    div.Attributes.Add("currentStyle", "divcontrol col2");
                    celdas.Add(div);
                }
                Session["CONTROLES"] = celdas;
            }
           
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            for (int x = 0; x < 40; x++)
            {
                panelFormulario.Controls.Add(celdas[x]);

                System.Web.UI.WebControls.Panel div = celdas[x];
                string col = (div.Attributes["class"].Contains("col1")) ? "col1" : "col2";

                if (hidden_selecteddiv.Value == div.ClientID)
                {
                    div.Attributes.Add("class", "divcontrolselected " + col);
                    div.Attributes.Add("currentStyle", "divcontrolselected " + col);
                    currentDiv = div;
                }
                else
                {
                    div.Attributes.Add("class", "divcontrol " + col);
                    div.Attributes.Add("currentStyle", "divcontrol " + col);
                }

            }
           
        }

        protected string GetControlName(string logicalName)
        {
            string retorno = string.Empty;
            if (logicalName == "hidden_selecteddiv") retorno = this.hidden_selecteddiv.ClientID;
            if (logicalName == "hidden_draggedObjectName") retorno = this.hidden_draggedObjectName.ClientID;
            
            
            return retorno;
        }

        protected string GetPostBackScript(string Code)
        {
            string retorno = string.Empty;
            switch (Code)
            {
                case "dropcontrol":
                    {
                        retorno = Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this.addControl));
                        break;
                    }
                case "selectdiv":
                    {
                        retorno = Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this.selectControl));
                        break;
                    }
            }

            return retorno;
        }

        protected void addControl_Click(object sender, EventArgs e)
        {
            string que = hidden_draggedObjectName.Value;
            
            switch (que)
            {
                case "ctrl_label":
                    {
                        TextBox control = new TextBox();
                        control.TextMode = TextBoxMode.SingleLine;
                        control.CssClass = "controlTitulo";
                        control.Text = "Etiqueta";
                        currentDiv.Controls.Add(control);
                        break;
                    }
                case "ctrl_text":
                    {
                        TextBox control = new TextBox();
                        control.TextMode = TextBoxMode.SingleLine;
                        control.CssClass = "controlText";
                        control.Text = "Texto";
                        control.AutoPostBack = false;
                        currentDiv.Controls.Add(control);
                        break;
                    }
                case "ctrl_combo":
                    {
                        DropDownList control = new DropDownList();
                        control.Items.Add("Seleccione");
                        control.Items.Add("Uno");
                        control.Items.Add("Dos");
                        control.CssClass = "controlCombo";
                        
                        currentDiv.Controls.Add(control);
                        break;
                    }
                case "ctrl_list":
                    {
                        ListBox control = new ListBox();
                        control.Items.Add("Seleccione");
                        control.Items.Add("Uno");
                        control.Items.Add("Dos");
                        control.CssClass = "controlCombo";

                        currentDiv.Controls.Add(control);
                        break;
                    }
                case "ctrl_check":
                    {
                        CheckBox control = new CheckBox();
                        control.CssClass = "controlText";
                        currentDiv.Controls.Add(control);
                        break;
                    }
                case "ctrl_calendar":
                    {
                        Calendar control = new Calendar();
                        control.CssClass = "controlCalendar";
                        currentDiv.Controls.Add(control);
                        break;
                    }
                default:
                    break;
            }
            cargaListaControles();
        }

        protected void selectControl_Click(object sender, EventArgs e)
        {
            if (currentDiv != null)
            {
                if (currentDiv.CssClass.Contains("col1"))
                    rdb1Col.Checked = true;
                else
                    rdb2Col.Checked = true;

                txtColorFondo.Text = System.Drawing.ColorTranslator.ToHtml(currentDiv.BackColor);

                cargaListaControles();

            }
           


        }

        protected void cargaListaControles()
        {
            if (currentDiv != null)
            {
                listaControles.Items.Clear();
                foreach (Control ctrl in currentDiv.Controls)
                    listaControles.Items.Add(ctrl.GetType().Name);
            }
        }

        protected void rdb2Col_CheckedChanged(object sender, EventArgs e)
        {
            //System.Web.UI.WebControls.Panel ctrl = getDiv(hidden_selecteddiv.Value);
            //if (ctrl!=null)
            //    ctrl.Attributes["class"] = ctrl.Attributes["class"].Replace("col1", "col2");
        }

        protected void rdb1Col_CheckedChanged(object sender, EventArgs e)
        {
            //System.Web.UI.WebControls.Panel ctrl = getDiv(hidden_selecteddiv.Value);
            //if (ctrl!=null)
            //    ctrl.Attributes["class"] = ctrl.Attributes["class"].Replace("col2", "col1");
        }

        public System.Web.UI.WebControls.Panel getDiv(string idName)
        {
            System.Web.UI.WebControls.Panel control = null;
            for (int x = 0; x < 40; x++)
            {
                if (panelFormulario.Controls[x].ClientID == idName)
                {
                    control = (System.Web.UI.WebControls.Panel)panelFormulario.Controls[x];
                    break;
                }
            }
            return control;
        }

        protected void Aplicar_Cambios_Div_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (txtColorFondo.Text.Trim() != string.Empty)
                    currentDiv.BackColor = System.Drawing.ColorTranslator.FromHtml(txtColorFondo.Text);
                else
                    currentDiv.BackColor = System.Drawing.Color.Empty;
            }
            catch (Exception ex)
            {
                
            }
            try
            {
                if (rdb1Col.Checked)
                    currentDiv.Attributes["class"] = currentDiv.Attributes["class"].Replace("col2", "col1");
                else
                    currentDiv.Attributes["class"] = currentDiv.Attributes["class"].Replace("col1", "col2");
            }
            catch (Exception)
            {
                
                throw;
            }
            
            
        }
    }
}
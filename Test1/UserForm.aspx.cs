using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace Test1
{
    public partial class UserForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridDataBind();
            }
                
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            XmlDocument XmlDocObj = new XmlDocument();
            XmlDocObj.Load(Server.MapPath("Test.xml"));
            XmlNode RootNode = XmlDocObj.SelectSingleNode("Users");
            XmlNode bookNode = RootNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "User", ""));

            bookNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "Name", "")).InnerText = tbName.Text;
            bookNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "Surname", "")).InnerText = tbSurname.Text;
            bookNode.AppendChild(XmlDocObj.CreateNode(XmlNodeType.Element, "CellNo", "")).InnerText = tbCellNo.Text;
         
            XmlDocObj.Save(Server.MapPath("Test.xml"));

            //Calling grid view binding method.  
            gridDataBind();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        public void gridDataBind()
        {
            DataSet ds = new DataSet();
         
            ds.ReadXml(Server.MapPath("Test.xml"));
            
            gvUsers.DataSource = ds;
    
            gvUsers.DataBind();
        }
        protected void gvUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            gridDataBind();
        }
        protected void gvUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
         
            TextBox name = gvUsers.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
            TextBox surname = gvUsers.Rows[e.RowIndex].FindControl("txtSurname") as TextBox;
            TextBox cellNumber = gvUsers.Rows[e.RowIndex].FindControl("txtCellNo") as TextBox;


            DataSet ds = new DataSet();

            ds.ReadXml(Server.MapPath("Test.xml"));

            int xmlRow = e.RowIndex;

            ds.Tables[0].Rows[xmlRow]["Name"] = name.Text;

            ds.Tables[0].Rows[xmlRow]["Surname"] = surname.Text;

            ds.Tables[0].Rows[xmlRow]["CellNo"] = cellNumber.Text;
         
            ds.WriteXml(Server.MapPath("Test.xml"));

            gvUsers.EditIndex = -1;
            gridDataBind();
        }
        protected void gvUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            gridDataBind();
        }
        //protected void gvUsers_RowDeteting(object sender, System.Web.UI.WebControls.GridViewDeletedEventArgs e)
        //{
        //    gvUsers.EditIndex = -1;
        //    gridDataBind();
        //}
        protected void gvUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            DataSet ds = new DataSet();

            ds.ReadXml(Server.MapPath("Test.xml"));

            ds.Tables[0].Rows.RemoveAt(e.RowIndex);

            ds.WriteXml(Server.MapPath("Test.xml"));

            gridDataBind();

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class geraXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("<?xml version=\"1.0\" encoding=\"utf-8\"?>");

        XmlDocument doc = new XmlDocument();
        XmlElement el = (XmlElement)doc.AppendChild(doc.CreateElement("veiculos"));

        XmlElement umveic = (XmlElement)el.AppendChild(doc.CreateElement("veiculo"));
        umveic.SetAttribute("idveiculo", "101");
        umveic.AppendChild(doc.CreateElement("placa")).InnerText = "DEE-2145";
        umveic.AppendChild(doc.CreateElement("marca")).InnerText = "Ford";
        umveic.AppendChild(doc.CreateElement("modelo")).InnerText = "Edge";

        XmlElement outroveic = (XmlElement)el.AppendChild(doc.CreateElement("veiculo"));
        outroveic.SetAttribute("idveiculo", "102");
        outroveic.AppendChild(doc.CreateElement("placa")).InnerText = "FNN-1234";
        outroveic.AppendChild(doc.CreateElement("marca")).InnerText = "Audi";
        outroveic.AppendChild(doc.CreateElement("modelo")).InnerText = "A4";

        Response.Write(doc.OuterXml);    
    }
}
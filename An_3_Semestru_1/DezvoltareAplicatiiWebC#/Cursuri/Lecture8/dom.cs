using System;
using System.Xml;

public class CSharpSample
{
	public static void Main()
	{
		//Create the XmlDocument.
		Console.Write ("\n .NET Framework Sample\n");
		XmlDocument doc = new XmlDocument();
		doc.Load("books.xml");

		//Create an XmlNamespaceManager for resolving namespaces.
		XmlNamespaceManager nsmgr = new XmlNamespaceManager(doc.NameTable);
		nsmgr.AddNamespace("bk","urn:samples");
		XmlNode book,price;
		XmlElement root = doc.DocumentElement;

		// Select and display the value of all the publicationdate attributes.
		Console.Write ("\n List of Publications\n");
		XmlNodeList pbDateList = root.SelectNodes("/bookstore/book/@publicationdate");
		XmlNodeList nameList = root.SelectNodes("/bookstore/book/title");
		for(int i=0;i < nameList.Count ;i++)
			Console.WriteLine("\n\t\tName: " +  nameList[i].InnerText + ",Published :" + pbDateList[i].InnerText);

		//Select the book node with the matching attribute value.		
		book = root.SelectSingleNode("descendant::book[@bk:ISBN='1-861001-57-6']", nsmgr);
		
		// Selects the first 'Price' element and modify its value.
		price = book.SelectSingleNode("price");
		price.InnerText = "50.5";
		Console.Write ("\n First Book Price Updated");

		// Remove the first element.
		root.RemoveChild(root.LastChild);
		Console.Write ("\n Last Element Deleted");

		// Create a new node and set its attributes.		
		XmlElement elem = doc.CreateElement("book");		
		elem.SetAttribute("genre","novel");
		elem.SetAttribute("publicationdate","1982");
		elem.SetAttribute("ISBN","urn:samples","1-851002-30-1");

		//Add the node to the document and save the XML.
		root.AppendChild(elem);
		Console.Write ("\n Element appended to XML Document");
		doc.Save("books2.xml");
		Console.Write ("\n XML Document Saved");			

		Console.ReadLine();

	}
}


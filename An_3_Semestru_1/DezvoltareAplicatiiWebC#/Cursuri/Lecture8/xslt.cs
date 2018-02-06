using System;
using System.Xml.Xsl;

class XSLT {

   public static void Main(string[] args) {
     
      XslTransform xslt = new XslTransform();
      xslt.Load(args[1]);

      xslt.Transform(args[0], args[2], null);
   
   }
}
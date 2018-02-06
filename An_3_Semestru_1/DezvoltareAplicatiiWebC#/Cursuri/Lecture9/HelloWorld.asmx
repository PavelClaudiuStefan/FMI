<%@ WebService Language="C#" Class="HelloWorld" %>

using System;
using System.Web.Services;

[WebService(Namespace="http://phobos.cs.unibuc.ro/appweb/HelloWorld")]
public class HelloWorld
{
   [WebMethod]
   public string Hello() 
   {
       return "Hi!  The time is now " + DateTime.Now.ToString();
   }

   [WebMethod]
   public string Hi() 
   {
       return "Hi!";
   }
}


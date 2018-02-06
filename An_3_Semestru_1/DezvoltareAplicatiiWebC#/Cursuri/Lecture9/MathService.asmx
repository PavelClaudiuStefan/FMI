<%@ WebService Language="C#" Class="MathService" %>

using System;
using System.Web.Services;

public class MathService 
{
   [WebMethod]
   public int Add(int a, int b) 
   {
       return a + b;
   }

   [WebMethod]
   public int Subtract(int a, int b) 
   {
       return a - b;
   }

   [WebMethod]
   public int Multiply(int a, int b) 
   {
       return a * b;
   }

   [WebMethod]
   public int Divide(int a, int b) 
   {
       if (b==0) return -1;
       return a / b;
   }
}


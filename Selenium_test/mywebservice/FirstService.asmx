<%@ WebService language = "C#" class = "FirstService" %>

using System;
using System.Web.Services;
using System.Xml.Serialization;

[WebService(Namespace="http://localhost/mywebservice/")]
public class FirstService : WebService
{
   [WebMethod]
   public int Add(int a, int b)
   {
      return a + b;
   }

   [WebMethod]
   public String SayHello()
   {
   return "Hello World";
   }

   [WebMethod]
   public int Multiply(int a, int b)
   {
      return a * b;
   }
}
<%@ WebService language = "C#" class = "FirstService" %>

using System;
using System.Web.Services;
using System.Xml.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

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
   return "Hello World!";
   }

   [WebMethod]
   public int Multiply(int a, int b)
   {
      return a * b;
   }

   [WebMethod]
   public int SetData(int first_num, int second_num, int add_result, int mul_result)
   {
      string strConn = "server=GEMINIG-A1MML3K\\SQLEXPRESS;database=iis_sample_db;User ID=test;Password=password;Trusted_Connection=True;";
      SqlConnection openCon=new SqlConnection(strConn);
      openCon.Open();
      string saveStaff = "INSERT into cal_result (first_num, second_num, add_result, mul_result) VALUES (@first_num, @second_num, @add_result, @mul_result)";
      SqlCommand querySaveStaff = new SqlCommand(saveStaff);
      querySaveStaff.Connection=openCon;
      querySaveStaff.Parameters.Add("@first_num", first_num);
      querySaveStaff.Parameters.Add("@second_num", second_num);
      querySaveStaff.Parameters.Add("@add_result", add_result);
      querySaveStaff.Parameters.Add("@mul_result", mul_result); 
      int ret = querySaveStaff.ExecuteNonQuery();
      openCon.Close();
      return ret;
   }
   [WebMethod]
   public int GetDataCount()
   {
      string data = "";
      string strConn = "server=GEMINIG-A1MML3K\\SQLEXPRESS;database=iis_sample_db;User ID=test;Password=password;Trusted_Connection=True;";
      SqlConnection myConn = new SqlConnection(strConn);
      myConn.Open();
      String strSQL = @"select count(*) from cal_result";
      SqlCommand myCommand = new SqlCommand(strSQL, myConn);
      int count = (int)myCommand.ExecuteScalar();
      myConn.Close();
      return count;
   }
   [WebMethod]
   public TableRow InitTable()
   {
      TableRow r = new TableRow();
      TableCell c1 = new TableCell();
      TableCell c2 = new TableCell();
      TableCell c3 = new TableCell();
      TableCell c4 = new TableCell();
      TableCell c5 = new TableCell();
      c1.Controls.Add(new LiteralControl("Trials"));
      c2.Controls.Add(new LiteralControl("first number"));
      c3.Controls.Add(new LiteralControl("second number"));
      c4.Controls.Add(new LiteralControl("sum"));
      c5.Controls.Add(new LiteralControl("multiplication"));
      r.Cells.Add(c1);
      r.Cells.Add(c2);
      r.Cells.Add(c3);
      r.Cells.Add(c4);
      r.Cells.Add(c5);
      return r;
   }
   [WebMethod]
   public TableRow GetDataById(int id)
   {
      TableRow r = new TableRow();
      string strConn = "server=GEMINIG-A1MML3K\\SQLEXPRESS;database=iis_sample_db;User ID=test;Password=password;Trusted_Connection=True;";
      SqlConnection myConn = new SqlConnection(strConn);
      myConn.Open();
      String strSQL = String.Format("select * from cal_result where id='{0}'", id);
      SqlCommand myCommand = new SqlCommand(strSQL, myConn);
      SqlDataReader myDataReader = myCommand.ExecuteReader();
      while (myDataReader.Read())
      {
          if (myDataReader["id"].ToString() != "")
          {              
              TableCell c1 = new TableCell();
              TableCell c2 = new TableCell();
              TableCell c3 = new TableCell();
              TableCell c4 = new TableCell();
              TableCell c5 = new TableCell();
              c1.Controls.Add(new LiteralControl("#" + myDataReader["id"].ToString()));
              c2.Controls.Add(new LiteralControl(myDataReader["first_num"].ToString()));
              c3.Controls.Add(new LiteralControl(myDataReader["second_num"].ToString()));
              c4.Controls.Add(new LiteralControl(myDataReader["add_result"].ToString()));
              c5.Controls.Add(new LiteralControl(myDataReader["mul_result"].ToString()));
              r.Cells.Add(c1);
              r.Cells.Add(c2);
              r.Cells.Add(c3);
              r.Cells.Add(c4);
              r.Cells.Add(c5);
              break;
          }
      }
      myConn.Close();
      return r;
   }
   [WebMethod]
   public void CleanData()
   {
      string strConn = "server=GEMINIG-A1MML3K\\SQLEXPRESS;database=iis_sample_db;User ID=test;Password=password;Trusted_Connection=True;";
      SqlConnection myConn = new SqlConnection(strConn);
      myConn.Open();
      String strSQL = @"truncate table cal_result";
      SqlCommand myCommand = new SqlCommand(strSQL, myConn);
      myCommand.ExecuteNonQuery();
      myConn.Close();
      return;
   }
}

<%@ Page Language="C#" %>
<script runat="server">
   void runSrvice_Click(Object sender, EventArgs e){

      FirstService mySvc = new FirstService();

      int first_num = Int32.Parse(txtNum1.Text);
      int second_num = Int32.Parse(txtNum2.Text);
      int add_result = mySvc.Add(first_num , second_num);
      int mul_result = mySvc.Multiply(first_num, second_num);

      int ret = mySvc.SetData(first_num, second_num, add_result, mul_result);

      Label1.Text = mySvc.SayHello();
      Label2.Text = first_num.ToString() + " + " + second_num.ToString() + " = " + add_result.ToString();
      Label3.Text = first_num.ToString() + " * " + second_num.ToString() + " = " + mul_result.ToString();
      clean();
   }
   void getResult_Click(Object sender, EventArgs e){
      FirstService mySvc = new FirstService();
      int count = mySvc.GetDataCount();
      Table1.Rows.Add(mySvc.InitTable());
      while (count > 0)
      {
          Table1.Rows.Add(mySvc.GetDataById(count));
          count--;
      }
   }
   void cleanResult_Click(Object sender, EventArgs e){
      FirstService mySvc = new FirstService();
      mySvc.CleanData();
   }
   void clean()
   {
      txtNum1.Text = "";
      txtNum2.Text = "";
   }
</script>

<html>
   <head> </head>
   
   <body bgcolor="rgb(255,0,0)">
      <form runat="server">
         <p>
            <em>First Number</em>:
            <asp:TextBox id="txtNum1" runat="server" Width="43px">4</asp:TextBox>
         </p>
			
         <p>
            <em>Second Number</em>:
            <asp:TextBox id="txtNum2" runat="server" Width="44px">5</asp:TextBox>
         </p>
			
         <p>
            <strong><u>Web Service Result -</u></strong>
         </p>
			
         <p>
            <em>Hello world Service</em> :
            <asp:Label id="Label1" runat="server" Font-Underline="True"></asp:Label>
         </p>

         <p>
            <em>Add Service</em> :
             <asp:Label id="Label2" runat="server" Font-Underline="True"></asp:Label>
         </p>

          <p>
            <em>Multiply Service</em> :
             <asp:Label id="Label3" runat="server" Font-Underline="True"></asp:Label>
         </p>
			
         <p align="left">
            <asp:Button id="runSrvice" onclick="runSrvice_Click" runat="server"  Text="Execute"></asp:Button>
            <asp:Button id="getResult" onclick="getResult_Click" runat="server"  Text="Show"></asp:Button>
            <asp:Button id="cleanResult" onclick="cleanResult_Click" runat="server"  Text="Clean"></asp:Button>
         </p>
	<div>

	    <h3></h3>
	    <asp:Table id="Table1" 
        	GridLines="Both" 
	        HorizontalAlign="Center" 
	        Font-Names="Verdana" 
        	Font-Size="8pt" 
	        CellPadding="15" 
        	CellSpacing="0" 
	        Runat="server"/>

	</div>
      </form>
   </body>
</html>

<%@ Page Language="C#" %>
<script runat="server">
   void runSrvice_Click(Object sender, EventArgs e){
      FirstService mySvc = new FirstService();
      Label1.Text = mySvc.SayHello();
      Label2.Text = mySvc.Add(Int32.Parse(txtNum1.Text),  Int32.Parse(txtNum2.Text)).ToString();
      Label3.Text = mySvc.Multiply(Int32.Parse(txtNum1.Text),  Int32.Parse(txtNum2.Text)).ToString();
   }
</script>

<html>
   <head> </head>
   
   <body bgcolor="rgb(128,128,128)">
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
            <asp:Label id="Label1" runat="server" Font-Underline="True">Label</asp:Label>
         </p>

         <p>
            <em>Add Service</em> :
            & <asp:Label id="Label2" runat="server" Font-Underline="True">Label</asp:Label>
         </p>

          <p>
            <em>Multiply Service</em> :
            & <asp:Label id="Label3" runat="server" Font-Underline="True">Label</asp:Label>
         </p>
			
         <p align="left">
            <asp:Button id="runSrvice" onclick="runSrvice_Click" runat="server"  Text="Execute"></asp:Button>
         </p>
			
      </form>
      
   </body>
</html>

<%@ Page language="c#" Debug="true" %>
<%@ Import namespace="System.Data" %>
<html>
<head>
</head>
<script runat="server">

private DataTable MakeMyDataTable(){
   // Create new DataTable.
   DataTable myDataTable = new DataTable("MyDataTable");
   
   // Declare DataColumn and DataRow variables.
   DataColumn myDataColumn;
   DataRow myDataRow;

   // Create new DataColumn, set DataType, ColumnName and add to DataTable.    
   myDataColumn = new DataColumn();
   myDataColumn.DataType = System.Type.GetType("System.Int32");
   myDataColumn.ColumnName = "id";
   myDataTable.Columns.Add(myDataColumn);

   // Create second column.
   myDataColumn = new DataColumn();
   myDataColumn.DataType = Type.GetType("System.String");
   myDataColumn.ColumnName = "item";
   myDataTable.Columns.Add(myDataColumn);

   // Create new DataRow objects and add to DataTable.    
   for(int i = 0; i < 10; i++){
      myDataRow = myDataTable.NewRow();
      myDataRow["id"] = i;
      myDataRow["item"] = "item " + i;
      myDataTable.Rows.Add(myDataRow);
   }
   return myDataTable;
}

public void Page_Load(object s, EventArgs e) 
{
  if (Page.IsPostBack)
  {
  }
  else
  {
    L1.DataBind();
  }
}
</script>
<body>
<form runat="server">
<asp:DropDownList id="L1" DataSource="<%# MakeMyDataTable() %>" DataValueField="id" DataTextField="item" runat="server" />
</form>
</body>
</html>
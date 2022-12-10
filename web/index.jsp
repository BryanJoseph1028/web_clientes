<%-- 
    Document   : index
    Created on : 27/08/2020, 06:09:57 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <body>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    
        <h1>Formulario Empleados</h1>
        <div class="container">
            <form action="sr_clientes" method="post" class="form-group">
                <label for="lbl_id" ><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0"  readonly>
                <label for="lbl_nit" ><b>Nit</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: C001" required>
                <label for="lbl_nombres" ><b>Nombres</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required>
                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required>
                <label for="lbl_direccion" ><b>Direccion</b></label>
                <input type="text"  name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #Casa calle zona ciudad" required>
                <label for="lbl_telefono" ><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>
                <label for="lbl_fn" ><b>Nacimiento</b></label>
                <input type="date"  name="txt_fn" id="txt_fn" class="form-control" required>
                
                    <%
                       Puesto puesto = new Puesto();
                       HashMap<String,String> drop = puesto.drop_sangre();
                       for (String i: drop.keySet()){
                          out.println("<option value='" + i + "' >" + drop.get(i) +"</option>");
                       }
                    %>
                </select>
                <br>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
            </form>
            <table class="table table-striped">
    <thead>
      <tr>
        <th>Nit</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Nacimiento</th>
      </tr>
    </thead>
    <tbody id="tbl_clientes">
        <% 
        Empleado empleado = new Empleado();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = empleado.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,8) + ">");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
            out.println("</tr>");
        
        }
        %>
      
    </tbody>
  </table>
  </div> 
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type=="text/javascript">
        $('#tbl_empleados').on('click','tr td', function(evt){
   var target,id,nit,nombres,apellidos,direccion,telefono,nacimiento;
   
   target = $(event.target);
   id = target.parent().data('id');
   nit= target.parents("tr").find("td").eq(0).html();
   nombres= target.parents("tr").find("td").eq(1).html();
   apellidos= target.parents("tr").find("td").eq(2).html();
   direccion= target.parents("tr").find("td").eq(3).html();
   telefono= target.parents("tr").find("td").eq(4).html();
   nacimiento= target.parents("tr").find("td").eq(5).html();
   
$("#txt_id").val(id);
   $("#txt_nit").val(nit);
   $("#txt_nombres").val(nombres);
   $("#txt_apellidos").val(apellidos);
   $("#txt_direccion").val(direccion);
   $("#txt_telefono").val(telefono);
   $("#txt_fn").val(nacimiento);
});
</script>
    </body>
</html>

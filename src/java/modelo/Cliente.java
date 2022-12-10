/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author USUARIO
 */
public class Cliente extends Persona {
    private String nit;
    private Conexion cn; 
    public Cliente(){}
    public Cliente(String nit, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.nit = nit;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

   public DefaultTableModel leer(){
 DefaultTableModel tabla = new DefaultTableModel();
 try{
     cn = new Conexion();
     cn.abrir_conexion();
      String query = "SELECT e.id_cliente as id,e.nit,e.nombres,e.apellidos,e.direc6cion,e.telefono,e.fecha_nacimiento FROM clientes as e inner join clientes as p on e.id_cliente = p.id_cliente;";
      ResultSet consulta = cn.coneccionBD.createStatement().executeQuery(query);
      String encabezado[] = {"id","nit","codigo","nombres","apellidos","direccion","telefono","nacimiento"};
      tabla.setColumnIdentifiers(encabezado);
      String datos[] = new String[7];
      while (consulta.next()){
          datos[0] = consulta.getString("id");
          datos[1] = consulta.getString("nit");
          datos[2] = consulta.getString("nombres");
          datos[3] = consulta.getString("apellidos");
          datos[4] = consulta.getString("direccion");
          datos[5] = consulta.getString("telefono");
          datos[6] = consulta.getString("fecha_nacimiento");
          tabla.addRow(datos);
         }
        cn.cerrar_conexion();
 }catch(SQLException ex){
     System.out.println(ex.getMessage());
 }
 return tabla;
 }

   @Override
   public int agregar(){
       int retorno = 0;
   try{
       PreparedStatement parametro;
       cn = new Conexion();
       String query  = "insert into clientes(nit,nombres,apellidos,direccion,telefono,fecha_nacimiento,id_cliente) values(?,?,?,?,?,?,?);";;
       cn.abrir_conexion();
       parametro = (PreparedStatement)cn.coneccionBD.prepareStatement(query);
       parametro.setString(1, getNit());
       parametro.setString(2, getNombres());
       parametro.setString(3, getApellidos());
       parametro.setString(4, getDireccion());
       parametro.setString(5, getTelefono());
       parametro.setString(6, this.getFecha_nacimiento());
       parametro.setInt(7, this.getId());
       retorno = parametro.executeUpdate();
       cn.cerrar_conexion();
       
   }catch(SQLException ex){
   System.out.println(ex.getMessage());
   retorno = 0;
   }
   return retorno;
   }    
   public int modificar(){
       int retorno = 0;
   try{
       PreparedStatement parametro;
       cn = new Conexion();
       String query = "update clientes set nit = ?,nombres= ?,apellidos= ?,direccion= ?,telefono= ?,fecha_nacimiento= ?,id_puesto= ? where id_cliente = ?;";
       cn.abrir_conexion();
       parametro = (PreparedStatement)cn.coneccionBD.prepareStatement(query);
       parametro.setString(1, getNit());
       parametro.setString(2, getNombres());
       parametro.setString(3, getApellidos());
       parametro.setString(4, getDireccion());
       parametro.setString(5, getTelefono());
       parametro.setString(6, this.getFecha_nacimiento());
       parametro.setInt(8, this.getId());
       retorno = parametro.executeUpdate();
       cn.cerrar_conexion();
       
   }catch(SQLException ex){
   System.out.println(ex.getMessage());
   retorno = 0;
   }
   return retorno;
   }    
  
   @Override
   public int eliminar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from clientes  where id_cliente = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.coneccionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
}
    
}

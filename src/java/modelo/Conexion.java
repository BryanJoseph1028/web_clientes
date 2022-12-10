/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author USUARIO
 */
public class Conexion {
    public Connection coneccionBD;
    public final String bd ="db_empresa";
    public final String urlconexion = String.format("jdbc:mysql://localhost:3306/%s",bd);
    public final String usuario = "usr_empresa";
    public final String contra = "Empre@123";
    public final String jdbc = "com.mysql.jdbc.Driver";
  
    public void abrir_conexion(){
    try{
         Class.forName(jdbc);
         coneccionBD = DriverManager.getConnection(urlconexion,usuario,contra);
         
    }catch(ClassNotFoundException | SQLException ex){
            System.out.println("Error..." + ex.getMessage());
            }

    }
    public void cerrar_conexion(){
    try{
        coneccionBD.close();
    }catch(SQLException ex){
    System.out.println("Error..." + ex.getMessage());
    }
    }
}

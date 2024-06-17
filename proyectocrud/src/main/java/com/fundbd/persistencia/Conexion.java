package com.fundbd.persistencia;


import java.sql.*;
public class Conexion {
    private Connection con;
    private String user;
    private String password;
    public Conexion(String user,String password){
        this.user=user;
        this.password=password;
    }
    public void conectar(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/polizas",user,password);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error en conexion(conectar):" +e);
        }
    }
    public void desconectar() throws SQLException{
        con.close();
    }
    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
}

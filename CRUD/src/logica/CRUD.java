package logica;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;
import persistencia.Conexion;


public class CRUD {
    private String user;
    private String password;
    private Conexion conex;
    private int numeroRegistros;
    private Statement st;
    private PreparedStatement pst;
    private ResultSet rs;
    private DefaultTableModel modelo;
    private ArrayList<Object> nombreColumnas; 
    private ArrayList<Object[]> datos;
    private ArrayList<Registro> listaRegistros;
    private Connection con;
    public CRUD() {
        numeroRegistros=0;
        listaRegistros=null;
        this.user="root";
        this.password="123456";
        modelo = new DefaultTableModel();
        try {
            añadirDatos();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void numeroRegistros(){
        conex=new Conexion(user, password);
        conex.conectar();
        con=conex.getCon();
        try {
            st=con.createStatement();
            rs=st.executeQuery("select count(*)as numero from tomador");
            while (rs.next()) {                
                this.numeroRegistros=rs.getInt("numero");
            }
            con.close();
        } catch (SQLException e) {
            System.err.println("ERROR (numeroResistros):"+e);
        }
    }
    private void añadirDatos() throws Exception{
        numeroRegistros();
        nombresColumnas();
        crearRegistros();
        datos=new ArrayList<Object[]>();
        try {
            for(int i=0;i<numeroRegistros;i++){
                Object[]informacion=new Object[]{
                listaRegistros.get(i).getDocumento(),
                listaRegistros.get(i).getNombre(),
                listaRegistros.get(i).getApellidos(),
                listaRegistros.get(i).getId_tipo_doc(),
                listaRegistros.get(i).getCiudad()
                };
                datos.add(informacion);
            }
            for(Object[] datoTomador : datos){
                modelo.addRow(datoTomador);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void crearRegistros() throws Exception{
        if (numeroRegistros==0) {
            throw new Exception("No hay registros");
        }
        conex=new Conexion(user, password);
        conex.conectar();
        con=conex.getCon();
        listaRegistros=new ArrayList();
        try {
            st=con.createStatement();
            rs=st.executeQuery("select * from tomador");
            while (rs.next()) {                
            Registro r = new Registro(rs.getInt("documento"), rs.getString("nombre"), rs.getString("apellidos"), rs.getInt("id_tipo_doc"), rs.getString("ciudad"));
            listaRegistros.add(r);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void nombresColumnas(){
        nombreColumnas=new ArrayList();
        nombreColumnas.add("documento");
        nombreColumnas.add("nombre");
        nombreColumnas.add("apellidos");
        nombreColumnas.add("id_tipo_doc");
        nombreColumnas.add("ciudad");
        for(Object columna:nombreColumnas){
            modelo.addColumn(columna);
        }
    }
    
    public void modificarRegistro(String documento,String nombre,String apellidos,String id_tipo_doc,String ciudad){
        conex=new Conexion(user, password);
        conex.conectar();
        con=conex.getCon();
        String sql = "UPDATE tomador SET nombre=?, apellidos=?, id_tipo_doc=?, ciudad=? WHERE tomador.documento=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, nombre);
            pst.setString(2, apellidos);
            pst.setString(3, id_tipo_doc);
            pst.setString(4, ciudad);
            pst.setString(5, documento);
            pst.execute();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void eliminarRegistro(int documento) throws Exception{
        conex=new Conexion(user, password);
        conex.conectar();
        con=conex.getCon();
        String sql = "DELETE from tomador WHERE tomador.documento="+documento;
        try {
            st=con.createStatement();
            st.executeUpdate(sql);
            con.close();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("No se puede eliminar, debido a una restriccion de llave foranea");
        }
    }
    
    public void insertarRegistro(String documento,String nombre,String apellidos,String id_tipo_doc,String ciudad){
        conex=new Conexion(user, password);
        conex.conectar();
        con=conex.getCon();
        String sql = "insert into tomador(documento,nombre,apellidos,id_tipo_doc,ciudad)values (?,?,?,?,?) ";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, documento);
            pst.setString(2, nombre);
            pst.setString(3, apellidos);
            pst.setString(4, id_tipo_doc);
            pst.setString(5, ciudad);
            pst.execute();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public ArrayList<Registro> getListaRegistros() {
        return listaRegistros;
    }

    public void setListaRegistros(ArrayList<Registro> listaRegistros) {
        this.listaRegistros = listaRegistros;
    }

    

    public DefaultTableModel getModelo() {
        return modelo;
    }

    public void setModelo(DefaultTableModel modelo) {
        this.modelo = modelo;
    }
    
}

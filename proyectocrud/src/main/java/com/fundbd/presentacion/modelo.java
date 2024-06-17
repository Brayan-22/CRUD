/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fundbd.presentacion;

import java.awt.Point;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.table.TableModel;
import com.fundbd.logica.CRUD;

/**
 *
 * @author USER
 */
public class modelo {
    private TableModel miModelo;
    private vista ventana;
    private CRUD crud;
    private vista2 ventana2;
    public void iniciar() {
        getVentana().setResizable(false);
        getVentana().setVisible(true);
        getVentana().setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        getVentana().setLocationRelativeTo(null);
        getVentana().setTitle("CRUD POLIZAS");
    }
    public void actualizarTabla(){
        crud=new CRUD();
        miModelo=crud.getModelo();
        getVentana().getTabla().setModel(miModelo);
    }
    public void vaciarTabla(){
        getVentana().getTabla().clearSelection();
        
    }
    public vista getVentana(){
        if (ventana==null) {
            ventana=new vista(this); 
        }
        return ventana;
    }
    public vista2 getVentana2(){
        if (ventana2==null) {
            ventana2=new vista2(this); 
        }
        return ventana2;
    }
    public void modificarRegistro(){
        crud=new CRUD();
        miModelo=crud.getModelo();
        String doc=getVentana().getInputDocumento().getText();
        String nombre=getVentana().getInputNombre().getText();
        String apellidos=getVentana().getInputApellidos().getText();
        String ciudad=getVentana().getInputCiudad().getText();
        if(getVentana().getJrbCC().isSelected()){
            crud.modificarRegistro(doc, nombre, apellidos, "1", ciudad);
        }else if(getVentana().getJrbCE().isSelected()){
            crud.modificarRegistro(doc, nombre, apellidos, "2", ciudad);
        }
        actualizarTabla();
    }
    public void mostrarEnField(Point point){
        int seleccionar=getVentana().getTabla().rowAtPoint(point);
        getVentana().getInputDocumento().setText(String.valueOf(getVentana().getTabla().getValueAt(seleccionar, 0)));
        getVentana().getInputNombre().setText(String.valueOf(getVentana().getTabla().getValueAt(seleccionar, 1)));
        getVentana().getInputApellidos().setText(String.valueOf(getVentana().getTabla().getValueAt(seleccionar, 2)));
        if(getVentana().getTabla().getValueAt(seleccionar, 3).equals(1)){
            getVentana().getJrbCC().setSelected(true);
            getVentana().getJrbCE().setSelected(false);
        }else{
            getVentana().getJrbCC().setSelected(false);
            getVentana().getJrbCE().setSelected(true);
        }
        getVentana().getInputCiudad().setText(String.valueOf(getVentana().getTabla().getValueAt(seleccionar, 4)));
    }
    
    public void eliminarRegistro(){
        crud=new CRUD();
        miModelo=crud.getModelo();
        int doc=Integer.valueOf(getVentana().getInputDocumento().getText());
        try {
            crud.eliminarRegistro(doc);
            JOptionPane.showMessageDialog(null,"Registro eliminado");
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null,ex.getMessage());
        }
        actualizarTabla();
    }
    
    public void openSecondView(){
        getVentana2().setResizable(false);
        getVentana2().setVisible(true);
        getVentana2().setLocationRelativeTo(getVentana());
        getVentana2().setTitle("Insertar Registro");
        getVentana2().setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        getVentana2().setSize(400, 300);
    }
    public void insertarRegistro(){
        crud=new CRUD();
        miModelo=crud.getModelo();
        String doc=getVentana2().getDocumentoField().getText();
        String nombre=getVentana2().getNombreField().getText();
        String apellidos=getVentana2().getApellidosField().getText();
        String ciudad=getVentana2().getCiudadField().getText();
        if(getVentana2().getJrbCC().isSelected()){
            crud.insertarRegistro(doc, nombre, apellidos, "1", ciudad);
        }else if(getVentana2().getJrbCE().isSelected()){
            crud.insertarRegistro(doc, nombre, apellidos, "2", ciudad);
        }
        actualizarTabla();
        getVentana2().dispose();
    }
}

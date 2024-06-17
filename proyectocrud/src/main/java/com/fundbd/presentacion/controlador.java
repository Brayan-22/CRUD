/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fundbd.presentacion;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;


/**
 *
 * @author USER
 */
public class controlador implements ActionListener,MouseListener{
    private modelo Modelo;
    public controlador(vista aThis) {
        this.Modelo=aThis.getModelo();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        switch(e.getActionCommand()){
            case "Mostrar":
                Modelo.actualizarTabla();
                break;
            case "Modificar":
                Modelo.modificarRegistro();
                break;
            case "Eliminar":
                Modelo.eliminarRegistro();
                break;
            case "Insertar":
                Modelo.openSecondView();
        }
    }

    @Override
    public void mouseClicked(MouseEvent me) {
        Modelo.mostrarEnField(me.getPoint());
    }

    @Override
    public void mousePressed(MouseEvent me) {
        
    }

    @Override
    public void mouseReleased(MouseEvent me) {
        
    }

    @Override
    public void mouseEntered(MouseEvent me) {
        
    }

    @Override
    public void mouseExited(MouseEvent me) {
        
    }
    
}

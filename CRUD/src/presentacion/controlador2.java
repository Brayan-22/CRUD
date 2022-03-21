/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentacion;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 *
 * @author USER
 */
public class controlador2 implements ActionListener{
    private modelo Modelo;

    public controlador2(vista2 aThis) {
        this.Modelo=aThis.getModelo();
    }

    @Override
    public void actionPerformed(ActionEvent ae) {
        if(ae.getActionCommand().equals("Insertar")){
            Modelo.insertarRegistro();
        }
    }
    
}

package com.fundbd;


import com.fundbd.presentacion.modelo;
class Launcher {
    private modelo miApp;
    public Launcher(){
        miApp=new modelo();
        miApp.iniciar();
    }
    public static void main(String[] args) {
        new Launcher();
    }
}

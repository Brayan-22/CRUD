# Proyecto de un CRUD hecho en JAVA

Realización de un CRUD implementado en el lenguaje de programación JAVA haciendo uso de la API JDBC para la conexión a la base de datos, el motor de base de datos MySQL y la biblioteca grafica
JAVA swing para la interfaz de usuario.

_Taller de la materia introducción a las bases de datos._


## Ejecución

Para ejecutar el proyecto

### Ejecucion de la base de datos
Es necesario persistir los datos, para ello se utilizó el motor de base de datos MySql, por lo que se debe montar el recurso haciendo uso del script polizas backup.sql que crea la base de datos, 
tablas, relaciones y persiste los datos iniciales.

### Uso de las credenciales correctas
Asegurate de utilizar las credenciales correctas según la configuración de la base de datos, esto se configura en la clase Conexion.java

### Empaquetado y ejecución del programa
El proyecto utiliza la herramienta Maven para la gestión de dependencias y construcción del mismo, para ello es necesario ejecutar en la carpeta raiz en la que se encuentra el archivo pom.xml
```bash
mvn clean package
```
Esto creará un archivo comprimido de JAVA con la extensión .jar en la carpeta _target_ listo para la ejecución directa con JAVA
```bash
java -jar nombreProyecto.jar
```

## Recursos
### Diagrama relacional base de datos
![diagrama](https://github.com/Brayan-22/CRUD/blob/main/diagrama%20base%20de%20datos.png?raw=true)

## Desarrollador👨‍💻

* Brayan Alejandro Riveros Rodriguez - 20201020084
    - [@Brayan-22](https://github.com/Brayan-22)
  
##### Estudiante de ingenieria de sistemas de la Universidad Distrital Francisco José de Caldas.

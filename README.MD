# Proyecto Final: Consulta del Catálogo de Carreras UASD

## Descripción
Aplicación de escritorio desarrollada en Java (Swing) que permite consultar el catálogo de carreras ofertadas por la UASD. El sistema implementa un flujo de selección en cascada (Facultad -> Escuela -> Carreras) y se conecta a una base de datos MySQL.

## Características Técnicas
- **Encapsulamiento:** Uso de clases modelo (`Carrera`, `Escuela`) con atributos privados y métodos de acceso.
- **Base de Datos Relacional:** Estructura de 3 tablas (Facultades, Escuelas y Carreras) con relaciones de llave foránea.
- **Interfaz Gráfica (GUI):** Componentes Swing (`JComboBox`, `JList`, `JButton`) con actualización dinámica en pantalla.

## Requisitos e Instalaciones Previas
- Java JDK 8 o superior (NetBeans).
- MySQL Server 8.0 o superior.
- MySQL Workbench.
- Conector JDBC para MySQL (`mysql-connector-j.jar`).

## Instrucciones de Instalación y Ejecución

1. **Base de Datos:** Abrir MySQL Workbench, crear una base de datos llamada `uasd_carreras` y ejecutar el script `script_base_datos.sql` (incluido en este repositorio). Este script creará las tablas y llenará los datos de todas las carreras.
2. **Proyecto en IDE:** Abrir el proyecto en NetBeans.
3. **Dependencias:** Asegurarse de que el archivo `.jar` del conector de MySQL esté agregado a las librerías del proyecto (Click derecho en *Libraries* > *Add JAR/Folder*).
4. **Credenciales:** Abrir la clase `Database.java` y modificar la constante `PASS` con la contraseña del usuario `root` de su base de datos local.
5. **Ejecución:** Hacer clic derecho sobre el archivo `VentanaCarreras.java` y seleccionar "Run File".

## Estructura de Clases (Modelo - Vista - Controlador)
- **Modelo:**
  - `Carrera.java`: Representa una carrera encapsulando su ID y nombre.
  - `Escuela.java`: Representa una escuela encapsulando su ID y nombre.
- **Conexión:**
  - `Database.java`: Clase encargada del manejo de la conexión JDBC a MySQL.
- **Vista/Controlador:**
  - `VentanaCarreras.java`: Interfaz gráfica. Contiene la lógica de eventos (ActionListeners) que conecta los menús desplegables con las consultas a la base de datos.

## Autor(es)
**Grupo Impulso:**
- Jaycob Ricardo Gómez Ortiz - 100529648
- Carlos Soto - 100444290
- Anderson Lebron - 100694831
- Harlem Castillo - 100073254
- José Falcon Muñoz - 100551022

<br>

**Universidad Autónoma de Santo Domingo (UASD)**  
**Asignatura:** Laboratorio de Lenguaje de Programación IV

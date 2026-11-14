/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package consultauasd;

/**
 *
 * @author Harlem Castillo
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    // OJO: Cambia "123456" por la contraseña que creaste en MySQL
    private static final String URL = "jdbc:mysql://localhost:3306/uasd_carreras?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root"; 
    private static final String PASS = "Jvaleriomota@gmail.com1"; // <--- TU CONTRASEÑA AQUÍ

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}

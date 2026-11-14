/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package consultauasd;

public class Escuela {
    private int id;
    private String nombre;

    public Escuela(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public int getId() { return id; }
    
    @Override
    public String toString() {
        return this.nombre; // Esto hace que el JComboBox muestre el nombre
    }
}

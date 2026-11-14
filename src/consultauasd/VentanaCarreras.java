/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package consultauasd;

/**
 *
 * @author Harlem Castillo
 */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class VentanaCarreras extends JFrame {

    private JComboBox<String> comboEscuelas;
    private JList<Carrera> listaCarreras;
    private DefaultListModel<Carrera> modeloLista;
    private JButton btnConsultar;

    public VentanaCarreras() {
        setTitle("Catálogo de Carreras UASD");
        setSize(600, 500);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout(10, 10));

        // Panel Superior
        JPanel panelTop = new JPanel(new FlowLayout());
        panelTop.add(new JLabel("Seleccione Escuela:"));
        
        comboEscuelas = new JComboBox<>();
        cargarEscuelasEnCombo();
        panelTop.add(comboEscuelas);

        btnConsultar = new JButton("Ver Carreras");
        panelTop.add(btnConsultar);

                // Panel Central
        modeloLista = new DefaultListModel<>();
        listaCarreras = new JList<>(modeloLista);
        
        // --- MEJORAS VISUALES ---
        // 1. Hacemos que la lista sea más alta
        listaCarreras.setVisibleRowCount(15); 
        
        // 2. Ponemos una fuente más grande y legible (Arial, tamaño 14)
        listaCarreras.setFont(new Font("Arial", Font.PLAIN, 14)); 
        
        // 3. Agregamos un margen interno para que el texto no esté pegado al borde
        listaCarreras.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        // 4. El ScrollPane (la barra de desplazamiento) para que funcione bien con listas largas
        JScrollPane scrollPane = new JScrollPane(listaCarreras);

        add(panelTop, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);

        // Acción del botón
        btnConsultar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String escuelaSeleccionada = (String) comboEscuelas.getSelectedItem();
                if (escuelaSeleccionada != null) {
                    cargarCarreras(escuelaSeleccionada);
                }
            }
        });

        setLocationRelativeTo(null);
    }

    private void cargarEscuelasEnCombo() {
        String sql = "SELECT nombre FROM escuelas";
        try (Connection conn = Database.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                comboEscuelas.addItem(rs.getString("nombre"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error al cargar escuelas: " + ex.getMessage());
        }
    }

    private void cargarCarreras(String nombreEscuela) {
        modeloLista.clear();
        String sql = "SELECT c.id, c.nombre FROM carreras c JOIN escuelas e ON c.escuela_id = e.id WHERE e.nombre = ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nombreEscuela);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Carrera carrera = new Carrera(rs.getInt("id"), rs.getString("nombre"));
                    modeloLista.addElement(carrera);
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error al consultar carreras: " + ex.getMessage());
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new VentanaCarreras().setVisible(true);
        });
    }
}

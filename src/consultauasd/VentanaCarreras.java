/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package consultauasd;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class VentanaCarreras extends JFrame {

    private JComboBox<String> comboFacultades;
    private JComboBox<Escuela> comboEscuelas;
    private JList<Carrera> listaCarreras;
    private DefaultListModel<Carrera> modeloLista;
    private JButton btnConsultar;

    public VentanaCarreras() {
        setTitle("Catálogo de Carreras UASD");
        setSize(1000, 700); 
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout(10, 10));

        // --- Panel Superior (Controles) ---
        JPanel panelTop = new JPanel(new FlowLayout(FlowLayout.CENTER, 15, 10));
        
        // 1. Combo de Facultades
        panelTop.add(new JLabel("1. Facultad:"));
        comboFacultades = new JComboBox<>();
        cargarFacultades();
        panelTop.add(comboFacultades);

        // 2. Combo de Escuelas
        panelTop.add(new JLabel("2. Escuela:"));
        comboEscuelas = new JComboBox<>();
        panelTop.add(comboEscuelas);

        // 3. Botón
        btnConsultar = new JButton("3. Buscar Carreras");
        panelTop.add(btnConsultar);

        // --- Panel Central (Lista) ---
        modeloLista = new DefaultListModel<>();
        listaCarreras = new JList<>(modeloLista);
        listaCarreras.setFont(new Font("Arial", Font.PLAIN, 14)); 
        listaCarreras.setFixedCellHeight(25); 

        JScrollPane scrollPane = new JScrollPane(listaCarreras);
        scrollPane.setBorder(BorderFactory.createTitledBorder(
                BorderFactory.createEtchedBorder(), "Carreras Ofertadas", TitledBorder.LEFT, TitledBorder.TOP, new Font("Arial", Font.BOLD, 12)));

        add(panelTop, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);

        // --- EVENTO: Cuando cambia la Facultad, se actualizan las Escuelas ---
        comboFacultades.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (comboFacultades.getSelectedItem() != null) {
                    String facultadSeleccionada = (String) comboFacultades.getSelectedItem();
                    cargarEscuelas(facultadSeleccionada);
                    modeloLista.clear();
                }
            }
        });

        // --- EVENTO: Botón para buscar carreras ---
        btnConsultar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Escuela escuelaSeleccionada = (Escuela) comboEscuelas.getSelectedItem();
                if (escuelaSeleccionada != null) {
                    cargarCarreras(escuelaSeleccionada.getId());
                }
            }
        });

        setLocationRelativeTo(null); 
        
        // Cargar escuelas de la primera facultad al abrir
        if (comboFacultades.getItemCount() > 0) {
            cargarEscuelas((String) comboFacultades.getSelectedItem());
        }
    }

    private void cargarFacultades() {
        String sql = "SELECT nombre FROM facultades";
        try (Connection conn = Database.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                comboFacultades.addItem(rs.getString("nombre"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error al cargar facultades: " + ex.getMessage());
        }
    }

    private void cargarEscuelas(String nombreFacultad) {
        comboEscuelas.removeAllItems();
        String sql = "SELECT e.id, e.nombre FROM escuelas e JOIN facultades f ON e.facultad_id = f.id WHERE f.nombre = ?";
        
        try (Connection conn = Database.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nombreFacultad);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    comboEscuelas.addItem(new Escuela(rs.getInt("id"), rs.getString("nombre")));
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error al cargar escuelas: " + ex.getMessage());
        }
    }

    private void cargarCarreras(int idEscuela) {
        modeloLista.clear(); 
        String sql = "SELECT id, nombre FROM carreras WHERE escuela_id = ?";
        
        try (Connection conn = Database.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idEscuela);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Carrera carrera = new Carrera(rs.getInt("id"), rs.getString("nombre"));
                    modeloLista.addElement(carrera);
                }
                if (modeloLista.isEmpty()) {
                    JOptionPane.showMessageDialog(this, "Esta escuela no tiene carreras registradas aún.");
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
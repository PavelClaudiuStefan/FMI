/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package magazinapp;

import javax.swing.JFrame;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author Student
 */
public class InterfataGrafica {
    JFrame frame;
    
    public void start() {
        frame = new JFrame("Magazin");
        frame.setLayout(new GridBagLayout());
        
        GridBagConstraints constraints;
        
        JButton newButton = new JButton("New");
        constraints = new GridBagConstraints();
        constraints.gridy = 0;
        constraints.gridx = 0;
        //constraints.weighty = 1;
        //constraints.weightx = 1;
        constraints.fill = GridBagConstraints.HORIZONTAL;
        //newButton.setSize(50, 50);
        newButton.setFocusable(false);
        frame.add(newButton, constraints);
        
        JButton listaButton = new JButton("Lista");
        constraints = new GridBagConstraints();
        constraints.gridy = 0;
        constraints.gridx = 1;
        //constraints.weighty = 1;
        //constraints.weightx = 1;
        constraints.fill = GridBagConstraints.HORIZONTAL;
        //listaButton.setSize(50, 50);
        listaButton.setFocusable(false);
        frame.add(listaButton, constraints);
        
        JButton saveButton = new JButton("Save");
        constraints = new GridBagConstraints();
        constraints.gridy = 0;
        constraints.gridx = 2;
        //constraints.weighty = 1;
        //constraints.weightx = 1;
        constraints.fill = GridBagConstraints.HORIZONTAL;
        //saveButton.setSize(50, 50);
        saveButton.setFocusable(false);
        frame.add(saveButton, constraints);
        
        JButton loadButton = new JButton("Load");
        constraints = new GridBagConstraints();
        constraints.gridy = 0;
        constraints.gridx = 3;
        //constraints.weighty = 1;
        //constraints.weightx = 1;
        constraints.fill = GridBagConstraints.HORIZONTAL;
        //loadButton.setSize(50, 50);
        loadButton.setFocusable(false);
        frame.add(loadButton, constraints);
        
        
        
        JPanel panel = new JPanel();
        constraints = new GridBagConstraints();
        constraints.gridx = 0;
        constraints.gridy = 1;
        constraints.weighty = 1;
        constraints.fill = GridBagConstraints.CENTER;
        frame.add(panel, constraints);
        
        panel.setLayout(new GridBagLayout());
            JTextField clientName = new JTextField("Nume client");
            constraints = new GridBagConstraints();
            panel.add(clientName, constraints);
        
            
            
        
        
        frame.setVisible(true);
	frame.setSize(300, 400);
        frame.setLocationRelativeTo(null);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}

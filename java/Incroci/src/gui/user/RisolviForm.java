/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.user;

import gui.prolog.PrologManager;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.PrintStream;
import utils.redirector.CustomOutputStream;

/**
 *
 * @author giuseppe
 */
public class RisolviForm extends javax.swing.JFrame {

    /**
     * Creates new form RisolviForm
     */
    public RisolviForm() {
        initComponents();

        

        risolviButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                manager = new PrologManager();
                manager.sendCommand("gestore_kb:recupera_incrocio(" + idText.getText() + ", I), gestore_kb:stampa_incrocio(I)");
//                manager.close();
            }
        });
        redirect(caricatoText);
//        redirect(soluzioneText);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        idLabel = new javax.swing.JLabel();
        idText = new javax.swing.JTextField();
        risolviButton = new javax.swing.JButton();
        caricatoSroll = new javax.swing.JScrollPane();
        caricatoText = new javax.swing.JTextArea();
        soluzioneScroll = new javax.swing.JScrollPane();
        soluzioneText = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        idLabel.setText("ID dell'incrocio");

        risolviButton.setText("Carica e risolvi");
        risolviButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                risolviButtonActionPerformed(evt);
            }
        });

        caricatoText.setColumns(20);
        caricatoText.setRows(5);
        caricatoSroll.setViewportView(caricatoText);

        soluzioneText.setColumns(20);
        soluzioneText.setRows(5);
        soluzioneScroll.setViewportView(soluzioneText);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(idLabel)
                        .addGap(22, 22, 22)
                        .addComponent(idText, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(29, 29, 29)
                        .addComponent(risolviButton)
                        .addGap(0, 237, Short.MAX_VALUE))
                    .addComponent(caricatoSroll)
                    .addComponent(soluzioneScroll))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(idLabel)
                    .addComponent(idText, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(risolviButton))
                .addGap(18, 18, 18)
                .addComponent(caricatoSroll, javax.swing.GroupLayout.PREFERRED_SIZE, 162, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(soluzioneScroll, javax.swing.GroupLayout.DEFAULT_SIZE, 162, Short.MAX_VALUE)
                .addGap(20, 20, 20))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void risolviButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_risolviButtonActionPerformed

    }//GEN-LAST:event_risolviButtonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(RisolviForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(RisolviForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(RisolviForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(RisolviForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new RisolviForm().setVisible(true);
            }
        });
    }

    private void redirect(javax.swing.JTextArea textArea) {
        PrintStream printStream = new PrintStream(new CustomOutputStream(textArea));
        System.setOut(printStream);
        System.setErr(printStream);
    }

    private PrologManager manager;

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane caricatoSroll;
    private javax.swing.JTextArea caricatoText;
    private javax.swing.JLabel idLabel;
    private javax.swing.JTextField idText;
    private javax.swing.JButton risolviButton;
    private javax.swing.JScrollPane soluzioneScroll;
    private javax.swing.JTextArea soluzioneText;
    // End of variables declaration//GEN-END:variables
}

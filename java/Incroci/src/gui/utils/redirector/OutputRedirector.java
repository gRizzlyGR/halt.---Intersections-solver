/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.utils.redirector;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;

/**
 *
 * @author giuseppe
 */
public class OutputRedirector {

    public void redirect(javax.swing.JTextArea textArea) {
        PrintStream printStream = new PrintStream(new CustomOutputStream(textArea));
        System.setOut(printStream);
        System.setErr(printStream);
    }

    private class CustomOutputStream extends OutputStream {

        private JTextArea textArea;

        public CustomOutputStream(JTextArea textArea) {
            this.textArea = textArea;
        }

//    @Override
//    public void write(int b) throws IOException {
//        // redirects data to the text area
//        textArea.append(String.valueOf((char) b));
//        // scrolls the text area to the end of data
//        textArea.setCaretPosition(textArea.getDocument().getLength());
//    }
        @Override
        public void write(byte[] buffer, int offset, int length) throws IOException {
            String text = new String(buffer, offset, length);

            String epured = text.replaceAll("(\\n*)(\\?-)(\\n)(false\\.)", "");

//        String regularBreakLines = epured.replaceAll(("(\\n+)"), "\n");
            SwingUtilities.invokeLater(new Runnable() {
                @Override
                public void run() {
                    textArea.append(epured);
                }
            });

            textArea.setCaretPosition(textArea.getDocument().getStartPosition().getOffset());
        }

        @Override
        public void write(int b) throws IOException {
            write(new byte[]{(byte) b}, 0, 1);
            textArea.setCaretPosition(textArea.getDocument().getStartPosition().getOffset());
        }
    }
}

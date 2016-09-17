/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prolog;

import com.declarativa.interprolog.PrologOutputListener;
import com.declarativa.interprolog.SWISubprocessEngine;
import com.declarativa.interprolog.SubprocessEngine;
import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.CodeSource;

/**
 *
 * @author giuseppe
 */
public class PrologManager {

    private final String BIN_PATH = "/usr/lib/swi-prolog/bin/amd64/swipl";
    private final String LIB_PATH = "/usr/lib/swi-prolog/lib/amd64";
    private SubprocessEngine engine;

    public PrologManager() {
        engine = new SWISubprocessEngine(BIN_PATH, false);

        File file = null;

        String name = this.getClass().getResource("PrologManager.class").toString();

        if (name.startsWith("jar")) //Avvio dal jar
        {
            try {

                CodeSource codeSource = this.getClass().getProtectionDomain().getCodeSource();
                File jarFile = new File(codeSource.getLocation().toURI().getPath());
                String jarDir = jarFile.getParentFile().getPath();
                file = new File(jarDir + "/prolog/java_access_point.pl");
            } catch (URISyntaxException ex) {
                System.out.println(ex);
            }
        } else {  //Avvio dall'IDE, solo per test
            try {
                URL url = this.getClass().getResource("lib/java_access_point.pl");
                URI uri = url.toURI();
                file = new File(uri);
            } catch (URISyntaxException ex) {
                System.out.println(ex);
            }
        }
        engine.consultAbsolute(file);

        PrologOutputListener itr = new PrologInterceptor();

        engine.addPrologOutputListener(itr);

//        engine.deterministicGoal("recupera_incrocio(fig5, I), stampa_incrocio(I), risolvi");
//        engine.deterministicGoal("gestore_kb:recupera_incrocio(fig5, I), gestore_kb:stampa_incrocio(I), circolano");
//        Object[] bindings = engine.deterministicGoal("incrocio(fig5, List), process_list(List, LL), ipObjectTemplate('ArrayOfString',AS,_,[LL],_)","[AS]"); 
//        Object[] bindings = engine.deterministicGoal("convert(LL), ipObjectTemplate('ArrayOfString',AS,_,[LL],_)","[AS]"); 
//        Object[] bindings = engine.deterministicGoal("recupera_incrocio(fig5, I), process_list(I, L), ipObjectTemplate('ArrayOfString',AS,_,[L],_)", "[AS]");
//        String[] list = (String[]) bindings[0];
//        
//        for (String l : list)
//            System.out.println(l);
//        try {}
//        finally {
//            engine.shutdown();
//        }
    }

    public boolean sendCommand(String command) {
        return engine.deterministicGoal(command);
    }

    public String getCommand(String functor, String... args) {
        String s = "(";

        for (String a : args) {
            s += a + ",";
        }

        return functor + s.substring(0, s.length() - 1) + ")";
    }

    public void close() {
        engine.shutdown();
    }

    class PrologInterceptor implements PrologOutputListener {

//        private final String QM_PATTERN = "(\\n*)(\\?-)(\\n*)";
//        private final String FALSE_PATTERN = "(\\n*)(false\\.)(\\n*)";
//        private final String QM_FALSE_PATTERN = "(\\n*)(\\?-)(false\\.)(\\n*)";
//        
        private final String QM_PATTERN = "\\n*\\?-\\n*";
        private final String FALSE_PATTERN = "\\n*false\\.\\n*";
        private final String QM_FALSE_PATTERN = "\\n*\\?-false\\.\\n*";

        @Override
        public void print(String string) {
//        if (!string.matches("(\\n*)(\\?-?)(\\n*)(false\\.)(\\n*)")) 
//        if (!(string.contains("?-") && string.contains("false.")))
//        if (!string.matches("(\"\\?-\")") || !string.matches("(\\n*)(false\\.)(\\n*)"))

            if (!string.matches(QM_PATTERN) && !string.matches(FALSE_PATTERN) && !string.matches(QM_FALSE_PATTERN)) //    if (!string.matches("(\\n*)(false\\.)(\\n*)"))
            {
                System.out.println(string);
            }
        }

    }

}

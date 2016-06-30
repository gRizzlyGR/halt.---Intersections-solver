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

/**
 *
 * @author giuseppe
 */
public class PrologManager {

    private final String BIN_PATH = "/usr/lib/swi-prolog/bin/amd64/swipl";
    private final String LIB_PATH = "/usr/lib/swi-prolog/lib/amd64";
    private SubprocessEngine engine;

    public PrologManager() {
//        JPL.setNativeLibraryDir(LIB_PATH);
//        JPL.init();
        engine = new SWISubprocessEngine(BIN_PATH, false);

//      boolean flag = engine.command("-f /home/giuseppe/IA/Progetto/main.pl -t start");
        engine.consultAbsolute(new File("/home/giuseppe/IA/Progetto/main.pl"));

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

    public static void main(String[] args) {
        new PrologManager();
//        String s1 = "?-";
//        String s2 = "\nfalse.\n\n";
//        
//        if (s1.matches("(\\?-)"))
//            System.out.println("s1");
//        
//        if (s2.matches("(\\n*)(false\\.)(\\n*)"))
//            System.out.println("s2");

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

        private final String QM_PATTERN = "(\\n*)(\\?-)(\\n*)";
        private final String FALSE_PATTERN = "(\\n*)(false\\.)(\\n*)";
        private final String QM_FALSE_PATTERN = "(\\n*)(\\?-)(false\\.)(\\n*)";

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

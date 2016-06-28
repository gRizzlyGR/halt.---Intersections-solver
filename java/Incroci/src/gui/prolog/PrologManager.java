/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.prolog;

import com.declarativa.interprolog.PrologEngine;
import com.declarativa.interprolog.SWISubprocessEngine;
import com.declarativa.interprolog.TermModel;
import java.io.File;

/**
 *
 * @author giuseppe
 */
public class PrologManager {
    
    private final String BIN_PATH = "/usr/lib/swi-prolog/bin/amd64/swipl";
    private final String LIB_PATH = "/usr/lib/swi-prolog/lib/amd64";
    private PrologEngine engine;
    
    
    public PrologManager() {
//        JPL.setNativeLibraryDir(LIB_PATH);
//        JPL.init();
        engine = new SWISubprocessEngine(BIN_PATH, false);
        System.out.println(engine.getPrologVersion());
//      boolean flag = engine.command("-f /home/giuseppe/IA/Progetto/main.pl -t start");
        
        
//        boolean flag = engine.consultAbsolute(new File("/home/giuseppe/IA/Progetto/gestore_kb.pl"));
        boolean flag = engine.consultAbsolute(new File("/home/giuseppe/IA/Progetto/kb.pl"));
//        System.out.println(new TermModel("recupera_incrocio(fig5, Incrocio)"));
        
//        Object[] tm = engine.deterministicGoal("incrocio", "[fig5, Incrocio]");
//        
//        for (Object t : tm)
//            System.out.println(t);
        
        boolean q = engine.deterministicGoal("incrocio(fig5, Incrocio)");
        
        if (q)
            System.out.println("VEROOOOOOO");
        engine.shutdown();
        
    }
    
    public static void main(String[] args) {
        new PrologManager();
    }
    
    
    public String getCommand(String functor, String... args) {
        String s = "(";
        
        for (String a : args)
            s += a + ",";
        
        return functor + s.substring(0, s.length()-1) + ")";
    }
    
    
    
    
}

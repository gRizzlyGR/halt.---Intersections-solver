/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui.prolog;

import com.declarativa.interprolog.PrologOutputListener;

/**
 *
 * @author giuseppe
 */
public class PrologInterceptor implements PrologOutputListener{

    @Override
    public void print(String string) {
        System.out.println(string);
    }
    
}

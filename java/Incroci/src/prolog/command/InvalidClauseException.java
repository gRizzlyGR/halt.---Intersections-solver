/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prolog.command;

/**
 *
 * @author giuseppe
 */
public class InvalidClauseException extends Exception{
    
    public InvalidClauseException() {
        super();
    }
    
    public InvalidClauseException(String message) {
        super(message);
    }
}

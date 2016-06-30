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
public enum PrologCommands {

    SOLVE_CROSSROAD_BY_ID("gestore_kb:pulisci, "
                        + "gestore_kb:recupera_incrocio(%s, Incrocio), "
                        + "gestore_kb:stampa_incrocio(Incrocio), "
                        + "menu_utente:risolvi");

    private final String command;

    private PrologCommands(final String text) {
        this.command = text;
    }

    public String getCommand() {
        return command;
    }
}

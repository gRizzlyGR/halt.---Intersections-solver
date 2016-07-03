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

//    SOLVE_CROSSROAD_BY_ID("gestore_kb:pulisci, "
//                        + "gestore_kb:recupera_incrocio(%s, Incrocio), "
//                        + "gestore_kb:stampa_incrocio(Incrocio), "
//                        + "menu_utente:risolvi");

    SOLVE_NEW_CROSSROAD("solve_new_crossroad(%s)"),
    SOLVE_CROSSROAD_BY_ID("solve_crossroad_by_id(%s)"),
    VISUALIZE_CROSSROAD("visualize_crossroad(%s)"),
    REGISTER_NEW_CROSSROAD("register_new_crossroad(%s, %s)"),
    DELETE_CROSSROAD("delete_crossroad(%s)");
    
    private final String command;

    private PrologCommands(final String text) {
        this.command = text;
    }

    public String getCommand() {
        return command;
    }
}

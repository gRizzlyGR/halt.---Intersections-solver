/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prolog.command;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author giuseppe
 */
public class ClauseValidator {

    private static final Pattern COMES_FROM = Pattern.compile(".*veicolo\\s+(.*)\\s+proviene.*braccio\\s+(.*)");
    private static final Pattern GOES_TO = Pattern.compile(".*veicolo\\s+(.*)\\s+transita.*braccio\\s+(.*)\\s+(svoltando\\s+a\\s+|proseguendo\\s+)(.*)");
    private static final Pattern SIGN = Pattern.compile(".*braccio\\s+(.*)\\s+c.*segnale\\s+(.*)"); //--> 'c' character is a watershed representing 'c'è'
    private Matcher m;

    public String validateClause(String textLoad) {
        List<String> clauses = null;
        try {
            if (textLoad.equals("")) {
                throw new InvalidClauseException();
            } else {
                String[] facts = textLoad.split(";");
                clauses = new ArrayList<>();
                String f;

                for (String fact : facts) {
                    f = removeNewLines(fact);
                    if (f.contains("proviene")) {
                        clauses.add(comesFromClause(f));
                    } else if (f.contains("transita")) {
                        clauses.add(goesToClause(f));
                    } else if (f.contains("segnale")) {
                        clauses.add(signClause(f));
                    }
                }
                
                return listToString(clauses);
            }
        } catch (InvalidClauseException e) {
            System.out.println("--Incrocio non formattato correttamente! Controlla");
        }

        return null;
    }

    private String comesFromClause(String sentence) throws InvalidClauseException {

        m = COMES_FROM.matcher(sentence);

        if (m.matches()) {
            return String.format("proviene(veicolo(%s), braccio(%s))", whiteSpaceToUnderscore(m.group(1)), whiteSpaceToUnderscore(m.group(2)));
        } else {
            throw new InvalidClauseException("Sentence not formatted correctly: " + sentence);
        }
    }

    private String goesToClause(String sentence) throws InvalidClauseException {
        m = GOES_TO.matcher(sentence);

        if (m.matches()) {
            return String.format("transita(veicolo(%s), %s, braccio(%s))", whiteSpaceToUnderscore(m.group(1)), whiteSpaceToUnderscore(m.group(4)), whiteSpaceToUnderscore(m.group(2)));
        } else {
            throw new InvalidClauseException("Sentence not formatted correctly: " + sentence);
        }
    }

    private String signClause(String sentence) throws InvalidClauseException {
        m = SIGN.matcher(sentence);

        if (m.matches()) {
            return String.format("segnaletica(braccio(%s), segnale(%s))", whiteSpaceToUnderscore(m.group(1)), whiteSpaceToUnderscore(m.group(2)));
        } else {
            throw new InvalidClauseException("Sentence not formatted correctly: " + sentence);
        }
    }

    private String whiteSpaceToUnderscore(String s) {
        return s.replaceAll("\\s+", "_");
    }

    private String removeNewLines(String s) {
        return s.replace("\n", "");
    }

    private String listToString(List<String> coll) {
        StringBuilder sb = new StringBuilder();

        for (String s : coll) {
            sb.append(s).append(";");
        }

        String merged = sb.toString();

        return merged.substring(0, merged.length() - 1);
    }
}

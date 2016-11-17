#!/bin/sh

# Questo script avvia il programma per UTENTE NORMALE.
# Per ulteriori informazioni leggere il documento di lavoro "Progetto.pdf"

# Il programma avvia una finestra del terminale in cui viene avviato Prolog.
# Se non dovesse funzionare copiare e incollare manualmente in una finestra
# di terminale il comando di swupl con i suoi argomenti scritto sotto.

x-terminal-emulator -e swipl -f prolog/main.pl -t start

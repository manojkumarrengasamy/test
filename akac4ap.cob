000000* ELEMENTKOPF-COBOL-SOURCE ********************************%*
000100*@CR                                                              CCC
000150* COPYRIGHT (C) 2018                                              CCC
000151* Fidelity National Information Services, Inc. and/or its         CCC
000152* subsidiaries - All Rights Reserved worldwide.                   CCC
000153* This document is protected under the trade secret and           CCC
000154* copyright laws as the property of Fidelity National             CCC
000155* Information Services, Inc. and/or its subsidiaries.             CCC
000156* Copying, reproduction or distribution should be limited         CCC
000157* and only to employees with a ( need to know )                   CCC
000158* to do their job. Any disclosure of this document                CCC
000159* to third parties is strictly prohibited.                        CCC
000160*@CR
000160*
000160* ELEMENTIDENTIFIKATION :
000160* -----------------------
000160*
000160*@a_element_info 
000160*@Titel         : (CI)  Schliessung anlegen
000160*@Elementname   : akac4ap.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20150107.093912
000160*@Produkt       : ak
000160*@Lieferpaket   : 
000160*@Liefertiefe   : ja
000160*@Rekursiv      : 
000160*@Kategorie     : scc
000160*@BatchDialog   : dialog
000160*@Zugeliefert   : 
000160*@Generiert_aus : 
000160*@Nicht_manuell : 
000160*@Pruefe_aekz   : j
000160*@Querschnitt   : 
000160*@SQL           : 
000160*@e_element_info 
000160*
001000*@Title        : Schließung anlegen                         *
001100* Verfasser    : Stefan Pötsch, Atos                        *
001200* Erstelldatum : 10.02.2012                                 *
001400*                                                           *     
001500*************************************************************
001600*@A-ELEMENTBESCHREIBUNG                                     *     
001700* Modul-Beschreibung:                                       *     
001800* Mit Hilfe dieses CI-Auftrags wird Schritt 2 einer Ver-    *     
001900* arbeitung durchgefuehrt (z.B. Loeschen nach einer erfolg- *
002000* reichen Anzeige)                                          *
002100* Dieser CI-Auftrag erfuellt folgende Anforderungen:        *     
002200* - Initialisierung aller Strukturen                        *     
002300* - Vorbelegen der Index-Struktur, um evtl. auftretende     *     
002400*   Fehler neben dem fehlerhaft erkannten Feld positionieren*     
002500*   zu koennen.                                             *     
002600* - Uebernahme der Eingabe-Felder (Suchbegriffe) aus dem    *     
002700*   APDU in den Hilfs-KADA                                  *     
002800* - Aufruf des KORDOBA-Auftrags AKAADI, um mit Hilfe dieses *     
002900*   Auftrags die notwendigen Pruefungen durchzufuehren und  *     
003000*   bei fehlerfreier Pruefung die gewuenschte Verarbeitung  *     
003100*   durchzufuehren                                          *     
003200* - Fuellen der Ausgabe-Struktur (Daten und ggf. Fehler-    *     
003300*   oder Quittungs-Meldungen)                               *     
003400*@E-ELEMENTBESCHREIBUNG                                     *     
003500*                                                           *     
003600*@A-MODULAUFRUF                                             *     
003700* Aufruf-Parameter: PRODECURE DIVISION                      *
003800*                   USING GSCI-STEUERDATEN                  *
003900*@E-MODULAUFRUF                                             *     
004000*                                                           *     
004100*@A-RETURNCODE                                              *     
004200* Meldungen/Returncodes:                                    *     
004300* ----------------------                                    *     
004400* Im CI-Auftrag AKAC4AP werden keine eigenen Fehlermeldungen*     
004500* in den Meldungs-Pool eingetragen.                         *     
004600*@E-RETURNCODE                                              *     
004700*                                                           *     
004800*@A-ENTRY                                                   *     
004900* Entryname       : AKAC4AP                                 *     
005000*@E-ENTRY                                                   *     
005100*                                                           *     
005200*@A-MODUL                                                   *     
005300* Gerufene Moduln/Auftraege:                                *     
005400*                   CGSAUF                                  *     
005500*                   CGSCI                                   *     
005600*                   AKAADI                                  *     
005700*@E-MODUL                                                   *     
005800*                                                           *     
005900*@A-COBOL-COPY                                              *     
006000* benoetigte COBOL-Copies:                                  *     
006100* DKAXIND : Konstantenstruktur fuer Indices                 *
006200* CGSOVER : allgemeiner Verstaendigungsbereich              *
006300* CGSICI  : Eingabebereich fuer CGSCI                       *
006400* CGSOCI  : Ausgabebereich fuer CGSCI                       *
006500* CGSCISD - CI-Steuerdaten                                  *
006600* CKAIADI1: Eingabestruktur fuer KORDOBA-Auftrag AKAADI     *
006700* CKAC4AP : Verstaendigungsbereich CI-Auftrag - PC          *
006800* DCTGRCGE- Meldungsgewichte                                *
006900*                                                           *
007000*@E-COBOL-COPY                                              *     
007100*                                                           *     
007200*@A-TABELLE                                                 *     
007300* TABEX-Tabellen  : entfaellt                               *     
007400*@E-TABELLE                                                 *     
007500*                                                           *     
007600*@A-BENUTZERSATZ                                            *     
007700* Benutzersaetze  : entfaellt                               *     
007800*@E-BENUTZERSATZ                                            *     
007900*                                                           *
008000*@A-DATEI                                                   *
008100* Dateien         : entfaellt                               *
008200*@E-DATEI                                                   *
008300*                                                           *     
008400*@A-KONVENTIONEN                                            *     
008500* - die MOVE-Anweisungen sind ausgerichtet.                 *     
008600* - die Sections sind alphabetisch geordnet                 *     
008700*@E-KONVENTIONEN                                            *     
008800*                                                           *     
008900*@A-DOKUMENT                                                *     
009000*                                                           *
009100* Die fachliche Beschreibung ist im Dokument                *     
009200* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *     
009300* hinterlegt.                                               *     
009400*@E-DOKUMENT                                                *
009500*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
090051* D01 R49665                                                *     D01
090052*     Technische Anpassung an geänderten Struktur-Name im   *     D01
090053*     Copy DKAXIND.                                         *     D01
090054*     Datum: 10.08.2012                            NKZ: SUM *     D01
090055*                                                           *     D01
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/                                                                 
100200 IDENTIFICATION DIVISION.                                         
100300 PROGRAM-ID. AKAC4AP.                                             
100400 ENVIRONMENT DIVISION.                                            
100500 CONFIGURATION SECTION.                                           
100600 SPECIAL-NAMES.                                                   
100700     DECIMAL-POINT                IS COMMA.                       
100800 DATA DIVISION.                                                   
100900*---------------------------------------------------------------*
101000* WORKING-STORAGE-Section                                       *
101100*---------------------------------------------------------------*
101200 WORKING-STORAGE SECTION.                                         
101300*                                                                 
101400*    PLATZHALTER FUER VERSIONSINFORMATIONEN                       
101500*                                                                 
101600 01  VERS-INF.                                                    CCC
101650     05  FILLER PIC X(13) VALUE "ELEM=akac4ap ".                  CCC
101651     05  FILLER PIC X(15) VALUE "VERS=k151-00002".                CCC
101652     05  FILLER PIC X(470) VALUE "COPYRIGHT (C) 2018 Fidelity NatiCCC
101653-                               "onal Information Services, Inc. aCCC
101654-                               "nd/or its subsidiaries - All RighCCC
101655-                               "ts Reserved worldwide. This documCCC
101656-                               "ent is protected under the trade CCC
101657-                               "secret and copyright laws as the CCC
101658-                               "property of Fidelity National InfCCC
101659-                               "ormation Services, Inc. and/or itCCC
101660-                               "s subsidiaries. Copying, reproducCCC
101661-                               "tion or distribution should be liCCC
101662-                               "mited and only to employees with CCC
101663-                               "a ( need to know ) to do their joCCC
101664-                               "b. Any disclosure of this documenCCC
101665-                               "t to third parties is strictly prCCC
101666-                               "ohibited.".                      CCC
102100/---------------------------------------------------------------*
102200* Konstanten fuer den Aufruf von CGSCI         
102300*---------------------------------------------------------------*
102400 01 GS-KONSTANTEN. 
102500     20 C-AUF-AUFRUF-AL           PIC X(040) VALUE "AUFRUF-AL".
102600     20 C-KONFIG-ID-KA            PIC X(002) VALUE "KA".
102700     20 C-OBJEKT-AKAADI           PIC X(020) VALUE "AKAADI".
102800     20 C-CI-NACHRICHT-LESEN      PIC X(040) 
102900                                  VALUE "NACHRICHT-LESEN".
103000     20 C-CI-NACHRICHT-SCHREIBEN  PIC X(040)
103100                                  VALUE "NACHRICHT-SCHREIBEN".
103200     20 C-OBJEKT-CI-LINES         PIC X(020) VALUE "LINES".
103300     20 C-CI-MELDUNGEN            PIC X(001) VALUE "M".
103400     20 C-KAC4AP                  PIC X(008) VALUE "KAC4AP".
103500     20 C-RETCODE-END             PIC 9(004) COMP-5 VALUE 0.
103600     20 C-SET                     PIC X(006) VALUE "SET   ". 
103700/---------------------------------------------------------------*
103800* Konstanten    
103900*---------------------------------------------------------------*           
104000 01 AKAC4AP-KONSTANTEN.
104100    05 C-01-STD-ABS-DIA           PIC X(040) VALUE
104200                                  "01-STD-ABS-DIA".
104300    05 C-1                        PIC 9(001) VALUE 1.
104400/---------------------------------------------------------------*
104500* Meldungsgewichte                                              *
104600*---------------------------------------------------------------*
104700  COPY DCTGRCGE.
104800/---------------------------------------------------------------*
104900* Uebergabestruktur fuer Indices an KORDOBA-Auftrag
105000*---------------------------------------------------------------*
105100  COPY DKAXIND.   
105200/---------------------------------------------------------------*
105300* LOCAL-STORAGE-Section         
105400*---------------------------------------------------------------*
105500 LOCAL-STORAGE SECTION.
105600/---------------------------------------------------------------*
105700* Allgemeiner Verstaendigungsbereich für Aufruf von Service-
105800* Funktionen         
105900*---------------------------------------------------------------*
106000  COPY CGSOVER.
106100/---------------------------------------------------------------*
106200* Eingabebereich fuer CGSCI         
106300*---------------------------------------------------------------*
106400  COPY CGSICI.
106500/---------------------------------------------------------------*
106600* Ausgabebereich fuer CGSCI         
106700*---------------------------------------------------------------*
106800  COPY CGSOCI.
106900/---------------------------------------------------------------*
107000* Eingabebereich aus AKAC4AP an AKAADI
107100*---------------------------------------------------------------*
107200  COPY CKAIADI1.  
107300/---------------------------------------------------------------*
107400* Aufruf von Service-Funktionen         
107500*---------------------------------------------------------------*
107600 01 DUMMY                         PIC X(001).
107700/---------------------------------------------------------------*
107800* Uebergabebereich von PC <-> CI-Auftrag         
107900*---------------------------------------------------------------*
108000  COPY CKAC4AP. 
108100/---------------------------------------------------------------*
108200* Hilfsfelder                                                   *
108300*---------------------------------------------------------------*
108400 01 HILFSFELDER.
108500    05 H-ZAEHLER-ANZ              PIC 9(003).
108600/****************************************************************
108700 LINKAGE SECTION.
108800*****************************************************************
108900/---------------------------------------------------------------*
109000* CI-Steuerdaten         
109100*---------------------------------------------------------------*
109200  COPY CGSCISD.
109300*****************************************************************
109400 PROCEDURE DIVISION
109500     USING GSCI-STEUERDATEN.
109600                                                                  
109700 STEUER-AKAC4AP SECTION.                                           
109800 STEUER-AKAC4AP-1001.                                              
109900*---------------------------------------------------------------* 
110000* Programmsteuerung                                               
110100*---------------------------------------------------------------* 
110200* - Initialisieren Eingabebereich 
110300* - Fuellen der Index-Struktur                                    
110400* - APDU-Felder in Auftragsdatenbereich uebertragen               
110500* - Verarbeitung (rufen Auftrag AKAADI)
110600*---------------------------------------------------------------*
110700     MOVE SPACE                   TO DUMMY 
110800     MOVE C-RETCODE-END           TO GSCI-ENDESTATUS
110900
111000*---------------------------------------------------------------* 
111100* Initialisieren der Eingabefelder der Uebergabestruktur          
111200*---------------------------------------------------------------* 
111300     PERFORM INIT-KADA-KAC4AP                                     
111400                                                                  
111500*---------------------------------------------------------------* 
111600* VERARBEITUNG                                                    
111700*---------------------------------------------------------------* 
111800* Schließungen anlegen (Auftrag AKAADI)
111900*---------------------------------------------------------------* 
112000* - APDU-Felder lesen
112100* - Aufruf KORDOBA-Auftrag, der die Verarbeitung der Daten
112200*   durchgefuehrt
112300* - APDU-Felder schreiben 
112400*---------------------------------------------------------------*
112500     EVALUATE GSCI-SERVICE                    
112600       WHEN C-SET
112700         PERFORM APDU-FELDER-LESEN                                             
112800         PERFORM AUFTRAG-AKAADI
112900         PERFORM APDU-FELDER-SCHREIBEN
113000       WHEN OTHER                                             
113100         GO TO PROGRAMM-VERLASSEN
113200     END-EVALUATE
113300     .                                                            
113400 STEUER-AKAC4AP-1002.                                              
113500     GO TO PROGRAMM-VERLASSEN                                   
113600     .                                                            
113700/
113800 APDU-FELDER-LESEN SECTION.
113900 APDU-FELDER-LESEN-1001.
114000*
114100*---------------------------------------------------------------*
114200* Datenuebertragung von CI nach Hilfskada (KADA-KAC4AP)
114300*---------------------------------------------------------------*
114400*     
114500     MOVE C-KAC4AP                TO GSICI-NAME-KADA-BEREICH
114600     MOVE ZERO                    TO GSICI-ANZAHL-INDICES 
114700     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
114800     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS
114900                                  OF KAC4AP-EA-BEREICH
115000*     
115100     CALL "CGSCI"
115200     USING C-CI-NACHRICHT-LESEN
115300           C-KONFIG-ID-KA 
115400           C-OBJEKT-CI-LINES
115500           GSOVER-VERSTAENDIGUNGSBEREICH
115600           GSICI-EINGABEBEREICH
115700           DUMMY
115800           DUMMY
115900     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
116000     THEN
116100       PERFORM MELDUNG-IN-APDU-EINTRAGEN
116200       GO TO PROGRAMM-VERLASSEN
116300     END-IF 
116400     .        
116500 APDU-FELDER-LESEN-1002.
116600     EXIT.
116700/
116800 APDU-FELDER-SCHREIBEN SECTION.
116900 APDU-FELDER-SCHREIBEN-1001.
117000*
117100*---------------------------------------------------------------*
117200* Datenuebertragung von Hilfskada (KADA-KAC4AP) nach CI
117300*---------------------------------------------------------------*
117400*      
117500     MOVE C-KAC4AP                TO GSICI-NAME-KADA-BEREICH
117600     MOVE ZERO                    TO GSICI-ANZAHL-INDICES
117700     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
117800     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS 
117900                                  OF KAC4AP-EA-BEREICH
118000*     
118100     CALL "CGSCI"
118200     USING C-CI-NACHRICHT-SCHREIBEN
118300           C-KONFIG-ID-KA  
118400           C-OBJEKT-CI-LINES
118500           GSOVER-VERSTAENDIGUNGSBEREICH
118600           GSICI-EINGABEBEREICH
118700           DUMMY
118800           DUMMY
118900     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
119000     THEN
119100       PERFORM MELDUNG-IN-APDU-EINTRAGEN
119200       GO TO PROGRAMM-VERLASSEN
119300     END-IF 
119400     .        
119500 APDU-FELDER-SCHREIBEN-1002.
119600     EXIT.
119700/                                                                 
119800 AUFTRAG-AKAADI SECTION.  
119900 AUFTRAG-AKAADI-1001.    
120000*---------------------------------------------------------------* 
120100* Schließung anlegen mit Hilfe vom KORDOBA-Auftrag
120200* AKAADI
120300*---------------------------------------------------------------* 
120400*         
120500     MOVE C-01-STD-ABS-DIA        TO KAIADI1-FUNKTION
120600* 
120700     MOVE KAC4AP-E-ANZAHL-BELEGT  TO KAIADI1-IND-LETZT
120800     MOVE KAC4AP-E-BEMERKUNG      TO KAIADI1-BEMERKUNG
120900*
121000     MOVE C-1                     TO H-ZAEHLER-ANZ
121100*
121200     PERFORM UNTIL H-ZAEHLER-ANZ > KAC4AP-E-ANZAHL-BELEGT
121300*      Primärkeytabelle versorgen
121400       MOVE KAC4AP-E-ABSTIMMKREIS  (H-ZAEHLER-ANZ) 
121500         TO KAIADI1-ABSTIMMKREIS-NR  (H-ZAEHLER-ANZ) 
121600       MOVE KAC4AP-E-HERKUNFT      (H-ZAEHLER-ANZ) 
121700         TO KAIADI1-HERKUNFT         (H-ZAEHLER-ANZ) 
121800       MOVE KAC4AP-E-KONTO-ID      (H-ZAEHLER-ANZ) 
121900         TO KAIADI1-KONTO-ID-ABSTIMM (H-ZAEHLER-ANZ) 
122000       MOVE KAC4AP-E-AUSZUGSDATUM  (H-ZAEHLER-ANZ) 
122100         TO KAIADI1-AUSZUGSDATUM     (H-ZAEHLER-ANZ) 
122200       MOVE KAC4AP-E-AUSZUGSNUMMER (H-ZAEHLER-ANZ) 
122300         TO KAIADI1-AUSZUGSNUMMER    (H-ZAEHLER-ANZ) 
122400       MOVE KAC4AP-E-AUSZUG-FNR    (H-ZAEHLER-ANZ) 
122500         TO KAIADI1-AUSZUG-FNR       (H-ZAEHLER-ANZ) 
122600       MOVE KAC4AP-E-LFD-NR-APO    (H-ZAEHLER-ANZ) 
122700         TO KAIADI1-LFD-NR-APO       (H-ZAEHLER-ANZ)
122800       MOVE KAC4AP-E-UPDC          (H-ZAEHLER-ANZ) 
122900         TO KAIADI1-UPDC             (H-ZAEHLER-ANZ)     
123000
123100*      
123200       ADD C-1                    TO H-ZAEHLER-ANZ
123300      END-PERFORM           
123400*
123500     CALL "CGSAUF"                                                
123600     USING C-AUF-AUFRUF-AL                                              
123700           C-KONFIG-ID-KA
123800           C-OBJEKT-AKAADI
123900           GSOVER-VERSTAENDIGUNGSBEREICH
124000           KAIADI1-EINGABEBEREICH
124100           DUMMY
124200           DUMMY
124300           D-KAXIND-INDICES                                       D01
124400     END-CALL                                                     
124500     IF GSOVER-GEWICHT            >= C-GEW-HINWEIS
124600     THEN
124700       IF GSOVER-GEWICHT          < C-GEW-FEHLER
124800       THEN
124900         NEXT SENTENCE
125000       END-IF                                        
125100       PERFORM MELDUNG-IN-APDU-EINTRAGEN
125200       GO TO PROGRAMM-VERLASSEN
125300     END-IF 
125400     .                                                            
125500 AUFTRAG-AKAADI-1002.
125600     EXIT.                                                        
125700/                                                                 
125800 INIT-KADA-KAC4AP SECTION.                                        
125900 INIT-KADA-KAC4AP-1001.                                           
126000*---------------------------------------------------------------* 
126100* Initialisieren der aller KADA-Felder , Achtung bei PIC-9-Feldern
126200*---------------------------------------------------------------* 
126300*
126400     MOVE HIGH-VALUE              TO KAC4AP-EA-BEREICH            
126500     .                                                            
126600 INIT-KADA-KAC4AP-1002.                                           
126700     EXIT.                                                        
126800/
126900 MELDUNG-IN-APDU-EINTRAGEN SECTION.
127000 MELDUNG-IN-APDU-EINTRAGEN-1001.
127100*---------------------------------------------------------------*
127200* FEHLERMELDUNGEN UND HINWEISE (WARNINGS) EINSCHLIESSLICH
127300* EVTENTUELLER INSERT-TEXTE WERDEN AUS DEM
127400* MELDUNGS-POOL IN DEN APDU (HIER NUR S-FELDER) UEBERTRAGEN
127500*---------------------------------------------------------------*
127600*
127700     MOVE C-CI-MELDUNGEN          TO GSICI-INDIKATOR-MODUS
127800     MOVE ZERO                    TO GSICI-ANZAHL-INDICES
127900*
128000     CALL "CGSCI"
128100     USING C-CI-NACHRICHT-SCHREIBEN
128200           C-KONFIG-ID-KA 
128300           C-OBJEKT-CI-LINES
128400           GSOVER-VERSTAENDIGUNGSBEREICH
128500           GSICI-EINGABEBEREICH
128600           DUMMY
128700           DUMMY
128800     .
128900 MELDUNG-IN-APDU-EINTRAGEN-1002.
129000     EXIT.
129100/                                                                 
129200 PROGRAMM-VERLASSEN SECTION.                                      
129300 PROGRAMM-VERLASSEN-1001.                                         
129400*---------------------------------------------------------------*
129500* Verlassen des Programms ueber einen Ausstiegspunkt
129600*---------------------------------------------------------------*
129700* Mit Hilfe dieses Unterprogramms kann ein Auftrag ueber eine
129800* definierte Stelle verlassen werden.
129900* Dieses Unterprogramm muss anstelle von EXIT PROGRAMM aufgerufen
130000* werden.  
130100*---------------------------------------------------------------* 
130200                                                                  
130300     EXIT PROGRAM                                                 
130400     .                                                            
130500 PROGRAMM-VERLASSEN-1002.                                         
130600     EXIT                                                         
130700     .                                                            
130800 END PROGRAM AKAC4AP.                                              

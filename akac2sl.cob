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
000160*@Titel         : (CI)  Schliessung aendern
000160*@Elementname   : akac2sl.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20150107.094038
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
001000*@Title        : Schließung ändern                          *
001100* Verfasser    : Stefan Pötsch, Atos                        *
001200* Erstelldatum : 15.02.2012                                 *
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
002800* - Aufruf des KORDOBA-Auftrags AKA4OF, um mit Hilfe dieses *     
002900*   Auftrags die notwendigen Pruefungen durchzufuehren und  *     
003000*   bei fehlerfreier Pruefung die gewuenschte Verarbeitung  *     
003100*   durchzufuehren                                          *     
003200* - Fuellen des Ausgabe-Struktur (Daten und ggf. Fehler-    *     
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
004400* Im CI-Auftrag AKAC2SL werden keine eigenen Fehlermeldungen*     
004500* in den Meldungs-Pool eingetragen.                         *     
004600*@E-RETURNCODE                                              *     
004700*                                                           *     
004800*@A-ENTRY                                                   *     
004900* Entryname       : AKAC2SL                                 *     
005000*@E-ENTRY                                                   *     
005100*                                                           *     
005200*@A-MODUL                                                   *     
005300* Gerufene Moduln/Auftraege:                                *     
005400*                   CGSAUF                                  *     
005500*                   CGSCI                                   *     
005600*                   AKA4OF                                  *     
005700*@E-MODUL                                                   *     
005800*                                                           *     
005900*@A-COBOL-COPY                                              *     
006000* benoetigte COBOL-Copies:                                  *     
006100* DKAXIND : Konstantenstruktur fuer Indices                 *
006200* CGSOVER : allgemeiner Verstaendigungsbereich              *
006300* CGSICI  : Eingabebereich fuer CGSCI                       *
006400* CGSOCI  : Ausgabebereich fuer CGSCI                       *
006500* CKAI4OF2: Eingabestruktur fuer KORDOBA-Auftrag AKA4OF     *
006600* CKAC2SL : Verstaendigungsbereich CI-Auftrag - PC          *
006700*                                                           *
006800*@E-COBOL-COPY                                              *     
006900*                                                           *     
007000*@A-TABELLE                                                 *     
007100* TABEX-Tabellen  : entfaellt                               *     
007200*@E-TABELLE                                                 *     
007300*                                                           *     
007400*@A-BENUTZERSATZ                                            *     
007500* Benutzersaetze  : entfaellt                               *     
007600*@E-BENUTZERSATZ                                            *     
007700*                                                           *
007800*@A-DATEI                                                   *
007900* Dateien         : entfaellt                               *
008000*@E-DATEI                                                   *
008100*                                                           *     
008200*@A-KONVENTIONEN                                            *     
008300* - die MOVE-Anweisungen sind ausgerichtet.                 *     
008400* - die Sections sind alphabetisch geordnet                 *     
008500*@E-KONVENTIONEN                                            *     
008600*                                                           *     
008700*@A-DOKUMENT                                                *     
008800*                                                           *
008900* Die fachliche Beschreibung ist im Dokument                *     
009000* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *     
009100* hinterlegt.                                               *     
009200*@E-DOKUMENT                                                *
009300*                                                           *
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
100300 PROGRAM-ID. AKAC2SL.                                             
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
101650     05  FILLER PIC X(13) VALUE "ELEM=akac2sl ".                  CCC
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
102700     20 C-OBJEKT-AKA4OF           PIC X(020) VALUE "AKA4OF".
102800     20 C-CI-NACHRICHT-LESEN      PIC X(040) 
102900                                  VALUE "NACHRICHT-LESEN".
103000     20 C-CI-NACHRICHT-SCHREIBEN  PIC X(040)
103100                                  VALUE "NACHRICHT-SCHREIBEN".
103200     20 C-OBJEKT-CI-LINES         PIC X(020) VALUE "LINES".
103300     20 C-CI-MELDUNGEN            PIC X(001) VALUE "M".
103400     20 C-KAC2SL                  PIC X(008) VALUE "KAC2SL".
103500     20 C-RETCODE-END             PIC 9(004) COMP-5 VALUE 0.
103600     20 C-SET                     PIC X(006) VALUE "SET   ". 
103700/---------------------------------------------------------------*
103800* Konstanten    
103900*---------------------------------------------------------------*           
104000 01 AKAC2SL-KONSTANTEN.
104100    05 C-01-STD-SCH-FREI          PIC X(040) VALUE
104200                                  "01-STD-SCH-FREI".
104300    05 C-01-STD-SCH-ABLE          PIC X(040) VALUE
104400                                  "01-STD-SCH-ABLE".
104500    05 C-01-STD-SCH-AUFH          PIC X(040) VALUE
104600                                  "01-STD-SCH-AUFH".
104700    05 C-AUFH                     PIC X(001) VALUE "1".
104800    05 C-FREI                     PIC X(001) VALUE "2".
104900    05 C-ABLE                     PIC X(001) VALUE "3".
105000/---------------------------------------------------------------*
105100* Hilfsfelder                                                   *
105200*---------------------------------------------------------------*
105300 01 HILFSFELDER.
105400    05 H-ZAEHLER-ANZ              PIC 9(003).
105500/---------------------------------------------------------------*
105600* Meldungsgewichte                                              *
105700*---------------------------------------------------------------*
105800  COPY DCTGRCGE.
105900/---------------------------------------------------------------*
106000* LOCAL-STORAGE-Section         
106100*---------------------------------------------------------------*
106200 LOCAL-STORAGE SECTION.
106300/---------------------------------------------------------------*
106400* Allgemeiner Verstaendigungsbereich für Aufruf von Service-
106500* Funktionen         
106600*---------------------------------------------------------------*
106700  COPY CGSOVER.
106800/---------------------------------------------------------------*
106900* Eingabebereich fuer CGSCI         
107000*---------------------------------------------------------------*
107100  COPY CGSICI.
107200/---------------------------------------------------------------*
107300* Ausgabebereich fuer CGSCI         
107400*---------------------------------------------------------------*
107500  COPY CGSOCI.
107600/---------------------------------------------------------------*
107700* Eingabebereich aus AKAC2SL an AKA4OF
107800*---------------------------------------------------------------*
107900  COPY CKAI4OF2.  
108000/---------------------------------------------------------------*
108100* Ausgabebereich von AKA4OF an AKAC2SL
108200*---------------------------------------------------------------*
108300* dzt. keines
108400/---------------------------------------------------------------*
108500* Uebergabestruktur fuer Indices an KORDOBA-Auftrag
108600*---------------------------------------------------------------*
108700  COPY DKAXIND.   
108800/---------------------------------------------------------------*
108900* Aufruf von Service-Funktionen         
109000*---------------------------------------------------------------*
109100 01 DUMMY                         PIC X(001).
109200/---------------------------------------------------------------*
109300* Uebergabebereich von PC <-> CI-Auftrag         
109400*---------------------------------------------------------------*
109500  COPY CKAC2SL. 
109600/****************************************************************
109700 LINKAGE SECTION.
109800*****************************************************************
109900/---------------------------------------------------------------*
110000* CI-Steuerdaten         
110100*---------------------------------------------------------------*
110200  COPY CGSCISD.
110300*****************************************************************
110400 PROCEDURE DIVISION
110500     USING GSCI-STEUERDATEN.
110600                                                                  
110700 STEUER-AKAC2SL SECTION.                                           
110800 STEUER-AKAC2SL-1001.                                              
110900*---------------------------------------------------------------* 
111000* Programmsteuerung                                               
111100*---------------------------------------------------------------* 
111200* - Initialisieren Eingabebereich 
111300* - Fuellen der Index-Struktur                                    
111400* - APDU-Felder in Auftragsdatenbereich uebertragen               
111500* - Verarbeitung (rufen Auftrag AKA4OF)
111600*---------------------------------------------------------------*
111700     MOVE SPACE                   TO DUMMY 
111800     MOVE C-RETCODE-END           TO GSCI-ENDESTATUS
111900
112000*---------------------------------------------------------------* 
112100* Initialisieren der Eingabefelder der Uebergabestruktur          
112200*---------------------------------------------------------------* 
112300     PERFORM INIT-KADA-KAC2SL                                     
112400                                                                  
112500*---------------------------------------------------------------* 
112600* VERARBEITUNG                                                    
112700*---------------------------------------------------------------* 
112800* Schleißung ändern (Auftrag AKA4OF)
112900*---------------------------------------------------------------* 
113000* - APDU-Felder lesen
113100* - Aufruf KORDOBA-Auftrag, der die Verarbeitung der Daten
113200*   durchgefuehrt
113300* - APDU-Felder schreiben 
113400*---------------------------------------------------------------*
113500     EVALUATE GSCI-SERVICE                    
113600       WHEN C-SET
113700         PERFORM APDU-FELDER-LESEN                                             
113800         PERFORM AUFTRAG-AKA4OF
113900         PERFORM APDU-FELDER-SCHREIBEN
114000       WHEN OTHER                                             
114100         GO TO PROGRAMM-VERLASSEN
114200     END-EVALUATE
114300     .                                                            
114400 STEUER-AKAC2SL-1002.                                              
114500     GO TO PROGRAMM-VERLASSEN                                   
114600     .                                                            
114700/
114800 APDU-FELDER-LESEN SECTION.
114900 APDU-FELDER-LESEN-1001.
115000*
115100*---------------------------------------------------------------*
115200* Datenuebertragung von CI nach Hilfskada (KADA-KAC2SL)
115300*---------------------------------------------------------------*
115400*     
115500     MOVE C-KAC2SL                TO GSICI-NAME-KADA-BEREICH
115600     MOVE ZERO                    TO GSICI-ANZAHL-INDICES 
115700     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
115800     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS
115900                                  OF KAC2SL-EA-BEREICH
116000*     
116100     CALL "CGSCI"
116200     USING C-CI-NACHRICHT-LESEN
116300           C-KONFIG-ID-KA 
116400           C-OBJEKT-CI-LINES
116500           GSOVER-VERSTAENDIGUNGSBEREICH
116600           GSICI-EINGABEBEREICH
116700           DUMMY
116800           DUMMY
116900     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
117000     THEN
117100       PERFORM MELDUNG-IN-APDU-EINTRAGEN
117200       GO TO PROGRAMM-VERLASSEN
117300     END-IF 
117400     .        
117500 APDU-FELDER-LESEN-1002.
117600     EXIT.
117700/
117800 APDU-FELDER-SCHREIBEN SECTION.
117900 APDU-FELDER-SCHREIBEN-1001.
118000*
118100*---------------------------------------------------------------*
118200* Datenuebertragung von Hilfskada (KADA-KAC2SL) nach CI
118300*---------------------------------------------------------------*
118400*      
118500     MOVE C-KAC2SL                TO GSICI-NAME-KADA-BEREICH
118600     MOVE ZERO                    TO GSICI-ANZAHL-INDICES
118700     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
118800     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS 
118900                                  OF KAC2SL-EA-BEREICH
119000*     
119100     CALL "CGSCI"
119200     USING C-CI-NACHRICHT-SCHREIBEN
119300           C-KONFIG-ID-KA  
119400           C-OBJEKT-CI-LINES
119500           GSOVER-VERSTAENDIGUNGSBEREICH
119600           GSICI-EINGABEBEREICH
119700           DUMMY
119800           DUMMY
119900     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
120000     THEN
120100       PERFORM MELDUNG-IN-APDU-EINTRAGEN
120200       GO TO PROGRAMM-VERLASSEN
120300     END-IF 
120400     .        
120500 APDU-FELDER-SCHREIBEN-1002.
120600     EXIT.
120700/                                                                 
120800 AUFTRAG-AKA4OF SECTION.  
120900 AUFTRAG-AKA4OF-1001.    
121000*---------------------------------------------------------------* 
121100* APO ändern mit Hilfe vom KORDOBA-Auftrag
121200* AKA4OF
121300*---------------------------------------------------------------* 
121400*
121500     EVALUATE KAC2SL-E-FUNKTION
121600     WHEN     C-FREI
121700       MOVE C-01-STD-SCH-FREI     TO KAI4OF2-FUNKTION
121800     WHEN     C-ABLE
121900       MOVE C-01-STD-SCH-ABLE     TO KAI4OF2-FUNKTION
122000     WHEN     C-AUFH
122100       MOVE C-01-STD-SCH-AUFH     TO KAI4OF2-FUNKTION
122200     END-EVALUATE
122300*
122400     MOVE KAC2SL-E-SCHLIESSUNGSNR
122500       TO KAI4OF2-SCHLIESSUNGSNR
122600     MOVE KAC2SL-E-SCHLIESSUNG-BEMERK
122700       TO KAI4OF2-SCHLIESSUNG-BEMERK
122800*
122900     CALL "CGSAUF"
123000     USING C-AUF-AUFRUF-AL
123100           C-KONFIG-ID-KA
123200           C-OBJEKT-AKA4OF
123300           GSOVER-VERSTAENDIGUNGSBEREICH
123400           KAI4OF2-EINGABEBEREICH
123500           DUMMY 
123600           D-KAXIND-INDICES                                       D01
123700     END-CALL                                                     
123800     IF GSOVER-GEWICHT            >= C-GEW-HINWEIS
123900     THEN
124000       IF GSOVER-GEWICHT          < C-GEW-FEHLER
124100       THEN
124200         NEXT SENTENCE
124300       END-IF                                        
124400       PERFORM MELDUNG-IN-APDU-EINTRAGEN
124500       GO TO PROGRAMM-VERLASSEN
124600     END-IF 
124700     .                                                            
124800 AUFTRAG-AKA4OF-1002.
124900     EXIT.                                                        
125000/                                                                 
125100 INIT-KADA-KAC2SL SECTION.                                        
125200 INIT-KADA-KAC2SL-1001.                                           
125300*---------------------------------------------------------------* 
125400* Initialisieren der aller KADA-Felder , Achtung bei PIC-9-Feldern
125500*---------------------------------------------------------------* 
125600*
125700     MOVE HIGH-VALUE              TO KAC2SL-EA-BEREICH        
125800     .                                                            
125900 INIT-KADA-KAC2SL-1002.                                           
126000     EXIT.                                                        
126100/
126200 MELDUNG-IN-APDU-EINTRAGEN SECTION.
126300 MELDUNG-IN-APDU-EINTRAGEN-1001.
126400*---------------------------------------------------------------*
126500* FEHLERMELDUNGEN UND HINWEISE (WARNINGS) EINSCHLIESSLICH
126600* EVTENTUELLER INSERT-TEXTE WERDEN AUS DEM
126700* MELDUNGS-POOL IN DEN APDU (HIER NUR S-FELDER) UEBERTRAGEN
126800*---------------------------------------------------------------*
126900*
127000     MOVE C-CI-MELDUNGEN          TO GSICI-INDIKATOR-MODUS
127100     MOVE ZERO                    TO GSICI-ANZAHL-INDICES
127200*
127300     CALL "CGSCI"
127400     USING C-CI-NACHRICHT-SCHREIBEN
127500           C-KONFIG-ID-KA 
127600           C-OBJEKT-CI-LINES
127700           GSOVER-VERSTAENDIGUNGSBEREICH
127800           GSICI-EINGABEBEREICH
127900           DUMMY
128000           DUMMY
128100     .
128200 MELDUNG-IN-APDU-EINTRAGEN-1002.
128300     EXIT.
128400/                                                                 
128500 PROGRAMM-VERLASSEN SECTION.                                      
128600 PROGRAMM-VERLASSEN-1001.                                         
128700*---------------------------------------------------------------*
128800* Verlassen des Programms ueber einen Ausstiegspunkt
128900*---------------------------------------------------------------*
129000* Mit Hilfe dieses Unterprogramms kann ein Auftrag ueber eine
129100* definierte Stelle verlassen werden.
129200* Dieses Unterprogramm muss anstelle von EXIT PROGRAMM aufgerufen
129300* werden.  
129400*---------------------------------------------------------------* 
129500                                                                  
129600     EXIT PROGRAM                                                 
129700     .                                                            
129800 PROGRAMM-VERLASSEN-1002.                                         
129900     EXIT                                                         
130000     .                                                            
130100 END PROGRAM AKAC2SL.                                              

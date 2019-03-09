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
000160*@Titel         : (CI)  APO aendern
000160*@Elementname   : akac2ap.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20150107.094028
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
001000*@Title        : APO ändern                                 *
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
004400* Im CI-Auftrag AKAC2AP werden keine eigenen Fehlermeldungen*     
004500* in den Meldungs-Pool eingetragen.                         *     
004600*@E-RETURNCODE                                              *     
004700*                                                           *     
004800*@A-ENTRY                                                   *     
004900* Entryname       : AKAC2AP                                 *     
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
006500* CKAI4OF1: Eingabestruktur fuer KORDOBA-Auftrag AKA4OF     *
006600* CKAC2AP : Verstaendigungsbereich CI-Auftrag - PC          *
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
100300 PROGRAM-ID. AKAC2AP.                                             
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
101650     05  FILLER PIC X(13) VALUE "ELEM=akac2ap ".                  CCC
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
103400     20 C-KAC2AP                  PIC X(008) VALUE "KAC2AP".
103500     20 C-RETCODE-END             PIC 9(004) COMP-5 VALUE 0.
103600     20 C-SET                     PIC X(006) VALUE "SET   ". 
103700/---------------------------------------------------------------*
103800* Konstanten    
103900*---------------------------------------------------------------*           
104000 01 AKAC2AP-KONSTANTEN.
104100    05 C-01-STD-APO-AEN-BEM-FB    PIC X(040) VALUE
104200                                  "01-STD-APO-AEN-BEM-FB".
104300    05 C-1                        PIC 9(001) VALUE 1.
104400/---------------------------------------------------------------*
104500* Hilfsfelder                                                   *
104600*---------------------------------------------------------------*
104700 01 HILFSFELDER.
104800    05 H-ZAEHLER-ANZ              PIC 9(003).
104900/---------------------------------------------------------------*
105000* Meldungsgewichte                                              *
105100*---------------------------------------------------------------*
105200  COPY DCTGRCGE.
105300/---------------------------------------------------------------*
105400* LOCAL-STORAGE-Section         
105500*---------------------------------------------------------------*
105600 LOCAL-STORAGE SECTION.
105700/---------------------------------------------------------------*
105800* Allgemeiner Verstaendigungsbereich für Aufruf von Service-
105900* Funktionen         
106000*---------------------------------------------------------------*
106100  COPY CGSOVER.
106200/---------------------------------------------------------------*
106300* Eingabebereich fuer CGSCI         
106400*---------------------------------------------------------------*
106500  COPY CGSICI.
106600/---------------------------------------------------------------*
106700* Ausgabebereich fuer CGSCI         
106800*---------------------------------------------------------------*
106900  COPY CGSOCI.
107000/---------------------------------------------------------------*
107100* Eingabebereich aus AKAC2AP an AKA4OF
107200*---------------------------------------------------------------*
107300  COPY CKAI4OF1.  
107400/---------------------------------------------------------------*
107500* Ausgabebereich von AKA4OF an AKAC2AP
107600*---------------------------------------------------------------*
107700* dzt. keines
107800/---------------------------------------------------------------*
107900* Uebergabestruktur fuer Indices an KORDOBA-Auftrag
108000*---------------------------------------------------------------*
108100  COPY DKAXIND.   
108200/---------------------------------------------------------------*
108300* Aufruf von Service-Funktionen         
108400*---------------------------------------------------------------*
108500 01 DUMMY                         PIC X(001).
108600/---------------------------------------------------------------*
108700* Uebergabebereich von PC <-> CI-Auftrag         
108800*---------------------------------------------------------------*
108900  COPY CKAC2AP. 
109000/****************************************************************
109100 LINKAGE SECTION.
109200*****************************************************************
109300/---------------------------------------------------------------*
109400* CI-Steuerdaten         
109500*---------------------------------------------------------------*
109600  COPY CGSCISD.
109700*****************************************************************
109800 PROCEDURE DIVISION
109900     USING GSCI-STEUERDATEN.
110000                                                                  
110100 STEUER-AKAC2AP SECTION.                                           
110200 STEUER-AKAC2AP-1001.                                              
110300*---------------------------------------------------------------* 
110400* Programmsteuerung                                               
110500*---------------------------------------------------------------* 
110600* - Initialisieren Eingabebereich 
110700* - Fuellen der Index-Struktur                                    
110800* - APDU-Felder in Auftragsdatenbereich uebertragen               
110900* - Verarbeitung (rufen Auftrag AKA4OF)
111000*---------------------------------------------------------------*
111100     MOVE SPACE                   TO DUMMY 
111200     MOVE C-RETCODE-END           TO GSCI-ENDESTATUS
111300
111400*---------------------------------------------------------------* 
111500* Initialisieren der Eingabefelder der Uebergabestruktur          
111600*---------------------------------------------------------------* 
111700     PERFORM INIT-KADA-KAC2AP                                     
111800                                                                  
111900*---------------------------------------------------------------* 
112000* VERARBEITUNG                                                    
112100*---------------------------------------------------------------* 
112200* APO ändern (Auftrag AKA4OF)
112300*---------------------------------------------------------------* 
112400* - APDU-Felder lesen
112500* - Aufruf KORDOBA-Auftrag, der die Verarbeitung der Daten
112600*   durchgfuehrt
112700* - APDU-Felder schreiben 
112800*---------------------------------------------------------------*
112900     EVALUATE GSCI-SERVICE                    
113000       WHEN C-SET
113100         PERFORM APDU-FELDER-LESEN                                             
113200         PERFORM AUFTRAG-AKA4OF
113300         PERFORM APDU-FELDER-SCHREIBEN
113400       WHEN OTHER                                             
113500         GO TO PROGRAMM-VERLASSEN
113600     END-EVALUATE
113700     .                                                            
113800 STEUER-AKAC2AP-1002.                                              
113900     GO TO PROGRAMM-VERLASSEN                                   
114000     .                                                            
114100/
114200 APDU-FELDER-LESEN SECTION.
114300 APDU-FELDER-LESEN-1001.
114400*
114500*---------------------------------------------------------------*
114600* Datenuebertragung von CI nach Hilfskada (KADA-KAC2AP)
114700*---------------------------------------------------------------*
114800*     
114900     MOVE C-KAC2AP                TO GSICI-NAME-KADA-BEREICH
115000     MOVE ZERO                    TO GSICI-ANZAHL-INDICES 
115100     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
115200     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS
115300                                  OF KAC2AP-EA-BEREICH
115400*     
115500     CALL "CGSCI"
115600     USING C-CI-NACHRICHT-LESEN
115700           C-KONFIG-ID-KA 
115800           C-OBJEKT-CI-LINES
115900           GSOVER-VERSTAENDIGUNGSBEREICH
116000           GSICI-EINGABEBEREICH
116100           DUMMY
116200           DUMMY
116300     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
116400     THEN
116500       PERFORM MELDUNG-IN-APDU-EINTRAGEN
116600       GO TO PROGRAMM-VERLASSEN
116700     END-IF 
116800     .        
116900 APDU-FELDER-LESEN-1002.
117000     EXIT.
117100/
117200 APDU-FELDER-SCHREIBEN SECTION.
117300 APDU-FELDER-SCHREIBEN-1001.
117400*
117500*---------------------------------------------------------------*
117600* Datenuebertragung von Hilfskada (KADA-KAC2AP) nach CI
117700*---------------------------------------------------------------*
117800*      
117900     MOVE C-KAC2AP                TO GSICI-NAME-KADA-BEREICH
118000     MOVE ZERO                    TO GSICI-ANZAHL-INDICES
118100     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
118200     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS 
118300                                  OF KAC2AP-EA-BEREICH
118400*     
118500     CALL "CGSCI"
118600     USING C-CI-NACHRICHT-SCHREIBEN
118700           C-KONFIG-ID-KA  
118800           C-OBJEKT-CI-LINES
118900           GSOVER-VERSTAENDIGUNGSBEREICH
119000           GSICI-EINGABEBEREICH
119100           DUMMY
119200           DUMMY
119300     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
119400     THEN
119500       PERFORM MELDUNG-IN-APDU-EINTRAGEN
119600       GO TO PROGRAMM-VERLASSEN
119700     END-IF 
119800     .        
119900 APDU-FELDER-SCHREIBEN-1002.
120000     EXIT.
120100/                                                                 
120200 AUFTRAG-AKA4OF SECTION.  
120300 AUFTRAG-AKA4OF-1001.    
120400*---------------------------------------------------------------* 
120500* APO ändern mit Hilfe vom KORDOBA-Auftrag
120600* AKA4OF
120700*---------------------------------------------------------------* 
120800*
120900     MOVE C-01-STD-APO-AEN-BEM-FB TO KAI4OF1-FUNKTION
121000
121100*
121200     MOVE KAC2AP-E-ABSTIMMKREIS 
121300       TO KAI4OF1-ABSTIMMKREIS-NR   
121400     MOVE KAC2AP-E-HERKUNFT
121500       TO KAI4OF1-HERKUNFT 
121600     MOVE KAC2AP-E-KONTO-ID 
121700       TO KAI4OF1-KONTO-ID-ABSTIMM  
121800     MOVE KAC2AP-E-AUSZUGSDATUM 
121900       TO KAI4OF1-AUSZUGSDATUM 
122000     MOVE KAC2AP-E-AUSZUGSNUMMER 
122100       TO KAI4OF1-AUSZUGSNUMMER
122200     MOVE KAC2AP-E-AUSZUG-FNR 
122300       TO KAI4OF1-AUSZUG-FNR 
122400     MOVE KAC2AP-E-LFD-NR-APO 
122500       TO KAI4OF1-LFD-NR-APO 
122600
122700     MOVE KAC2AP-E-BEMERKUNG
122800       TO KAI4OF1-BEMERKUNG 
122900     MOVE KAC2AP-E-FACHBEREICH
123000       TO KAI4OF1-FACHBEREICH  
123100     MOVE KAC2AP-E-UPDC-APO 
123200       TO KAI4OF1-TIMESTAMP-BKAAPO
123300*    MOVE KAC2AP-E-UPDC-SCHLIESS
123400*      TO KAI4OF1-TIMESTAMP-BKAAPO
123500*
123600     CALL "CGSAUF"
123700     USING C-AUF-AUFRUF-AL
123800           C-KONFIG-ID-KA
123900           C-OBJEKT-AKA4OF
124000           GSOVER-VERSTAENDIGUNGSBEREICH
124100           KAI4OF1-EINGABEBEREICH
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
125500 AUFTRAG-AKA4OF-1002.
125600     EXIT.                                                        
125700/                                                                 
125800 INIT-KADA-KAC2AP SECTION.                                        
125900 INIT-KADA-KAC2AP-1001.                                           
126000*---------------------------------------------------------------* 
126100* Initialisieren der aller KADA-Felder , Achtung bei PIC-9-Feldern
126200*---------------------------------------------------------------* 
126300*
126400     MOVE HIGH-VALUE              TO KAC2AP-EA-BEREICH        
126500     .                                                            
126600 INIT-KADA-KAC2AP-1002.                                           
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
130800 END PROGRAM AKAC2AP.                                              

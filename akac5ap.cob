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
000160*@Titel         : (CI)  Detailauskunft Abstimmposition
000160*@Elementname   : akac5ap.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20150107.094003
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
001000*@Title        : Detailauskunft Abstimmposition             *
001100* Verfasser    : Stefan Pötsch, Atos                        *
001200* Erstelldatum : 11.02.2012                                 *
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
002800* - Aufruf des KORDOBA-Auftrags AKA5OF, um mit Hilfe dieses *     
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
004400* Im CI-Auftrag AKAC5AP werden keine eigenen Fehlermeldungen*     
004500* in den Meldungs-Pool eingetragen.                         *     
004600*@E-RETURNCODE                                              *     
004700*                                                           *     
004800*@A-ENTRY                                                   *     
004900* Entryname       : AKAC5AP                                 *     
005000*@E-ENTRY                                                   *     
005100*                                                           *     
005200*@A-MODUL                                                   *     
005300* Gerufene Moduln/Auftraege:                                *     
005400*                   CGSAUF                                  *     
005500*                   CGSCI                                   *     
005600*                   AKA5AP5OF                                  *     
005700*@E-MODUL                                                   *     
005800*                                                           *     
005900*@A-COBOL-COPY                                              *     
006000* benoetigte COBOL-Copies:                                  *     
006100* DKAXIND : Konstantenstruktur fuer Indices                 *
006200* CGSOVER : allgemeiner Verstaendigungsbereich              *
006300* CGSICI  : Eingabebereich fuer CGSCI                       *
006400* CGSOCI  : Ausgabebereich fuer CGSCI                       *
006500* CKAI5OF1: Eingabestruktur fuer KORDOBA-Auftrag AKA55OF    *
006600* CKAO5OF1: Ausgabestruktur von  KORDOBA-Auftrag AKA55OF    *
006700* CKAC5AP : Verstaendigungsbereich CI-Auftrag - PC          *
006800*                                                           *
006900*@E-COBOL-COPY                                              *     
007000*                                                           *     
007100*@A-TABELLE                                                 *     
007200* TABEX-Tabellen  : entfaellt                               *     
007300*@E-TABELLE                                                 *     
007400*                                                           *     
007500*@A-BENUTZERSATZ                                            *     
007600* Benutzersaetze  : entfaellt                               *     
007700*@E-BENUTZERSATZ                                            *     
007800*                                                           *
007900*@A-DATEI                                                   *
008000* Dateien         : entfaellt                               *
008100*@E-DATEI                                                   *
008200*                                                           *     
008300*@A-KONVENTIONEN                                            *     
008400* - die MOVE-Anweisungen sind ausgerichtet.                 *     
008500* - die Sections sind alphabetisch geordnet                 *     
008600*@E-KONVENTIONEN                                            *     
008700*                                                           *     
008800*@A-DOKUMENT                                                *     
008900*                                                           *
009000* Die fachliche Beschreibung ist im Dokument                *     
009100* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *     
009200* hinterlegt.                                               *     
009300*@E-DOKUMENT                                                *
009400*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050*                                                           *     D01
090051* D01 R49665                                                *     D01
090052*     Technische Anpassung an geänderten Struktur-Name im   *     D01
090053*     Copy DKAXIND.                                         *     D01
090054*     Datum: 10.08.2012                            NKZ: SUM *     D01
090055*                                                           *     D01
090056*                                                           *
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/                                                                 
100200 IDENTIFICATION DIVISION.                                         
100300 PROGRAM-ID. AKAC5AP.                                             
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
101650     05  FILLER PIC X(13) VALUE "ELEM=akac5ap ".                  CCC
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
102700     20 C-OBJEKT-AKA5OF           PIC X(020) VALUE "AKA5OF".
102800     20 C-CI-NACHRICHT-LESEN      PIC X(040) 
102900                                  VALUE "NACHRICHT-LESEN".
103000     20 C-CI-NACHRICHT-SCHREIBEN  PIC X(040)
103100                                  VALUE "NACHRICHT-SCHREIBEN".
103200     20 C-OBJEKT-CI-LINES         PIC X(020) VALUE "LINES".
103300     20 C-CI-MELDUNGEN            PIC X(001) VALUE "M".
103400     20 C-KAC5AP                  PIC X(008) VALUE "KAC5AP".
103500     20 C-RETCODE-END             PIC 9(004) COMP-5 VALUE 0.
103600     20 C-GET                     PIC X(006) VALUE "GET   ". 
103700/---------------------------------------------------------------*
103800* Konstanten    
103900*---------------------------------------------------------------*           
104000 01 AKAC5AP-KONSTANTEN.
104100    05 C-01-STD-APO-L-DET-AUSK    PIC X(040) VALUE
104200                                  "01-STD-APO-L-DET-AUSK".
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
107100* Eingabebereich aus AKAC5AP an AKA5OF
107200*---------------------------------------------------------------*
107300  COPY CKAI5OF1.  
107400/---------------------------------------------------------------*
107500* Ausgabebereich von AKAADI an AKAC5OF
107600*---------------------------------------------------------------*
107700  COPY CKAO5OF1.     
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
108900  COPY CKAC5AP. 
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
110100 STEUER-AKAC5AP SECTION.                                           
110200 STEUER-AKAC5AP-1001.                                              
110300*---------------------------------------------------------------* 
110400* Programmsteuerung                                               
110500*---------------------------------------------------------------* 
110600* - Initialisieren Eingabebereich 
110700* - Fuellen der Index-Struktur                                    
110800* - APDU-Felder in Auftragsdatenbereich uebertragen               
110900* - Verarbeitung (rufen Auftrag AKAADI)
111000*---------------------------------------------------------------*
111100     MOVE SPACE                   TO DUMMY 
111200     MOVE C-RETCODE-END           TO GSCI-ENDESTATUS
111300
111400*---------------------------------------------------------------* 
111500* Initialisieren der Eingabefelder der Uebergabestruktur          
111600*---------------------------------------------------------------* 
111700     PERFORM INIT-KADA-KAC5AP                                     
111800                                                                  
111900*---------------------------------------------------------------* 
112000* VERARBEITUNG                                                    
112100*---------------------------------------------------------------* 
112200* Detailauskunft (Auftrag AKA5OF)
112300*---------------------------------------------------------------* 
112400* - APDU-Felder lesen
112500* - Aufruf KORDOBA-Auftrag, der die Verarbeitung der Daten
112600*   durchgfuehrt
112700* - APDU-Felder schreiben 
112800*---------------------------------------------------------------*
112900     EVALUATE GSCI-SERVICE                    
113000       WHEN C-GET
113100         PERFORM APDU-FELDER-LESEN                                             
113200         PERFORM AUFTRAG-AKA5OF
113300         PERFORM APDU-FELDER-SCHREIBEN
113400       WHEN OTHER                                             
113500         GO TO PROGRAMM-VERLASSEN
113600     END-EVALUATE
113700     .                                                            
113800 STEUER-AKAC5AP-1002.                                              
113900     GO TO PROGRAMM-VERLASSEN                                   
114000     .                                                            
114100/
114200 APDU-FELDER-LESEN SECTION.
114300 APDU-FELDER-LESEN-1001.
114400*
114500*---------------------------------------------------------------*
114600* Datenuebertragung von CI nach Hilfskada (KADA-KAC5AP)
114700*---------------------------------------------------------------*
114800*     
114900     MOVE C-KAC5AP                TO GSICI-NAME-KADA-BEREICH
115000     MOVE ZERO                    TO GSICI-ANZAHL-INDICES 
115100     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
115200     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS
115300                                  OF KAC5AP-EA-BEREICH
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
117600* Datenuebertragung von Hilfskada (KADA-KAC5AP) nach CI
117700*---------------------------------------------------------------*
117800*      
117900     MOVE C-KAC5AP                TO GSICI-NAME-KADA-BEREICH
118000     MOVE ZERO                    TO GSICI-ANZAHL-INDICES
118100     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
118200     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS 
118300                                  OF KAC5AP-EA-BEREICH
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
120200 AUFTRAG-AKA5OF SECTION.  
120300 AUFTRAG-AKA5OF-1001.    
120400*---------------------------------------------------------------* 
120500* Schließung anlegen mit Hilfe vom KORDOBA-Auftrag
120600* AKA5OF
120700*---------------------------------------------------------------* 
120800*
120900     MOVE C-01-STD-APO-L-DET-AUSK TO KAI5OF1-FUNKTION
121000*
121100     MOVE KAC5AP-E-ABSTIMMKREIS
121200       TO KAI5OF1-ABSTIMMKREIS-NR
121300     MOVE KAC5AP-E-HERKUNFT
121400       TO KAI5OF1-HERKUNFT
121500     MOVE KAC5AP-E-KONTO-ID
121600       TO KAI5OF1-KONTO-ID-ABSTIMM
121700     MOVE KAC5AP-E-AUSZUGSDATUM
121800       TO KAI5OF1-AUSZUGSDATUM
121900     MOVE KAC5AP-E-AUSZUGSNUMMER
122000       TO KAI5OF1-AUSZUGSNUMMER
122100     MOVE KAC5AP-E-AUSZUG-FNR
122200       TO KAI5OF1-AUSZUG-FNR
122300     MOVE KAC5AP-E-LFD-NR-APO
122400       TO KAI5OF1-LFD-NR-APO
122500*
122600     CALL "CGSAUF"                                                
122700     USING C-AUF-AUFRUF-AL                                              
122800           C-KONFIG-ID-KA
122900           C-OBJEKT-AKA5OF
123000           GSOVER-VERSTAENDIGUNGSBEREICH
123100           KAI5OF1-EINGABEBEREICH
123200           KAO5OF1-AUSGABEBEREICH
123300           DUMMY 
123400           D-KAXIND-INDICES                                       D01
123500     END-CALL                                                     
123600*
123700     IF GSOVER-GEWICHT            >= C-GEW-HINWEIS
123800     THEN
123900       IF GSOVER-GEWICHT          < C-GEW-FEHLER
124000       THEN
124100         NEXT SENTENCE
124200       END-IF                                        
124300       PERFORM MELDUNG-IN-APDU-EINTRAGEN
124400       GO TO PROGRAMM-VERLASSEN
124500     END-IF 
124600*
124700     MOVE KAO5OF1-APO-ABSTIMMKREIS-NR
124800       TO KAC5AP-A-ABSTIMMKREIS
124900*
125000     MOVE KAO5OF1-APO-ABSTIMMKREIS-TYP 
125100       TO KAC5AP-A-ABSTIMMKREIS-TYP
125200     MOVE KAO5OF1-APO-STATUS 
125300       TO KAC5AP-A-STATUS
125400     MOVE KAO5OF1-APO-BEMERKUNG
125500       TO KAC5AP-A-BEMERKUNG 
125600     MOVE KAO5OF1-APO-FACHBEREICH 
125700       TO KAC5AP-A-FACHBEREICH
125800*
125900     MOVE KAO5OF1-APO-REF-NACHRICHT
126000       TO KAC5AP-A-REF-NACHRICHT 
126100     MOVE KAO5OF1-APO-TRANSAKTION-TYP 
126200       TO KAC5AP-A-TRANSAKTION-TYP
126300     MOVE KAO5OF1-APO-WAEHRUNG 
126400       TO KAC5AP-A-WAEHRUNG
126500     MOVE KAO5OF1-APO-BETRAG 
126600       TO KAC5AP-A-BETRAG
126700     MOVE KAO5OF1-APO-BUTAG 
126800       TO KAC5AP-A-BUTAG 
126900     MOVE KAO5OF1-APO-VALUTA 
127000       TO KAC5AP-A-VALUTA 
127100     MOVE KAO5OF1-APO-REF-KONTOFUEHRER 
127200       TO KAC5AP-A-REF-KONTOFUEHRER
127300     MOVE KAO5OF1-APO-REF-KONTOINH 
127400       TO KAC5AP-A-REF-KONTOINH  
127500     MOVE KAO5OF1-APO-ERG-TEXT 
127600       TO KAC5AP-A-ERG-TEXT
127700     MOVE KAO5OF1-APO-GV-CODE
127800       TO KAC5AP-A-GV-CODE 
127900     MOVE KAO5OF1-APO-ZUSATZ-TXT-SL 
128000       TO KAC5AP-A-ZUSATZ-TXT-SL
128100     MOVE KAO5OF1-APO-PRIMANOTA 
128200       TO KAC5AP-A-PRIMANOTA 
128300     MOVE KAO5OF1-APO-STORNO-KZ 
128400       TO KAC5AP-A-STORNO-KZ
128500     MOVE KAO5OF1-APO-TRANSAKTION-ID 
128600       TO KAC5AP-A-TRANSAKTION-ID 
128700     MOVE KAO5OF1-APO-TRANSAKTION-ID-FS 
128800       TO KAC5AP-A-TRANSAKTION-ID-FS 
128900     MOVE KAO5OF1-APO-ISIN 
129000       TO KAC5AP-A-ISIN 
129100     MOVE KAO5OF1-APO-NENNWERT 
129200       TO KAC5AP-A-NENNWERT 
129300     MOVE KAO5OF1-APO-GEGEN-KONTO-ID 
129400       TO KAC5AP-A-GEGEN
129500     MOVE KAO5OF1-APO-REMOTE-KONTO-ID 
129600       TO KAC5AP-A-REMOTE-KONTO-ID 
129700     MOVE KAO5OF1-APO-KONTO-ID-ORIG 
129800       TO KAC5AP-A-KONTO-ID-ORIG 
129900     MOVE KAO5OF1-APO-VERWENDUNGSZWECK 
130000       TO KAC5AP-A-VERWENDUNGSZWECK
130100*
130200     MOVE KAO5OF1-SCH-SCHLIESSUNGSNR
130300       TO KAC5AP-A-SCHLIESSUNGSNR 
130400     MOVE KAO5OF1-SCH-SCHLIESSUNGSART 
130500       TO KAC5AP-A-SCHLIESSUNGSART 
130600     MOVE KAO5OF1-SCH-SCHLIESSREGEL-NR 
130700       TO KAC5AP-A-SCHLIESSREGEL-NR 
130800     MOVE KAO5OF1-SCH-DIFF-ZULAESSIG  
130900       TO KAC5AP-A-DIFF-ZULAESSIG 
131000     MOVE KAO5OF1-SCH-DIFF-TATSAECHL  
131100       TO KAC5AP-A-DIFF-TATSAECHL 
131200*
131300     MOVE KAO5OF1-SCH-USER-SCHLIESS 
131400       TO KAC5AP-A-USER-ANLAGE 
131500     MOVE KAO5OF1-SCH-TIMESTAMP-SCHLIESS (1:8)
131600       TO KAC5AP-A-AN-TS-DATUM
131700     MOVE KAO5OF1-SCH-TIMESTAMP-SCHLIESS (9:6)
131800       TO KAC5AP-A-AN-TS-UHRZEIT 
131900
132000     MOVE KAO5OF1-SCH-USER-FREI
132100       TO KAC5AP-A-USER-FREI 
132200      MOVE KAO5OF1-SCH-TIMESTAMP-FREI    (1:8)
132300       TO KAC5AP-A-FR-TS-DATUM 
132400      MOVE KAO5OF1-SCH-TIMESTAMP-FREI    (9:6)
132500       TO KAC5AP-A-FR-TS-UHRZEIT
132600
132700     MOVE KAO5OF1-APO-USER-ABLEHN 
132800       TO KAC5AP-A-USER-ABLEHN 
132900     MOVE KAO5OF1-APO-TIMESTAMP-ABLEHN   (1:8)
133000       TO KAC5AP-A-AB-TS-DATUM
133100     MOVE KAO5OF1-APO-TIMESTAMP-ABLEHN   (9:6)
133200       TO KAC5AP-A-AB-TS-UHRZEIT
133300
133400     MOVE KAO5OF1-APO-USER-AUFHEBEN 
133500       TO KAC5AP-A-USER-AUFHEB  
133600     MOVE KAO5OF1-APO-TIMESTAMP-AUFHEBEN  (1:8)
133700       TO KAC5AP-A-AH-TS-DATUM
133800     MOVE KAO5OF1-APO-TIMESTAMP-AUFHEBEN  (9:6)
133900       TO KAC5AP-A-AH-TS-UHRZEIT
134000
134100     MOVE KAO5OF1-SCH-SCHLIESSUNG-BEMERK 
134200       TO KAC5AP-A-SCHLIESSUNG-BEMERK
134300*
134400     MOVE KAO5OF1-APO-TIMESTAMP-BKAAPO
134500       TO KAC5AP-A-UPDC-APO
134600*
134700     MOVE KAO5OF1-SCH-TIMESTAMP-BKASCH 
134800       TO KAC5AP-A-UPDC-SCHLIESS
134900
135000     MOVE KAO5OF1-BERECHTIGUNG
135100       TO KAC5AP-A-BERECHTIGUNG
135200     .                                                            
135300 AUFTRAG-AKA5OF-1002.
135400     EXIT.                                                        
135500/                                                                 
135600 INIT-KADA-KAC5AP SECTION.                                        
135700 INIT-KADA-KAC5AP-1001.                                           
135800*---------------------------------------------------------------* 
135900* Initialisieren der aller KADA-Felder , Achtung bei PIC-9-Feldern
136000*---------------------------------------------------------------* 
136100*
136200     MOVE HIGH-VALUE              TO KAC5AP-EA-BEREICH        
136300     .                                                            
136400 INIT-KADA-KAC5AP-1002.                                           
136500     EXIT.                                                        
136600/
136700 MELDUNG-IN-APDU-EINTRAGEN SECTION.
136800 MELDUNG-IN-APDU-EINTRAGEN-1001.
136900*---------------------------------------------------------------*
137000* FEHLERMELDUNGEN UND HINWEISE (WARNINGS) EINSCHLIESSLICH
137100* EVTENTUELLER INSERT-TEXTE WERDEN AUS DEM
137200* MELDUNGS-POOL IN DEN APDU (HIER NUR S-FELDER) UEBERTRAGEN
137300*---------------------------------------------------------------*
137400*
137500     MOVE C-CI-MELDUNGEN          TO GSICI-INDIKATOR-MODUS
137600     MOVE ZERO                    TO GSICI-ANZAHL-INDICES
137700*
137800     CALL "CGSCI"
137900     USING C-CI-NACHRICHT-SCHREIBEN
138000           C-KONFIG-ID-KA 
138100           C-OBJEKT-CI-LINES
138200           GSOVER-VERSTAENDIGUNGSBEREICH
138300           GSICI-EINGABEBEREICH
138400           DUMMY
138500           DUMMY
138600     .
138700 MELDUNG-IN-APDU-EINTRAGEN-1002.
138800     EXIT.
138900/                                                                 
139000 PROGRAMM-VERLASSEN SECTION.                                      
139100 PROGRAMM-VERLASSEN-1001.                                         
139200*---------------------------------------------------------------*
139300* Verlassen des Programms ueber einen Ausstiegspunkt
139400*---------------------------------------------------------------*
139500* Mit Hilfe dieses Unterprogramms kann ein Auftrag ueber eine
139600* definierte Stelle verlassen werden.
139700* Dieses Unterprogramm muss anstelle von EXIT PROGRAMM aufgerufen
139800* werden.  
139900*---------------------------------------------------------------* 
140000                                                                  
140100     EXIT PROGRAM                                                 
140200     .                                                            
140300 PROGRAMM-VERLASSEN-1002.                                         
140400     EXIT                                                         
140500     .                                                            
140600 END PROGRAM AKAC5AP.                                              

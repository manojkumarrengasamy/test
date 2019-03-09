000000* ELEMENTKOPF-COBOL-SOURCE **********************************     
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
000160*@Titel         : (CI)  Abstimmpositionen suchen
000160*@Elementname   : akac5al.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20150107.093937
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
001000*@Title        : Abstimmpositionen suchen                   *     
001100* VERFASSER    : Stefan Poetsch                             *     
001200* ERSTELLDATUM : 06.02.2012                                 *     
001400*                                                           *     
001500*@A-ELEMENTBESCHREIBUNG                                     *     
001600* Modul-Beschreibung:                                       *     
001700* Suchen von Abstimmpositionen nach definierten             *
001800* Suchkriterien Abstimmkreis-Typ und Status ggf. kombiniert *
001900* mit Abstimmkreis-Nummer, zuständiger Fachbereich, Betrag, *
002000* Buchungstag, Valuta, Zusatztextschlüssel, Primanota,      *
002100* ISIN, Schließungsnummer.                                  *
002200* Wenn die Schließungsnummer belegt ist, wird die           *
002300* AKA5OF-Funktion für das Lesen der APOs zur Schließung     *
002400* gerufen, ansonsten die Funktion für die APO-Suche         *
002500* über die variablen Suchkriterien.                         *
002600*                                                           *
002700* In diesem Programm werden folgende Verarbeitungsschritte  *     
002800* ausgefuehrt:                                              *     
002900* - Initialisieren aller Strukturen                         *     
003000* - Vorbelegen der Index-Struktur, um evtl. auftretende     *     
003100*   Fehler neben dem fehlerhaft erkannten Feld positionieren*     
003200*   zu koennen                                              *     
003300* - Uebernahme der Eingabe-Felder (Suchbegriffe) aus dem    *     
003400*   APDU in den Hilfs-KADA                                  *     
003500* - Aufruf des KORDOBA-Auftrags AKA5OF                      *     
003600* - Fuellen der Ausgabe-Struktur (Daten und ggf. Fehler oder*     
003700*   Quittungsmeldungen)                                     *     
003800* - Uebertragen der Felder aus dem Hilfs-KADA in den APDU   *     
003900*@E-ELEMENTBESCHREIBUNG                                     *     
004000*                                                           *     
004100*@A-FUNKTION-1                                              *     
004200*@E-FUNKTION-1                                              *     
004300*                                                           *     
004400*@A-MODULAUFRUF                                             *     
004500* Aufruf-Parameter: PRODECURE DIVISION                      *     
004600*                   USING GSCI-STEUERDATEN                  *     
004700*@E-MODULAUFRUF                                             *     
004800*                                                           *     
004900*@A-RETURNCODE                                              *     
005000* Meldungen/Returncodes:                                    *     
005100* ----------------------                                    *     
005200* Im CI-Auftrag AKAC5AL werden keine eigenen Fehlermeldungen*     
005300* in den Meldungspool eingetragen.                          *     
005400*@E-RETURNCODE                                              *     
005500*                                                           *     
005600*@A-ENTRY                                                   *     
005700* Entry-Name     : AKAC5AL                                  *     
005800*@E-ENTRY                                                   *     
005900*                                                           *     
006000*@A-MODUL                                                   *     
006100* GERUFENE MODULN/AUFTRAEGE:                                *     
006200*                  CGSCI                                    *     
006300*                  CGSAUF                                   *     
006400*@E-MODUL                                                   *     
006500*                                                           *     
006600*@A-COBOL-COPY                                              *     
006700* Benoetigte COBOL-Copies:                                  *     
006800* CGSOMEL    : AUSGABEBEREICH F. CGSMEL-AUFRUFE             *     
006900* CGSTMEL    : TRANSIENTER BEREICH F. CGSMEL-AUFRUFE        *     
007000* DCTGRCGE   : RETURNCODE GEWICHTE                          *     
007100* CGSOVER    : VERSTAENDIGUNGSBEREICH                       *     
007200* CGSICI     : EINGABEBEREICH FUER CGSCI-AUFRUFE            *     
007300* CGSOCI     : AUSGABEBEREICH FUER CGSCI-AUFRUFE            *     
007400* CKAC5AL    : CI-KADA                                      *     
007500* CKAO5OF2   : AUSGABEBEREICH AKA5OF                        *     
007600* CKAI5OF2   : EINGABEBEREICH AKA5OF                        *     
007700* CKAI5OF3   : EINGABEBEREICH AKA5OF                        *     
007800* CKAT5OF1   : TRANSIENTER-BEREICH AKA5OF (Kontext)         *     
007900* DKAXIND    : INDICES AKA5OF                               *     
008000* CGSCISD    : CI-Steuerdaten                               *     
008100*@E-COBOL-COPY                                              *     
008200*                                                           *     
008300*@A-TABELLE                                                 *     
008400*@E-TABELLE                                                 *     
008500*                                                           *     
008600*@A-BENUTZERSATZ                                            *     
008700*                                                           *     
008800*@E-BENUTZERSATZ                                            *     
008900*                                                           *     
009000*@A-DATEI                                                   *     
009100*@E-DATEI                                                   *     
009200*                                                           *     
009300*@A-KONVENTIONEN                                            *     
009400*@E-KONVENTIONEN                                            *     
009500*                                                           *     
009600*@A-DOKUMENT                                                *     
009700* Die Beschreibung ist im Dokument                          *
009800* C24_K12.01_DVG_Kontoabstimmung.docx hinterlegt.           *     
009900*@E-DOKUMENT                                                *     
010000*                                                           *     
090000* AENDERUNGSPROTOKOLL:                                      *     
090050* --------------------                                      *     
090051*                                                           *     A01
090052*  A01 BEZUG: R50403                                        *     A01
090053*      C-RETCODE-MORE für Blättern tatsächlich absetzen     *     A01
090054*      DATUM: 30.08.2012                            NKZ:TRO *     A01
090055*                                                           *     A01
090056* D02 R58134:  CR-Ticket 172088                             *     D02
090057*     Bei entsprechend gesetztem Installationsparameter     *     D02
090058*     werden nur diejenigen Abstimmposten als "freigebbar"  *     D02
090059*     angezeigt, welche nicht vom aktiven Benutzer geschlos-*     D02
090060*     sen wurden (Vorwegnahme des 4-Augen-Prinzips)         *     D02
090061*     Datum: 29.04.2013                            NKZ: TRO *     D02
090062*                                                           *     D02
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ******************************************     
100100/                                                                 
100200 IDENTIFICATION DIVISION.                                         
100300 PROGRAM-ID. AKAC5AL.                                             
100400 ENVIRONMENT DIVISION.                                            
100500 CONFIGURATION SECTION.                                           
100600 SPECIAL-NAMES.                                                   
100700     DECIMAL-POINT                IS COMMA.                       
100800 DATA DIVISION.                                                   
100900*---------------------------------------------------------------* 
101000* WORKING-STORAGE-Section                                       * 
101100*---------------------------------------------------------------* 
101200 WORKING-STORAGE SECTION.                                         
101300*---------------------------------------------------------------* 
101400* PLATZHALTER FUER VERSIONSINFORMATIONEN                        * 
101500*---------------------------------------------------------------* 
101600 01  VERS-INF.                                                    CCC
101650     05  FILLER PIC X(13) VALUE "ELEM=akac5al ".                  CCC
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
102700     20 C-OBJEKT-AUF-AKA5OF       PIC X(020) VALUE "AKA5OF".      
102800     20 C-CI-NACHRICHT-LESEN      PIC X(040)                      
102900                                  VALUE "NACHRICHT-LESEN".        
103000     20 C-CI-NACHRICHT-SCHREIBEN  PIC X(040)                      
103100                                  VALUE "NACHRICHT-SCHREIBEN".    
103200     20 C-CI-KONTEXT-BEREICH-LESEN
103300                                  PIC X(040)                      
103400                                  VALUE "KONTEXT-BEREICH-LESEN".  
103500     20 C-CI-KONTEXT-BEREICH-SCHREIBEN
103600                                  PIC X(040) VALUE                
103700                                  "KONTEXT-BEREICH-SCHREIBEN".    
103800     20 C-OBJEKT-CI-LINES         PIC X(020) VALUE "LINES".       
103900     20 C-OBJEKT-CI-KONTEXT       PIC X(020) VALUE "KONTEXT".     
104000     20 C-KAC5AL                  PIC X(006) VALUE "KAC5AL".      
104100     20 C-RETCODE-END             PIC 9(004) COMP-5 VALUE 0.      
104200     20 C-RETCODE-MORE            PIC 9(004) COMP-5 VALUE 1.      
104300     20 C-RETCODE-END-NO-RESET    PIC 9(004) COMP-5 VALUE 4.      
104400     20 C-CI-NEU-ANLEGEN          PIC X(001) VALUE "N".           
104500     20 C-CI-AKTUALISIEREN        PIC X(001) VALUE "A".           
104600     20 C-BEGINR                  PIC X(006) VALUE "BEGINR".      
104700     20 C-MORE                    PIC X(006) VALUE "MORE".        
104800     20 C-NEIN                    PIC X(001) VALUE "N".           
104900     20 C-JA                      PIC X(001) VALUE "J".           
105000     20 C-MCGS1704                PIC X(006) VALUE "GS1704".      
105100     20 C-1                       PIC 9(004) COMP-5 VALUE 1.      
105200 01 REST-KONST.                                                   
105300     20 C-J                       PIC X      VALUE "J".           
105400     20 C-N                       PIC X      VALUE "N".           
105500     20 C-ANZ-TREFFER             PIC 9(003) VALUE 100.           
105600/---------------------------------------------------------------* 
105700* Meldungsgewichte                                              * 
105800*---------------------------------------------------------------* 
105900  COPY DCTGRCGE.                                                  
106000*---------------------------------------------------------------* 
106100*  FELDINDIZES FUER FELDMARKIERUNG BEI FEHLERAUSGABEN           * 
106200*---------------------------------------------------------------* 
106300  COPY DKAXIND.  
106400*---------------------------------------------------------------* 
106500* Verstaendigungsbereich AKA5OF                                 * 
106600*---------------------------------------------------------------* 
106700 01 C-01-STD-APO-LIST-Z-SCH       PIC X(040)                      
106800                                  VALUE  "01-STD-APO-LIST-Z-SCH". 
106900 01 C-01-STD-APO-LIST-SUCHE       PIC X(040)                      
107000                                  VALUE  "01-STD-APO-LIST-SUCHE". 
107100/---------------------------------------------------------------* 
107200* LOCAL-STORAGE-Section                                           
107300*---------------------------------------------------------------* 
107400 LOCAL-STORAGE SECTION.                                           
107500/---------------------------------------------------------------* 
107600* Allgemeiner Verstaendigungsbereich fuer Aufruf von Service-     
107700* Funktionen                                                      
107800*---------------------------------------------------------------* 
107900  COPY CGSOVER.                                                   
108000/---------------------------------------------------------------* 
108100* Eingabebereich fuer CGSCI                                       
108200*---------------------------------------------------------------* 
108300  COPY CGSICI.                                                    
108400/---------------------------------------------------------------* 
108500* Ausgabebereich fuer CGSCI                                       
108600*---------------------------------------------------------------* 
108700  COPY CGSOCI.                                                    
108800/---------------------------------------------------------------*
108900* Copy fuer Indices
109000*---------------------------------------------------------------*
109100  COPY CKAXIND.
109200/---------------------------------------------------------------* 
109300* Hilfsvariable                                                   
109400*---------------------------------------------------------------* 
109500 01 DUMMY                         PIC X(001).                     
109600 01 H-FLAG-SATZ-VORHANDEN         PIC X(001).                     
109700 01 KZ-WEITER                     PIC X(001).                     
109800 01 H-LAENGE-VWZWECK              PIC 9(003).                     
109900 01 H-INDEX                       PIC 9(003) COMP-3.              
110000 01 H-ZAEHLER                     PIC 9(003).                     
110100/---------------------------------------------------------------* 
110200* CI-KADA                                                         
110300*---------------------------------------------------------------* 
110400  COPY CKAC5AL.                                                   
110500/---------------------------------------------------------------* 
110600* Auftragsdatenbereiche                                         * 
110700*---------------------------------------------------------------* 
110800 COPY CKAI5OF2.       
110900 COPY CKAI5OF3.       
111000 COPY CKAO5OF2.       
111100/---------------------------------------------------------------* 
111200* Kontextbereich (FUER MORE)                                      
111300*---------------------------------------------------------------* 
111400 01 AKAC5AL-KONTEXT-BEREICH.                                      
111500    COPY CKAT5OF1 REPLACING 01 BY 05, ==(01)== BY ==(01)==.           
111600       
111700/**************************************************************** 
111800 LINKAGE SECTION.                                                 
111900***************************************************************** 
112000/---------------------------------------------------------------* 
112100* CI-Steuerdaten                                                  
112200*---------------------------------------------------------------* 
112300  COPY CGSCISD.                                                   
112400 PROCEDURE DIVISION USING GSCI-STEUERDATEN.                       
112500***************************************************************** 
112600*---------------------------------------------------------------* 
112700* PROGRAMMSTEUERUNG                                               
112800*---------------------------------------------------------------* 
112900* Die Steuerdaten haben folgende Werte:                           
113000* beim ersten Aufruf:                                             
113100* - GSICI-SERVICE: "MORE"                                         
113200* - GSICI-ACTION : "BEGINR"                                       
113300* Folgende Verarbeitungsschritte werden durchgefuehrt:            
113400* - Initialisieren der Eingabe-Felder               
113500* - Vorbelegungen durchfuehren                                    
113600* - APDU-Felder mit Hilfe von CGSCI in Auftragsdaten-Bereich      
113700*   uebertragen. Hierfuer muessen die Felder                      
113800*   - GSICI-NAME-KADA-BEREICH sowie                               
113900*   - GSICI-PTR-KADA-BEREICH                                      
114000*   entsprechend belegt werden.                                   
114100*---------------------------------------------------------------* 
114200 STEUER-AKAC5AL SECTION.                                          
114300 STEUER-AKAC5AL-1001.                                             
114400*---------------------------------------------------------------* 
114500* Initialisierungen                                               
114600*---------------------------------------------------------------* 
114700     MOVE SPACE                   TO DUMMY
114800     MOVE C-RETCODE-END           TO GSCI-ENDESTATUS
114900*
115000     PERFORM INIT-AKAC5AL                                         
115100     PERFORM FUELLEN-INDEX-STRUKT                                 
115200     PERFORM INIT-KONTEXT-BEREICH
115300*
115400*---------------------------------------------------------------* 
115500* VERARBEITUNG                                                    
115600*---------------------------------------------------------------* 
115700     EVALUATE GSCI-AKTION                                         
115800     WHEN C-BEGINR                                                
115900*---------------------------------------------------------------* 
116000* - CI-KADA Initialisieren                                        
116100* - APDU-Felder lesen                                             
116200*---------------------------------------------------------------* 
116300        PERFORM INIT-KADA-KAC5AL-E-BEREICH                        
116400        PERFORM APDU-FELDER-LESEN                                 
116500*---------------------------------------------------------------* 
116600* - Aufruf KORDOBA-Auftrag:                                     * 
116700*   - Verarbeitung der Daten                                    * 
116800*   - APDU-Felder schreiben                                     * 
116900*   - (Kontext mit APDU-Daten versorgen und schreiben)          * 
117000*---------------------------------------------------------------* 
117100        PERFORM VERARBEITUNG-LISTE                                
117200     WHEN C-MORE                                                  
117300*---------------------------------------------------------------* 
117400* - CI-KADA Initialisieren                                        
117500* - Kontext lesen u. Aufsetzpunkt übertragen                      
117600* - APDU-Felder lesen                                             
117700*---------------------------------------------------------------* 
117800        PERFORM INIT-KADA-KAC5AL-E-BEREICH                        
117900        PERFORM KONTEXT-LESEN                                     
118000        PERFORM AUFSETZPUNKT-UEBERTRAGEN                          
118100        PERFORM APDU-FELDER-LESEN                                 
118200*---------------------------------------------------------------* 
118300* - Aufruf KORDOBA-Auftrag:                                     * 
118400*   - Verarbeitung der Daten                                    * 
118500*   - APDU-Felder schreiben                                     * 
118600*   - (Kontext mit APDU-Daten versorgen und schreiben)          * 
118700*---------------------------------------------------------------* 
118800        PERFORM VERARBEITUNG-LISTE                                
118900     WHEN OTHER                                                   
119000        GO TO PROGRAMM-VERLASSEN                                  
119100     END-EVALUATE                                                 
119200     .                                                            
119300 STEUER-AKAC5AL-1002.                                             
119400     GO TO PROGRAMM-VERLASSEN                                     
119500     .                                                            
119600/                                                                 
119700 INIT-AKAC5AL SECTION.                                            
119800 INIT-AKAC5AL-1001.                                               
119900*---------------------------------------------------------------* 
120000* Init-Werte belegen                                              
120100*---------------------------------------------------------------* 
120200     MOVE C-RETCODE-END           TO GSCI-ENDESTATUS              
120300     MOVE LOW-VALUE               TO H-FLAG-SATZ-VORHANDEN        
120400     .                                                            
120500 INIT-AKAC5AL-1002.                                               
120600     EXIT                                                         
120700     .                                                            
120800/                                                                 
120900 FUELLEN-INDEX-STRUKT SECTION.
121000 FUELLEN-INDEX-STRUKT-1001.
121100*---------------------------------------------------------------*
121200* Uebergabe der Index-Konstanten an Uebergabestruktur -> Auftrag
121300*---------------------------------------------------------------*
121400* Mit Hilfe dieser Section werden die Indices aus dem 
121500* Konstanten-Copy in die Uebergabestruktur fuer den KORDOBA-
121600* Auftrag uebertragen.
121700*---------------------------------------------------------------*
121800*
121900     MOVE D-KAXIND-INDICES        TO KAXIND-INDICES
122000     .
122100 FUELLEN-INDEX-STRUKT-1002.
122200     EXIT
122300     .
122400/
122500 INIT-KADA-KAC5AL-E-BEREICH SECTION.                              
122600 INIT-KADA-KAC5AL-E-BEREICH-1001.                                 
122700*---------------------------------------------------------------* 
122800* In dieser Section wird der Uebergabe-Bereich des CI-KADA      * 
122900* initialisiert                                                 * 
123000*---------------------------------------------------------------* 
123100     MOVE HIGH-VALUE              TO KAC5AL-E-BEREICH
123200     .                                                            
123300 INIT-KADA-KAC5AL-E-BEREICH-1002.                                 
123400     EXIT                                                         
123500     .                                                            
123600/
123700 INIT-KONTEXT-BEREICH SECTION.
123800 INIT-KONTEXT-BEREICH-1001.
123900*---------------------------------------------------------------*
124000* In dieser Section wird der Kontext-Bereich initialisiert.
124100*---------------------------------------------------------------*
124200     INITIALIZE KAT5OF1-TRANSIENT-BEREICH
124300     .
124400 INIT-KONTEXT-BEREICH-1002.
124500     EXIT.
124600/                                                                 
124700 APDU-FELDER-LESEN SECTION.                                       
124800 APDU-FELDER-LESEN-1001.                                          
124900*                                                                 
125000*---------------------------------------------------------------* 
125100* Datenuebertragung von CI nach Hilfskada (KADA-KAC5AL)           
125200*---------------------------------------------------------------* 
125300*                                                                 
125400     MOVE ZERO                    TO GSICI-ANZAHL-INDICES         
125500     MOVE C-KAC5AL                TO GSICI-NAME-KADA-BEREICH      
125600     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS
125700     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS OF                   
125800                                  KAC5AL-EA-BEREICH               
125900*                                                                 
126000     CALL "CGSCI"                                                 
126100     USING C-CI-NACHRICHT-LESEN                                   
126200           C-KONFIG-ID-KA                                         
126300           C-OBJEKT-CI-LINES                                      
126400           GSOVER-VERSTAENDIGUNGSBEREICH                          
126500           GSICI-EINGABEBEREICH                                   
126600           DUMMY                                                  
126700           DUMMY                                                  
126800*                                                                 
126900     IF GSOVER-GEWICHT            > C-GEW-WARNUNG                 
127000     THEN                                                         
127100        PERFORM MELDUNG-IN-APDU-EINTRAGEN                         
127200        GO TO PROGRAMM-VERLASSEN                                  
127300     END-IF                                                       
127400     .                                                            
127500 APDU-FELDER-LESEN-1002.                                          
127600     EXIT                                                         
127700     .                                                            
127800/                                                                 
127900 APDU-FELDER-SCHREIBEN SECTION.                                   
128000 APDU-FELDER-SCHREIBEN-1001.                                      
128100*---------------------------------------------------------------* 
128200* Datenuebertragung von Hilfskada (KADA-KAC5AL) nach CI           
128300*---------------------------------------------------------------* 
128400*                                                                 
128500     MOVE ZERO                    TO GSICI-ANZAHL-INDICES         
128600     MOVE C-KAC5AL                TO GSICI-NAME-KADA-BEREICH      
128700     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS        
128900     SET GSICI-PTR-KADA-BEREICH   TO ADDRESS OF                   
129000                                  KAC5AL-EA-BEREICH               
129100*                                                                 
129200     CALL "CGSCI"                                                 
129300     USING C-CI-NACHRICHT-SCHREIBEN                               
129400           C-KONFIG-ID-KA                                         
129500           C-OBJEKT-CI-LINES                                      
129600           GSOVER-VERSTAENDIGUNGSBEREICH                          
129700           GSICI-EINGABEBEREICH                                   
129800           DUMMY                                                  
129900           DUMMY                                                  
130000*                                                                 
130100     IF GSOVER-GEWICHT            > C-GEW-WARNUNG                 
130200     THEN                                                         
130300        GO TO PROGRAMM-VERLASSEN                                  
130400     END-IF                                                       
130500* KENNZEICHEN FUER SATZ VORHANDEN                                 
130600     MOVE HIGH-VALUE              TO H-FLAG-SATZ-VORHANDEN        
130700     .                                                            
130800 APDU-FELDER-SCHREIBEN-1002.                                      
130900     EXIT                                                         
131000     .                                                            
131100/                                                                 
131200 VERARBEITUNG-LISTE SECTION.                                      
131300 VERARBEITUNG-LISTE-1001.                                         
131400*                                                                 
131500*---------------------------------------------------------------* 
131600* In dieser Section wird der KORDOBA-Auftrag AKA5OF aufgerufen.
131700* Dieser liefert bis zu 200 Treffer, die in einer Schleife
131800* in den APDU-Bereich gestellt werden, bis dieser vollstaendig
131900* gefuellt ist
132000*---------------------------------------------------------------* 
132100*                                                                 
132200     PERFORM VERSORG-KADA-AKA5OF                                  
132300     PERFORM AUFTRAG-AKA5OF                                       
132400     IF KAO5OF2-IND-LETZT NOT = ZERO                              
132500     THEN                                                         
132600*    zumindest ein Satz vorhanden --> Ausgabe in APDU             
132700       IF KAO5OF2-IND-LETZT = C-ANZ-TREFFER                       
132800       THEN                                                       
132900*        so viele Treffer, wie angefordert
133000         MOVE C-RETCODE-MORE      TO GSCI-ENDESTATUS              
133100         MOVE KAO5OF2-IND-LETZT   TO H-INDEX                      
133200         PERFORM KONTEXT-VERSORGEN                                
133300         PERFORM KONTEXT-SCHREIBEN                                
133400         MOVE KAO5OF2-IND-LETZT   TO H-ZAEHLER                    
133500         SUBTRACT C-1             FROM H-ZAEHLER                  
133600       ELSE
133700*        weniger Treffer als angefordert
133800         MOVE KAO5OF2-IND-LETZT   TO H-ZAEHLER                    
133900       END-IF                                                     
134000*
134100       MOVE C-JA                  TO KZ-WEITER                    
134200       MOVE 1                     TO H-INDEX                      
134300       PERFORM WITH TEST BEFORE UNTIL                             
134400                                KZ-WEITER = C-NEIN                
134500                                OR                                
134600                                H-INDEX >  H-ZAEHLER              
134700         PERFORM VERSORG-KADA-AKAC5AL-L                           
134800         PERFORM APDU-FELDER-SCHREIBEN                            
134900*        Kapazitaet des APDU erschoepft?                          
135000         IF GSOVER-RETURNCODE = C-MCGS1704                        
135100         THEN                                                     
135200*          DER AKTUELLE SATZ KONNTE !! NICHT!! MEHR IN DEN APDU   
135300*          GESTELLT WERDEN                                        
135400*          --> Der  Satz davor ist der Aufsetzsatz                
135500           MOVE C-NEIN            TO KZ-WEITER                    
135600           MOVE C-RETCODE-MORE    TO GSCI-ENDESTATUS              
135700           PERFORM KONTEXT-VERSORGEN                              
135800           PERFORM KONTEXT-SCHREIBEN                              
135900         ELSE                                                     
136000           ADD 1 TO H-INDEX                                       
136100         END-IF                                                   
136200       END-PERFORM                                                
136300     END-IF                                                       
136400     .                                                            
136500 VERARBEITUNG-LISTE-1002.                                         
136600     EXIT                                                         
136700     .                                                            
136800/                                                                 
136900 VERSORG-KADA-AKA5OF SECTION.                                     
137000 VERSORG-KADA-AKA5OF-1001.                                        
137100*---------------------------------------------------------------* 
137200* Versorgung der Eingabe-Felder FUER LISTE                        
137300*---------------------------------------------------------------* 
137400     MOVE HIGH-VALUE              TO KAI5OF3-EINGABEBEREICH       
137500*
137600     IF KAC5AL-E-SCHLIESSUNGSNR   NOT NUMERIC                     
137700     THEN                                                         
137800*      Dynamische Suche
137900       MOVE C-01-STD-APO-LIST-SUCHE                               
138000         TO KAI5OF3-FUNKTION                                      
138100*                                                                 
138200       MOVE C-ANZ-TREFFER         TO KAI5OF3-ANF-ANZ-TREFFER      
138300*                                                                 
138400       IF GSCI-AKTION = C-MORE                                    
138500       THEN                                                       
138600* FOLGEAUFRUF IN NEUER TRANSAKTION                                
138700          MOVE C-J                                                
138800            TO KAI5OF3-ANF-KZ-AUFSETZ-ZUGRIFF                     
138900       ELSE                                                       
139000* ERSTAUFRUF IN NEUER TRANSAKTION                                 
139100          MOVE C-N                                                
139200            TO KAI5OF3-ANF-KZ-AUFSETZ-ZUGRIFF                     
139300       END-IF                                                     
139400*
139500       MOVE HIGH-VALUE            TO KAI5OF3-SELEKTION-OF         
139600*      Pflichtfelder
139700       MOVE KAC5AL-E-ABSTIMMKREIS-TYP                             
139800         TO KAI5OF3-S-ABSTIMMKREIS-TYP                            
139900       MOVE KAC5AL-E-STATUS       TO KAI5OF3-S-STATUS             
140000*      optionale Felder                                           
140100       IF KAC5AL-E-ABSTIMMKREIS   NUMERIC
140200       THEN
140300         MOVE KAC5AL-E-ABSTIMMKREIS
140400           TO KAI5OF3-S-ABSTIMMKREIS-NR
140500       END-IF
140600       IF KAC5AL-E-FACHBEREICH    NOT = HIGH-VALUE
140700       THEN
140800         MOVE KAC5AL-E-FACHBEREICH
140900           TO KAI5OF3-S-FACHBEREICH
141000       END-IF
141100       IF KAC5AL-E-BETRAG         NUMERIC
141200       THEN
141300         MOVE KAC5AL-E-BETRAG     TO KAI5OF3-S-BETRAG
141400       END-IF
141500       IF KAC5AL-E-BUTAG          NUMERIC
141600       THEN
141700         MOVE KAC5AL-E-BUTAG      TO KAI5OF3-S-BUTAG
141800       END-IF
141900       IF KAC5AL-E-VALUTA         NUMERIC
142000       THEN
142100         MOVE KAC5AL-E-VALUTA     TO KAI5OF3-S-VALUTA
142200       END-IF
142300       IF KAC5AL-E-ZUSATZ-TXT-SL  NUMERIC
142400       THEN
142500         MOVE KAC5AL-E-ZUSATZ-TXT-SL
142600           TO KAI5OF3-S-ZUSATZ-TYT-SL
142700       END-IF
142800       IF KAC5AL-E-PRIMANOTA      NUMERIC
142900       THEN
143000         MOVE KAC5AL-E-PRIMANOTA  TO KAI5OF3-S-PRIMANOTA
143100       END-IF
143200       IF KAC5AL-E-ISIN           NOT = HIGH-VALUE
143300       THEN
143400         MOVE KAC5AL-E-ISIN       TO KAI5OF3-S-ISIN
143500       END-IF
143600     ELSE
143700*    Bereitstellen APOs zu einer Schließung
143800       MOVE C-01-STD-APO-LIST-Z-SCH
143900         TO KAI5OF2-FUNKTION
144000*                                                                 
144100       MOVE C-ANZ-TREFFER         TO KAI5OF2-ANF-ANZ-TREFFER      
144200*                                                                 
144300       IF GSCI-AKTION = C-MORE                                    
144400       THEN                                                       
144500* FOLGEAUFRUF IN NEUER TRANSAKTION                                
144600          MOVE C-J                                                
144700            TO KAI5OF2-ANF-KZ-AUFSETZ-ZUGRIFF                     
144800       ELSE                                                       
144900* ERSTAUFRUF IN NEUER TRANSAKTION                                 
145000          MOVE C-N                                                
145100            TO KAI5OF2-ANF-KZ-AUFSETZ-ZUGRIFF                     
145200       END-IF                                                     
145300*
145400       MOVE KAC5AL-E-ABSTIMMKREIS-TYP
145500         TO KAI5OF2-ABSTIMMKREIS-TYP
145600       MOVE KAC5AL-E-STATUS
145700         TO KAI5OF2-STATUS
145800       MOVE KAC5AL-E-SCHLIESSUNGSNR 
145900         TO KAI5OF2-SCHLIESSUNGSNR
146000     END-IF
146100     .                                                            
146200 VERSORG-KADA-AKA5OF-1002.                                        
146300     EXIT                                                         
146400     .                                                            
146500/                                                                 
146600 AUFTRAG-AKA5OF SECTION.                                          
146700 AUFTRAG-AKA5OF-1001.                                             
146800*                                                                 
146900*---------------------------------------------------------------* 
147000* KORDOBA-Auftrag AKA5OF aufrufen                                 
147100* (Liste von Abstimmpositionen lesen)                             
147200*---------------------------------------------------------------* 
147300*                                                                 
147400     IF KAC5AL-E-SCHLIESSUNGSNR   NOT NUMERIC                     
147500     THEN                                                         
147600*
147700       CALL "CGSAUF"                                              
147800       USING                                                      
147900         C-AUF-AUFRUF-AL                                          
148000         C-KONFIG-ID-KA                                           
148100         C-OBJEKT-AUF-AKA5OF                                      
148200         GSOVER-VERSTAENDIGUNGSBEREICH                            
148300         KAI5OF3-EINGABEBEREICH                                   
148400         KAO5OF2-AUSGABEBEREICH                                   
148500         KAT5OF1-TRANSIENT-BEREICH                                
148600         KAXIND-INDICES 
148700     ELSE
148800*
148900       CALL "CGSAUF"                                              
149000       USING                                                      
149100         C-AUF-AUFRUF-AL                                          
149200         C-KONFIG-ID-KA                                           
149300         C-OBJEKT-AUF-AKA5OF                                      
149400         GSOVER-VERSTAENDIGUNGSBEREICH                            
149500         KAI5OF2-EINGABEBEREICH                                   
149600         KAO5OF2-AUSGABEBEREICH                                   
149700         KAT5OF1-TRANSIENT-BEREICH                                
149800         KAXIND-INDICES 
149900     END-IF                                                       
150000*
150100     IF GSOVER-GEWICHT            >  C-GEW-WARNUNG                
150200     THEN                                                         
150300        PERFORM MELDUNG-IN-APDU-EINTRAGEN                         
150400        GO TO PROGRAMM-VERLASSEN                                  
150500     END-IF                                                       
150600     .                                                            
150700 AUFTRAG-AKA5OF-1002.                                             
150800     EXIT                                                         
150900     .                                                            
151000/                                                                 
151100 VERSORG-KADA-AKAC5AL-L SECTION.                                  
151200 VERSORG-KADA-AKAC5AL-L-1001.                                     
151300*---------------------------------------------------------------* 
151400* Versorgung CI-AUSGABEFELDER Fuer LIST-AUSKUNFT                  
151500*---------------------------------------------------------------* 
151600*                                                                 
151700
151800     MOVE KAO5OF2-APO-ABSTIMMKREIS-NR (H-INDEX)    
151900       TO KAC5AL-A-ABSTIMMKREIS
152000     MOVE KAO5OF2-APO-HERKUNFT (H-INDEX)                     
152100       TO KAC5AL-A-HERKUNFT 
152200     MOVE KAO5OF2-APO-KONTO-ID-ABSTIMM (H-INDEX)                 
152300       TO KAC5AL-A-KONTO-ID
152400     MOVE KAO5OF2-APO-AUSZUGSDATUM (H-INDEX)                 
152500       TO KAC5AL-A-AUSZUGSDATUM
152600     MOVE KAO5OF2-APO-AUSZUGSNUMMER (H-INDEX)                 
152700       TO KAC5AL-A-AUSZUGSNUMMER
152800     MOVE KAO5OF2-APO-AUSZUG-FNR (H-INDEX)                 
152900       TO KAC5AL-A-AUSZUG-FNR 
153000     MOVE KAO5OF2-APO-LFD-NR-APO  (H-INDEX)                
153100       TO KAC5AL-A-LFD-NR-APO
153200     MOVE KAO5OF2-APO-WAEHRUNG (H-INDEX)                   
153300       TO KAC5AL-A-WAEHRUNG
153400     MOVE KAO5OF2-APO-BETRAG (H-INDEX)                        
153500       TO KAC5AL-A-BETRAG
153600     MOVE KAO5OF2-APO-BUTAG (H-INDEX)                       
153700       TO KAC5AL-A-BUTAG 
153800     MOVE KAO5OF2-APO-VALUTA (H-INDEX)                    
153900       TO KAC5AL-A-VALUTA 
154000     MOVE KAO5OF2-APO-FACHBEREICH (H-INDEX)                 
154100       TO KAC5AL-A-FACHBEREICH 
154200     MOVE KAO5OF2-APO-ZUSATZ-TXT-SL (H-INDEX)                 
154300       TO KAC5AL-A-ZUSATZ-TXT-SL
154400     MOVE KAO5OF2-APO-PRIMANOTA (H-INDEX)                 
154500       TO KAC5AL-A-PRIMANOTA 
154600     MOVE KAO5OF2-APO-TRANSAKTION-ID (H-INDEX)                 
154700       TO KAC5AL-A-TRANSAKTION-ID 
154800     MOVE KAO5OF2-APO-TRANSAKTION-ID-FS (H-INDEX)                 
154900       TO KAC5AL-A-TRANSAKTION-ID-FS 
155000     MOVE KAO5OF2-APO-ISIN (H-INDEX)                         
155100       TO KAC5AL-A-ISIN         
155200     MOVE KAO5OF2-APO-NENNWERT (H-INDEX)                    
155300       TO KAC5AL-A-NENNWERT  
155400     MOVE KAO5OF2-APO-KONTO-ID-ORIG (H-INDEX)                 
155500       TO KAC5AL-A-KONTO-ID-ORIG
155600     COMPUTE H-LAENGE-VWZWECK                           
155700             = FUNCTION LENGTH (KAC5AL-A-VERWENDUNGSZWECK)     
155800     MOVE KAO5OF2-APO-VERWENDUNGSZWECK 
155900          (H-INDEX)(1:H-LAENGE-VWZWECK)                 
156000       TO KAC5AL-A-VERWENDUNGSZWECK
156100     MOVE KAO5OF2-APO-BEMERKUNG (H-INDEX)                   
156200       TO KAC5AL-A-BEMERKUNG
156300     MOVE KAO5OF2-APO-SCHLIESSUNGSNR (H-INDEX)                  
156400       TO KAC5AL-A-SCHLIESSUNGSNR 
156500     MOVE KAO5OF2-APO-SCHLIESSUNGSART (H-INDEX)                
156600       TO KAC5AL-A-SCHLIESSUNGSART
156700     MOVE KAO5OF2-SCH-SCHLIESSUNG-BEMERK (H-INDEX)                 
156800       TO KAC5AL-A-SCHLIESSUNG-BEMERK 
156900     MOVE KAO5OF2-APO-TIMESTAMP-BKAAPO (H-INDEX)                 
157000       TO KAC5AL-A-UPDC
157100     MOVE KAO5OF2-BERECHTIGUNG    
157200       TO KAC5AL-A-BERECHTIGUNG
157300     .                                                            
157400 VERSORG-KADA-AKAC5AL-L-1002.                                     
157500     EXIT                                                         
157600     .                                                            
157700/                                                                 
157800 KONTEXT-VERSORGEN SECTION.                                       
157900 KONTEXT-VERSORGEN-1001.                                          
158000*                                                                 
158100*---------------------------------------------------------------* 
158200* Versorgen der relevanten Kontext-Daten                          
158300*---------------------------------------------------------------* 
158400*                                                                 
158450     MOVE KAO5OF2-NOT-USER-SCHLI                                  D02
158451       TO KAT5OF1-NOT-USER-SCHLI                                  D02
158452*                                                                 D02
158500     MOVE KAO5OF2-APO-ABSTIMMKREIS-NR         (H-INDEX )
158600       TO KAT5OF1-APO-ABSTIMMKREIS-NR
158700     MOVE KAO5OF2-APO-HERKUNFT                (H-INDEX )
158800       TO KAT5OF1-APO-HERKUNFT 
158900     MOVE KAO5OF2-APO-KONTO-ID-ABSTIMM        (H-INDEX )
159000       TO KAT5OF1-APO-KONTO-ID-ABSTIMM
159100     MOVE KAO5OF2-APO-AUSZUGSDATUM            (H-INDEX )
159200       TO KAT5OF1-APO-AUSZUGSDATUM 
159300     MOVE KAO5OF2-APO-AUSZUGSNUMMER           (H-INDEX )
159400       TO KAT5OF1-APO-AUSZUGSNUMMER 
159500     MOVE KAO5OF2-APO-AUSZUG-FNR              (H-INDEX )
159600       TO KAT5OF1-APO-AUSZUG-FNR 
159700     MOVE KAO5OF2-APO-LFD-NR-APO              (H-INDEX )
159800       TO KAT5OF1-APO-LFD-NR-APO 
159900*
160000     MOVE KAO5OF2-APO-ABSTIMMKREIS-TYP        (H-INDEX )
160100       TO KAT5OF1-S-ABSTIMMKREIS-TYP
160200     MOVE KAO5OF2-APO-STATUS                  (H-INDEX )
160300       TO KAT5OF1-S-STATUS
160400     MOVE KAO5OF2-APO-FACHBEREICH             (H-INDEX )
160500       TO KAT5OF1-S-FACHBEREICH
160600     MOVE KAO5OF2-APO-ISIN                    (H-INDEX )
160700       TO KAT5OF1-S-ISIN
160800     MOVE KAO5OF2-APO-BETRAG                  (H-INDEX )
160900       TO KAT5OF1-S-BETRAG
161000     MOVE KAO5OF2-APO-BUTAG                   (H-INDEX )
161100       TO KAT5OF1-S-BUTAG
161200     MOVE KAO5OF2-APO-VALUTA                  (H-INDEX )
161300       TO KAT5OF1-S-VALUTA
161400     MOVE KAO5OF2-APO-ZUSATZ-TXT-SL           (H-INDEX )
161500       TO KAT5OF1-S-ZUTXT-SL
161600     MOVE KAO5OF2-APO-PRIMANOTA               (H-INDEX )
161700       TO KAT5OF1-S-PRIMANOTA
161800     MOVE KAO5OF2-APO-SCHLIESSUNGSNR          (H-INDEX )
161900       TO KAT5OF1-S-SCHLIESSUNGSNR
162000*
162100     .                                                            
162200 KONTEXT-VERSORGEN-1002.                                          
162300     EXIT                                                         
162400     .                                                            
162500/                                                                 
162600 KONTEXT-SCHREIBEN SECTION.                                       
162700 KONTEXT-SCHREIBEN-1001.                                          
162800*                                                                 
162900*---------------------------------------------------------------* 
163000* In dieser Section werden alle Daten, die beim Blaettern als     
163100* Aufsetzbegriff benoetigt werden, in den Kontext-Bereich ueber-  
163200* tragen und gespeichert                                          
163300*---------------------------------------------------------------* 
163400*                                                                 
163500     MOVE C-KAC5AL                TO GSICI-NAME-KADA-BEREICH      
163600     MOVE C-1                     TO GSICI-NUMMER-KONTEXT         
163700     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS        
163800     SET GSICI-PTR-KONTEXT-DATEN  TO ADDRESS OF                   
163900                                  AKAC5AL-KONTEXT-BEREICH         
164000     COMPUTE GSICI-LAENGE-KONTEXT-DATEN                           
164100                                  = FUNCTION LENGTH               
164200                                  (AKAC5AL-KONTEXT-BEREICH)       
164300     EVALUATE GSCI-AKTION                                         
164400     WHEN C-BEGINR                                                
164500        MOVE C-CI-NEU-ANLEGEN     TO GSICI-INDIKATOR-MODUS        
164600     WHEN OTHER                                                   
164700        MOVE C-CI-AKTUALISIEREN   TO GSICI-INDIKATOR-MODUS        
164800     END-EVALUATE                                                 
164900*                                                                 
165000     CALL "CGSCI"                                                 
165100     USING C-CI-KONTEXT-BEREICH-SCHREIBEN                         
165200           C-KONFIG-ID-KA                                         
165300           C-OBJEKT-CI-KONTEXT                                    
165400           GSOVER-VERSTAENDIGUNGSBEREICH                          
165500           GSICI-EINGABEBEREICH                                   
165600           DUMMY                                                  
165700           DUMMY                                                  
165800     IF GSOVER-GEWICHT            > C-GEW-WARNUNG                 
165900     THEN                                                         
166000        PERFORM MELDUNG-IN-APDU-EINTRAGEN                         
166100        GO TO PROGRAMM-VERLASSEN                                  
166200     END-IF                                                       
166300     .                                                            
166400 KONTEXT-SCHREIBEN-1002.                                          
166500     EXIT                                                         
166600     .                                                            
166700/                                                                 
166800 KONTEXT-LESEN SECTION.                                           
166900 KONTEXT-LESEN-1001.                                              
167000*                                                                 
167100*---------------------------------------------------------------* 
167200* Die im Sessiongedaechtnis gespeicherten Daten werden gelesen    
167300* und als Aufsetzgebriff fuer das Lesen der naechsten Daten       
167400* zur Verfuegung gestellt.                                        
167500*---------------------------------------------------------------* 
167600*                                                                 
167700     MOVE ZERO                    TO GSICI-ANZAHL-INDICES         
167800     MOVE C-KAC5AL                TO GSICI-NAME-KADA-BEREICH      
167900     MOVE C-1                     TO GSICI-NUMMER-KONTEXT         
168000     MOVE SPACE                   TO GSICI-INDIKATOR-MODUS        
168100     SET GSICI-PTR-KONTEXT-DATEN  TO ADDRESS OF                   
168200                                  AKAC5AL-KONTEXT-BEREICH         
168300     COMPUTE GSICI-LAENGE-KONTEXT-DATEN                           
168400                                  = FUNCTION LENGTH               
168500                                  (AKAC5AL-KONTEXT-BEREICH)       
168600*                                                                 
168700     CALL "CGSCI"                                                 
168800     USING C-CI-KONTEXT-BEREICH-LESEN                             
168900           C-KONFIG-ID-KA                                         
169000           C-OBJEKT-CI-KONTEXT                                    
169100           GSOVER-VERSTAENDIGUNGSBEREICH                          
169200           GSICI-EINGABEBEREICH                                   
169300           GSOCI-AUSGABEBEREICH                                   
169400           DUMMY                                                  
169500     IF GSOVER-GEWICHT            > C-GEW-WARNUNG                 
169600     THEN                                                         
169700        PERFORM MELDUNG-IN-APDU-EINTRAGEN                         
169800        GO TO PROGRAMM-VERLASSEN                                  
169900     END-IF                                                       
170000     .                                                            
170100 KONTEXT-LESEN-1002.                                              
170200     EXIT                                                         
170300     .                                                            
170400/
170500 AUFSETZPUNKT-UEBERTRAGEN SECTION.                                
170600 AUFSETZPUNKT-UEBERTRAGEN-1001.                                   
170700*---------------------------------------------------------------* 
170800* Uebertragen des Aufsetz-Begriffes nach KONTEXT-LESEN in die   * 
170900* entsprechenden Felder fuer die Verarbeitung im KORDOBA-AUFTRAG* 
171000*---------------------------------------------------------------* 
171100*
171200* nicht notwendig, da in transienten Bereich gelesen wird, der
171300* an den Auftrag übergeben wird
171400     NEXT SENTENCE
171500     .       
171600 AUFSETZPUNKT-UEBERTRAGEN-1002.
171700     EXIT.
171800/                                                                 
171900 MELDUNG-IN-APDU-EINTRAGEN SECTION.                               
172000 MELDUNG-IN-APDU-EINTRAGEN-1001.                                  
172100*---------------------------------------------------------------* 
172200* FEHLERMELDUNGEN UND HINWEISE (WARNINGS) EINSCHLIESSLICH         
172300* EVTENTUELLER INSERT-TEXTE WERDEN AUS DEM                        
172400* MELDUNGS-POOL IN DEN APDU UEBERTRAGEN                           
172500*---------------------------------------------------------------* 
172600     CALL "CGSCI"                                                 
172700     USING C-CI-NACHRICHT-SCHREIBEN                               
172800           C-KONFIG-ID-KA                                         
172900           C-OBJEKT-CI-LINES                                      
173000           GSOVER-VERSTAENDIGUNGSBEREICH                          
173100           GSICI-EINGABEBEREICH                                   
173200           DUMMY                                                  
173300           DUMMY                                                  
173400     .                                                            
173500 MELDUNG-IN-APDU-EINTRAGEN-1002.                                  
173600     EXIT                                                         
173700     .                                                            
173800/                                                                 
173900 PROGRAMM-VERLASSEN SECTION.                                      
174000 PROGRAMM-VERLASSEN-1001.                                         
174100*---------------------------------------------------------------* 
174200* Verlassen des Programms ueber einen Ausstiegspunkt              
174300*---------------------------------------------------------------* 
174400* Mit Hilfe dieses Unterprogramms kann ein Auftrag ueber eine     
174500* definierte Stelle verlassen werden.                             
174600* Dieses Unterprogramm muss anstelle von EXIT PROGRAMM aufgerufen 
174700* werden.                                                         
174800*---------------------------------------------------------------* 
174900*                                                                 
175000     EXIT PROGRAM                                                 
175100     .                                                            
175200 PROGRAMM-VERLASSEN-1002.                                         
175300     EXIT                                                         
175400     .                                                            
175500 END PROGRAM AKAC5AL.                                             

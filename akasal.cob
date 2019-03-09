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
000160*@Titel         : Ermitteln Saldeninformationen zu Abstimmkreis
000160*@Elementname   : akasal.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20141223.111131
000160*@Produkt       : ak
000160*@Lieferpaket   : 
000160*@Liefertiefe   : ja
000160*@Rekursiv      : 
000160*@Kategorie     : sas
000160*@BatchDialog   : beides
000160*@Zugeliefert   : 
000160*@Generiert_aus : 
000160*@Nicht_manuell : 
000160*@Pruefe_aekz   : j
000160*@Querschnitt   : 
000160*@SQL           : 
000160*@e_element_info 
000160*
001000*@Title        : Ermitteln Saldeninformationen zu AKR       *
001100* Verfasser    : Ernst Böhmer ATOS                          *
001200* Erstelldatum : 13.03.2012                                 *
001400*                                                           *
001500*@A-ELEMENTBESCHREIBUNG                                     *
001600* Modul-Beschreibung:                                       *
001700* ------------------                                        *
001800* Der Auftrag ermittelt Saldeninformationen zu gegebenem    *
001900* Abstimmkreis                                              *
002000*@E-ELEMENTBESCHREIBUNG                                     *
002100*                                                           *
002200*@A-FUNKTION-1                                              *
002300* Ermitteln Saldeninformationen                             *
002400*                                                           *
002500* Eingabefeldbelegungen:                                    *
002600* Funktion "01-INT-SALD-INFO-AKRS"                          *
002700* KAISAL1-ABSTIMMKREIS-NR                                   *
002800*                                                           *
002900*@E-FUNKTION-1                                              *
003000*                                                           *
003100*                                                           *
003200*@A-MODULAUFRUF                                             *
003300* Aufruf-Beispiel:                                          *
003400*                                                           *
003500* Aufrufparameter: 1. Funktion               (I)            *
003600*                  2. Konfigurations-Id      (I)            *
003700*                  3. Objekt                 (I)            *
003800*                  4. Verstaendigungsbereich (O)            *
003900*                  5. Eingabebereich         (I)            *
004000*                  6. Ausgabebereich         (O)            *
004100*                  7. Transientbereich       (I/O)          *
004200*                  8. Indices                (I)            *
004300*                                                           *
004400* CALL "CGSAUF"                                             *
004500* USING C-AUF-AUFRUF-AL                                     *
004600*       C-KONFIG-ID-KA                                      *
004700*       C-OBJEKT-AUFTRAG-AKASAL                             *
004800*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *
004900*       KAI4OF1-EINGABEBEREICH                              *
005000*       DUMMY                                               *
005100*       DUMMY                                               *
005200*       KAXIND-INDICES                                      *
005300*                                                           *
005400*@E-MODULAUFRUF                                             *
005500*                                                           *
005600*@A-RETURNCODE                                              *
005700* Meldungen/Returncodes:                                    *
005800* ----------------------                                    *
005900
006000* Folgende Fehlermeldungen werden von diesem KORDOBA-Auftrag*
006100* zureckgegeben bzw. in den Meldungs-Pool eingetragen:      *
006200* KA0000 : Verarbeitung erfolgreich durchgeführt            *
006300* alle Meldungen der gerufenen AUfträge                     *
006400*                                                           *
006500*@E-RETURNCODE                                              *
006600*                                                           *
006700*@A-ENTRY                                                   *
006800* Entryname       : AKASAL                                  *
006900*                                                           *
007000*@E-ENTRY                                                   *
007100*                                                           *
007200*@A-MODUL                                                   *
008100*@E-MODUL                                                   *
008200*                                                           *
008300*@A-COBOL-COPY                                              *
010600*@E-COBOL-COPY                                              *
010700*                                                           *
010800*@A-TABELLE                                                 *
011200*@E-TABELLE                                                 *
011300*                                                           *
011400*@A-BENUTZERSATZ                                            *
011500* Benutzersaetze  : <benutzersatz> (I/O/IO)                 *
011600* keine                                                     *
011700*                                                           *
011800*@E-BENUTZERSATZ                                            *
011900*                                                           *
012000*@A-DATEI                                                   *
012100* Dateien         : entfallen                               *
012200*                                                           *
012300*@E-DATEI                                                   *
012400*                                                           *
012500*@A-KONVENTIONEN                                            *
012600*@E-KONVENTIONEN                                            *
012700*                                                           *
012800*@A-DOKUMENT                                                *
012900* Die fachliche Beschreibung ist im Dokument                *
013000* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *
013100* hinterlegt.                                               *
013200*                                                           *
013300*@E-DOKUMENT                                                *
013400*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
090051* D01 R48721                                                *     D01
090052*     Rolle immer versorgen                                 *     D01
090053*     Datum: 30.07.2012                            NKZ: TRO *     D01
090054*                                                           *     D01
090055* D02 R49405                                                *     D02
090056*     Hier wird nur die Berechtigung für Auskunft benötigt  *     D02
090057*     Datum: 02.08.2012                            NKZ: TRO *     D02
090058*                                                           *     D02
090060* D03 R58252                                                *     D03
090061*     Wenn zu einem Konto keine Abstimmpositionen vorliegen,*     D03
090062*     ist keine Fehlermeldung KA4302 mehr auszugegeben.     *     D03
090063*     (Stattdessen "Nuller"-Sätze in Ausgabedatei schreiben)*     D03
090064*     Datum: 23.04.2013                            NKZ: SUM *     D03
090065*                                                           *     D03
090066* D04 R59813                                                *     D04
090067*     Da das Copy CKAO5KT1X nur ein einziges Mal initiali-  *     D04
090068*     siert wird, darf es nicht in der LOCAL STORAGE liegen.*     D04
090069*                                                           *     D04
      * E01 R77134                                                *     E01
      *     Anpassung im Rahmdes des Projekts WP-Stückeabstimmung *     E01
      *     (wegen Erweiterung in Parametertabelle KA000AKKTO)    *     E01
      *     Datum: 08.12.2014                            NKZ: SUM *     E01
      *                                                           *     E01
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/
100200 IDENTIFICATION DIVISION.
100300 PROGRAM-ID. AKASAL.
100400/
100500 ENVIRONMENT DIVISION.
100600 CONFIGURATION SECTION.
100700 SPECIAL-NAMES.
100800     DECIMAL-POINT     IS COMMA.
100900/
101000 DATA DIVISION.
101100 WORKING-STORAGE SECTION.
101200*
101300*    PLATZHALTER FUER VERSIONSINFORMATIONEN
101400*
101500 01  VERS-INF.                                                    CCC
101550     05  FILLER PIC X(13) VALUE "ELEM=akasal  ".                  CCC
101551     05  FILLER PIC X(15) VALUE "VERS=k151-00002".                CCC
101552     05  FILLER PIC X(470) VALUE "COPYRIGHT (C) 2018 Fidelity NatiCCC
101553-                               "onal Information Services, Inc. aCCC
101554-                               "nd/or its subsidiaries - All RighCCC
101555-                               "ts Reserved worldwide. This documCCC
101556-                               "ent is protected under the trade CCC
101557-                               "secret and copyright laws as the CCC
101558-                               "property of Fidelity National InfCCC
101559-                               "ormation Services, Inc. and/or itCCC
101560-                               "s subsidiaries. Copying, reproducCCC
101561-                               "tion or distribution should be liCCC
101562-                               "mited and only to employees with CCC
101563-                               "a ( need to know ) to do their joCCC
101564-                               "b. Any disclosure of this documenCCC
101565-                               "t to third parties is strictly prCCC
101566-                               "ohibited.".                      CCC
102000*****************************************************************
102100************** Konstanten-Definitionen **************************
102200*****************************************************************
102300/---------------------------------------------------------------*
102400* Returncode-Gewichte                                           *
102500*---------------------------------------------------------------*
102600 COPY DCTGRCGE.
102700*---------------------------------------------------------------*
102800* Meldungscodes                                                 *
102900*---------------------------------------------------------------*
103000 01 MELDUNGSCODES.
103100    05 C-OBJEKT-GS1500            PIC X(006) VALUE "GS1500".
103200    05 C-OBJEKT-KA0000            PIC X(006) VALUE "KA0000".
103300    05 C-OBJEKT-KA4301            PIC X(006) VALUE "KA4301".
103400    05 C-OBJEKT-KA4302            PIC X(006) VALUE "KA4302".
103500    05 C-OBJEKT-KA4801            PIC X(006) VALUE "KA4801".
103600    05 C-OBJEKT-KA5002            PIC X(006) VALUE "KA5002".
103700/---------------------------------------------------------------*
103800* Lokale Konstante fuer KORDOBA-Auftrag AKASAL                  *
103900*---------------------------------------------------------------*
104000 01 KONSTANTE-AKASAL.
104100    05 C-01-INT-SALD-INFO-AKRS    PIC X(040) VALUE
104200                                  "01-INT-SALD-INFO-AKRS".
104300    05 C-KONFIG-ID-KA             PIC X(002) VALUE "KA".
104400    05 C-KONFIG-ID-GS             PIC X(002) VALUE "GS".
104500    05 C-AUF-AUFRUF-AL            PIC X(040) VALUE "AUFRUF-AL".
104600    05 C-AKASAL                   PIC X(008) VALUE "AKASAL".
104700    05 C-1                        PIC 9(001) VALUE 1.
104800    05 C-2                        PIC 9(001) VALUE 2.
104900    05 C-JA                       PIC X(001) VALUE "J".           D03
105000    05 C-NEIN                     PIC X(001) VALUE "N".           D03
105100    05 C-OFFEN-2                  PIC X(001) VALUE "2".
105200/---------------------------------------------------------------*
105300* CGSMEL                                                        *
105400*---------------------------------------------------------------*
105500 01 CGSMEL-DEFINITIONEN.
105600     05 C-MEL-EINTRAGEN           PIC X(040) VALUE "EINTRAGEN".
105700     05 C-MEL-AUSTRAGEN           PIC X(040) VALUE "AUSTRAGEN".
105800     05 C-OBJEKT-MEL-GSPOOL       PIC X(006) VALUE SPACE.
105900/---------------------------------------------------------------*
106000* CGSTAB                                                        *
106100*---------------------------------------------------------------*
106200 01 CGSTAB-DEFINITIONEN.
106300     05 C-OBJEKT-LOG-NAME         PIC X(009) VALUE "KA00INSTA".
106400     05 C-OBJEKT-TAB-ANMELDEDATEN PIC X(020) VALUE "ANMELDEDATEN".
106500     05 C-TAB-LESEN-ZEILE         PIC X(040) VALUE "LESEN-ZEILE".
106600     05 C-TAB-LESEN-EQUAL         PIC X(040) VALUE "LESEN-EQUAL".
106700     05 C-TAB-ANM-DAT-LESEN       PIC X(040) VALUE
106800                                  "ANM-DAT-LESEN".
106900/
107000*---------------------------------------------------------------*
107100* Schnittstelle CGSBER (Berechtigungspruefung)                  *
107200*---------------------------------------------------------------*
107300 01 H-BERECHTIGUNG.
107400     05 C-BER-PRUEFEN             PIC X(040) VALUE "PRUEFEN".
107500     05 C-OBJEKT-BER-USER-BERECHT PIC X(020)
107600                                  VALUE "USER-BERECHT".
107700     05 C-BER-ANZAHL-3            PIC 9(002) VALUE 3.
107800     05 H-OBJEKT-BER              PIC X(010) VALUE SPACE.
107900     05 C-OBJEKT-BER-KA-KTOABST   PIC X(010) VALUE "KA-KTOABST".
108000     05 C-FKT-BER-AUSK            PIC X(003) VALUE "710".         D02
108200*
108300     COPY CGSI4BER                REPLACING 01 BY 05,
108400                                  ==(01)== BY ==(01)==.
108500*---------------------------------------------------------------* 
108600* Meldungszusatztexte                                           * 
108700*---------------------------------------------------------------* 
108800 01  H-ZUTXT-4301.
108900     05 FILLER                    PIC X(003) VALUE SPACE.
109000     05 H-ZUTXT-4301-AUFTR        PIC X(008).
109100     05 FILLER                    PIC X(003) VALUE " / ".
109200     05 H-ZUTXT-4301-AKR          PIC 9(005).
109300 01  H-ZUTXT-4302.
109400     05 FILLER                    PIC X(003) VALUE SPACE.
109500     05 H-ZUTXT-4302-AUFTR        PIC X(008).
109600     05 FILLER                    PIC X(003) VALUE " / ".
109700     05 H-ZUTXT-4302-KONTO-ID     PIC X(035).
109800*
109900*---------------------------------------------------------------* 
110000* Schnittstellenparameter für Auftrag KKA5AP                    * 
110100*---------------------------------------------------------------* 
110200 01 C-01-INT-LES-APO-SUM-AK    PIC X(040) VALUE
110300                                  "01-INT-LES-APO-SUM-AK".
110400 01 C-OBJEKT-AUFTRAG-KKA5AP       PIC X(020) VALUE "KKA5AP".   
110500 COPY CKAI5AP1.
110600 COPY CKAO5AP1.  
110700*---------------------------------------------------------------* 
110800* Schnittstellenparameter für Auftrag KKA5KT                    * 
110900*---------------------------------------------------------------* 
111000 01 C-01-INT-LES-KTO              PIC X(040) VALUE
111100                                  "01-INT-LES-KTO".
111200 01 C-OBJEKT-AUFTRAG-KKA5KT       PIC X(020) VALUE "KKA5KT".   
111300*---------------------------------------------------------------* 
111400* TABEX-Tabellen                                                * 
111500*---------------------------------------------------------------* 
      * Tabellen-View für GeldUmsatz-Abstimmung verwenden               E01
111600 01 C-OBJEKT-TAB-KA03AKKTO        PIC X(020) VALUE "KA03AKKTO".   E01
111700*
111800/---------------------------------------------------------------*
111900* Hilfsfelder                                                   *
112000*---------------------------------------------------------------*
112100 01 C-STATI.
112200     05 C-STATUS-ABGELEHNT        PIC 9(001) VALUE 6.
112300     05 C-STATUS-GESCHLOSSEN      PIC 9(001) VALUE 8.
112400     05 C-STATUS-AUFGEHOBEN       PIC 9(001) VALUE 9.
112500 01 HILFSFELDER.
112600    05 H-ZAEHLER-ANZ              PIC 9(003).
112650    05 H-ERSTER-AUFRUF            PIC X(001)  VALUE "J".          D03  
112700/---------------------------------------------------------------*
112800*   LOKALE ARBEITSFELDER                                        *
112900*---------------------------------------------------------------*
112950*  Initialisierungs-Struktur (INI) zu CKAO5KT1                  * D04
112951   COPY CKAO5KT1X REPLACING ==:PRE:== BY ==INI==.                 D04
113000 LOCAL-STORAGE SECTION.
113100/---------------------------------------------------------------*
113200* Meldungsschnittstelle                                         *
113300*---------------------------------------------------------------*
113400 COPY CGSOMEL.
113500 COPY CGSTMEL.
113600/---------------------------------------------------------------*
113700* Meldungstabelle                                               *
113800*---------------------------------------------------------------*
113900 COPY CGSI0MEL.
114000 COPY CGSO0MEL.
114100/---------------------------------------------------------------*
114200* KA000AKTO Bereiche                                            *
114300*---------------------------------------------------------------*
114400 COPY CKAI0AKK.
114500 COPY CKAO0AKK.
114600/---------------------------------------------------------------*
114700* Auftragsdaten-Bereiche                                        *
114800*---------------------------------------------------------------*      
114900 COPY CKAI5KT1.    
115000 COPY CKAO5KT1.
115100*
115200 COPY CKAI5AP6.    
115300 COPY CKAO5AP5.  
115400/---------------------------------------------------------------*
115500* Anmeldedaten                                                  *
115600*---------------------------------------------------------------*
115700 COPY CGSO0ANM.
115800* Uebergabeparameter fuer CGSTAB                                *
115900*---------------------------------------------------------------*
116000 COPY CGSTTAB.
116100/---------------------------------------------------------------*
116200* Hilfsfelder                                                   *
116300*---------------------------------------------------------------*
116400 01  H-MELDUNGS-OBJEKT             PIC X(006).
116500 01  H-FUNKTION.
116600      05 H-FUNKTION-MLD            PIC X(020).
116700      05 H-FUNKTION-REST           PIC X(020).
116800 01  DUMMY                         PIC X(001).
116900*
117000  01  H-VERARB-ZAEHLER             PIC 9(001).
117100  01  H-SUMME-APO-BETR             PIC S9(015)V9(003).
117200  01  H-KONTO-SALDO                PIC S9(015)V9(003).
117300  01  H-AK-NUMMER                  PIC 9(005).
117400  01  H-HERKUNFT                   PIC X(011).
117500  01  H-KONTO-ID                   PIC X(035).
117600  01  H-ROLLE                      PIC X(010).
117700  01  H-NAECHSTE-ZEILE             PIC 9(010).
117800/---------------------------------------------------------------*
117900* Programmschalter                                              *
118000*---------------------------------------------------------------*
118100 01 HS-AK-FLAG                    PIC X(001).
118200    88 AKNR-SUCHEN                VALUE "S".
118300    88 AKNR-GEFUNDEN              VALUE "J".
118400    88 AKNR-N-GEFUNDEN            VALUE "N".
118500*   
118600/****************************************************************
118700 LINKAGE SECTION.
118800*****************************************************************
118900*---------------------------------------------------------------*
119000* Funktion                                                      *
119100*---------------------------------------------------------------*
119200 01 AUF-FUNKTION                  PIC X(040).
119300*---------------------------------------------------------------*
119400* Konfigurations-Kennzeichen                                    *
119500*---------------------------------------------------------------*
119600 01 KONFIG-ID                     PIC X(002).
119700*---------------------------------------------------------------*
119800* Auftragsname                                                  *
119900*---------------------------------------------------------------*
120000 01 OBJEKT-AUFTRAGS-ID            PIC X(020).
120100*---------------------------------------------------------------*
120200* VerstAendigungsbereich des Aufrufers                          *
120300*---------------------------------------------------------------*
120400 COPY CGSOVER.
120500*---------------------------------------------------------------*
120600* Eingabebereich fuer den StandAlone-Auftrag AKASAL             *
120700*---------------------------------------------------------------*
120800 01 LS-EINGABEBEREICH             PIC X(001).                      
120900 01 LS-EIN-BER-01                 REDEFINES LS-EINGABEBEREICH. 
121000     COPY CKAISAL1                REPLACING 01 BY 05,
121100                                  ==(01)== BY ==(01)==.
121200*---------------------------------------------------------------*
121300* Ausgabebereich fuer den StandAlone-Auftrag AKASAL             *
121400*---------------------------------------------------------------*
121500 01 LS-AUSGABEBEREICH             PIC X(001).
121600 01 LS-EIN-BER-01                 REDEFINES LS-AUSGABEBEREICH. 
121700     COPY CKAOSAL1                REPLACING 01 BY 05,
121800                                  ==(01)== BY ==(01)==.
121900*---------------------------------------------------------------*
122000* Transientbereich im Auftragsformat fuer den Auftrag AKASAL    *
122100*---------------------------------------------------------------*
122200 01 LS-DUMMY                      PIC X(001).          
122300*---------------------------------------------------------------*
122400* Indices                                                       *
122500*---------------------------------------------------------------*
122600 COPY CKAXIND. 
122700/
122800 PROCEDURE DIVISION
122900     USING AUF-FUNKTION
123000           KONFIG-ID
123100           OBJEKT-AUFTRAGS-ID
123200           GSOVER-VERSTAENDIGUNGSBEREICH
123300           LS-EINGABEBEREICH
123400           LS-AUSGABEBEREICH
123500           LS-DUMMY
123600           KAXIND-INDICES
123700           .
123800/---------------------------------------------------------------*
123900* Hier wird die Steuerung des KORDOBA-Auftrags durchgefuehrt    *
124000*---------------------------------------------------------------*
124100 STEUER-AKASAL SECTION.
124200 STEUER-AKASAL-1001.
124300     PERFORM INITIALISIERUNG
124400*    PERFORM BERECHTIGUNG                                
124500*
124600     EVALUATE KAISAL1-FUNKTION
124700     WHEN C-01-INT-SALD-INFO-AKRS   
124800       PERFORM VERARB-SALDEN-INFO
124900     WHEN OTHER
125000* KA5002: @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@
125100       MOVE C-OBJEKT-KA5002       TO H-MELDUNGS-OBJEKT
125200       MOVE C-AKASAL              TO GSTMEL-VAR-TEXT-1
125300       MOVE KAISAL1-FUNKTION      TO H-FUNKTION
125400       MOVE H-FUNKTION-MLD        TO GSTMEL-VAR-TEXT-2
125500       PERFORM MELDUNG-EINTRAGEN
125600       GO TO PROGRAMM-VERLASSEN
125700     END-EVALUATE
125800     .
125900 STEUER-AKASAL-1002.
126000     GO TO PROGRAMM-VERLASSEN.
126100/---------------------------------------------------------------*
126200* Berechtigungsprüfung                                          *
126300*---------------------------------------------------------------*
126400 BERECHTIGUNG SECTION.
126500 BERECHTIGUNG-1001.
126600*
126700* Pruefen der Berechtigung
126800     MOVE SPACE                   TO GSI4BER-BP-BK-LISTE
126900* Funktion versorgen
127000     EVALUATE KAISAL1-FUNKTION
127100     WHEN C-01-INT-SALD-INFO-AKRS
127200       MOVE C-FKT-BER-AUSK        TO GSI4BER-BP-FUNKTION-KURZNAME D02
127300     WHEN OTHER
127400       CONTINUE
127500     END-EVALUATE
127600* Objekt versorgen
127700     MOVE C-OBJEKT-BER-KA-KTOABST TO GSI4BER-BP-BER-OBJ-KURZNAME
127800     MOVE ZERO                    TO GSI4BER-BP-ANZAHL-KRITERIEN
127900* Berechtigung aufrufen
128000     CALL "CGSBER"
128100     USING C-BER-PRUEFEN
128200           C-KONFIG-ID-KA
128300           C-OBJEKT-BER-USER-BERECHT
128400           GSOVER-VERSTAENDIGUNGSBEREICH
128500           GSI4BER-EINGABEBEREICH
128600           DUMMY
128700           DUMMY
128800     END-CALL
128900*
129000     EVALUATE GSOVER-GEWICHT
129100     WHEN C-GEW-ABBRUCH
129200       GO TO PROGRAMM-VERLASSEN
129300     WHEN C-GEW-FEHLER
129400* Fehler der Gewichtung 4 werden uebernommen und eingetragen
129500       MOVE GSOVER-RETURNCODE     TO H-MELDUNGS-OBJEKT
129600       MOVE GSOVER-TEXTE          TO GSTMEL-TEXTE
129700       PERFORM MELDUNG-EINTRAGEN
129800       GO TO PROGRAMM-VERLASSEN
129900     WHEN OTHER
130000       CONTINUE
130100     END-EVALUATE
130200*
130300     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
130400     THEN
130500*      KA4801 Sie haben nicht die erforderliche Berechtigung
130600       MOVE C-OBJEKT-KA4801       TO H-MELDUNGS-OBJEKT
130700       PERFORM MELDUNG-EINTRAGEN
130800       GO TO PROGRAMM-VERLASSEN
130900     ELSE
131000       MOVE C-OBJEKT-KA0000   TO GSOVER-RETURNCODE
131100     END-IF
131200     .
131300 BERECHTIGUNG-1002.
131400     EXIT.
131500/---------------------------------------------------------------*
131600* Verarbeitung Ermitteln Salden Info                            *
131700*---------------------------------------------------------------*
131800 VERARB-SALDEN-INFO SECTION.
131900 VERARB-SALDEN-INFO-1001.
132000*
132100     MOVE KAISAL1-ABSTIMMKREIS-NR TO H-AK-NUMMER
132200     MOVE ZERO                    TO H-VERARB-ZAEHLER
132300*    1. Eintrag suchen
132400     PERFORM LESEN-TAB-AKKTO
132500*    
132600     IF AKNR-GEFUNDEN
132700     THEN
132800*
132900       ADD C-1                    TO H-VERARB-ZAEHLER
133000         ON SIZE ERROR CONTINUE                                   
133100       END-ADD                                                    
133200       PERFORM AUFRUF-KKA5KT
133300*
133400       PERFORM AUFRUF-KKA5AP
133500*
133600       PERFORM VERSORGEN-AUSGABE
133700*
133800*      2. Eintrag lesen
133900       PERFORM LESEN-TAB-AKKTO-NEXT
134000       IF AKNR-GEFUNDEN
134100       THEN
134200         ADD C-1                  TO H-VERARB-ZAEHLER
134300           ON SIZE ERROR CONTINUE                                 
134400         END-ADD                                                  
134500         PERFORM AUFRUF-KKA5KT
134600*
134700         PERFORM AUFRUF-KKA5AP
134800*
134900         PERFORM VERSORGEN-AUSGABE
135000       END-IF
135100     ELSE
135200*      AKNR nicht gefunden - keine Verarbeitung
135300*      RC setzen
135400       CONTINUE
135500     END-IF
135600     .
135700 VERARB-SALDEN-INFO-1002.
135800     EXIT.
135900/---------------------------------------------------------------*
136000* LESEN-TAB-AKKTO:                                              *
136100* Lesen KA000AKKTO (zeilenweise)                                *
136200*---------------------------------------------------------------*
136300 LESEN-TAB-AKKTO SECTION.
136400 LESEN-TAB-AKKTO-1001.
136500*
136700     MOVE C-1                     TO GSTTAB-ZEILENNUMMER 
136800     SET AKNR-SUCHEN              TO TRUE
136900     PERFORM UNTIL AKNR-GEFUNDEN
137000                   OR
137100                   AKNR-N-GEFUNDEN
137200*
137300       CALL "CGSTAB" USING
137400            C-TAB-LESEN-ZEILE
137500            C-KONFIG-ID-KA
137600            C-OBJEKT-TAB-KA03AKKTO                                E01
137700            GSOVER-VERSTAENDIGUNGSBEREICH
137800            KAI0AKK-EINGABEBEREICH
137900            KAO0AKK-AUSGABEBEREICH
138000            GSTTAB-EIN-AUSGABEBEREICH
138100       END-CALL
138200*
138300       EVALUATE GSOVER-GEWICHT
138400         WHEN C-GEW-NICHT-GESETZT
138500           IF H-AK-NUMMER           = KAO0AKK-AK-NUMMER
138600           THEN
138700             SET AKNR-GEFUNDEN     TO TRUE
138800             MOVE KAO0AKK-ROLLE-KONTO
138900                                   TO H-ROLLE
139000             MOVE KAO0AKK-HERKUNFT  
139100                                   TO H-HERKUNFT
139200             MOVE KAO0AKK-KONTO-ID  
139300                                  TO H-KONTO-ID
139400             ADD C-1              TO GSTTAB-ZEILENNUMMER
139500                 GIVING H-NAECHSTE-ZEILE
139600               ON SIZE ERROR CONTINUE                             
139700             END-ADD                                              
139800           ELSE
139900             IF KAO0AKK-AK-NUMMER > H-AK-NUMMER
140000             THEN
140100               SET AKNR-N-GEFUNDEN 
140200                                  TO TRUE
140300*              KA4301: Es sind keine Abstimmkreis-Konten definiert
140400               MOVE C-OBJEKT-KA4301  
140500                                  TO H-MELDUNGS-OBJEKT
140600               MOVE C-AKASAL      TO H-ZUTXT-4301-AUFTR
140700               MOVE H-AK-NUMMER   TO H-ZUTXT-4301-AKR
140800               MOVE H-ZUTXT-4301  TO GSTMEL-ZUSATZTEXT
140900               COMPUTE GSTMEL-ZUSATZTEXT-LAENGE 
141000                                 = FUNCTION LENGTH(H-ZUTXT-4301)
141100                 ON SIZE ERROR CONTINUE                           
141200               END-COMPUTE                                        
141300               PERFORM MELDUNG-EINTRAGEN
141400               GO TO PROGRAMM-VERLASSEN
141500             ELSE
141600               ADD C-1            TO GSTTAB-ZEILENNUMMER
141700                 ON SIZE ERROR CONTINUE                           
141800               END-ADD                                            
141900               SET AKNR-SUCHEN    TO TRUE
142000             END-IF
142100           END-IF
142200         WHEN C-GEW-ZUSTAND
142300           SET AKNR-N-GEFUNDEN    TO TRUE       
142400*          KA4301: Es sind keine Abstimmkreis-Konten definiert
142500           MOVE C-OBJEKT-KA4301  
142600                                  TO H-MELDUNGS-OBJEKT
142700           MOVE C-AKASAL          TO H-ZUTXT-4301-AUFTR
142800           MOVE H-AK-NUMMER       TO H-ZUTXT-4301-AKR
142900           MOVE H-ZUTXT-4301      TO GSTMEL-ZUSATZTEXT
143000           COMPUTE GSTMEL-ZUSATZTEXT-LAENGE 
143100                             = FUNCTION LENGTH(H-ZUTXT-4301)
143200             ON SIZE ERROR CONTINUE                              
143300           END-COMPUTE                                           
143400           PERFORM MELDUNG-EINTRAGEN
143500           GO TO PROGRAMM-VERLASSEN
143600         WHEN OTHER
143700           GO TO PROGRAMM-VERLASSEN               
143800       END-EVALUATE
143900     END-PERFORM
144000     .
144100 LESEN-TAB-AKKTO-1002.
144200     EXIT.
144300/---------------------------------------------------------------*
144400* LESEN-TAB-AKKTO-NEXT:                                         *
144500* Lesen naechste Zeile aus KA000AKKTO                           *
144600*---------------------------------------------------------------*
144700 LESEN-TAB-AKKTO-NEXT SECTION.
144800 LESEN-TAB-AKKTO-NEXT-1001.
144900*
145000     MOVE H-NAECHSTE-ZEILE        TO GSTTAB-ZEILENNUMMER 
145100     SET AKNR-SUCHEN              TO TRUE
145200*
145300     CALL "CGSTAB" USING
145400          C-TAB-LESEN-ZEILE
145500          C-KONFIG-ID-KA
145600          C-OBJEKT-TAB-KA03AKKTO                                  E01
145700          GSOVER-VERSTAENDIGUNGSBEREICH
145800          KAI0AKK-EINGABEBEREICH
145900          KAO0AKK-AUSGABEBEREICH
146000          GSTTAB-EIN-AUSGABEBEREICH
146100     END-CALL
146200*
146300     EVALUATE GSOVER-GEWICHT
146400       WHEN C-GEW-NICHT-GESETZT
146500         IF H-AK-NUMMER           = KAO0AKK-AK-NUMMER
146600         THEN
146700           SET AKNR-GEFUNDEN      TO TRUE
146750           MOVE KAO0AKK-ROLLE-KONTO                               D01
146751                                  TO H-ROLLE                      D01
146800           MOVE KAO0AKK-HERKUNFT  TO H-HERKUNFT
146900           MOVE KAO0AKK-KONTO-ID  TO H-KONTO-ID
147000         ELSE
147100           SET AKNR-N-GEFUNDEN    TO TRUE
147200           
147300         END-IF
147400       WHEN C-GEW-ZUSTAND
147500          SET AKNR-N-GEFUNDEN     TO TRUE       
147600       WHEN OTHER
147700         GO TO PROGRAMM-VERLASSEN               
147800     END-EVALUATE
147900     .
148000 LESEN-TAB-AKKTO-NEXT-1002.
148100     EXIT.
148200/---------------------------------------------------------------*
148300* Aufruf des Auftrags KKA5AP                                    *
148400* Lesen APO über PK                                             *
148500*---------------------------------------------------------------*
148600 AUFRUF-KKA5AP SECTION.
148700 AUFRUF-KKA5AP-1001.
148800*
148900     MOVE C-01-INT-LES-APO-SUM-AK TO KAI5AP6-FUNKTION
149000*
149100* Eingabebereich versorgen
149200*
149300     MOVE KAISAL1-ABSTIMMKREIS-NR TO
149400          KAI5AP6-ABSTIMMKREIS-NR
149500     MOVE H-HERKUNFT              TO
149600          KAI5AP6-HERKUNFT
149700     MOVE H-KONTO-ID              TO
149800          KAI5AP6-KONTO-ID-ABSTIMM
149900*    Status OFFEN übergeben
150000     MOVE C-OFFEN-2               TO
150100          KAI5AP6-STATUS
150200*
150300     CALL "CGSAUF" USING
150400          C-AUF-AUFRUF-AL
150500          C-KONFIG-ID-KA 
150600          C-OBJEKT-AUFTRAG-KKA5AP  
150700          GSOVER-VERSTAENDIGUNGSBEREICH  
150800          KAI5AP6-EINGABEBEREICH    
150900          KAO5AP5-AUSGABEBEREICH   
151000          DUMMY
151100          DUMMY
151200     END-CALL
151300*
151400     IF GSOVER-GEWICHT            > C-GEW-ZUSTAND
151500     THEN
151600       GO TO PROGRAMM-VERLASSEN
151700     END-IF
151800*
151900     MOVE KAO5AP5-SUMME-APO-BETRAEGE
152000                                 TO H-SUMME-APO-BETR
152100     .
152200 AUFRUF-KKA5AP-1002.
152300     EXIT.
152400/---------------------------------------------------------------*
152500* Aufruf des Auftrags KKA5KT                                    *
152600* Ändern APO-Satz                                               *
152700*---------------------------------------------------------------*
152800 AUFRUF-KKA5KT SECTION.
152900 AUFRUF-KKA5KT-1001.
153000*
153100     MOVE C-01-INT-LES-KTO        TO KAI5KT1-FUNKTION 
153200    
153300* Eingabebereich versorgen
153400
153500* Grundbelegung vom Lesen
153600     MOVE H-HERKUNFT              TO KAI5KT1-HERKUNFT
153700     MOVE H-KONTO-ID              TO KAI5KT1-KONTO-ID
153705                                                                  D03
153710* Ausgabebereich initalisieren                                    D03
153715     MOVE INI-KAO5KT1-AUSGABEBEREICH                              D03
152716                                  TO KAO5KT1-AUSGABEBEREICH       D03
153800*
153900     CALL "CGSAUF" USING
154000          C-AUF-AUFRUF-AL
154100          C-KONFIG-ID-KA 
154200          C-OBJEKT-AUFTRAG-KKA5KT  
154300          GSOVER-VERSTAENDIGUNGSBEREICH  
154400          KAI5KT1-EINGABEBEREICH    
154500          KAO5KT1-AUSGABEBEREICH
154600          DUMMY
154700          DUMMY
154800     END-CALL
154900*
155000     IF GSOVER-GEWICHT            > C-GEW-ZUSTAND                 D03
155100     THEN
155200*      KA4302: Zu diesem Eintrag ist kein Konto vorhanden
155300       MOVE C-OBJEKT-KA4302       TO H-MELDUNGS-OBJEKT
155400       MOVE C-AKASAL              TO H-ZUTXT-4302-AUFTR
155500       MOVE H-KONTO-ID            TO H-ZUTXT-4302-KONTO-ID
155600       MOVE H-ZUTXT-4302          TO GSTMEL-ZUSATZTEXT
155700       COMPUTE GSTMEL-ZUSATZTEXT-LAENGE 
155800                                  = FUNCTION LENGTH(H-ZUTXT-4302)
155900         ON SIZE ERROR CONTINUE                                   
156000       END-COMPUTE                                                
156100       PERFORM MELDUNG-EINTRAGEN
156200       GO TO PROGRAMM-VERLASSEN
156300     END-IF
156400     MOVE KAO5KT1-SALDO           TO H-KONTO-SALDO
156500     .
156600 AUFRUF-KKA5KT-1002.                                              D04
156700     EXIT.
156800/---------------------------------------------------------------*
156900* Programminitialisierung                                       *
157000*---------------------------------------------------------------*
157100 INITIALISIERUNG SECTION.
157200 INITIALISIERUNG-1001.
157300*
157400     MOVE SPACES                  TO GSTMEL-TRANSIENTER-BEREICH
157500     MOVE ZERO                    TO GSTMEL-ZUSATZTEXT-LAENGE
157600     MOVE ZERO                    TO GSTMEL-FELDINDEX (1)
157800     MOVE ZERO                    TO GSTMEL-FELDINDEX (2)
158000     MOVE ZERO                    TO GSTMEL-FELDINDEX (3)
158100     MOVE ZERO                    TO GSTMEL-FELDINDEX (3)
158300     MOVE ZERO                    TO GSTMEL-FELDINDEX (4)
158400     MOVE ZERO                    TO GSTMEL-FELDINDEX (5)
158500     MOVE ZERO                    TO GSTMEL-POS-CURSOR
158600     MOVE SPACE                   TO H-FUNKTION
158700*
158800     PERFORM LESEN-ANMELDEDATEN
158850*                                                                 D03
158851*    Aktionen, die nur einmalig durchzuführen sind:               D03
158852     IF H-ERSTER-AUFRUF = C-JA                                    D03
158853     THEN                                                         D03
158854*      Initialisierung der Lösch-Strukturen (INI-Strukturen)      D03  
158855       INITIALIZE INI-KAO5KT1-AUSGABEBEREICH                      D03
158856*      Zurücksetzen des Schalters bzgl. <ERSTER AUFRUF>           D03   
158857       MOVE C-NEIN                TO H-ERSTER-AUFRUF              D03
158858     END-IF                                                       D03
158900     .
159000 INITIALISIERUNG-1002.
159100     EXIT.
159200/---------------------------------------------------------------*
159300* Versorgen des Ausgabebereichs abh. vom VERARB-ZAEHLER         *
159400*---------------------------------------------------------------*
159500 VERSORGEN-AUSGABE SECTION.
159600 VERSORGEN-AUSGABE-1001.
159700*
159800     EVALUATE H-VERARB-ZAEHLER
159900       WHEN C-1
160000         MOVE C-1                  TO KAOSAL1-ANZ-KONTEN-IM-AK      
160100*                             
160200         MOVE KAO0AKK-AK-NUMMER    TO KAOSAL1-I-ABSTIMMKREIS-NR     
160300*        INFOS-ZU-AK-KTO-1                                      
160400         MOVE H-ROLLE              TO KAOSAL1-IK1-ROLLE-KTO         
160500         MOVE H-HERKUNFT           TO KAOSAL1-IK1-HERKUNFT          
160600         MOVE H-KONTO-ID           TO KAOSAL1-IK1-KONTO-ID          
160700         MOVE H-KONTO-SALDO        TO KAOSAL1-IK1-SALDO-KTO         
160800*        INFOS-ZU-AK-KTO-2                                      
160900         MOVE ZERO                 TO KAOSAL1-IK2-ROLLE-KTO         
161000         MOVE SPACE                TO KAOSAL1-IK2-HERKUNFT          
161100         MOVE SPACE                TO KAOSAL1-IK2-KONTO-ID          
161200         MOVE ZERO                 TO KAOSAL1-IK2-SALDO-KTO         
161300*        INFOS-WEITERE                                  
161400         MOVE H-KONTO-SALDO        TO KAOSAL1-IW-SUMME-SALDEN       
161500         MOVE H-SUMME-APO-BETR     TO 
161600              KAOSAL1-IW-SUM-OFF-APOS
161700         COMPUTE KAOSAL1-IW-ABWEICHUNG    
161800                                   = KAOSAL1-IW-SUMME-SALDEN 
161900                                   - KAOSAL1-IW-SUM-OFF-APOS  
162000            ON SIZE ERROR CONTINUE                                 
162100         END-COMPUTE                                               
162200       WHEN C-2
162300         MOVE C-2                  TO KAOSAL1-ANZ-KONTEN-IM-AK      
162400*        INFOS-ZU-AK-KTO-2                                      
162500         MOVE H-ROLLE              TO KAOSAL1-IK2-ROLLE-KTO                    
162600         MOVE H-HERKUNFT           TO KAOSAL1-IK2-HERKUNFT                        
162700         MOVE H-KONTO-ID           TO KAOSAL1-IK2-KONTO-ID                         
162800         MOVE H-KONTO-SALDO        TO KAOSAL1-IK2-SALDO-KTO                              
162900*        INFOS-WEITERE                                  
163000         ADD H-KONTO-SALDO         TO KAOSAL1-IW-SUMME-SALDEN             
163100           ON SIZE ERROR CONTINUE                                  
163200         END-ADD                                                   
163300         ADD H-SUMME-APO-BETR      TO KAOSAL1-IW-SUM-OFF-APOS       
163400           ON SIZE ERROR CONTINUE                                  
163500         END-ADD                                                   
163600         COMPUTE KAOSAL1-IW-ABWEICHUNG         
163700                                   = KAOSAL1-IW-SUMME-SALDEN 
163800                                   - KAOSAL1-IW-SUM-OFF-APOS  
163900            ON SIZE ERROR CONTINUE                                 
164000         END-COMPUTE                                               
164100       WHEN OTHER          
164200         CONTINUE
164300     END-EVALUATE
164400     .
164500 VERSORGEN-AUSGABE-1002.
164600     EXIT.
164700/---------------------------------------------------------------*
164800* Lesen der Anmeldedaten                                        *
164900*---------------------------------------------------------------*
165000 LESEN-ANMELDEDATEN SECTION.
165100 LESEN-ANMELDEDATEN-1001.
165200     CALL "CGSTAB"
165300     USING C-TAB-ANM-DAT-LESEN
165400           C-KONFIG-ID-GS
165500           C-OBJEKT-TAB-ANMELDEDATEN
165600           GSOVER-VERSTAENDIGUNGSBEREICH
165700           DUMMY
165800           GSO0ANM-AUSGABEBEREICH
165900           GSTTAB-EIN-AUSGABEBEREICH
166000     END-CALL
166100
166200     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
166300     THEN
166400       GO TO PROGRAMM-VERLASSEN
166500     END-IF
166600      .
166700 LESEN-ANMELDEDATEN-1002.
166800     EXIT.
166900/---------------------------------------------------------------*
167000* Meldung eintragen                                             *
167100*---------------------------------------------------------------*
167200 MELDUNG-EINTRAGEN SECTION.
167300 MELDUNG-EINTRAGEN-1001.
167400     CALL "CGSMEL"
167500     USING C-MEL-EINTRAGEN
167600           C-KONFIG-ID-KA
167700           H-MELDUNGS-OBJEKT
167800           GSOVER-VERSTAENDIGUNGSBEREICH
167900           DUMMY
168000           GSOMEL-AUSGABEBEREICH
168100           GSTMEL-TRANSIENTER-BEREICH
168200     END-CALL
168300*
168400     IF GSOVER-GEWICHT            > C-GEW-FEHLER
168500     THEN
168600       GO TO PROGRAMM-VERLASSEN
168700     ELSE
168800       MOVE H-MELDUNGS-OBJEKT     TO GSOVER-RETURNCODE
168900     END-IF
169000     .
169100 MELDUNG-EINTRAGEN-1002.
169200     EXIT.
169300/*-------------------------------------------------------------*
169400* Meldungen aus Meldungspool loeschen.                         *
169500*--------------------------------------------------------------*
169600 MELDUNG-AUSTRAGEN SECTION.
169700 MELDUNG-AUSTRAGEN-1001.
169800     CALL "CGSMEL"
169900     USING C-MEL-AUSTRAGEN
170000           C-KONFIG-ID-KA
170100           C-OBJEKT-MEL-GSPOOL
170200           GSOVER-VERSTAENDIGUNGSBEREICH
170300           DUMMY
170400           GSOMEL-AUSGABEBEREICH
170500           GSTMEL-TRANSIENTER-BEREICH
170600
170700     IF GSOMEL-MAX-GEW > C-GEW-WARNUNG
170800     THEN
170900       GO TO PROGRAMM-VERLASSEN
171000     END-IF
171100     .
171200 MELDUNG-AUSTRAGEN-1002.
171300     EXIT.
171400/---------------------------------------------------------------*
171500* Verlassen des Programms ueber einen Ausstiegspunkt            *
171600*---------------------------------------------------------------*
171700 PROGRAMM-VERLASSEN SECTION.
171800 PROGRAMM-VERLASSEN-1001.
171900     EXIT PROGRAM.
172000 PROGRAMM-VERLASSEN-1002.
172100     EXIT.

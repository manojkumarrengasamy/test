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
000160*@Titel         : lesen Abstimmpositionen Oberfläche
000160*@Elementname   : aka5of.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00001
000160*@Cr_Date       : 20150107.094112
000160*@Produkt       : ak
000160*@Lieferpaket   : 
000160*@Liefertiefe   : ja
000160*@Rekursiv      : 
000160*@Kategorie     : sao
000160*@BatchDialog   : dialog
000160*@Zugeliefert   : 
000160*@Generiert_aus : 
000160*@Nicht_manuell : 
000160*@Pruefe_aekz   : j
000160*@Querschnitt   : 
000160*@SQL           : 
000160*@e_element_info 
000160*
001000*@Title        : Lesen Abstimmpositionen Oberfläche         *
001100* Verfasser    : Stefan Poetsch                             *
001200* Erstelldatum : 02.02.2012                                 *
001400*                                                           *
001500*@A-ELEMENTBESCHREIBUNG                                     *
001600* Modul-Beschreibung:                                       *
001700* ------------------                                        *
001800* Der KORDOBA Auftrag stellt die fuer die Leseanforderungen *
001900* der KA-Oberfläche nötigen Funktionen bereit.              *
002000*                                                           *
002100*@E-ELEMENTBESCHREIBUNG                                     *
002200*                                                           *
002300*@A-FUNKTION-1                                              *
002400* Lesen der Daten für die Detailauskunft.                   *
002500*                                                           *
002600* Eingabefeldbelegungen:                                    *
002700* Funktion "01-STD-APO-L-DET-AUSK"                          *
002800* APO-Primärkey                                             *
002900*                                                           *
003000*@E-FUNKTION-1                                              *
003100*                                                           *
003200*@A-FUNKTION-2                                              *
003300* Portionsweise Bereitstellung aller  APO-Sätze, die        *
003400* zu einer  bestimmten Schließung gehören.                  *
003500*                                                           *
003600* Eingabefeldbelegungen:                                    *
003700* Funktion "01-STD-APO-LIST-Z-SCH"                          *
003800* Selektionskriterien                                       *
003900*                                                           *
004000*                                                           *
004100*@E-FUNKTION-2                                              *
004200*                                                           *
004300*@A-FUNKTION-3                                              *
004400* Bereitstellen APOs zu dynamischen Suchkriterien.          *
004500*                                                           *
004600* Eingabefeldbelegungen:                                    *
004700* Funktion "01-STD-APO-LIST-SUCHE"                          *
004800* Selektionskriterien                                       *
004900*                                                           *
005000*@E-FUNKTION-3                                              *
005100*                                                           *
005200*@A-MODULAUFRUF                                             *
005300* Aufruf-Beispiel:                                          *
005400*                                                           *
005500* Aufrufparameter: 1. Funktion               (I)            *
005600*                  2. Konfigurations-Id      (I)            *
005700*                  3. Objekt                 (I)            *
005800*                  4. Verstaendigungsbereich (O)            *
005900*                  5. Eingabebereich         (I)            *
006000*                  6. Ausgabebereich         (O)            *
006100*                  7. Transientbereich       (I/O)          *
006200*                  8. Indices                (I)            *
006300*                                                           *
006400* CALL "CGSAUF"                                             *
006500* USING C-AUF-AUFRUF-AL                                     *
006600*       C-KONFIG-ID-KA                                      *
006700*       C-OBJEKT-AUFTRAG-AKA5OF                             *
006800*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *
006900*       KAI5OF3-EINGABEBEREICH                              *
007000*       KAO5OF2-AUSGABEBEREICH                              *
007100*       KAT5OF1-TRANSIENT-BEREICH                           *
007200*       KAXIND-INDICES                                      *
007300*                                                           *
007400*@E-MODULAUFRUF                                             *
007500*                                                           *
007600*@A-RETURNCODE                                              *
007700* Meldungen/Returncodes:                                    *
007800* ----------------------                                    *
007900
008000* Folgende Fehlermeldungen werden von diesem KORDOBA-Auftrag*
008100* zureckgegeben bzw. in den Meldungs-Pool eingetragen:      *
008200* KA0000 : Verarbeitung erfolgreich durchgeführt            *
008250* KA4207: Tabelle @@@@@@@@@@ hat keinen Eintrag zu          *     D02
008251*         @@@@@@@@@@@@@@@@@@@@                              *     D02
008300* alle Meldungen der gerufenen AUfträge                     *
008400*                                                           *
008500*@E-RETURNCODE                                              *
008600*                                                           *
008700*@A-ENTRY                                                   *
008800* Entryname       : AKA5OF                                  *
008900*                                                           *
009000*@E-ENTRY                                                   *
009100*                                                           *
009200*@A-MODUL                                                   *
009300* Gerufene Moduln/Auftraege:                                *
009400* CGSDZS   Datenzugriffsschicht                             *
009500* CGSMEL   Meldungsschnittstelle                            *
009600* CGSBER   - Servicefunktion Berechtigungsprüfung           *
009700*                                                           *
009800*@E-MODUL                                                   *
009900*                                                           *
010000*@A-COBOL-COPY                                              *
010100* Benoetigte Cobol-Copies:                                  *
010200* CGSI0MEL: Eingabebereich Meldungstabelle                  *
010300* CGSO0MEL: Ausgabebereich Meldungstabelle                  *
010400* CGSOMEL : Ausgabebereich Meldungsschnittstelle            *
010500* CGSTMEL : transienter Bereich Meldungsschnittstelle       *
010600* CGSOVER : Verstaendigungsbereich                          *
010700* CGSTTAB : transienter Bereich Zugriff Parametertabellen   *
010800* CGSO0ANM: Copy fuer taskspez. Anmeldedaten                *
010900* CKAI5OF1: Eingabebereich AKA5OF                           *
011000* CKAI5OF2: Eingabebereich AKA5OF                           *
011100* CKAO5OF1: Ausgabebereich AKA5OF                           *
011200* CKAI5OF3: Eingabebereich AKA5OF                           *
011300* CKAO5OF2: Ausgabebereich AKA5OF                           *
011350* CKAI0INS: Eingabebereich KA000INSTA                       *     D02
011351* CKAO0INS: Ausgabebereich KA000INSTA                       *     D02
011400* CKAT5OF1: Transienter Bereich                             *
011500* CKAXIND : Indices                                         *
011600* DCTGRCGE: Meldungsgewichte                                *
011700*                                                           *
011800*@E-COBOL-COPY                                              *
011900*                                                           *
012000*@A-TABELLE                                                 *
012100* TABEX-Tabellen  :                                         *
012200*                                                           *
012300*@E-TABELLE                                                 *
012400*                                                           *
012500*@A-BENUTZERSATZ                                            *
012600* Benutzersaetze  : <benutzersatz> (I/O/IO)                 *
012700* keine                                                     *
012800*                                                           *
012900*@E-BENUTZERSATZ                                            *
013000*                                                           *
013100*@A-DATEI                                                   *
013200* Dateien         : entfallen                               *
013300*                                                           *
013400*@E-DATEI                                                   *
013500*                                                           *
013600*@A-KONVENTIONEN                                            *
013700*@E-KONVENTIONEN                                            *
013800*                                                           *
013900*@A-DOKUMENT                                                *
014000* Die fachliche Beschreibung ist im Dokument                *
014100* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *
014200* hinterlegt.                                               *
014300*                                                           *
014400*@E-DOKUMENT                                                *
014500*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
090051* D01 R49405                                                *     D01
090052*     Anpassung der Funktionscodes der Berechtigungsprüfung *     D01
090053*     Datum: 02.08.2012                            NKZ: TRO *     D01
090054*                                                           *     D01
090055* D02 R58134:  CR-Ticket 172088                             *     D02
090056*     Bei entsprechend gesetztem Installationsparameter     *     D02
090057*     werden nur diejenigen Abstimmposten als "freigebbar"  *     D02
090058*     angezeigt, welche nicht vom aktiven Benutzer geschlos-*     D02
090059*     sen wurden (Vorwegnahme des 4-Augen-Prinzips)         *     D02
090060*     Datum: 29.04.2013                            NKZ: TRO *     D02
090061*                                                           *     D02
090062* D03 R60232: Ausgabebereich stets vollständig versorgen    *     D03
090063*     Die Berechtigungs-Flags müssen auch versorgt werden,  *     D03
090064*     wenn die Detailauskunft als Funktion gewählt wurde.   *     D03
090065*     Datum: 13.08.2013                            NKZ: TRO *     D03
090066*                                                           *     D03
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/
100200 IDENTIFICATION DIVISION.
100300 PROGRAM-ID. AKA5OF.
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
101550     05  FILLER PIC X(13) VALUE "ELEM=aka5of  ".                  CCC
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
103300    05 C-OBJEKT-KA1000            PIC X(006) VALUE "KA1000".
103350    05 C-OBJEKT-KA4207            PIC X(006) VALUE "KA4207".      D02
103400    05 C-OBJEKT-KA4801            PIC X(006) VALUE "KA4801".
103500    05 C-OBJEKT-KA5002            PIC X(006) VALUE "KA5002".
103600/---------------------------------------------------------------*
103700* Lokale Konstante fuer KORDOBA-Auftrag AKA5OF                  *
103800*---------------------------------------------------------------*
103900 01 KONSTANTE-AKA5OF.
104000    05 C-01-STD-APO-L-DET-AUSK    PIC X(040) VALUE
104100                                  "01-STD-APO-L-DET-AUSK".
104200    05 C-01-STD-APO-LIST-Z-SCH    PIC X(040) VALUE
104300                                  "01-STD-APO-LIST-Z-SCH".
104400    05 C-01-STD-APO-LIST-SUCHE    PIC X(040) VALUE
104500                                  "01-STD-APO-LIST-SUCHE".
104600    05 C-KONFIG-ID-KA             PIC X(002) VALUE "KA".
104700    05 C-KONFIG-ID-GS             PIC X(002) VALUE "GS".
104800    05 C-AUF-AUFRUF-AL            PIC X(040) VALUE "AUFRUF-AL".
104900    05 C-AKA5OF                   PIC X(008) VALUE "AKA5OF".
105000    05 C-1                        PIC 9(001) VALUE 1.
105100    05 C-200                      PIC 9(003) VALUE 200.
105200    05 C-J                        PIC X(001) VALUE "J".
105300    05 C-N                        PIC X(001) VALUE "N".
105350    05 C-STAT-FREIZUGEBEN         PIC X(001) VALUE "5".           D02
105351    05 C-ANZ-UMF-FR               PIC X(010) VALUE "ANZ-UMF-FR".  D02
105352    05 C-KEINE-SELBST-GESCHLO     PIC X(020) VALUE                D02
105353                                  "KEINE-SELBST-GESCHLO".         D02
105400/---------------------------------------------------------------*
105500* CGSMEL                                                        *
105600*---------------------------------------------------------------*
105700 01 CGSMEL-DEFINITIONEN.
105800     05 C-MEL-EINTRAGEN           PIC X(040) VALUE "EINTRAGEN".
105900     05 C-MEL-AUSTRAGEN           PIC X(040) VALUE "AUSTRAGEN".
106000     05 C-OBJEKT-MEL-GSPOOL       PIC X(006) VALUE SPACE.
106100/---------------------------------------------------------------*
106200* CGSTAB                                                        *
106300*---------------------------------------------------------------*
106400 01 CGSTAB-DEFINITIONEN.
106500     05 C-OBJEKT-LOG-NAME         PIC X(009) VALUE "KA00INSTA".
106600     05 C-OBJEKT-TAB-ANMELDEDATEN PIC X(020) VALUE "ANMELDEDATEN".
106650     05 C-OBJEKT-TAB-KA00INSTA    PIC X(020) VALUE "KA00INSTA".   D02
106700     05 C-TAB-LESEN-ZEILE         PIC X(040) VALUE "LESEN-ZEILE".
106800     05 C-TAB-LESEN-EQUAL         PIC X(040) VALUE "LESEN-EQUAL".
106900     05 C-TAB-ANM-DAT-LESEN       PIC X(040) VALUE
107000                                  "ANM-DAT-LESEN".
107100/
107200*---------------------------------------------------------------*
107300* Schnittstelle CGSBER (Berechtigungspruefung)                  *
107400*---------------------------------------------------------------*
107500 01 H-BERECHTIGUNG.
107600     05 C-BER-PRUEFEN             PIC X(040) VALUE "PRUEFEN".
107700     05 C-OBJEKT-BER-USER-BERECHT PIC X(020)
107800                                  VALUE "USER-BERECHT".
107900     05 C-BER-ANZAHL-3            PIC 9(002) VALUE 3.
108000     05 H-OBJEKT-BER              PIC X(010) VALUE SPACE.
108100     05 C-OBJEKT-BER-KA-KTOABST   PIC X(010) VALUE "KA-KTOABST".
108200     05 C-FKT-BER-AUSK            PIC X(003) VALUE "710".
108300     05 C-FKT-BER-AEND            PIC X(003) VALUE "750".         D01
108400     05 C-FKT-BER-ABST            PIC X(003) VALUE "760".         D01
108500     05 C-FKT-BER-ABSTFREI        PIC X(003) VALUE "772".         D01
108600     05 C-FKT-BER-SCHLFREI        PIC X(003) VALUE "770".
108700*
108800     COPY CGSI4BER                REPLACING 01 BY 05,
108900                                  ==(01)== BY ==(01)==.
109000*---------------------------------------------------------------* 
109100* Schnittstellenparameter für Auftrag KKA5AP                    * 
109200*---------------------------------------------------------------* 
109300 01 C-01-INT-LES-APO-DETAIL       PIC X(040) VALUE
109400                                  "01-INT-LES-APO-DETAIL".
109500 01 C-01-INT-LIST-APO-DIA-SL      PIC X(040) VALUE
109600                                  "01-INT-LIST-APO-DIA-SL".
109700 01 C-01-INT-LIST-APO-DIA-SU       PIC X(040) VALUE
109800                                  "01-INT-LIST-APO-DIA-SU".
109900 01 C-OBJEKT-AUFTRAG-KKA5AP       PIC X(020) VALUE "KKA5AP".   
110000 COPY CKAI5AP1.
110100 COPY CKAO5AP1.
110200 COPY CKAI5AP4.
110300 COPY CKAI5AP5.
110400 COPY CKAO5AP4.
110500 COPY CKAT5AP3.
110600*---------------------------------------------------------------* 
110700* Schnittstellenparameter für Auftrag KKA5SL                    * 
110800*---------------------------------------------------------------* 
110900 01 C-01-INT-LES-SCH-DETAIL       PIC X(040) VALUE
111000                                  "01-INT-LES-SCH-DETAIL".
111100 01 C-OBJEKT-AUFTRAG-KKA5SL       PIC X(020) VALUE "KKA5SL".   
111200 COPY CKAI5SL1. 
111300 COPY CKAO5SL1.
111350/---------------------------------------------------------------* D02
111351* Moduleigenes Gedächtnis für einmalig ermittelte Werte         * D02
111352*---------------------------------------------------------------* D02
111353 01 AKA5OF-GEDAECHTNIS.                                           D02
111354    05 GEDAECHTNIS-FLAG           PIC X(001) VALUE LOW-VALUE.     D02
111355     88 GEDAECHTNIS-BEFUELLT      VALUE HIGH-VALUE.               D02
111356     88 GEDAECHTNIS-LEER          VALUE LOW-VALUE.                D02
111357    05 H-MERK-ANZ-UMF-FR          PIC X(020).                     D02
111400/---------------------------------------------------------------*
111500* Hilfsfelder                                                   *
111600*---------------------------------------------------------------*
111700 01 HILFSFELDER.
111800    05 H-ZAEHLER-ANZ              PIC 9(003).
111900/---------------------------------------------------------------*
112000*   LOKALE ARBEITSFELDER                                        *
112100*---------------------------------------------------------------*
112200 LOCAL-STORAGE SECTION.
112300/---------------------------------------------------------------*
112400* Meldungsschnittstelle                                         *
112500*---------------------------------------------------------------*
112600 COPY CGSOMEL.
112700 COPY CGSTMEL.
112800/---------------------------------------------------------------*
112900* Meldungstabelle                                               *
113000*---------------------------------------------------------------*
113100 COPY CGSI0MEL.
113200 COPY CGSO0MEL.
113300/---------------------------------------------------------------*
113400* Anmeldedaten                                                  *
113500*---------------------------------------------------------------*
113600 COPY CGSO0ANM.
113700* Uebergabeparameter fuer CGSTAB                                *
113800*---------------------------------------------------------------*
113900 COPY CGSTTAB.
113950/---------------------------------------------------------------* D02
113951* Installationsparameter KA                                     * D02
113952*---------------------------------------------------------------* D02
113953 COPY CKAI0INS.                                                   D02
113954 COPY CKAO0INS.                                                   D02
114000/---------------------------------------------------------------*
114100* Hilfsfelder                                                   *
114200*---------------------------------------------------------------*
114300 01 H-MELDUNGS-OBJEKT             PIC X(006).
114400 01 H-FUNKTION.
114500     05 H-FUNKTION-MLD            PIC X(020).
114600     05 H-FUNKTION-REST           PIC X(020).
114700 01 H-BERECH-HINWEISE.
114800     05 H-BERECH-AUSK             PIC X(001).
114900     05 H-BERECH-AEND             PIC X(001).
115000     05 H-BERECH-ABST             PIC X(001).
115100     05 H-BERECH-ABSTFREI         PIC X(001).
115200     05 H-BERECH-SCHLFREI         PIC X(001).
115300     05 FILLER                    PIC X(005).
115400 01 DUMMY                         PIC X(001).
115500/****************************************************************
115600 LINKAGE SECTION.
115700*****************************************************************
115800*---------------------------------------------------------------*
115900* Funktion                                                      *
116000*---------------------------------------------------------------*
116100 01 AUF-FUNKTION                  PIC X(040).
116200*---------------------------------------------------------------*
116300* Konfigurations-Kennzeichen                                    *
116400*---------------------------------------------------------------*
116500 01 KONFIG-ID                     PIC X(002).
116600*---------------------------------------------------------------*
116700* Auftragsname                                                  *
116800*---------------------------------------------------------------*
116900 01 OBJEKT-AUFTRAGS-ID            PIC X(020).
117000*---------------------------------------------------------------*
117100* VerstAendigungsbereich des Aufrufers                          *
117200*---------------------------------------------------------------*
117300 COPY CGSOVER.
117400*---------------------------------------------------------------*
117500* Eingabebereich fuer den StandAlone-Auftrag AKA5OF             *
117600*---------------------------------------------------------------*
117700 01 LS-EINGABEBEREICH             PIC X(001).                      
117800 01 LS-EIN-BER-01                 REDEFINES LS-EINGABEBEREICH. 
117900     COPY CKAI5OF1                REPLACING 01 BY 05,
118000                                  ==(01)== BY ==(01)==.
118100 01 LS-EIN-BER-02                 REDEFINES LS-EINGABEBEREICH. 
118200     COPY CKAI5OF2                REPLACING 01 BY 05,
118300                                  ==(01)== BY ==(01)==.
118400 01 LS-EIN-BER-03                 REDEFINES LS-EINGABEBEREICH. 
118500     COPY CKAI5OF3                REPLACING 01 BY 05,
118600                                  ==(01)== BY ==(01)==.
118700*---------------------------------------------------------------*
118800* Ausgabebereich fuer den StandAlone-Auftrag AKA5OF             *
118900*---------------------------------------------------------------*
119000 01 LS-AUSGABEBEREICH             PIC X(001).                      
119100 01 LS-AUS-BER-01                 REDEFINES LS-AUSGABEBEREICH. 
119200     COPY CKAO5OF1                REPLACING 01 BY 05,
119300                                  ==(01)== BY ==(01)==.
119400 01 LS-AUS-BER-02                 REDEFINES LS-AUSGABEBEREICH. 
119500     COPY CKAO5OF2                REPLACING 01 BY 05,
119600                                  ==(01)== BY ==(01)==.
119700*---------------------------------------------------------------*
119800* Transientbereich im Auftragsformat fuer den Auftrag AKA5OF    *
119900*---------------------------------------------------------------*
120000 COPY CKAT5OF1.
120100*---------------------------------------------------------------*
120200* Indices                                                       *
120300*---------------------------------------------------------------*
120400 COPY CKAXIND. 
120500/
120600 PROCEDURE DIVISION
120700     USING AUF-FUNKTION
120800           KONFIG-ID
120900           OBJEKT-AUFTRAGS-ID
121000           GSOVER-VERSTAENDIGUNGSBEREICH
121100           LS-EINGABEBEREICH
121200           LS-AUSGABEBEREICH
121300           KAT5OF1-TRANSIENT-BEREICH
121400           KAXIND-INDICES
121500           .
121600/---------------------------------------------------------------*
121700* Hier wird die Steuerung des KORDOBA-Auftrags durchgefuehrt    *
121800*---------------------------------------------------------------*
121900 STEUER-AKA5OF SECTION.
122000 STEUER-AKA5OF-1001.
122100     PERFORM INITIALISIERUNG
122200     PERFORM BERECHTIGUNG
122300     EVALUATE KAI5OF1-FUNKTION
122400     WHEN C-01-STD-APO-L-DET-AUSK
122500       PERFORM VERARB-DETAIL
122600     WHEN C-01-STD-APO-LIST-SUCHE
122700       PERFORM VERARB-LIST-SUCHE
122800     WHEN C-01-STD-APO-LIST-Z-SCH
122900       PERFORM VERARB-LIST-SUCHE
123000     WHEN OTHER
123100* KA5002: @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@
123200       MOVE C-OBJEKT-KA5002       TO H-MELDUNGS-OBJEKT
123300       MOVE C-AKA5OF              TO GSTMEL-VAR-TEXT-1
123400       MOVE KAI5OF1-FUNKTION      TO H-FUNKTION
123500       MOVE H-FUNKTION-MLD        TO GSTMEL-VAR-TEXT-2
123600       PERFORM MELDUNG-EINTRAGEN
123700       GO TO PROGRAMM-VERLASSEN
123800     END-EVALUATE
123900     .
124000 STEUER-AKA5OF-1002.
124100     GO TO PROGRAMM-VERLASSEN.
124200/---------------------------------------------------------------*
124300* Berechtigungsprüfung                                          *
124400*---------------------------------------------------------------*
124500 BERECHTIGUNG SECTION.
124600 BERECHTIGUNG-1001.
124700*
124800* Pruefen der Berechtigung
124900     MOVE SPACE                   TO GSI4BER-BP-BK-LISTE
125000* Funktion versorgen
125100     MOVE C-FKT-BER-AUSK          TO GSI4BER-BP-FUNKTION-KURZNAME
125200* Objekt versorgen
125300     MOVE C-OBJEKT-BER-KA-KTOABST TO GSI4BER-BP-BER-OBJ-KURZNAME
125400     MOVE ZERO                    TO GSI4BER-BP-ANZAHL-KRITERIEN
125500* Berechtigung aufrufen
125600     PERFORM AUFRUF-CGSBER
125700*
125800     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
125900     THEN
126000*      KA4801 Sie haben nicht die erforderliche Berechtigung
126100       MOVE C-OBJEKT-KA4801       TO H-MELDUNGS-OBJEKT
126200       PERFORM MELDUNG-EINTRAGEN
126300       GO TO PROGRAMM-VERLASSEN
126400     ELSE
126500       MOVE C-OBJEKT-KA0000   TO GSOVER-RETURNCODE
126600     END-IF
126700*
126800     MOVE SPACE                   TO H-BERECH-HINWEISE
126900     MOVE C-J                     TO H-BERECH-AUSK
127000*
127100     MOVE C-FKT-BER-AEND          TO GSI4BER-BP-FUNKTION-KURZNAME
127200     PERFORM AUFRUF-CGSBER
127300     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
127400     THEN
127500       MOVE C-N                   TO H-BERECH-AEND
127600     ELSE
127700       MOVE C-OBJEKT-KA0000   TO GSOVER-RETURNCODE
127800       MOVE C-J                   TO H-BERECH-AEND
127900     END-IF
128000*
128100     MOVE C-FKT-BER-ABST          TO GSI4BER-BP-FUNKTION-KURZNAME
128200     PERFORM AUFRUF-CGSBER
128300     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
128400     THEN
128500       MOVE C-N                   TO H-BERECH-ABST
128600     ELSE
128700       MOVE C-OBJEKT-KA0000   TO GSOVER-RETURNCODE
128800       MOVE C-J                   TO H-BERECH-ABST
128900     END-IF
129000*
129100     MOVE C-FKT-BER-ABSTFREI      TO GSI4BER-BP-FUNKTION-KURZNAME
129200     PERFORM AUFRUF-CGSBER
129300     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
129400     THEN
129500       MOVE C-N                   TO H-BERECH-ABSTFREI
129600     ELSE
129700       MOVE C-OBJEKT-KA0000   TO GSOVER-RETURNCODE
129800       MOVE C-J                   TO H-BERECH-ABSTFREI
129900     END-IF
130000*
130100     MOVE C-FKT-BER-SCHLFREI      TO GSI4BER-BP-FUNKTION-KURZNAME
130200     PERFORM AUFRUF-CGSBER
130300     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
130400     THEN
130500       MOVE C-N                   TO H-BERECH-SCHLFREI
130600     ELSE
130700       MOVE C-OBJEKT-KA0000   TO GSOVER-RETURNCODE
130800       MOVE C-J                   TO H-BERECH-SCHLFREI
130900     END-IF
131000     .
131100 BERECHTIGUNG-1002.
131200     EXIT.
131300/---------------------------------------------------------------*
131400* Berechtigungsprüfung - Aufruf CGSBER                          *
131500*---------------------------------------------------------------*
131600 AUFRUF-CGSBER SECTION.
131700 AUFRUF-CGSBER-1001.
131800*
131900* Berechtigung aufrufen
132000     CALL "CGSBER"
132100     USING C-BER-PRUEFEN
132200           C-KONFIG-ID-KA
132300           C-OBJEKT-BER-USER-BERECHT
132400           GSOVER-VERSTAENDIGUNGSBEREICH
132500           GSI4BER-EINGABEBEREICH
132600           DUMMY
132700           DUMMY
132800*
132900     EVALUATE GSOVER-GEWICHT
133000     WHEN C-GEW-ABBRUCH
133100       GO TO PROGRAMM-VERLASSEN
133200     WHEN C-GEW-FEHLER
133300* Fehler der Gewichtung 4 werden uebernommen und eingetragen
133400       MOVE GSOVER-RETURNCODE     TO H-MELDUNGS-OBJEKT
133500       MOVE GSOVER-TEXTE          TO GSTMEL-TEXTE
133600       PERFORM MELDUNG-EINTRAGEN
133700       GO TO PROGRAMM-VERLASSEN
133800     WHEN OTHER
133900       CONTINUE
134000     END-EVALUATE
134100     .
134200 AUFRUF-CGSBER-1002.
134300     EXIT.
134400/---------------------------------------------------------------*
134500* Verarbeitung Detailauskunft                                   *
134600*---------------------------------------------------------------*
134700 VERARB-DETAIL SECTION.
134800 VERARB-DETAIL-1001.
134900     PERFORM PRUEFEN-EINGABEFELDER-1
135000     PERFORM AUFRUF-KKA5AP-DET
135100     PERFORM AUFRUF-KKA5SL-DET
135150*                                                                 D03
135152     MOVE H-BERECH-HINWEISE       TO KAO5OF1-BERECHTIGUNG         D03
135200     .
135300 VERARB-DETAIL-1002.
135400     EXIT.
135500/---------------------------------------------------------------*
135600* Verarbeitung Funktion 2/3                                     *
135700*---------------------------------------------------------------*
135800 VERARB-LIST-SUCHE SECTION.
135900 VERARB-LIST-SUCHE-1001.
136000     PERFORM PRUEFEN-EINGABEFELDER-3
136100     PERFORM AUFRUF-KKA5AP
136200     PERFORM AUFRUFE-KKA5SL
136300*
136400     MOVE H-BERECH-HINWEISE       TO KAO5OF2-BERECHTIGUNG
136500     .
136600 VERARB-LIST-SUCHE-1002.
136700     EXIT.
136800/---------------------------------------------------------------*
136900* Prüfen der Eingabeparamter Detailauskunft                     *
137000*---------------------------------------------------------------*
137100 PRUEFEN-EINGABEFELDER-1 SECTION.
137200 PRUEFEN-EINGABEFELDER-1-1001.
137300* Prüfungen erfolgen in den gerufenen Aufträgen.
137400* Dzt. keine zusätzlichen Prüfen.
137500     NEXT SENTENCE
137600     .
137700 PRUEFEN-EINGABEFELDER-1-1002.
137800     EXIT.
137900/---------------------------------------------------------------*
138000* Prüfen der Eingabeparamter Funktion 3                         *
138100*---------------------------------------------------------------*
138200 PRUEFEN-EINGABEFELDER-3 SECTION.
138300 PRUEFEN-EINGABEFELDER-3-1001.
138400* Prüfungen erfolgen in den gerufenen Aufträgen.
138500* Dzt. keine zusätzlichen Prüfen.
138600     NEXT SENTENCE
138700     .
138800 PRUEFEN-EINGABEFELDER-3-1002.
138900     EXIT.
139000/---------------------------------------------------------------*
139100* Aufruf des Auftrags KKA5AP                                    *
139200* Lesen APO über PK                                             *
139300*---------------------------------------------------------------*
139400 AUFRUF-KKA5AP-DET SECTION.
139500 AUFRUF-KKA5AP-DET-1001.
139600*
139700     MOVE C-01-INT-LES-APO-DETAIL
139800       TO KAI5AP1-FUNKTION
139900* Eingabebereich versorgen
140000
140100     MOVE KAI5OF1-ABSTIMMKREIS-NR
140200       TO KAI5AP1-ABSTIMMKREIS-NR
140300     MOVE KAI5OF1-HERKUNFT
140400       TO KAI5AP1-HERKUNFT
140500     MOVE KAI5OF1-KONTO-ID-ABSTIMM
140600       TO KAI5AP1-KONTO-ID-ABSTIMM
140700     MOVE KAI5OF1-AUSZUGSDATUM
140800       TO KAI5AP1-AUSZUGSDATUM
140900     MOVE KAI5OF1-AUSZUGSNUMMER
141000       TO KAI5AP1-AUSZUGSNUMMER
141100     MOVE KAI5OF1-AUSZUG-FNR
141200       TO KAI5AP1-AUSZUG-FNR
141300     MOVE KAI5OF1-LFD-NR-APO
141400       TO KAI5AP1-LFD-NR-APO
141500* Auftrag aufrufen
141600     CALL "CGSAUF"
141700     USING C-AUF-AUFRUF-AL
141800           C-KONFIG-ID-KA 
141900           C-OBJEKT-AUFTRAG-KKA5AP  
142000           GSOVER-VERSTAENDIGUNGSBEREICH  
142100           KAI5AP1-EINGABEBEREICH    
142200           KAO5AP1-AUSGABEBEREICH   
142300           DUMMY
142400           KAXIND-INDICES
142500*
142600     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
142700     THEN
142800       GO TO PROGRAMM-VERLASSEN
142900     END-IF
143000* Ausgabebereich versorgen
143100     MOVE KAO5AP1-KAAPO-GESAMT
143200       TO KAO5OF1-ABSTIMMPOS-SATZ
143300     .
143400 AUFRUF-KKA5AP-DET-1002.
143500     EXIT.
143600/---------------------------------------------------------------*
143700* Aufruf des Auftrags KKA5SL                                    *
143800* Lesen Schließung über PK                                      *
143900*---------------------------------------------------------------*
144000 AUFRUF-KKA5SL-DET SECTION.
144100 AUFRUF-KKA5SL-DET-1001.
144200*
144300     IF KAO5AP1-APO-SCHLIESSUNGSNR <> ZERO
144400     THEN
144500       MOVE C-01-INT-LES-SCH-DETAIL
144600         TO KAI5SL1-FUNKTION
144700*      Eingabebereich versorgen
144800       MOVE KAO5AP1-APO-SCHLIESSUNGSNR
144900         TO KAI5SL1-SCHLIESSUNGSNR
145000
145100*      Auftrag aufrufen
145200       CALL "CGSAUF"
145300       USING C-AUF-AUFRUF-AL
145400             C-KONFIG-ID-KA 
145500             C-OBJEKT-AUFTRAG-KKA5SL
145600             GSOVER-VERSTAENDIGUNGSBEREICH  
145700             KAI5SL1-EINGABEBEREICH    
145800             KAO5SL1-AUSGABEBEREICH   
145900*
146000       IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
146100       THEN
146200         GO TO PROGRAMM-VERLASSEN
146300       END-IF
146400*      Ausgabebereich versorgen
146500       MOVE KAO5SL1-SCHLIESSUNG-SATZ
146600         TO KAO5OF1-SCHLIESSUNG-SATZ
146700     ELSE
146800       INITIALIZE KAO5OF1-SCHLIESSUNG-SATZ
146900     END-IF
147000*      
147100     .
147200 AUFRUF-KKA5SL-DET-1002.
147300     EXIT.
147400/---------------------------------------------------------------*
147500* Aufruf des Auftrags KKA5AP                                    *
147600* Es werden maximal 200 APOs zuückgeliefert.                    *
147700*---------------------------------------------------------------*
147800 AUFRUF-KKA5AP SECTION.
147900 AUFRUF-KKA5AP-1001.
148000*
148100     IF KAI5OF1-FUNKTION = C-01-STD-APO-LIST-Z-SCH
148200     THEN
148300*      Suche über Schließnummer
148400       MOVE C-01-INT-LIST-APO-DIA-SL
148500         TO KAI5AP4-FUNKTION
148600*      Eingabebereich versorgen
148700       MOVE KAI5OF2-SELEKTION     TO KAI5AP4-SELEKTION
148800       MOVE KAI5OF2-ANF-ANZ-TREFFER
148900         TO KAI5AP4-ANF-ANZ-TREFFER
149000       MOVE KAI5OF2-ANF-KZ-AUFSETZ-ZUGRIFF 
149100         TO KAI5AP4-ANF-KZ-AUFSETZ-ZUGRIFF
149200       IF KAI5OF2-ANF-KZ-AUFSETZ-ZUGRIFF = C-J
149300       THEN
149400         MOVE KAT5OF1-TRANSIENT-BEREICH
149500           TO KAT5AP3-TRANSIENT-BEREICH
149600       END-IF
149700     ELSE
149800*      dynamische Suche
149900       MOVE C-01-INT-LIST-APO-DIA-SU
150000         TO KAI5AP5-FUNKTION
150100*      Eingabebereich versorgen
150200       MOVE KAI5OF3-SELEKTION-OF  TO KAI5AP5-SELEKTION-OF
150251*      Versorge ggfs. den aktuellen Benutzer, damit nur jene      D02
150252*      Treffersätze geliefert werden, die ein anderer Benutzer    D02
150253*      geschlossen hat:                                           D02
150254       IF KAI5OF3-S-STATUS        = C-STAT-FREIZUGEBEN            D02
150255          AND H-MERK-ANZ-UMF-FR   = C-KEINE-SELBST-GESCHLO        D02
150256       THEN                                                       D02
150257         PERFORM LESEN-ANMELDEDATEN                               D02
150258         MOVE GSO0ANM-BENUTZERIDENTIFIKATION                      D02
150259                                  TO KAI5AP5-NOT-USER-SCHLI       D02
150260       ELSE                                                       D02
150261         MOVE HIGH-VALUE          TO KAI5AP5-NOT-USER-SCHLI       D02
150262       END-IF                                                     D02
150300       MOVE KAI5OF3-ANF-ANZ-TREFFER
150400         TO KAI5AP5-ANF-ANZ-TREFFER
150500       MOVE KAI5OF3-ANF-KZ-AUFSETZ-ZUGRIFF 
150600         TO KAI5AP5-ANF-KZ-AUFSETZ-ZUGRIFF
150700       IF KAI5OF3-ANF-KZ-AUFSETZ-ZUGRIFF = C-J
150800       THEN
150900         MOVE KAT5OF1-TRANSIENT-BEREICH
151000           TO KAT5AP3-TRANSIENT-BEREICH
151100       END-IF
151200     END-IF
151300* Auftrag aufrufen
151400     IF KAI5OF1-FUNKTION = C-01-STD-APO-LIST-Z-SCH
151500     THEN
151600*      Suche über Schließnummer
151700       CALL "CGSAUF"
151800       USING C-AUF-AUFRUF-AL
151900             C-KONFIG-ID-KA
152000             C-OBJEKT-AUFTRAG-KKA5AP
152100             GSOVER-VERSTAENDIGUNGSBEREICH
152200             KAI5AP4-EINGABEBEREICH
152300             KAO5AP4-AUSGABEBEREICH
152400             KAT5AP3-TRANSIENT-BEREICH
152500             KAXIND-INDICES
152600     ELSE
152700*      Dynamische Suche
152800       CALL "CGSAUF"
152900       USING C-AUF-AUFRUF-AL
153000             C-KONFIG-ID-KA
153100             C-OBJEKT-AUFTRAG-KKA5AP
153200             GSOVER-VERSTAENDIGUNGSBEREICH
153300             KAI5AP5-EINGABEBEREICH
153400             KAO5AP4-AUSGABEBEREICH
153500             KAT5AP3-TRANSIENT-BEREICH
153600             KAXIND-INDICES
153700        END-IF
153800
153900*
154000     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
154100     THEN
154200       GO TO PROGRAMM-VERLASSEN
154300     END-IF
154400* Ausgabebereich versorgen
154500     MOVE KAO5AP4-IND-LETZT     TO KAO5OF2-IND-LETZT
154600     MOVE KAO5AP4-KZ-WEITER     TO KAO5OF2-KZ-WEITER 
154650     MOVE KAO5AP4-NOT-USER-SCHLI  TO KAO5OF2-NOT-USER-SCHLI       D02
154700     MOVE KAO5AP4-ABSTIMM-POS-DATEN
154800       TO KAO5OF2-ABSTIMM-POS-DATEN
154900     .
155000 AUFRUF-KKA5AP-1002.
155100     EXIT.
155200/---------------------------------------------------------------*
155300* Aufruf des Auftrags KKA5SL pro Abstimmposition                *
155400*---------------------------------------------------------------*
155500 AUFRUFE-KKA5SL SECTION.
155600 AUFRUFE-KKA5SL-1001.
155700*
155800     MOVE C-01-INT-LES-SCH-DETAIL
155900       TO KAI5SL1-FUNKTION
156000*
156100     MOVE C-1                     TO H-ZAEHLER-ANZ
156200*
156300     PERFORM UNTIL H-ZAEHLER-ANZ > KAO5AP4-IND-LETZT 
156400       IF KAO5AP4-APO-SCHLIESSUNGSNR(H-ZAEHLER-ANZ)
156500          NOT = ZERO
156600       THEN
156700*        Eingabebereich versorgen
156800         MOVE KAO5AP4-APO-SCHLIESSUNGSNR(H-ZAEHLER-ANZ)
156900           TO KAI5SL1-SCHLIESSUNGSNR
157000
157100*        Auftrag aufrufen
157200         CALL "CGSAUF"
157300         USING C-AUF-AUFRUF-AL
157400               C-KONFIG-ID-KA 
157500               C-OBJEKT-AUFTRAG-KKA5SL
157600               GSOVER-VERSTAENDIGUNGSBEREICH  
157700               KAI5SL1-EINGABEBEREICH    
157800               KAO5SL1-AUSGABEBEREICH   
157900*
158000         IF GSOVER-GEWICHT        NOT = C-GEW-NICHT-GESETZT
158100         THEN
158200           GO TO PROGRAMM-VERLASSEN
158300         END-IF
158400*        Ausgabebereich versorgen
158500         MOVE KAO5SL1-SCHLIESSUNG-SATZ
158600           TO KAO5OF2-SCHLIESSUNG-SATZ(H-ZAEHLER-ANZ) 
158700       ELSE
158800         INITIALIZE KAO5OF2-SCHLIESSUNG-SATZ(H-ZAEHLER-ANZ)
158900       END-IF
159000*      
159100       ADD C-1                    TO H-ZAEHLER-ANZ
159200     END-PERFORM      
159300     .
159400 AUFRUFE-KKA5SL-1002.
159500     EXIT.
159600/---------------------------------------------------------------*
159700* Programminitialisierung                                       *
159800*---------------------------------------------------------------*
159900 INITIALISIERUNG SECTION.
160000 INITIALISIERUNG-1001.
160100     INITIALIZE                   GSTMEL-TRANSIENTER-BEREICH
160200     MOVE SPACE                   TO H-FUNKTION
160300*
160400     PERFORM LESEN-ANMELDEDATEN
160450     PERFORM GEDAECHTNIS-VERSORGEN                                D02
160500     .
160600 INITIALISIERUNG-1002.
160700     EXIT.
160800/---------------------------------------------------------------*
160900* Lesen der Anmeldedaten                                        *
161000*---------------------------------------------------------------*
161100 LESEN-ANMELDEDATEN SECTION.
161200 LESEN-ANMELDEDATEN-1001.
161300     CALL "CGSTAB"
161400     USING C-TAB-ANM-DAT-LESEN
161500           C-KONFIG-ID-GS
161600           C-OBJEKT-TAB-ANMELDEDATEN
161700           GSOVER-VERSTAENDIGUNGSBEREICH
161800           DUMMY
161900           GSO0ANM-AUSGABEBEREICH
162000           GSTTAB-EIN-AUSGABEBEREICH
162100     END-CALL
162200
162300     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
162400     THEN
162500       GO TO PROGRAMM-VERLASSEN
162600     END-IF
162700      .
162800 LESEN-ANMELDEDATEN-1002.
162900     EXIT.
162950/---------------------------------------------------------------* D02
162951* Liest einmalig den KA-Installationsparameter und merkt ihn sich D02
162952*---------------------------------------------------------------* D02
162953 GEDAECHTNIS-VERSORGEN SECTION.                                   D02
162954 GEDAECHTNIS-VERSORGEN-1001.                                      D02
162955*                                                                 D02
162956     IF GEDAECHTNIS-LEER                                          D02
162957     THEN                                                         D02
162958       SET GEDAECHTNIS-BEFUELLT   TO TRUE                         D02
162959*                                                                 D02
162960       MOVE C-ANZ-UMF-FR          TO KAI0INS-INDEX                D02
162961       CALL "CGSTAB"                                              D02
162962       USING C-TAB-LESEN-EQUAL                                    D02
162963             C-KONFIG-ID-KA                                       D02
162964             C-OBJEKT-TAB-KA00INSTA                               D02
162965             GSOVER-VERSTAENDIGUNGSBEREICH                        D02
162966             KAI0INS-EINGABEBEREICH                               D02
162967             KAO0INS-AUSGABEBEREICH                               D02
162968             GSTTAB-EIN-AUSGABEBEREICH                            D02
162969       END-CALL                                                   D02
162970                                                                  D02
162971       EVALUATE GSOVER-GEWICHT                                    D02
162972         WHEN C-GEW-NICHT-GESETZT                                 D02
162973           MOVE KAO0INS-WERT      TO H-MERK-ANZ-UMF-FR            D02
162974         WHEN C-GEW-ZUSTAND                                       D02
162975*          KA4207: Tabelle @@@@@@@@@@ hat keinen Eintrag zu       D02
162976*                  @@@@@@@@@@@@@@@@@@@@                           D02
162977           MOVE C-OBJEKT-KA4207   TO H-MELDUNGS-OBJEKT            D02
162978           MOVE C-OBJEKT-TAB-KA00INSTA                            D02
162979                                  TO GSTMEL-VAR-TEXT-1            D02
162980           MOVE C-ANZ-UMF-FR      TO GSTMEL-VAR-TEXT-2            D02
162981           PERFORM MELDUNG-EINTRAGEN                              D02
162982           GO TO PROGRAMM-VERLASSEN                               D02
162983         WHEN OTHER                                               D02
162984           GO TO PROGRAMM-VERLASSEN                               D02
162985       END-EVALUATE                                               D02
162986     END-IF                                                       D02
162987      .                                                           D02
162988 GEDAECHTNIS-VERSORGEN-1002.                                      D02
162989     EXIT.                                                        D02
163000/---------------------------------------------------------------*
163100* Meldung eintragen                                             *
163200*---------------------------------------------------------------*
163300 MELDUNG-EINTRAGEN SECTION.
163400 MELDUNG-EINTRAGEN-1001.
163500     CALL "CGSMEL"
163600     USING C-MEL-EINTRAGEN
163700           C-KONFIG-ID-KA
163800           H-MELDUNGS-OBJEKT
163900           GSOVER-VERSTAENDIGUNGSBEREICH
164000           DUMMY
164100           GSOMEL-AUSGABEBEREICH
164200           GSTMEL-TRANSIENTER-BEREICH
164300     END-CALL
164400*
164500     IF GSOVER-GEWICHT            > C-GEW-FEHLER
164600     THEN
164700       GO TO PROGRAMM-VERLASSEN
164800     ELSE
164900       MOVE H-MELDUNGS-OBJEKT     TO GSOVER-RETURNCODE
165000     END-IF
165100     .
165200 MELDUNG-EINTRAGEN-1002.
165300     EXIT.
165400/*-------------------------------------------------------------*
165500* Meldungen aus Meldungspool loeschen.                         *
165600*--------------------------------------------------------------*
165700 MELDUNG-AUSTRAGEN SECTION.
165800 MELDUNG-AUSTRAGEN-1001.
165900     CALL "CGSMEL"
166000     USING C-MEL-AUSTRAGEN
166100           C-KONFIG-ID-KA
166200           C-OBJEKT-MEL-GSPOOL
166300           GSOVER-VERSTAENDIGUNGSBEREICH
166400           DUMMY
166500           GSOMEL-AUSGABEBEREICH
166600           GSTMEL-TRANSIENTER-BEREICH
166700
166800     IF GSOMEL-MAX-GEW > C-GEW-WARNUNG
166900     THEN
167000       GO TO PROGRAMM-VERLASSEN
167100     END-IF
167200     .
167300 MELDUNG-AUSTRAGEN-1002.
167400     EXIT.
167500/---------------------------------------------------------------*
167600* Verlassen des Programms ueber einen Ausstiegspunkt            *
167700*---------------------------------------------------------------*
167800 PROGRAMM-VERLASSEN SECTION.
167900 PROGRAMM-VERLASSEN-1001.
168000     EXIT PROGRAM.
168100 PROGRAMM-VERLASSEN-1002.
168200     EXIT.

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
000160*@Titel         : Update-Aktionen KA-Oberfläche
000160*@Elementname   : aka4of.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00001
000160*@Cr_Date       : 20150217.140437
000160*@Produkt       : ak
000160*@Lieferpaket   : 
000160*@Liefertiefe   : nur_lesen
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
001000*@Title        : Update-Aktionen KA-Oberfläche              *
001100* Verfasser    : Stefan Poetsch                             *
001200* Erstelldatum : 15.02.2012                                 *
001400*                                                           *
001500*@A-ELEMENTBESCHREIBUNG                                     *
001600* Modul-Beschreibung:                                       *
001700* ------------------                                        *
001800* Der Auftrag stellt  die ändernden Funktionen bereit,      *
001900* die bei der Bearbeitung der  Kontoabstimmungs-Daten über  *
002000* den KA-Dialog benötigt werden.                            *
002100* (Ausnahme: Die  Dialog-Aktion "Abstimmen" wird nicht über *
002200* diesen Auftrag, sonder über AKAADI durchgeführt)          *
002300*                                                           *
002400*@E-ELEMENTBESCHREIBUNG                                     *
002500*                                                           *
002600*@A-FUNKTION-1                                              *
002700* Update der vom User änderbaren Felder                     *
002800* (Bemerkung und Fachbereich) in einem APO-Satz             *
002900*                                                           *
003000* Eingabefeldbelegungen:                                    *
003100* Funktion "01-STD-APO-AEN-BEM-FB"                          *
003200* APO-Primärkey                                             *
003300* Daten für die Änderung                                    *
003400*                                                           *
003500*@E-FUNKTION-1                                              *
003600*                                                           *
003700*@A-FUNKTION-2                                              *
003800* Freigabe einer Schließung                                 *
003900*                                                           *
004000* Eingabefeldbelegungen:                                    *
004100* Funktion "01-STD-SCH-FREI"                                *
004200* Schließungsnummer                                         *
004300* Daten für die Änderung                                    *
004400*                                                           *
004500*@E-FUNKTION-2                                              *
004600*                                                           *
004700*@A-FUNKTION-3                                              *
004800* Aufheben einer Schließung                                 *
004900*                                                           *
005000* Eingabefeldbelegungen:                                    *
005100* Funktion "01-STD-SCH-AUFH"                                *
005200* Schließungsnummer                                         *
005300* Daten für die Änderung                                    *
005400*                                                           *
005500*@E-FUNKTION-3                                              *
005600*                                                           *
005700*@A-FUNKTION-4                                              *
005800* Ablehnen einer Schließung                                 *
005900*                                                           *
006000* Eingabefeldbelegungen:                                    *
006100* Funktion "01-STD-SCH-ABLE"                                *
006200* Schließungsnummer                                         *
006300* Daten für die Änderung                                    *
006400*                                                           *
006500*@E-FUNKTION-4                                              *
006600*                                                           *
006700*@A-MODULAUFRUF                                             *
006800* Aufruf-Beispiel:                                          *
006900*                                                           *
007000* Aufrufparameter: 1. Funktion               (I)            *
007100*                  2. Konfigurations-Id      (I)            *
007200*                  3. Objekt                 (I)            *
007300*                  4. Verstaendigungsbereich (O)            *
007400*                  5. Eingabebereich         (I)            *
007500*                  6. Ausgabebereich         (O)            *
007600*                  7. Transientbereich       (I/O)          *
007700*                  8. Indices                (I)            *
007800*                                                           *
007900* CALL "CGSAUF"                                             *
008000* USING C-AUF-AUFRUF-AL                                     *
008100*       C-KONFIG-ID-KA                                      *
008200*       C-OBJEKT-AUFTRAG-AKA4OF                             *
008300*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *
008400*       KAI4OF1-EINGABEBEREICH                              *
008500*       DUMMY                                               *
008600*       DUMMY                                               *
008700*       KAXIND-INDICES                                      *
008800*                                                           *
008900*@E-MODULAUFRUF                                             *
009000*                                                           *
009100*@A-RETURNCODE                                              *
009200* Meldungen/Returncodes:                                    *
009300* ----------------------                                    *
009400
009500* Folgende Fehlermeldungen werden von diesem KORDOBA-Auftrag*
009600* zureckgegeben bzw. in den Meldungs-Pool eingetragen:      *
009700* KA0000 : Verarbeitung erfolgreich durchgeführt            *
009750* KA4860 : Der angemeldete Benutzer darf nur im             *     D01
009751*          4-Augen-Prinzip freigeben                        *     D01
009760*                                                           *     D03
009761* KA4857 : Bei diesem Status ist die Freigabe nicht möglich *     D03
009762*          S-Nr: @@@@@@@@@@@@)                                    D03
009763* KA4858 : Bei diesem Status ist die Aufhebung nicht möglich*     D03
009764*          S-Nr: @@@@@@@@@@@@)                                    D03
009765* KA4859 : Bei diesem Status ist die Ablehnung nicht möglich*     D03
009766*          S-Nr: @@@@@@@@@@@@)                                    D03
009800* alle Meldungen der gerufenen AUfträge                     *
009900*                                                           *
010000*@E-RETURNCODE                                              *
010100*                                                           *
010200*@A-ENTRY                                                   *
010300* Entryname       : AKA4OF                                  *
010400*                                                           *
010500*@E-ENTRY                                                   *
010600*                                                           *
010700*@A-MODUL                                                   *
010800* Gerufene Moduln/Auftraege:                                *
010900* CGSDZS   Datenzugriffsschicht                             *
011000* CGSMEL   Meldungsschnittstelle                            *
011100* CGSBER   - Servicefunktion Berechtigungsprüfung           *
011200*                                                           *
011300*@E-MODUL                                                   *
011400*                                                           *
011500*@A-COBOL-COPY                                              *
011600* Benoetigte Cobol-Copies:                                  *
011700* CGSI0MEL: Eingabebereich Meldungstabelle                  *
011800* CGSO0MEL: Ausgabebereich Meldungstabelle                  *
011900* CGSOMEL : Ausgabebereich Meldungsschnittstelle            *
012000* CGSTMEL : transienter Bereich Meldungsschnittstelle       *
012100* CGSOVER : Verstaendigungsbereich                          *
012200* CGSTTAB : transienter Bereich Zugriff Parametertabellen   *
012300* CGSO1ANM: Copy fuer taskspez. Anmeldedaten                *
012400* CKAI4OF1: Eingabebereich AKA4OF                           *
012500* CKAI4OF2: Eingabebereich AKA4OF                           *
012600* CKAXIND : Indices                                         *
012700* DCTGRCGE: Meldungsgewichte                                *
012800*                                                           *
012900*@E-COBOL-COPY                                              *
013000*                                                           *
013100*@A-TABELLE                                                 *
013200* TABEX-Tabellen  :                                         *
013300*                                                           *
013400*@E-TABELLE                                                 *
013500*                                                           *
013600*@A-BENUTZERSATZ                                            *
013700* Benutzersaetze  : <benutzersatz> (I/O/IO)                 *
013800* keine                                                     *
013900*                                                           *
014000*@E-BENUTZERSATZ                                            *
014100*                                                           *
014200*@A-DATEI                                                   *
014300* Dateien         : entfallen                               *
014400*                                                           *
014500*@E-DATEI                                                   *
014600*                                                           *
014700*@A-KONVENTIONEN                                            *
014800*@E-KONVENTIONEN                                            *
014900*                                                           *
015000*@A-DOKUMENT                                                *
015100* Die fachliche Beschreibung ist im Dokument                *
015200* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *
015300* hinterlegt.                                               *
015400*                                                           *
015500*@E-DOKUMENT                                                *
015600*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
090051* D01 R49405                                                *     D01
090052*     Anpassung der Funktionscodes der Berechtigungsprüfung *     D01
090053*     ggfs. 4-Augen-Prinzip bei Freigabe verlangen          *     D01
090054*     Datum: 02.08.2012                            NKZ: TRO *     D01
090055*                                                           *     D01
090056* D02 R52432/HPQC 8185                                      *     D02
090057*     TIMESTAMP für AUFHEBEN, FREIGEBEN und ABLEHNEN        *     D02
090058*     richtigstellen                                        *     D02
090059*     Datum: 05.11.2012                            NKZ: BRU *     D02
090060*                                                           * 
090061* D03 R50750                                                *     D03
090062*    -Wenn beim Aufhebem. Ablehnen oder Freigeben einer     *     D03
090063*     Schließung keine Treffer zur Schließungsnummer-Status-*     D03
090064*     Kombination gefunden wird, bricht nun das Programm    *     D03
090065*     nicht mehr ab, sondern gibt eine 4er-Meldung aus.     *     D03
090066*     (Situation kann auftreten, wenn bei diesen Dialog-    *     D03
090067*     Funktionen die Aktion ohne zwischenzeitliche          *     D03
090068*     OFL-Aktualisierung versehentlich mehrfach angestoßen  *     D03
090069*     wird.                                                 *     D03
090070*     Datum: 04.01.2013                            NKZ: SUM *     D03
090071*                                                           *     D03
      * E01 R77134                                                *     E01
      *     Erweiterungen wegen Projekt WP-Stückeabstimmung.      *     E01
      *     Belegung Abstimmart im erweiterten I-Copy für KKA4SL  *     E01
      *     Datum: 10.12.2014                            NKZ: SUM *     E01
      *                                                           *     E01
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100072* ENDE ELEMENTKOPF ****************************************%*     D03
100100/
100200 IDENTIFICATION DIVISION.
100300 PROGRAM-ID. AKA4OF.
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
101550     05  FILLER PIC X(13) VALUE "ELEM=aka4of  ".                  CCC
101551     05  FILLER PIC X(15) VALUE "VERS=k151-00004".                CCC
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
103400    05 C-OBJEKT-KA2851            PIC X(006) VALUE "KA2851".
103500    05 C-OBJEKT-KA2852            PIC X(006) VALUE "KA2852".
103600    05 C-OBJEKT-KA2853            PIC X(006) VALUE "KA2853".
103700    05 C-OBJEKT-KA2856            PIC X(006) VALUE "KA2856".
103800    05 C-OBJEKT-KA4801            PIC X(006) VALUE "KA4801".
103870    05 C-OBJEKT-KA4857            PIC X(006) VALUE "KA4857".      D03
103871    05 C-OBJEKT-KA4858            PIC X(006) VALUE "KA4858".      D03
103872    05 C-OBJEKT-KA4859            PIC X(006) VALUE "KA4859".      D03
103880    05 C-OBJEKT-KA4860            PIC X(006) VALUE "KA4860".      D01
103900    05 C-OBJEKT-KA5002            PIC X(006) VALUE "KA5002".
104000    05 C-OBJEKT-KA5007            PIC X(006) VALUE "KA5007".
104100/---------------------------------------------------------------*
104200* Lokale Konstante fuer KORDOBA-Auftrag AKA4OF                  *
104300*---------------------------------------------------------------*
104400 01 KONSTANTE-AKA4OF.
104500    05 C-01-STD-APO-AEN-BEM-FB    PIC X(040) VALUE
104600                                  "01-STD-APO-AEN-BEM-FB".
104700    05 C-01-STD-SCH-FREI          PIC X(040) VALUE
104800                                  "01-STD-SCH-FREI".
104900    05 C-01-STD-SCH-ABLE          PIC X(040) VALUE
105000                                  "01-STD-SCH-ABLE".
105100    05 C-01-STD-SCH-AUFH          PIC X(040) VALUE
105200                                  "01-STD-SCH-AUFH".
105300    05 C-KONFIG-ID-KA             PIC X(002) VALUE "KA".
105400    05 C-KONFIG-ID-GS             PIC X(002) VALUE "GS".
105500    05 C-AUF-AUFRUF-AL            PIC X(040) VALUE "AUFRUF-AL".
105600    05 C-AKA4OF                   PIC X(008) VALUE "AKA4OF".
105700    05 C-1                        PIC 9(001) VALUE 1.
105800    05 C-J                        PIC X(001) VALUE "J".
105900    05 C-N                        PIC X(001) VALUE "N".
          05 C-GELDKTO-UMSATZ-ABSTIMM   PIC X(002) VALUE "GU".          E01
106000/---------------------------------------------------------------*
106100* CGSMEL                                                        *
106200*---------------------------------------------------------------*
106300 01 CGSMEL-DEFINITIONEN.
106400     05 C-MEL-EINTRAGEN           PIC X(040) VALUE "EINTRAGEN".
106500     05 C-MEL-AUSTRAGEN           PIC X(040) VALUE "AUSTRAGEN".
106600     05 C-OBJEKT-MEL-GSPOOL       PIC X(006) VALUE SPACE.
106700/---------------------------------------------------------------*
106800* CGSTAB                                                        *
106900*---------------------------------------------------------------*
107000 01 CGSTAB-DEFINITIONEN.
107100     05 C-OBJEKT-LOG-NAME         PIC X(009) VALUE "KA00INSTA".
107200     05 C-OBJEKT-TAB-ANMELDEDATEN PIC X(020) VALUE "ANMELDEDATEN".
107300     05 C-TAB-LESEN-ZEILE         PIC X(040) VALUE "LESEN-ZEILE".
107400     05 C-TAB-LESEN-EQUAL         PIC X(040) VALUE "LESEN-EQUAL".
107500     05 C-TAB-ANM-DAT-LESEN       PIC X(040) VALUE
107600                                  "ANM-DAT-LESEN".
107700/
107800*---------------------------------------------------------------*
107900* Schnittstelle CGSBER (Berechtigungspruefung)                  *
108000*---------------------------------------------------------------*
108100 01 H-BERECHTIGUNG.
108200     05 C-BER-PRUEFEN             PIC X(040) VALUE "PRUEFEN".
108300     05 C-OBJEKT-BER-USER-BERECHT PIC X(020)
108400                                  VALUE "USER-BERECHT".
108500     05 C-BER-ANZAHL-3            PIC 9(002) VALUE 3.
108600     05 H-OBJEKT-BER              PIC X(010) VALUE SPACE.
108700     05 C-OBJEKT-BER-KA-KTOABST   PIC X(010) VALUE "KA-KTOABST".
108800     05 C-FKT-BER-AEND            PIC X(003) VALUE "750".         D01
108900     05 C-FKT-BER-FREI-4-AUGEN    PIC X(003) VALUE "770".         D01
108950     05 C-FKT-BER-FREI-IMMER      PIC X(003) VALUE "771".         D01
109000*
109100     COPY CGSI4BER                REPLACING 01 BY 05,
109200                                  ==(01)== BY ==(01)==.
109300*---------------------------------------------------------------* 
109400* Schnittstellenparameter für Auftrag KKA4AP                    * 
109500*---------------------------------------------------------------* 
109600 01 C-01-INT-AEN-APO-UCHK         PIC X(040) VALUE
109700                                  "01-INT-AEN-APO-UCHK".
109800 01 C-01-INT-AEN-APO-FREI         PIC X(040) VALUE
109900                                  "01-INT-AEN-APO-FREI".
110000 01 C-01-INT-AEN-APO-ABLE        PIC X(040) VALUE
110100                                  "01-INT-AEN-APO-ABLE".
110200 01 C-01-INT-AEN-APO-AUFH         PIC X(040) VALUE
110300                                  "01-INT-AEN-APO-AUFH".
110400 01 C-OBJEKT-AUFTRAG-KKA4AP       PIC X(020) VALUE "KKA4AP".   
110500 COPY CKAI4AP1.
110600 COPY CKAI4AP4.
110700*---------------------------------------------------------------* 
110800* Schnittstellenparameter für Auftrag KKA5AP                    * 
110900*---------------------------------------------------------------* 
111000 01 C-01-INT-LES-APO-DETAIL       PIC X(040) VALUE
111100                                  "01-INT-LES-APO-DETAIL".
111200 01 C-OBJEKT-AUFTRAG-KKA5AP       PIC X(020) VALUE "KKA5AP".   
111300 COPY CKAI5AP1.
111400 COPY CKAO5AP1.  
111500*---------------------------------------------------------------* 
111600* Schnittstellenparameter für Auftrag KKA4SL                    * 
111700*---------------------------------------------------------------* 
111800 01 C-01-INT-AEN-SCH-FREI         PIC X(040) VALUE
111900                                  "01-INT-AEN-SCH-FREI".
112000 01 C-01-INT-AEN-SCH-ABLE         PIC X(040) VALUE
112100                                  "01-INT-AEN-SCH-ABLE".
112200 01 C-01-INT-AEN-SCH-AUFH         PIC X(040) VALUE
112300                                  "01-INT-AEN-SCH-AUFH".
112400 01 C-OBJEKT-AUFTRAG-KKA4SL       PIC X(020) VALUE "KKA4SL".   
112500 COPY CKAI4SL2.
112600*---------------------------------------------------------------* 
112700* Schnittstellenparameter für Auftrag KKA5SL                    * 
112800*---------------------------------------------------------------* 
112900 01 C-01-INT-LES-SCH-DETAIL       PIC X(040) VALUE
113000                                  "01-INT-LES-SCH-DETAIL".
113100 01 C-OBJEKT-AUFTRAG-KKA5SL       PIC X(020) VALUE "KKA5SL".   
113200 COPY CKAI5SL1. 
113300 COPY CKAO5SL1. 
113400/---------------------------------------------------------------*
113500* Hilfsfelder                                                   *
113600*---------------------------------------------------------------*
113700 01 C-STATI.
113800     05 C-STATUS-ABGELEHNT        PIC 9(001) VALUE 6.
113900     05 C-STATUS-GESCHLOSSEN      PIC 9(001) VALUE 8.
114000     05 C-STATUS-AUFGEHOBEN       PIC 9(001) VALUE 9.
114100 01 HILFSFELDER.
114200    05 H-ZAEHLER-ANZ              PIC 9(003).
114300/---------------------------------------------------------------*
114400* Ausgabeschnittstelle fuer CJDWRTE                             *
114500*---------------------------------------------------------------*
114600 COPY CJDOWRTI.
114700/---------------------------------------------------------------*
114800* Eingabeschnittstelle fuer KJD100                              *
114900*---------------------------------------------------------------*
115000 COPY CJDI100.
115100/---------------------------------------------------------------*
115200* Ausgabeschnittstelle fuer KJD100                              *
115300*---------------------------------------------------------------*
115400 COPY CJDO100.
115500/---------------------------------------------------------------*
115600* Uebergabestruktur fuer Indices JD an KORDOBA-Auftrag          *
115700*---------------------------------------------------------------*
115800 COPY CCJDIND.
115900/---------------------------------------------------------------*
116000* Aenderungs-Tabelle fuer Journaldaten-Eintraege                *
116100*---------------------------------------------------------------*
116200  01 AENDERUNGEN.
116300     05 AEND-TABELLE              OCCURS 50.
116400     COPY CJDAENES                REPLACING 01 BY 10,
116500                                  ==(01)== BY ==(01)==.
116600  01 C-KONSTANTEN-JD.
116700     05 C-FUNKTION-HERK-LIEFERN   PIC X(040) VALUE
116800                                  "LIEFERN-SYSTEM-HERKUNFT".
116900     05 C-OBJEKT-ESA-JD           PIC X(020) VALUE "ESA-JD".
117000     05 C-PROT-EINGABE            PIC X(004) VALUE "0006".
117100     05 C-PROT-FREIGABE           PIC X(004) VALUE "0007".
117200     05 C-GESCHAEFTSVORFAELLE.
117300       10 C-GV-APO-AEND           PIC X(008) VALUE "KAABPOAE".
117400       10 C-GV-SCHL-FREI          PIC X(008) VALUE "KASCHLFR".
117500       10 C-GV-SCHL-ABLE          PIC X(008) VALUE "KASCHLAB".
117600       10 C-GV-SCHL-AUFH          PIC X(008) VALUE "KASCHLAF".
117700     05 C-JD-FELDNAMEN.
117800       10 C-FELD-KA000001         PIC X(006) VALUE "000001".
117900       10 C-FELD-KA000002         PIC X(006) VALUE "000002".
118000     05 C-AKTION-NEU              PIC X(006) VALUE "NEUANL".
118100     05 C-AKTION-FREI             PIC X(006) VALUE "FREI".
118200     05 C-AKTION-ABLE             PIC X(006) VALUE "ABLEHN".
118300     05 C-AKTION-AUFH             PIC X(006) VALUE "AUFHEB".
118400     05 C-0000                    PIC X(004) VALUE "0000".
118500     05 C-VERARB-KZ-1             PIC X(001) VALUE "1".
118600     05 C-PROT-LAUFNUMMER         PIC X(004) VALUE "0001".
118700     05 C-ZUGRIFFSSCHUTZ          PIC X(002) VALUE "00".
118800     05 C-99991231                PIC 9(008) VALUE 99991231.
118900     05 C-GV-VERSION              PIC X(003) VALUE "001".
119000     05 C-OBJEKT-KJD100           PIC X(020) VALUE "KJD100".
119100     05 H-ZUGRIFFSKRITERIUM       PIC 9(007).
119200
119300
119400/---------------------------------------------------------------*
119500*   LOKALE ARBEITSFELDER                                        *
119600*---------------------------------------------------------------*
119700 LOCAL-STORAGE SECTION.
119800/---------------------------------------------------------------*
119900* Meldungsschnittstelle                                         *
120000*---------------------------------------------------------------*
120100 COPY CGSOMEL.
120200 COPY CGSTMEL.
120300/---------------------------------------------------------------*
120400* Meldungstabelle                                               *
120500*---------------------------------------------------------------*
120600 COPY CGSI0MEL.
120700 COPY CGSO0MEL.
120800/---------------------------------------------------------------*
120900* Anmeldedaten                                                  *
121000*---------------------------------------------------------------*
121100 COPY CGSO1ANM.
121200*---------------------------------------------------------------*
121300* Uebergabeparameter fuer CGSTAB                                *
121400*---------------------------------------------------------------*
121500 COPY CGSTTAB.
121550/---------------------------------------------------------------* D01
121551* Programmschalter                                              * D01
121552*---------------------------------------------------------------* D01
121553 01 VIER-AUGEN-PRINZIP-FLAG       PIC X(001).                     D01
121554    88 VIER-AUGEN-PRINZIP-JA      VALUE "J".                      D01
121555    88 VIER-AUGEN-PRINZIP-NEIN    VALUE "N".                      D01
121600/---------------------------------------------------------------*
121700* Hilfsfelder                                                   *
121800*---------------------------------------------------------------*
121900 01 H-MELDUNGS-OBJEKT             PIC X(006).
122000 01 H-FUNKTION.
122100     05 H-FUNKTION-MLD            PIC X(020).
122200     05 H-FUNKTION-REST           PIC X(020).
122300 01 DUMMY                         PIC X(001).
122400 01 H-IND                         PIC 9(002).
122500* Deklaration der Timestamp-Hilfsvariablen
122600  01 H-DH-TIMESTAMP-FIELDS.
122700   05  H-DH-TIMESTAMP.
122800    10  H-CURRENT-YEAR           PIC X(004).
122900    10  H-CURRENT-MONTH          PIC X(002).
123000    10  H-CURRENT-DAY            PIC X(002).
123100    10  H-CURRENT-HOUR           PIC X(002).
123200    10  H-CURRENT-MINUTE         PIC X(002).
123300    10  H-CURRENT-SECOND         PIC X(002).
123400    10  H-CURRENT-MS             PIC X(002).
123500   05  FILLER                    PIC X(005).
123600/****************************************************************
123700 LINKAGE SECTION.
123800*****************************************************************
123900*---------------------------------------------------------------*
124000* Funktion                                                      *
124100*---------------------------------------------------------------*
124200 01 AUF-FUNKTION                  PIC X(040).
124300*---------------------------------------------------------------*
124400* Konfigurations-Kennzeichen                                    *
124500*---------------------------------------------------------------*
124600 01 KONFIG-ID                     PIC X(002).
124700*---------------------------------------------------------------*
124800* Auftragsname                                                  *
124900*---------------------------------------------------------------*
125000 01 OBJEKT-AUFTRAGS-ID            PIC X(020).
125100*---------------------------------------------------------------*
125200* VerstAendigungsbereich des Aufrufers                          *
125300*---------------------------------------------------------------*
125400 COPY CGSOVER.
125500*---------------------------------------------------------------*
125600* Eingabebereich fuer den StandAlone-Auftrag AKA4OF             *
125700*---------------------------------------------------------------*
125800 01 LS-EINGABEBEREICH             PIC X(001).                      
125900 01 LS-EIN-BER-01                 REDEFINES LS-EINGABEBEREICH. 
126000     COPY CKAI4OF1                REPLACING 01 BY 05,
126100                                  ==(01)== BY ==(01)==.
126200 01 LS-EIN-BER-02                 REDEFINES LS-EINGABEBEREICH. 
126300     COPY CKAI4OF2                REPLACING 01 BY 05,
126400                                  ==(01)== BY ==(01)==.
126500*---------------------------------------------------------------*
126600* Ausgabebereich fuer den StandAlone-Auftrag AKA4OF             *
126700*---------------------------------------------------------------*
126800 01 LS-AUSGABEBEREICH             PIC X(001).
126900*---------------------------------------------------------------*
127000* Transientbereich im Auftragsformat fuer den Auftrag AKA4OF    *
127100*---------------------------------------------------------------*
127200 01 LS-DUMMY                      PIC X(001).          
127300*---------------------------------------------------------------*
127400* Indices                                                       *
127500*---------------------------------------------------------------*
127600 COPY CKAXIND. 
127700/
127800 PROCEDURE DIVISION
127900     USING AUF-FUNKTION
128000           KONFIG-ID
128100           OBJEKT-AUFTRAGS-ID
128200           GSOVER-VERSTAENDIGUNGSBEREICH
128300           LS-EINGABEBEREICH
128400           LS-AUSGABEBEREICH
128500           LS-DUMMY
128600           KAXIND-INDICES
128700           .
128800/---------------------------------------------------------------*
128900* Hier wird die Steuerung des KORDOBA-Auftrags durchgefuehrt    *
129000*---------------------------------------------------------------*
129100 STEUER-AKA4OF SECTION.
129200 STEUER-AKA4OF-1001.
129300     PERFORM INITIALISIERUNG
129400     PERFORM BERECHTIGUNG
129500     EVALUATE KAI4OF1-FUNKTION
129600     WHEN C-01-STD-APO-AEN-BEM-FB
129700       PERFORM VERARB-APO-AEND
129800     WHEN C-01-STD-SCH-FREI
129900     WHEN C-01-STD-SCH-ABLE
130000     WHEN C-01-STD-SCH-AUFH
130100       PERFORM VERARB-SCH-AEND
130200     WHEN OTHER
130300* KA5002: @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@
130400       MOVE C-OBJEKT-KA5002       TO H-MELDUNGS-OBJEKT
130500       MOVE C-AKA4OF              TO GSTMEL-VAR-TEXT-1
130600       MOVE KAI4OF1-FUNKTION      TO H-FUNKTION
130700       MOVE H-FUNKTION-MLD        TO GSTMEL-VAR-TEXT-2
130800       PERFORM MELDUNG-EINTRAGEN
130900       GO TO PROGRAMM-VERLASSEN
131000     END-EVALUATE
131100     .
131200 STEUER-AKA4OF-1002.
131300     GO TO PROGRAMM-VERLASSEN.
131400/---------------------------------------------------------------*
131500* Berechtigungsprüfung                                          *
131600*---------------------------------------------------------------*
131700 BERECHTIGUNG SECTION.
131800 BERECHTIGUNG-1001.
131900*
132000* Pruefen der Berechtigung
132100     MOVE SPACE                   TO GSI4BER-BP-BK-LISTE
132200* Funktion versorgen
132300     EVALUATE KAI4OF1-FUNKTION
132400     WHEN C-01-STD-APO-AEN-BEM-FB
132500       MOVE C-FKT-BER-AEND        TO GSI4BER-BP-FUNKTION-KURZNAME
132550       PERFORM CALL-CGSBER                                        D01
132600     WHEN C-01-STD-SCH-FREI
132700     WHEN C-01-STD-SCH-ABLE
132800     WHEN C-01-STD-SCH-AUFH
132900       MOVE C-FKT-BER-FREI-IMMER  TO GSI4BER-BP-FUNKTION-KURZNAME D01
132950       PERFORM CALL-CGSBER                                        D01
132951       IF GSOVER-GEWICHT          = C-GEW-ZUSTAND                 D01
132952       THEN                                                       D01
132953         SET VIER-AUGEN-PRINZIP-JA                                D01
132954                                  TO TRUE                         D01
132955         MOVE C-FKT-BER-FREI-4-AUGEN                              D01
132956                                  TO GSI4BER-BP-FUNKTION-KURZNAME D01
132957         PERFORM CALL-CGSBER                                      D01
132958       ELSE                                                       D01
132959         SET VIER-AUGEN-PRINZIP-NEIN                              D01
132960                                  TO TRUE                         D01
132961       END-IF                                                     D01
133000     WHEN OTHER
133100       CONTINUE
133200     END-EVALUATE
134500*
134600     EVALUATE GSOVER-GEWICHT
134700     WHEN C-GEW-ABBRUCH
134800       GO TO PROGRAMM-VERLASSEN
134900     WHEN C-GEW-FEHLER
135000* Fehler der Gewichtung 4 werden uebernommen und eingetragen
135100       MOVE GSOVER-RETURNCODE     TO H-MELDUNGS-OBJEKT
135200       MOVE GSOVER-TEXTE          TO GSTMEL-TEXTE
135300       PERFORM MELDUNG-EINTRAGEN
135400       GO TO PROGRAMM-VERLASSEN
135500     WHEN OTHER
135600       CONTINUE
135700     END-EVALUATE
135800*
135900     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
136000     THEN
136100*      KA4801 Sie haben nicht die erforderliche Berechtigung
136200       MOVE C-OBJEKT-KA4801       TO H-MELDUNGS-OBJEKT
136300       PERFORM MELDUNG-EINTRAGEN
136400       GO TO PROGRAMM-VERLASSEN
136500     ELSE
136600       MOVE C-OBJEKT-KA0000   TO GSOVER-RETURNCODE
136700     END-IF
136800     .
136900 BERECHTIGUNG-1002.
137000     EXIT.
137050/---------------------------------------------------------------* D01
137052* Berechtigungsprüfung - Aufruf CGSBER                          * D01
137054*---------------------------------------------------------------* D01
137056 CALL-CGSBER SECTION.                                             D01
137058 CALL-CGSBER-1001.                                                D01
137060*                                                                 D01
137062* Objekt versorgen                                                D01
137064     MOVE C-OBJEKT-BER-KA-KTOABST TO GSI4BER-BP-BER-OBJ-KURZNAME  D01
137066     MOVE ZERO                    TO GSI4BER-BP-ANZAHL-KRITERIEN  D01
137068* Berechtigung aufrufen                                           D01
137070     CALL "CGSBER"                                                D01
137072     USING C-BER-PRUEFEN                                          D01
137074           C-KONFIG-ID-KA                                         D01
137076           C-OBJEKT-BER-USER-BERECHT                              D01
137078           GSOVER-VERSTAENDIGUNGSBEREICH                          D01
137080           GSI4BER-EINGABEBEREICH                                 D01
137082           DUMMY                                                  D01
137084           DUMMY                                                  D01
137086     .                                                            D01
137088 CALL-CGSBER-1002.                                                D01
137090     EXIT.                                                        D01
137100/---------------------------------------------------------------*
137200* Verarbeitung für Ändern APO                                   *
137300*---------------------------------------------------------------*
137400 VERARB-APO-AEND SECTION.
137500 VERARB-APO-AEND-1001.
137600*
137700     PERFORM PRUEFEN-EINGABEFELDER-APO
137800* APO-Satz lesen
137900     PERFORM AUFRUF-KKA5AP
138000* APO-Satz ändern
138100* Fehlermeldung, wenn Status <> offen                             <-???
138200     PERFORM AUFRUF-KKA4AP
138300* Journal schreiben
138400     PERFORM ANLEGEN-JOURNAL
138500* KA2856 Die Daten wurden gespeichert
138600     MOVE C-OBJEKT-KA2856         TO H-MELDUNGS-OBJEKT
138700     PERFORM MELDUNG-EINTRAGEN
138800     .
138900 VERARB-APO-AEND-1002.
139000     EXIT.
139100/---------------------------------------------------------------*
139200* Verarbeitung für Ändern Schließung                            *
139300*---------------------------------------------------------------*
139400 VERARB-SCH-AEND SECTION.
139500 VERARB-SCH-AEND-1001.
139600*
139700     PERFORM PRUEFEN-EINGABEFELDER-SCH
139800* Schließung-Satz lesen
139900     PERFORM AUFRUF-KKA5SL
139950* 4-Augen-Prinzip gegebenenfalls prüfen                           D01
139951     PERFORM VIER-AUGEN-PRUEFUNG                                  D01
140000* Schließung-Satz ändern
140100     PERFORM AUFRUF-KKA4SL
140200     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
140300     THEN
140400*      KA5007 (DB-Fehler)
140500       MOVE C-OBJEKT-KA5007       TO H-MELDUNGS-OBJEKT
140600       PERFORM MELDUNG-EINTRAGEN
140700       GO TO PROGRAMM-VERLASSEN
140800     END-IF
140900* Massen-Update APOs
141000     PERFORM AUFRUF-KKA4AP-MASSEN-UPD
141100* Journal schreiben
141200     PERFORM ANLEGEN-JOURNAL
141300*
141400     EVALUATE KAI4OF2-FUNKTION
141500     WHEN     C-01-STD-SCH-FREI
141600*      KA2852 Die Freigabe wurde durchgeführt
141700       MOVE C-OBJEKT-KA2852         TO H-MELDUNGS-OBJEKT
141800     WHEN     C-01-STD-SCH-ABLE
141900*      KA2853 Die Ablehnung wurde durchgeführt
142000       MOVE C-OBJEKT-KA2853         TO H-MELDUNGS-OBJEKT
142100     WHEN     C-01-STD-SCH-AUFH
142200*    KA2851 Die Aufhebung wurde durchgeführt
142300       MOVE C-OBJEKT-KA2851         TO H-MELDUNGS-OBJEKT
142400     END-EVALUATE
142500*
142600     PERFORM MELDUNG-EINTRAGEN
142700     .
142800 VERARB-SCH-AEND-1002.                                            D01
142900     EXIT.
142950/---------------------------------------------------------------* D01
142951* VIER-AUGEN-PRUEFUNG                                           * D01
142952* Falls eine Freigabe durchgeführt werden soll und dafür ein    * D01
142953* 4-Augen-Prinzip notwendig ist, wird sichergestellt, dass der  * D01
142954* freigebende Benutzer ungleich dem Benutzer ist, der die akt.  * D01
142955* Schliessung auf den Status "freizugeben" gesetzt hat.         * D01
142956*---------------------------------------------------------------* D01
142957 VIER-AUGEN-PRUEFUNG SECTION.                                     D01
142958 VIER-AUGEN-PRUEFUNG-1001.                                        D01
142959*                                                                 D01
142960     IF KAI4OF1-FUNKTION          = C-01-STD-SCH-FREI             D01
142961        AND VIER-AUGEN-PRINZIP-JA                                 D01
142962     THEN                                                         D01
142963       IF GSO1ANM-BENUTZERIDENTIFIKATION                          D01
142964                                  = KAO5SL1-SCH-USER-SCHLIESS     D01
142965       THEN                                                       D01
142966*        KA4860 Der angemeldete Benutzer darf nur im              D01
142967*               4-Augen-Prinzip freigeben                         D01
142968         MOVE C-OBJEKT-KA4860     TO H-MELDUNGS-OBJEKT            D01
142969         PERFORM MELDUNG-EINTRAGEN                                D01
142970         GO TO PROGRAMM-VERLASSEN                                 D01
142971       ELSE                                                       D01
142972         CONTINUE                                                 D01
142973       END-IF                                                     D01
142974     ELSE                                                         D01
142975       CONTINUE                                                   D01
142976     END-IF                                                       D01
142977     .                                                            D01
142978 VIER-AUGEN-PRUEFUNG-1002.                                        D01
142979     EXIT.                                                        D01
143000/---------------------------------------------------------------*
143100* Prüfen der Eingabeparamter bei Ändern APO                     *
143200*---------------------------------------------------------------*
143300 PRUEFEN-EINGABEFELDER-APO SECTION.
143400 PRUEFEN-EINGABEFELDER-APO-1001.
143500* Prüfungen erfolgen in den gerufenen Aufträgen.
143600* Dzt. keine zusätzlichen Prüfen.
143700     NEXT SENTENCE
143800     .
143900 PRUEFEN-EINGABEFELDER-APO-1002.
144000     EXIT.
144100/---------------------------------------------------------------*
144200* Prüfen der Eingabeparamter bei Ändern Schließung              *
144300*---------------------------------------------------------------*
144400 PRUEFEN-EINGABEFELDER-SCH SECTION.
144500 PRUEFEN-EINGABEFELDER-SCH-1001.
144600* Prüfungen erfolgen in den gerufenen Aufträgen.
144700* Dzt. keine zusätzlichen Prüfen.
144800     NEXT SENTENCE
144900     .
145000 PRUEFEN-EINGABEFELDER-SCH-1002.
145100     EXIT.
145200/---------------------------------------------------------------*
145300* Aufruf des Auftrags KKA5AP                                    *
145400* Lesen APO über PK                                             *
145500*---------------------------------------------------------------*
145600 AUFRUF-KKA5AP SECTION.
145700 AUFRUF-KKA5AP-1001.
145800*
145900     MOVE C-01-INT-LES-APO-DETAIL
146000       TO KAI5AP1-FUNKTION
146100* Eingabebereich versorgen
146200
146300     MOVE KAI4OF1-ABSTIMMKREIS-NR
146400       TO KAI5AP1-ABSTIMMKREIS-NR
146500     MOVE KAI4OF1-HERKUNFT
146600       TO KAI5AP1-HERKUNFT
146700     MOVE KAI4OF1-KONTO-ID-ABSTIMM
146800       TO KAI5AP1-KONTO-ID-ABSTIMM
146900     MOVE KAI4OF1-AUSZUGSDATUM
147000       TO KAI5AP1-AUSZUGSDATUM
147100     MOVE KAI4OF1-AUSZUGSNUMMER
147200       TO KAI5AP1-AUSZUGSNUMMER
147300     MOVE KAI4OF1-AUSZUG-FNR
147400       TO KAI5AP1-AUSZUG-FNR
147500     MOVE KAI4OF1-LFD-NR-APO
147600       TO KAI5AP1-LFD-NR-APO
147700* Auftrag aufrufen
147800     CALL "CGSAUF"
147900     USING C-AUF-AUFRUF-AL
148000           C-KONFIG-ID-KA 
148100           C-OBJEKT-AUFTRAG-KKA5AP  
148200           GSOVER-VERSTAENDIGUNGSBEREICH  
148300           KAI5AP1-EINGABEBEREICH    
148400           KAO5AP1-AUSGABEBEREICH   
148500           DUMMY
148600           KAXIND-INDICES
148700*
148800     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
148900     THEN
149000       GO TO PROGRAMM-VERLASSEN
149100     END-IF
149200     .
149300 AUFRUF-KKA5AP-1002.
149400     EXIT.
149500/---------------------------------------------------------------*
149600* Aufruf des Auftrags KKA4AP                                    *
149700* Ändern APO-Satz                                               *
149800*---------------------------------------------------------------*
149900 AUFRUF-KKA4AP SECTION.
150000 AUFRUF-KKA4AP-1001.
150100*
150200     MOVE C-01-INT-AEN-APO-UCHK
150300       TO KAI4AP1-FUNKTION
150400* Eingabebereich versorgen
150500
150600* Grundbelegung vom Lesen
150700     MOVE KAO5AP1-APO-PK          TO KAI4AP1-APO-PK
150800     MOVE KAO5AP1-APO-DATEN       TO KAI4AP1-APO-DATEN
150900*
151000     MOVE KAI4OF1-BEMERKUNG       TO KAI4AP1-APO-BEMERKUNG
151100     MOVE KAI4OF1-FACHBEREICH     TO KAI4AP1-APO-FACHBEREICH
151200* es gibt keinen Benutzer für Änderung:
151300*    MOVE GSO1ANM-BENUTZERIDENTIFIKATION
151400*      TO ???
151500     MOVE KAI4OF1-TIMESTAMP-BKAAPO
151600       TO KAI4AP1-APO-TIMESTAMP-BKAAPO 
151700* Auftrag aufrufen
151800     CALL "CGSAUF"
151900     USING C-AUF-AUFRUF-AL
152000           C-KONFIG-ID-KA 
152100           C-OBJEKT-AUFTRAG-KKA4AP  
152200           GSOVER-VERSTAENDIGUNGSBEREICH  
152300           KAI4AP1-EINGABEBEREICH    
152400           DUMMY
152500           DUMMY
152600           KAXIND-INDICES
152700*
152800     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
152900     THEN
153000       GO TO PROGRAMM-VERLASSEN
153100     END-IF
153200     .
153300 AUFRUF-KKA4AP-1002.
153400     EXIT.
153500/---------------------------------------------------------------*
153600* Aufruf des Auftrags KKA5SL                                    *
153700* Lesen Schließung über PK                                      *
153800*---------------------------------------------------------------*
153900 AUFRUF-KKA5SL SECTION.
154000 AUFRUF-KKA5SL-1001.
154100*
154200     MOVE C-01-INT-LES-SCH-DETAIL
154300       TO KAI5SL1-FUNKTION
154400*    Eingabebereich versorgen
154500     MOVE KAI4OF2-SCHLIESSUNGSNR
154600       TO KAI5SL1-SCHLIESSUNGSNR
154700*    Auftrag aufrufen
154800     CALL "CGSAUF"
154900     USING C-AUF-AUFRUF-AL
155000           C-KONFIG-ID-KA 
155100           C-OBJEKT-AUFTRAG-KKA5SL
155200           GSOVER-VERSTAENDIGUNGSBEREICH  
155300           KAI5SL1-EINGABEBEREICH
155400           KAO5SL1-AUSGABEBEREICH
155500*
155600     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
155700     THEN
155800       GO TO PROGRAMM-VERLASSEN
155900     END-IF
156000     .
156100 AUFRUF-KKA5SL-1002.
156200     EXIT.
156300/---------------------------------------------------------------*
156400* Aufruf des Auftrags KKA4SL                                    *
156500* Freigabe/Aufheben/Ablehnen der Schließung                     *
156600*---------------------------------------------------------------*
156700 AUFRUF-KKA4SL SECTION.
156800 AUFRUF-KKA4SL-1001.
156900*
157000     EVALUATE KAI4OF2-FUNKTION
157100     WHEN     C-01-STD-SCH-FREI
157200       MOVE C-01-INT-AEN-SCH-FREI TO KAI4SL2-FUNKTION
157300     WHEN     C-01-STD-SCH-ABLE
157400       MOVE C-01-INT-AEN-SCH-ABLE TO KAI4SL2-FUNKTION
157500     WHEN     C-01-STD-SCH-AUFH
157600       MOVE C-01-INT-AEN-SCH-AUFH TO KAI4SL2-FUNKTION
157700     END-EVALUATE
157800*    Eingabebereich versorgen
157900     MOVE KAI4OF2-SCHLIESSUNGSNR
158000                                  TO KAI4SL2-SCHLIESSUNGSNR
158100
158200     MOVE KAI4OF2-SCHLIESSUNG-BEMERK
158300                                  TO KAI4SL2-SCHLIESSUNG-BEMERK
158400     MOVE GSO1ANM-BENUTZERIDENTIFIKATION
158500                                  TO KAI4SL2-USER
158600     MOVE FUNCTION CURRENT-DATE   TO H-DH-TIMESTAMP-FIELDS        D02
158700     MOVE H-DH-TIMESTAMP          TO KAI4SL2-KASCH-TIMESTAMP      D02
158800
158900*    Auftrag aufrufen
159000     CALL "CGSAUF"
159100     USING C-AUF-AUFRUF-AL
159200           C-KONFIG-ID-KA 
159300           C-OBJEKT-AUFTRAG-KKA4SL
159400           GSOVER-VERSTAENDIGUNGSBEREICH  
159500           KAI4SL2-EINGABEBEREICH    
159600           DUMMY
159700*
159750     EVALUATE GSOVER-GEWICHT                                      D03
159760       WHEN C-GEW-NICHT-GESETZT                                   D03
159761         CONTINUE                                                 D03
159800       WHEN C-GEW-ZUSTAND                                         D03
159850           EVALUATE KAI4OF2-FUNKTION                              D03
159860             WHEN C-01-STD-SCH-FREI                               D03
159861*                 KA4857 : Bei diesem Status ist die Freigabe     D03
159862*                 nicht möglich:  S-Nr: @@@@@@@@@@@@)             D03
159863               MOVE C-OBJEKT-KA4857        TO H-MELDUNGS-OBJEKT   D03
159864               MOVE KAI4SL2-SCHLIESSUNGSNR TO GSTMEL-VAR-TEXT-1   D03
159865               PERFORM MELDUNG-EINTRAGEN                          D03
159866               GO TO PROGRAMM-VERLASSEN                           D03
159870             WHEN C-01-STD-SCH-AUFH                               D03
159871*                 KA4858 : Bei diesem Status ist die Aufhebung    D03
159872*                 nicht möglich:  S-Nr: @@@@@@@@@@@@)             D03
159873               MOVE C-OBJEKT-KA4858        TO H-MELDUNGS-OBJEKT   D03
159874               MOVE KAI4SL2-SCHLIESSUNGSNR TO GSTMEL-VAR-TEXT-1   D03
159875               PERFORM MELDUNG-EINTRAGEN                          D03
159876               GO TO PROGRAMM-VERLASSEN                           D03
159880             WHEN OTHER                                           D03
159881*                 KA4859 : Bei diesem Status ist die Ablehnung    D03
159882*                 nicht möglich:  S-Nr: @@@@@@@@@@@@)             D03
159883               MOVE C-OBJEKT-KA4859        TO H-MELDUNGS-OBJEKT   D03
159884               MOVE KAI4SL2-SCHLIESSUNGSNR TO GSTMEL-VAR-TEXT-1   D03
159885               PERFORM MELDUNG-EINTRAGEN                          D03
159886               GO TO PROGRAMM-VERLASSEN                           D03
159890         END-EVALUATE                                             D03
160000       WHEN OTHER                                                 D03
160100*        Abbruchfehler in Datenbasis                              D03
160150         GO TO PROGRAMM-VERLASSEN                                 D03
160160     END-EVALUATE                                                 D03
160200     .                                                            
160300 AUFRUF-KKA4SL-DET-1002.
160400     EXIT.
160500/---------------------------------------------------------------*
160600* Aufruf des Auftrags KKA4AP                                    *
160700* Massenänderung                                                *
160800*---------------------------------------------------------------*
160900 AUFRUF-KKA4AP-MASSEN-UPD SECTION.
161000 AUFRUF-KKA4AP-MASSEN-UPD-1001.
161100*
161200     EVALUATE KAI4OF2-FUNKTION
161300     WHEN     C-01-STD-SCH-FREI
161400       MOVE C-01-INT-AEN-APO-FREI TO KAI4AP4-FUNKTION
161500     WHEN     C-01-STD-SCH-ABLE
161600       MOVE C-01-INT-AEN-APO-ABLE TO KAI4AP4-FUNKTION
161700     WHEN     C-01-STD-SCH-AUFH
161800       MOVE C-01-INT-AEN-APO-AUFH TO KAI4AP4-FUNKTION
161900     END-EVALUATE
162000*    Eingabebereich versorgen
162100     MOVE KAI4OF2-SCHLIESSUNGSNR
162200       TO KAI4AP4-SCHLIESSUNGSNR
162300*
162400     MOVE FUNCTION CURRENT-DATE   TO H-DH-TIMESTAMP-FIELDS
162500     MOVE H-DH-TIMESTAMP          TO KAI4AP4-TIMESTAMP
162600     MOVE GSO1ANM-BENUTZERIDENTIFIKATION
162700                                  TO KAI4AP4-USER
162800* Auftrag aufrufen
162900     CALL "CGSAUF"
163000     USING C-AUF-AUFRUF-AL
163100           C-KONFIG-ID-KA 
163200           C-OBJEKT-AUFTRAG-KKA4AP  
163300           GSOVER-VERSTAENDIGUNGSBEREICH  
163400           KAI4AP4-EINGABEBEREICH    
163500           DUMMY
163600           DUMMY
163700           KAXIND-INDICES
163800*
163900     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
164000     THEN
164100       GO TO PROGRAMM-VERLASSEN
164200     END-IF
164300     .
164400 AUFRUF-KKA4AP-MASSEN-UPD-1002.
164500     EXIT.
164600/
164700*-----------------------------------------------------------*
164800* Anlegen Jounal                                            *
164900*-----------------------------------------------------------*
165000 ANLEGEN-JOURNAL SECTION.
165100 ANLEGEN-JOURNAL-1001.
165200*
165300* Herkunftskennzeichen für KJD100 ermitteln
165400     CALL "CJDWRTE"
165500     USING C-FUNKTION-HERK-LIEFERN
165600           C-KONFIG-ID-KA
165700           C-OBJEKT-ESA-JD
165800           GSOVER-VERSTAENDIGUNGSBEREICH
165900           DUMMY
166000           JDOWRTI-AUSGABEBEREICH
166100           DUMMY
166200     IF GSOVER-GEWICHT            > C-GEW-NICHT-GESETZT
166300     THEN
166400* Meldung bereits eingetragen
166500       GO TO PROGRAMM-VERLASSEN
166600     END-IF
166700*
166800     EVALUATE KAI4OF1-FUNKTION
166900     WHEN C-01-STD-APO-AEN-BEM-FB
167000*      Protokollgrund
167100       MOVE C-PROT-EINGABE        TO JDI100-PROTOKOLLGRUND
167200       MOVE C-GV-APO-AEND         TO JDI100-GV
167300       MOVE KAI4OF1-BEMERKUNG (1:60)
167400         TO JDI100-BEMERKUNG1
167500*      GV-spezifische Verarbeitung
167600       MOVE ZERO                  TO H-IND
167700       ADD C-1                    TO H-IND
167800       MOVE C-FELD-KA000001       TO JDAENES-AEND-FELD(H-IND)
167900       MOVE C-AKTION-NEU
168000         TO JDAENES-AEND-FELDINHALT-NEU(H-IND)
168100*      Zugriffskriterium
168200       MOVE KAI4OF1-ABSTIMMKREIS-NR
168300                                  TO H-ZUGRIFFSKRITERIUM
168400       MOVE H-ZUGRIFFSKRITERIUM   TO JDI100-ZUGRIFFSKRITERIUM
168500     WHEN C-01-STD-SCH-FREI
168600*      Protokollgrund
168700       MOVE C-PROT-EINGABE        TO JDI100-PROTOKOLLGRUND
168800       MOVE C-GV-SCHL-FREI        TO JDI100-GV
168900       MOVE KAI4OF2-SCHLIESSUNG-BEMERK (1:60)
169000                                  TO JDI100-BEMERKUNG1
169100*      GV-spezifische Verarbeitung
169200       MOVE ZERO                  TO H-IND
169300       ADD C-1                    TO H-IND
169400       MOVE C-FELD-KA000002       TO JDAENES-AEND-FELD(H-IND)
169500       MOVE C-AKTION-FREI
169600         TO JDAENES-AEND-FELDINHALT-NEU(H-IND)
169700*      Zugriffskriterium
169800       MOVE KAI4OF2-SCHLIESSUNGSNR
169900                                  TO H-ZUGRIFFSKRITERIUM
170000       MOVE H-ZUGRIFFSKRITERIUM   TO JDI100-ZUGRIFFSKRITERIUM
170100     WHEN C-01-STD-SCH-ABLE
170200*      Protokollgrund
170300       MOVE C-PROT-EINGABE        TO JDI100-PROTOKOLLGRUND
170400       MOVE C-GV-SCHL-ABLE        TO JDI100-GV
170500       MOVE KAI4OF2-SCHLIESSUNG-BEMERK (1:60)
170600                                  TO JDI100-BEMERKUNG1
170700*      GV-spezifische Verarbeitung
170800       MOVE ZERO                  TO H-IND
170900       ADD C-1                    TO H-IND
171000       MOVE C-FELD-KA000002       TO JDAENES-AEND-FELD(H-IND)
171100       MOVE C-AKTION-ABLE
171200         TO JDAENES-AEND-FELDINHALT-NEU(H-IND)
171300*      Zugriffskriterium
171400       MOVE KAI4OF2-SCHLIESSUNGSNR
171500                                  TO H-ZUGRIFFSKRITERIUM
171600       MOVE H-ZUGRIFFSKRITERIUM   TO JDI100-ZUGRIFFSKRITERIUM
171700     WHEN C-01-STD-SCH-AUFH
171800*      Protokollgrund
171900       MOVE C-PROT-EINGABE        TO JDI100-PROTOKOLLGRUND
172000       MOVE C-GV-SCHL-AUFH        TO JDI100-GV
172100       MOVE KAI4OF2-SCHLIESSUNG-BEMERK (1:60)
172200                                  TO JDI100-BEMERKUNG1
172300*      GV-spezifische Verarbeitung
172400       MOVE ZERO                  TO H-IND
172500       ADD C-1                    TO H-IND
172600       MOVE C-FELD-KA000002       TO JDAENES-AEND-FELD(H-IND)
172700       MOVE C-AKTION-AUFH
172800         TO JDAENES-AEND-FELDINHALT-NEU(H-IND)
172900*      Zugriffskriterium
173000       MOVE KAI4OF2-SCHLIESSUNGSNR
173100                                  TO H-ZUGRIFFSKRITERIUM
173200       MOVE H-ZUGRIFFSKRITERIUM   TO JDI100-ZUGRIFFSKRITERIUM
173300     WHEN OTHER
173400       CONTINUE
173500     END-EVALUATE
173600*
173700* Eingabebereich versorgen
173800     MOVE H-IND                   TO JDI100-ANZAHL-AEN-INF
173900     MOVE C-VERARB-KZ-1           TO JDI100-VERARB-KZ
174000     MOVE JDOWRTI-HERKUNFT        TO JDI100-HERKUNFTS-KZ
174100     MOVE GSO1ANM-GV-DATUM        TO JDI100-DATUM-EINGABE
174200     MOVE C-PROT-LAUFNUMMER       TO JDI100-PROT-LAUFNUMMER
174300     MOVE C-ZUGRIFFSSCHUTZ        TO JDI100-ZUGRIFFSSCHUTZ
174400     MOVE C-0000                  TO JDI100-OBG-EINGABE
174500     MOVE C-0000                  TO JDI100-OBG-BESTAND
174600     MOVE C-0000                  TO JDI100-OBG-FREIGABE
174700     MOVE C-GV-VERSION            TO JDI100-GV-VERSION
174800* Wirksam ab/bis
174900     MOVE GSO1ANM-QUELLE-DATUM    TO JDI100-DATUM-WIRKSAM-VON
175000     MOVE C-99991231              TO JDI100-DATUM-WIRKSAM-BIS
175100     CALL "CGSAUF"
175200     USING C-AUF-AUFRUF-AL
175300           C-KONFIG-ID-GS
175400           C-OBJEKT-KJD100
175500           GSOVER-VERSTAENDIGUNGSBEREICH
175600           JDI100-EINGABEBEREICH
175700           JDO100-AUSGABEBEREICH
175800           CJDIND-INDICES
175900           AENDERUNGEN
176000     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
176100     THEN
176200* Meldung bereits eingetragen
176300       GO TO PROGRAMM-VERLASSEN
176400     END-IF
176500     MOVE C-OBJEKT-KA0000         TO GSOVER-RETURNCODE
176600     .
176700 ANLEGEN-JOURNAL-1002.
176800     EXIT
176900     .
177000/---------------------------------------------------------------*
177100* Programminitialisierung                                       *
177200*---------------------------------------------------------------*
177300 INITIALISIERUNG SECTION.
177400 INITIALISIERUNG-1001.
177500     INITIALIZE                   GSTMEL-TRANSIENTER-BEREICH
177600     MOVE SPACE                   TO H-FUNKTION
177700*
177800     PERFORM LESEN-ANMELDEDATEN
177900     .
178000 INITIALISIERUNG-1002.
178100     EXIT.
178200/---------------------------------------------------------------*
178300* Lesen der Anmeldedaten                                        *
178400*---------------------------------------------------------------*
178500 LESEN-ANMELDEDATEN SECTION.
178600 LESEN-ANMELDEDATEN-1001.
178700     CALL "CGSTAB"
178800     USING C-TAB-ANM-DAT-LESEN
178900           C-KONFIG-ID-GS
179000           C-OBJEKT-TAB-ANMELDEDATEN
179100           GSOVER-VERSTAENDIGUNGSBEREICH
179200           DUMMY
179300           GSO1ANM-AUSGABEBEREICH
179400           GSTTAB-EIN-AUSGABEBEREICH
179500     END-CALL
179600
179700     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
179800     THEN
179900       GO TO PROGRAMM-VERLASSEN
180000     END-IF
180100      .
180200 LESEN-ANMELDEDATEN-1002.
180300     EXIT.
180400/---------------------------------------------------------------*
180500* Meldung eintragen                                             *
180600*---------------------------------------------------------------*
180700 MELDUNG-EINTRAGEN SECTION.
180800 MELDUNG-EINTRAGEN-1001.
180900     CALL "CGSMEL"
181000     USING C-MEL-EINTRAGEN
181100           C-KONFIG-ID-KA
181200           H-MELDUNGS-OBJEKT
181300           GSOVER-VERSTAENDIGUNGSBEREICH
181400           DUMMY
181500           GSOMEL-AUSGABEBEREICH
181600           GSTMEL-TRANSIENTER-BEREICH
181700     END-CALL
181800*
181900     IF GSOVER-GEWICHT            > C-GEW-FEHLER
182000     THEN
182100       GO TO PROGRAMM-VERLASSEN
182200     ELSE
182300       MOVE H-MELDUNGS-OBJEKT     TO GSOVER-RETURNCODE
182400     END-IF
182500     .
182600 MELDUNG-EINTRAGEN-1002.
182700     EXIT.
182800/*-------------------------------------------------------------*
182900* Meldungen aus Meldungspool loeschen.                         *
183000*--------------------------------------------------------------*
183100 MELDUNG-AUSTRAGEN SECTION.
183200 MELDUNG-AUSTRAGEN-1001.
183300     CALL "CGSMEL"
183400     USING C-MEL-AUSTRAGEN
183500           C-KONFIG-ID-KA
183600           C-OBJEKT-MEL-GSPOOL
183700           GSOVER-VERSTAENDIGUNGSBEREICH
183800           DUMMY
183900           GSOMEL-AUSGABEBEREICH
184000           GSTMEL-TRANSIENTER-BEREICH
184100
184200     IF GSOMEL-MAX-GEW > C-GEW-WARNUNG
184300     THEN
184400       GO TO PROGRAMM-VERLASSEN
184500     END-IF
184600     .
184700 MELDUNG-AUSTRAGEN-1002.
184800     EXIT.
184900/---------------------------------------------------------------*
185000* Verlassen des Programms ueber einen Ausstiegspunkt            *
185100*---------------------------------------------------------------*
185200 PROGRAMM-VERLASSEN SECTION.
185300 PROGRAMM-VERLASSEN-1001.
185400     EXIT PROGRAM.
185500 PROGRAMM-VERLASSEN-1002.
185600     EXIT.

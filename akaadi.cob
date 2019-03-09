sdfdfdsfsd000000* ELEMENTKOPF-COBOL-SOURCE ********************************%*
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
000160*@Titel         : Massenabstimmung
000160*@Elementname   : akaadi.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00003
000160*@Cr_Date       : 20150107.094134
000160*@Produkt       : ak
000160*@Lieferpaket   : 
000160*@Liefertiefe   : nur_lesen
000160*@Rekursiv      : 
000160*@Kategorie     : sao
000160*@BatchDialog   : beides
000160*@Zugeliefert   : 
000160*@Generiert_aus : 
000160*@Nicht_manuell : 
000160*@Pruefe_aekz   : j
000160*@Querschnitt   : 
000160*@SQL           : 
000160*@e_element_info 
000160*
001000*@Title        : Massenabstimmung                           *
001100* Verfasser    : Stefan Poetsch                             *
001200* Erstelldatum : 09.02.2012                                 *
001400*                                                           *
001500*@A-ELEMENTBESCHREIBUNG                                     *
001600* Modul-Beschreibung:                                       *
001700* ------------------                                        *
001800* Der KORDOBA Auftrag stellt die Funktionen fuer            *
001900* - Dialogabstimmung und                                    *
002000* - Abstimmung einer Import-Datei                           *
002100* bereit.                                                   *
002200*                                                           *
002300*@E-ELEMENTBESCHREIBUNG                                     *
002400*                                                           *
002500*@A-FUNKTION-1                                              *
002600* Dialogabstimmung                                          *
002700*                                                           *
002800* Eingabefeldbelegungen:                                    *
002900* Funktion "01-STD-ABS-DIA"                                 *
003000* Index des letzten Eintrags der Tabelle                    *
003100* Tabelle mit bis zu 200 Primärkeys                         *
003200*                                                           *
003300*@E-FUNKTION-1                                              *
003400*                                                           *
003500*@A-MODULAUFRUF                                             *
003600* Aufruf-Beispiel:                                          *
003700*                                                           *
003800* Aufrufparameter: 1. Funktion               (I)            *
003900*                  2. Konfigurations-Id      (I)            *
004000*                  3. Objekt                 (I)            *
004100*                  4. Verstaendigungsbereich (O)            *
004200*                  5. Eingabebereich         (I)            *
004300*                  6. Ausgabebereich         (O)            *
004400*                  7. Transientbereich       (I/O)          *
004500*                  8. Indices                (I)            *
004600*                                                           *
004700* CALL "CGSAUF"                                             *
004800* USING C-AUF-AUFRUF-AL                                     *
004900*       C-KONFIG-ID-KA                                      *
005000*       C-OBJEKT-AUF-AKAADI                                 *
005100*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *
005200*       KAIADI1-EINGABEBEREICH                              *
005300*       DUMMY                                               *
005400*       DUMMY                                               *
005500*       KAXIND-INDICES                                      *
005600*                                                           *
005700*@E-MODULAUFRUF                                             *
005800*                                                           *
005900*@A-RETURNCODE                                              *
007900*@E-RETURNCODE                                              *
008000*                                                           *
008100*@A-ENTRY                                                   *
008200* Entryname       : AKAADI                                  *
008300*                                                           *
008400*@E-ENTRY                                                   *
008500*                                                           *
008600*@A-MODUL                                                   *
009400*@E-MODUL                                                   *
009500*                                                           *
009600*@A-COBOL-COPY                                              *
013800*@E-COBOL-COPY                                              *
013900*                                                           *
014000*@A-TABELLE                                                 *
014100* TABEX-Tabellen  :                                         *
014200*                   KA00AKRS                                *
014300*                   KA00AKKTO                               *
014400*@E-TABELLE                                                 *
014500*                                                           *
014600*@A-BENUTZERSATZ                                            *
014700* Benutzersaetze  : <benutzersatz> (I/O/IO)                 *
014800*                   BKAAPO                                  *
014900*                                                           *
015000*@E-BENUTZERSATZ                                            *
015100*                                                           *
015200*@A-DATEI                                                   *
015300* Dateien         : entfallen                               *
015400*                                                           *
015500*@E-DATEI                                                   *
015600*                                                           *
015700*@A-KONVENTIONEN                                            *
015800*@E-KONVENTIONEN                                            *
015900*                                                           *
016000*@A-DOKUMENT                                                *
016100* Die fachliche Beschreibung ist im Dokument                *
016200* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *
016300* hinterlegt.                                               *
016400*                                                           *
016500*@E-DOKUMENT                                                *
016600*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
090051* D01 R49405                                                *     D01
090052*     Anpassung der Funktionscodes der Berechtigungsprüfung *     D01
090053*     unterschiedliche Meldungen je nach Art der Abstimmung *     D01
090054*     Datum: 02.08.2012                            NKZ: TRO *     D01
090055*                                                           *     D01
090056* D02 R51381                                                *     D02
090057*     einheitliche Feldlänge für Schliessungsnummer         *     D02
090058*     Datum: 27.09.2012                            NKZ: EPI *     D02
090059*                                                           *     D02
090060* E01 R77134                                                *     E01
090061*     Erweiterungen wegen Projekt WP-Stückeabstimmung       *     E01
090062*     (bzgl. KA_TABLE_SCH, KA000AKKTO und KA000AKRS).       *     E01
090063*     Datum: 08.12.2014                            NKZ: SUM *     E01
090064*                                                           *     E01
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/
100200 IDENTIFICATION DIVISION.
100300 PROGRAM-ID. AKAADI.
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
101550     05  FILLER PIC X(13) VALUE "ELEM=akaadi  ".                  CCC
101551     05  FILLER PIC X(15) VALUE "VERS=k151-00003".                CCC
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
103100    05 C-OBJEKT-KA0000            PIC X(006) VALUE "KA0000".
103200    05 C-OBJEKT-KA2850            PIC X(006) VALUE "KA2850".
103250    05 C-OBJEKT-KA2854            PIC X(006) VALUE "KA2854".      D01
103300    05 C-OBJEKT-KA4101            PIC X(006) VALUE "KA4101".
103400    05 C-OBJEKT-KA4114            PIC X(006) VALUE "KA4114".
103500    05 C-OBJEKT-KA4201            PIC X(006) VALUE "KA4201".
103600    05 C-OBJEKT-KA4202            PIC X(006) VALUE "KA4202".
103700    05 C-OBJEKT-KA4203            PIC X(006) VALUE "KA4203".
103800    05 C-OBJEKT-KA4205            PIC X(006) VALUE "KA4205".
103900    05 C-OBJEKT-KA4206            PIC X(006) VALUE "KA4206".
104000    05 C-OBJEKT-KA4801            PIC X(006) VALUE "KA4801".
104100    05 C-OBJEKT-KA5002            PIC X(006) VALUE "KA5002".
104200    05 C-OBJEKT-KA5003            PIC X(006) VALUE "KA5003".
104300    05 C-OBJEKT-KA5007            PIC X(006) VALUE "KA5007".
104400/---------------------------------------------------------------*
104500* Lokale Konstante fuer KORDOBA-Auftrag AKAADI                  *
104600*---------------------------------------------------------------*
104700 01 KONSTANTE-AKAADI.
104800    05 C-01-STD-ABS-DIA           PIC X(040) VALUE
104900                                  "01-STD-ABS-DIA".
105000    05 C-01-INT-ABS-IMP-V-ANF     PIC X(040)
105100                                  VALUE "01-INT-ABS-IMP-V-ANF".
105200    05 C-01-INT-ABS-IMP-V-APO     PIC X(040)
105300                                  VALUE "01-INT-ABS-IMP-V-APO".
105400    05 C-01-INT-ABS-IMP-V-END     PIC X(040)
105500                                  VALUE "01-INT-ABS-IMP-V-END".
105600    05 C-KONFIG-ID-KA             PIC X(002) VALUE "KA".
105700    05 C-KONFIG-ID-GS             PIC X(002) VALUE "GS".
105800    05 C-AUF-AUFRUF-AL            PIC X(040) VALUE "AUFRUF-AL".
105900    05 C-AKAADI                   PIC X(008) VALUE "AKAADI".
106000    05 C-MINUS-1                  PIC S9(003) BINARY VALUE -1.
106100    05 C-1                        PIC 9(001) VALUE 1.
106200    05 C-2                        PIC 9(001) VALUE 2.
106300    05 C-J                        PIC X(001) VALUE "J".
106400    05 C-N                        PIC X(001) VALUE "N".
106500    05 C-SCHLIESSART-IMPORT       PIC X(001) VALUE "I".
106600    05 C-SCHLIESSART-MANUELL      PIC X(001) VALUE "M".
      *                                                                 E01
          05 C-SCHLIESSQUALI-GU         PIC X(001) VALUE " ".           E01
          05 C-GELDKTO-UMSATZ-ABSTIMM   PIC X(002) VALUE "GU".          E01
106700    05 C-BEMERK-OFFEN             PIC X(080) VALUE
106800        "offener Ausgleichsposten".
106900    05 C-BEMERK-GESCHL            PIC X(080) VALUE
107000        "geschlossener Ausgleichsposten".
107100    05 C-NACHRICHTYP-AUSGL        PIC X(020) VALUE
107200                                  "Ausgleichsposten".
107300    05 C-INTERN                   PIC X(010) VALUE "INTERN".
107400    05 C-TXT-SL-9900              PIC 9(004) VALUE 9900.
107500 01 C-STATI.
107600    05 C-STATUS-OFFEN             PIC 9(001) VALUE 2.
107700    05 C-STATUS-FREIZUGEBEN       PIC 9(001) VALUE 5.
107800    05 C-STATUS-GESCHLOSSEN       PIC 9(001) VALUE 8.
107900/---------------------------------------------------------------*
108000* CGSMEL                                                        *
108100*---------------------------------------------------------------*
108200 01 CGSMEL-DEFINITIONEN.
108300     05 C-MEL-EINTRAGEN           PIC X(040) VALUE "EINTRAGEN".
108400     05 C-LAENGE-ZUSATZTEXT-KA420X
108500                                  PIC 9(002) VALUE 70.
108600     05 C-ZUSATZTEXT-KA420X.
108700      10 KA420X-AK-NR             PIC 9(005).
108800      10 FILLER                   PIC X(001) VALUE "/".
108900      10 KA420X-KONTO-ID          PIC X(035).
109000      10 FILLER                   PIC X(001) VALUE "/".
109100      10 KA420X-AUSZUG-DATUM      PIC 9(008).
109200      10 FILLER                   PIC X(001) VALUE "/".
109300      10 KA420X-AUSZUG-NR         PIC 9(005).
109400      10 FILLER                   PIC X(001) VALUE "/".
109500      10 KA420X-FOLGENUMMER       PIC 9(005).
109600      10 FILLER                   PIC X(001) VALUE "/".
109700      10 KA420X-TRANSAKT-LFD-NR   PIC 9(007).
109800/---------------------------------------------------------------*
109900* CGSTAB                                                        *
110000*---------------------------------------------------------------*
110100 01 CGSTAB-DEFINITIONEN.
110200     05 C-OBJEKT-TAB-ANMELDEDATEN PIC X(020) VALUE "ANMELDEDATEN".
110300     05 C-TAB-LESEN-EQUAL         PIC X(040) VALUE "LESEN-EQUAL".
110400     05 C-TAB-ANM-DAT-LESEN       PIC X(040) VALUE
110500                                  "ANM-DAT-LESEN".
110600     05 C-OBJEKT-TAB-KA01AKRS     PIC X(009) VALUE "KA01AKRS".    E01
110700     05 C-OBJEKT-TAB-AKKTO        PIC X(020) VALUE "KA00AKKTO".
110800/
110900*---------------------------------------------------------------*
111000* Schnittstelle CGSBER (Berechtigungspruefung)                  *
111100*---------------------------------------------------------------*
111200 01 H-BERECHTIGUNG.
111300     05 C-FUNKTION-HERK-LIEFERN   PIC X(040) VALUE
111400                                  "LIEFERN-SYSTEM-HERKUNFT".
111500     05 C-OBJEKT-ESA-JD           PIC X(020) VALUE "ESA-JD".
111600     05 C-BER-PRUEFEN             PIC X(040) VALUE "PRUEFEN".
111700     05 C-OBJEKT-BER-USER-BERECHT PIC X(020)
111800                                  VALUE "USER-BERECHT".
111900     05 C-BER-ANZAHL-3            PIC 9(002) VALUE 3.
112000     05 H-OBJEKT-BER              PIC X(010) VALUE SPACE.
112100     05 C-OBJEKT-BER-KA-KTOABST   PIC X(010) VALUE "KA-KTOABST".
112200     05 C-FKT-BER-ABST-OHNE-FREI  PIC X(003) VALUE "760".         D01
112300     05 C-FKT-BER-ABST-MIT-FREI   PIC X(003) VALUE "772".         D01
112400*
112500     COPY CGSI4BER                REPLACING 01 BY 05,
112600                                  ==(01)== BY ==(01)==.
112700/---------------------------------------------------------------*
112800* Ausgabeschnittstelle fuer CJDWRTE                             *
112900*---------------------------------------------------------------*
113000 COPY CJDOWRTI.
113100/---------------------------------------------------------------*
113200* Eingabeschnittstelle fuer KJD100                              *
113300*---------------------------------------------------------------*
113400 COPY CJDI100.
113500/---------------------------------------------------------------*
113600* Ausgabeschnittstelle fuer KJD100                              *
113700*---------------------------------------------------------------*
113800 COPY CJDO100.
113900/---------------------------------------------------------------*
114000* Uebergabestruktur fuer Indices JD an KORDOBA-Auftrag          *
114100*---------------------------------------------------------------*
114200 COPY CCJDIND.
114300/---------------------------------------------------------------*
114400* Aenderungs-Tabelle fuer Journaldaten-Eintraege                *
114500*---------------------------------------------------------------*
114600  01 AENDERUNGEN.
114700     05 AEND-TABELLE              OCCURS 50.
114800     COPY CJDAENES                REPLACING 01 BY 10,
114900                                  ==(01)== BY ==(01)==.
115000  01 C-KONSTANTEN-JD.
115100     05 C-0000                    PIC X(004) VALUE "0000".
115200     05 C-VERARB-KZ-1             PIC X(001) VALUE "1".
115300     05 C-ZUGRIFFSSCHUTZ          PIC X(002) VALUE "00".
115400     05 C-PROT-LAUFNUMMER         PIC X(004) VALUE "0001".
115500     05 C-PROT-EINGABE            PIC X(004) VALUE "0006".
115600     05 C-PROT-FREIGABE           PIC X(004) VALUE "0007".
115700     05 C-99991231                PIC 9(008) VALUE 99991231.
115800     05 C-GV-VERSION              PIC X(003) VALUE "001".
115900     05 C-OBJEKT-KJD100           PIC X(020) VALUE "KJD100".
116000     05 H-ZUGRIFFSKRITERIUM       PIC 9(012).                     D02
116100     05 C-GESCHAEFTSVORFAELLE.
116200       10 C-GV-KASCHLAN           PIC X(008) VALUE "KASCHLAN".
116300     05 C-JD-FELDNAMEN.
116400       10 C-FELD-KA000002         PIC X(006) VALUE "000002".
116500     05 C-AKTION-NEU              PIC X(006) VALUE "NEUANL".
116600*
116700*-------------- lokales Gedächtnis ----------------------------
116800  01 H-MERK-FELDER.
116900     05 H-MERK-AK-NR              PIC 9(005).
117000     05 H-MERK-AK-NR-ALT          PIC 9(005).
117100     05 H-MERK-HERKUNFT           PIC X(011).
117200     05 H-MERK-KONTO-ID           PIC X(035).
117300     05 H-MERK-AUSZUGSDATUM       PIC 9(008).
117400     05 H-MERK-AUSZUGSNUMMER      PIC 9(005).
117500     05 H-MERK-AUSZUG-FNR         PIC 9(005).
117600     05 H-MERK-LFD-NR-APO         PIC 9(007).
117700*
117800     05 H-MERK-STATUS             PIC X(001).
117900*
118000     05 H-MERK-BETRAGSSUMME       PIC S9(015)V9(003).
118100     05 H-MERK-ABSOLUTBETRAG      PIC 9(015)V9(003).
118200     05 H-MERK-WAEHRUNG           PIC X(003).
118300     05 H-MERK-DIFF-TOLERIERT     PIC 9(012)V9(003).
118400*
118500     05 H-MERK-HERKUNFT-INTERN    PIC X(011).
118600     05 H-MERK-KONTO-ID-INTERN    PIC X(035).
118700*
118800     05 H-MERK-BUCHUNGSDATUM      PIC 9(008).
118900     05 H-MERK-NEUE-FOLGENUMMER   PIC 9(005).
119000*
119100     05 H-MERK-SCHLIESSUNGSNUMMER PIC 9(012).                     D02
119200     05 H-MERK-SCHLIESSUNGSART    PIC X(001).
119300     05 H-MERK-SCHLIESSUNG-STATUS PIC X(001).
119400     05 H-MERK-SCHLIESSUNG-BEMERK PIC X(080).
119500*
119600     05 H-BER-ABST-OHNE-FREI      PIC X(001).
119700     05 H-BER-ABST-MIT-FREI       PIC X(001).
119800*---------------------------------------------------------------* 
119900* Schnittstellenparameter für Auftrag KKA5AP                    * 
120000*---------------------------------------------------------------* 
120100 COPY CKAI5AP1. 
120200*
120300 01 AUSGABEBEREICH-KKA5AP.
120400 COPY CKAO5AP1 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
120500 01 AUSGABEBEREICH-KKA5AP-2 REDEFINES AUSGABEBEREICH-KKA5AP.
120600 COPY CKAO5AP2 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
120700*
120800 COPY CKAI5APM. 
120900 COPY CKAO5APM.
121000*
121100 01 KKA5AP-KONSTANTE.
121200     05 C-01-INT-LES-MAX-FNR      PIC X(040)
121300                                  VALUE "01-INT-LES-MAX-FNR".
121400     05 C-01-INT-LES-APO-DETAIL   PIC X(040) VALUE
121500                                  "01-INT-LES-APO-DETAIL".
121600     05 C-01-INT-LES-APO-ABST-D   PIC X(040) VALUE
121700                                  "01-INT-LES-APO-ABST-D".
121800     05 C-OBJEKT-AUF-KKA5AP       PIC X(020) VALUE "KKA5AP".
121900*---------------------------------------------------------------* 
122000* Schnittstellenparameter für Auftrag KKA4SL                    * 
122100*---------------------------------------------------------------* 
122200 01 KKA4SL-KONSTANTE.
122300    05 C-01-INT-ANL-SCH           PIC X(040) VALUE
122400                                  "01-INT-ANL-SCH ".
122500    05 C-01-INT-AEN-SCH-IMP       PIC X(040) VALUE
122600                                  "01-INT-AEN-SCH-IMP".
122700    05 C-OBJEKT-AUF-KKA4SL        PIC X(020) VALUE "KKA4SL".   
122800*
122900 COPY CKAI4SL1. 
123000 COPY CKAO4SL1.
123100*---------------------------------------------------------------* 
123200* Schnittstellenparameter für Auftrag KKA4AP                    * 
123300*---------------------------------------------------------------* 
123400 01 KKA4AP-KONSTANTE.
123500    05 C-01-INT-ANL-APO           PIC X(040) VALUE
123600                                  "01-INT-ANL-APO".
123700    05 C-01-INT-AEN-APO-UCHK      PIC X(040) VALUE
123800                                  "01-INT-AEN-APO-UCHK".
123900    05 C-01-INT-AEN-APO-SCHL-1    PIC X(040) VALUE
124000                                  "01-INT-AEN-APO-SCHL-1".
124100    05 C-OBJEKT-AUF-KKA4AP        PIC X(020) VALUE "KKA4AP".
124200*
124300 01 EINGABEBEREICH-KKA4AP.
124400 COPY CKAI4AP1 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
124500 01 EINGABEBEREICH-KKA4AP-2 REDEFINES EINGABEBEREICH-KKA4AP.
124600 COPY CKAI4AP2 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
124700/---------------------------------------------------------------*
124800* Hilfsfelder                                                   *
124900*---------------------------------------------------------------*
125000  01 H-TIMESTAMP-FIELDS.
125100   05  H-DH-TIMESTAMP.
125200    10  H-CURRENT-YEAR            PIC X(004).
125300    10  H-CURRENT-MONTH           PIC X(002).
125400    10  H-CURRENT-DAY             PIC X(002).
125500    10  H-CURRENT-HOUR            PIC X(002).
125600    10  H-CURRENT-MINUTE          PIC X(002).
125700    10  H-CURRENT-SECOND          PIC X(002).
125800    10  H-CURRENT-MS              PIC X(002).
125900   05  FILLER                     PIC X(005).
126000*
126100 01 HILFSFELDER.
126200    05 H-ZAEHLER-ANZ              PIC 9(003).
126300*
126400    05 H-IND                      PIC 9(002).
126500/---------------------------------------------------------------*
126600*   LOKALE ARBEITSFELDER                                        *
126700*---------------------------------------------------------------*
126800 LOCAL-STORAGE SECTION.
126900/---------------------------------------------------------------*
127000* Meldungsschnittstelle                                         *
127100*---------------------------------------------------------------*
127200 COPY CGSOMEL.
127300 COPY CGSTMEL.
127400/---------------------------------------------------------------*
127500* Meldungstabelle                                               *
127600*---------------------------------------------------------------*
127700 COPY CGSI0MEL.
127800 COPY CGSO0MEL.
127900/---------------------------------------------------------------*
128000* Anmeldedaten                                                  *
128100*---------------------------------------------------------------*
128200 COPY CGSO1ANM.
128300/---------------------------------------------------------------*
128400* Tabelle Abstimmkreise                                         *
128500*---------------------------------------------------------------*
128600 COPY CKAI0AKR.
128700 COPY CKAO0AKR.
128800/---------------------------------------------------------------*
128900* Tabelle Abstimmkreiskonto                                     *
129000*---------------------------------------------------------------*
129100 COPY CKAI0AKK.
129200 COPY CKAO0AKK.
129300/---------------------------------------------------------------*
129400* Uebergabeparameter fuer CGSTAB                                *
129500*---------------------------------------------------------------*
129600 COPY CGSTTAB.
129700/---------------------------------------------------------------*
129800* Hilfsfelder                                                   *
129900*---------------------------------------------------------------*
130000 01 H-MELDUNGS-OBJEKT             PIC X(006).
130100 01 H-FUNKTION.
130200     05 H-FUNKTION-MLD            PIC X(020).
130300     05 H-FUNKTION-REST           PIC X(020).
130400 01 H-DIFFERENZ-ABDRUCKBAR        PIC ZZZZZZZZZZZ9,9(003).
130500 01 DUMMY                         PIC X(001).
130600 COPY CKAHADI.
130700 COPY CBKAAPO.
130800 COPY CKAIAPO.
130900 COPY CKAOAPO.
131000/****************************************************************
131100 LINKAGE SECTION.
131200*****************************************************************
131300*---------------------------------------------------------------*
131400* Funktion                                                      *
131500*---------------------------------------------------------------*
131600 01 AUF-FUNKTION                  PIC X(040).
131700*---------------------------------------------------------------*
131800* Konfigurations-Kennzeichen                                    *
131900*---------------------------------------------------------------*
132000 01 KONFIG-ID                     PIC X(002).
132100*---------------------------------------------------------------*
132200* Auftragsname                                                  *
132300*---------------------------------------------------------------*
132400 01 OBJEKT-AUFTRAGS-ID            PIC X(020).
132500*---------------------------------------------------------------*
132600* VerstAendigungsbereich des Aufrufers                          *
132700*---------------------------------------------------------------*
132800 COPY CGSOVER.
132900*---------------------------------------------------------------*
133000* Eingabebereich fuer den StandAlone-Auftrag AKAADI             *
133100*---------------------------------------------------------------*
133200 01 EINGABEBEREICH.
133300 COPY CKAIADI1 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
133400 01 EINGABEBEREICH-2 REDEFINES EINGABEBEREICH.
133500 COPY CKAIADI2 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
133600 01 EINGABEBEREICH-3 REDEFINES EINGABEBEREICH.
133700 COPY CKAIADI3 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
133800 01 EINGABEBEREICH-4 REDEFINES EINGABEBEREICH.
133900 COPY CKAIADI4 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
134000*---------------------------------------------------------------*
134100* Ausgabebereich fuer den StandAlone-Auftrag AKAADI             *
134200*---------------------------------------------------------------*
134300 01 AUSGABEBEREICH.
134400 COPY CKAOADI1 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
134500 01 AUSGABEBEREICH-2 REDEFINES AUSGABEBEREICH.
134600 COPY CKAOADI2 REPLACING 01 BY 05, ==(01)== BY ==(01)==.
134700*
134800 01 DUMMY-2                       PIC X(001).
134900*---------------------------------------------------------------*
135000* Indices                                                       *
135100*---------------------------------------------------------------*
135200 COPY CKAXIND.
135300/
135400 PROCEDURE DIVISION
135500     USING AUF-FUNKTION
135600           KONFIG-ID
135700           OBJEKT-AUFTRAGS-ID
135800           GSOVER-VERSTAENDIGUNGSBEREICH
135900           EINGABEBEREICH
136000           AUSGABEBEREICH
136100           DUMMY-2
136200           KAXIND-INDICES
136300           .
136400/---------------------------------------------------------------*
136500* Hier wird die Steuerung des KORDOBA-Auftrags durchgefuehrt    *
136600*---------------------------------------------------------------*
136700 STEUER-AKAADI SECTION.
136800 STEUER-AKAADI-1001.
136900     PERFORM INITIALISIERUNG
137000     PERFORM BERECHTIGUNG
137050*                                                                 D01
137051     IF H-BER-ABST-MIT-FREI = C-N                                 D01
137052     THEN                                                         D01
137053       MOVE C-STATUS-FREIZUGEBEN  TO H-MERK-SCHLIESSUNG-STATUS    D01
137054     ELSE                                                         D01
137055       MOVE C-STATUS-GESCHLOSSEN  TO H-MERK-SCHLIESSUNG-STATUS    D01
137056     END-IF                                                       D01
137057*                                                                 D01
137100     EVALUATE KAIADI1-FUNKTION
137200     WHEN C-01-STD-ABS-DIA
137300       PERFORM VERARB-ABS-DIA
137400     WHEN C-01-INT-ABS-IMP-V-ANF
137500       PERFORM VERARB-IMP-ANF
137600     WHEN C-01-INT-ABS-IMP-V-APO
137700       PERFORM VERARB-IMP-APO
137800     WHEN C-01-INT-ABS-IMP-V-END
137900       PERFORM VERARB-IMP-END
138000     WHEN OTHER
138100* KA5002: @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@
138200       MOVE C-OBJEKT-KA5002       TO H-MELDUNGS-OBJEKT
138300       MOVE C-AKAADI              TO GSTMEL-VAR-TEXT-1
138400       MOVE KAIADI1-FUNKTION      TO H-FUNKTION
138500       MOVE H-FUNKTION-MLD        TO GSTMEL-VAR-TEXT-2
138600       PERFORM MELDUNG-EINTRAGEN
138700       GO TO PROGRAMM-VERLASSEN
138800     END-EVALUATE
138900     .
139000 STEUER-AKAADI-1002.
139100     GO TO PROGRAMM-VERLASSEN.
139200/---------------------------------------------------------------*
139300* Berechtigungsprüfung                                          *
139400*---------------------------------------------------------------*
139500 BERECHTIGUNG SECTION.
139600 BERECHTIGUNG-1001.
139700*
139800*
139900* Pruefen, ob Berechtigung für "Abstimmen" ohne Freigabe vorhanden
140000     MOVE SPACE                   TO GSI4BER-BP-BK-LISTE
140100* Funktion versorgen
140200     MOVE C-FKT-BER-ABST-OHNE-FREI
140300                                  TO GSI4BER-BP-FUNKTION-KURZNAME
140400* Objekt versorgen
140500     MOVE C-OBJEKT-BER-KA-KTOABST TO GSI4BER-BP-BER-OBJ-KURZNAME
140600     MOVE ZERO                    TO GSI4BER-BP-ANZAHL-KRITERIEN
140700* Berechtigung aufrufen
140800     PERFORM CALL-CGSBER
140900*
141000     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
141100     THEN
141200       MOVE C-N                   TO H-BER-ABST-OHNE-FREI
141300     ELSE
141400       MOVE C-J                   TO H-BER-ABST-OHNE-FREI
141500       MOVE C-OBJEKT-KA0000       TO GSOVER-RETURNCODE
141600     END-IF
141700*
141800* Pruefen, ob Berechtigung für "Abstimmen mit direkter Freigabe" vorhanden
141900     MOVE C-FKT-BER-ABST-MIT-FREI TO GSI4BER-BP-FUNKTION-KURZNAME
142000     PERFORM CALL-CGSBER
142100     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
142200     THEN
142300       MOVE C-N                   TO H-BER-ABST-MIT-FREI
142400     ELSE
142500       MOVE C-OBJEKT-KA0000       TO GSOVER-RETURNCODE
142600       MOVE C-J                   TO H-BER-ABST-MIT-FREI
142700     END-IF
142800*
142900* Fehlermeldung, wenn weder die eine, noch die andere Berechtigung vorh.
143000     IF H-BER-ABST-OHNE-FREI      = C-N 
143100        AND
143200        H-BER-ABST-MIT-FREI       = C-N
143300     THEN
143400*      KA4801 Sie haben nicht die erforderliche Berechtigung
143500       MOVE C-OBJEKT-KA4801       TO H-MELDUNGS-OBJEKT
143600       PERFORM MELDUNG-EINTRAGEN
143700       GO TO PROGRAMM-VERLASSEN
143800     END-IF
143900
144000     .
144100 BERECHTIGUNG-1002.
144200     EXIT.
144300/---------------------------------------------------------------*
144400* Berechtigungsprüfung - Aufruf CGSBER                          *
144500*---------------------------------------------------------------*
144600 CALL-CGSBER SECTION.
144700 CALL-CGSBER-1001.
144800*
144900* Berechtigung aufrufen
145000     CALL "CGSBER"
145100     USING C-BER-PRUEFEN
145200           C-KONFIG-ID-KA
145300           C-OBJEKT-BER-USER-BERECHT
145400           GSOVER-VERSTAENDIGUNGSBEREICH
145500           GSI4BER-EINGABEBEREICH
145600           DUMMY
145700           DUMMY
145800*
145900     EVALUATE GSOVER-GEWICHT
146000     WHEN C-GEW-ABBRUCH
146100       GO TO PROGRAMM-VERLASSEN
146200     WHEN C-GEW-FEHLER
146300* Fehler der Gewichtung 4 werden uebernommen und eingetragen
146400       MOVE GSOVER-RETURNCODE     TO H-MELDUNGS-OBJEKT
146500       MOVE GSOVER-TEXTE          TO GSTMEL-TEXTE
146600       PERFORM MELDUNG-EINTRAGEN
146700       GO TO PROGRAMM-VERLASSEN
146800     WHEN OTHER
146900       CONTINUE
147000     END-EVALUATE
147100     .
147200 CALL-CGSBER-1002.
147300     EXIT.
147400/---------------------------------------------------------------*
147500* Verarbeitung Abstimmung im Dialog                             *
147600*---------------------------------------------------------------*
147700 VERARB-ABS-DIA SECTION.
147800 VERARB-ABS-DIA-1001.
147900*
148000*    Lesen der Abstimmpositionen
148100     MOVE ZERO                    TO H-MERK-BETRAGSSUMME
148200     MOVE C-1                     TO H-ZAEHLER-ANZ
148300*
148400     PERFORM UNTIL H-ZAEHLER-ANZ  > KAIADI1-IND-LETZT
148500       PERFORM VERSORGE-DIA-KKA5AP
148600       PERFORM AUFRUF-KKA5AP
148700       PERFORM ERGEBNISSE-DIA-KKA5AP
148800*
148900*      Prüfen der Abstimmposition
149000       EVALUATE TRUE
149100         WHEN H-MERK-STATUS       NOT = C-STATUS-OFFEN
149200*          KA4202 Abstimmposition ist nicht offen
149300           MOVE C-OBJEKT-KA4202   TO H-MELDUNGS-OBJEKT
149400           PERFORM VERSORGE-ZUSATZTEXT-KA420X
149500           PERFORM MELDUNG-EINTRAGEN
149600           GO TO PROGRAMM-VERLASSEN
149700         WHEN OTHER
149800           CONTINUE
149900       END-EVALUATE
150000*
150100       ADD C-1                    TO H-ZAEHLER-ANZ
150200     END-PERFORM
150300*
150400*    zulässige Differenz aus Tabex bestimmen
150500     PERFORM ERMITTELN-DIFF
150600*    wenn Betragssumme < zulässige Differenz
150700     MOVE H-MERK-BETRAGSSUMME     TO H-MERK-ABSOLUTBETRAG
150800     IF H-MERK-ABSOLUTBETRAG      <= H-MERK-DIFF-TOLERIERT
150900     THEN
151000*      Schließungssatz anlegen
151100       MOVE ZERO                  TO H-MERK-SCHLIESSUNGSNUMMER
151200       MOVE C-SCHLIESSART-MANUELL TO H-MERK-SCHLIESSUNGSART
151900       MOVE KAIADI1-BEMERKUNG     TO H-MERK-SCHLIESSUNG-BEMERK
152000       MOVE C-01-INT-ANL-SCH      TO KAI4SL1-FUNKTION
             MOVE C-GELDKTO-UMSATZ-ABSTIMM                              E01
                                        TO KAI4SL1-AKTUELLE-ABSTIMM-ART E01
152100       PERFORM VERSORGE-KKA4SL-FINAL
152200       PERFORM AUFRUF-KKA4SL
152300*
152400*      alle APOs mit Schließnummer versorgen
152500       MOVE C-1                   TO H-ZAEHLER-ANZ
152600       PERFORM UNTIL H-ZAEHLER-ANZ > KAIADI1-IND-LETZT
152700         PERFORM VERSORGE-DIA-KKA4AP
152800         PERFORM AUFRUF-KKA4AP
152900         ADD C-1                  TO H-ZAEHLER-ANZ
153000       END-PERFORM
153100*
153200*      wenn Betragssumme <> 0, Ausgleichspostionen anlegen
153300       IF H-MERK-BETRAGSSUMME     <> 0
153400       THEN
153500*
153600*        ---------- Ausgleichsposition geschlossen
153700*        Eingabebereich versorgen
153800         MOVE C-SCHLIESSART-MANUELL
153900                                  TO H-MERK-SCHLIESSUNGSART
154000         PERFORM VERSORGE-1-KKA4AP-ANL
154100         PERFORM AUFRUF-KKA4AP-ANL
154200*
154300*        ---------- Ausgleichsposition offen
154400*        hier nur mehr abweichende Eingabeparameter versorgt
154500         PERFORM VERSORGE-2-KKA4AP-ANL
154600         PERFORM AUFRUF-KKA4AP-ANL
154700       END-IF
154800     ELSE
154900*      KA4203 Toleranz überschritten, Soll: @@@@@@@@@@@@@@@@
155000*             Ist: @@@@@@@@@@@@@@@@
155100       MOVE C-OBJEKT-KA4203       TO H-MELDUNGS-OBJEKT
155200       MOVE H-MERK-DIFF-TOLERIERT TO H-DIFFERENZ-ABDRUCKBAR
155300       MOVE H-DIFFERENZ-ABDRUCKBAR
155400                                  TO GSTMEL-VAR-TEXT-1
155500       MOVE H-MERK-ABSOLUTBETRAG  TO H-DIFFERENZ-ABDRUCKBAR
155600       MOVE H-DIFFERENZ-ABDRUCKBAR
155700                                  TO GSTMEL-VAR-TEXT-2
155800       PERFORM MELDUNG-EINTRAGEN
155900       GO TO PROGRAMM-VERLASSEN
156000     END-IF
156100*
156200     PERFORM ANLEGEN-JOURNAL
156250*
156251     IF H-MERK-SCHLIESSUNG-STATUS = C-STATUS-FREIZUGEBEN          D01
156252     THEN                                                         D01
156253*      KA2854 Die Schließung wurde angelegt - Freigabe notwendig  D01
156254       MOVE C-OBJEKT-KA2854       TO H-MELDUNGS-OBJEKT            D01
156255       PERFORM MELDUNG-EINTRAGEN                                  D01
156256     ELSE                                                         D01
156300*      KA2850 Die Schließung wurde angelegt - Freigabe nicht notw.D01
156400       MOVE C-OBJEKT-KA2850         TO H-MELDUNGS-OBJEKT          D01
156500       PERFORM MELDUNG-EINTRAGEN                                  D01
156550     END-IF                                                       D01
156600     .
156700 VERARB-ABS-DIA-1002.
156800     EXIT.
156900/---------------------------------------------------------------*
157000* Aufruf des Auftrags KKA5AP pro Abstimmposition                *
157100*---------------------------------------------------------------*
157200 AUFRUF-KKA5AP SECTION.
157300 AUFRUF-KKA5AP-1001.
157400*
157500*    Auftrag aufrufen
157600     CALL "CGSAUF"
157700     USING C-AUF-AUFRUF-AL
157800           C-KONFIG-ID-KA
157900           C-OBJEKT-AUF-KKA5AP
158000           GSOVER-VERSTAENDIGUNGSBEREICH
158100           KAI5AP1-EINGABEBEREICH
158200           AUSGABEBEREICH-KKA5AP
158300*
158400     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
158500     THEN
158600       GO TO PROGRAMM-VERLASSEN
158700     END-IF
158800     .
158900 AUFRUF-KKA5AP-1002.
159000     EXIT.
159100/---------------------------------------------------------------*
159200* Aufruf des Auftrags KKA4AP (pro Abstimmposition)              *
159300* Abstimmposition Ändern                                        *
159400*---------------------------------------------------------------*
159500 AUFRUF-KKA4AP SECTION.
159600 AUFRUF-KKA4AP-1001.
159700*
159800*      Auftrag aufrufen
159900       CALL "CGSAUF"
160000       USING C-AUF-AUFRUF-AL
160100             C-KONFIG-ID-KA
160200             C-OBJEKT-AUF-KKA4AP
160300             GSOVER-VERSTAENDIGUNGSBEREICH
160400             EINGABEBEREICH-KKA4AP
160500             DUMMY
160600             DUMMY
160700             KAXIND-INDICES
160800*
160900       IF GSOVER-GEWICHT          NOT = C-GEW-NICHT-GESETZT
161000       THEN
161100         GO TO PROGRAMM-VERLASSEN
161200       END-IF
161300     .
161400 AUFRUF-KKA4AP-1002.
161500     EXIT.
161600/---------------------------------------------------------------*
161700* Aufruf des Auftrags KKA4AP zu Anlage von Ausgleichspositionen *
161800*---------------------------------------------------------------*
161900 AUFRUF-KKA4AP-ANL SECTION.
162000 AUFRUF-KKA4AP-ANL-1001.
162100*
162200     MOVE C-01-INT-ANL-APO        TO KAI4AP1-FUNKTION
162300*    Auftrag aufrufen
162400     CALL "CGSAUF"
162500     USING C-AUF-AUFRUF-AL
162600           C-KONFIG-ID-KA
162700           C-OBJEKT-AUF-KKA4AP
162800           GSOVER-VERSTAENDIGUNGSBEREICH
162900           KAI4AP1-EINGABEBEREICH
163000           DUMMY
163100           DUMMY
163200           KAXIND-INDICES
163300*
163400     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
163500     THEN
163600*      KA5007 (DB-Fehler)
163700       MOVE C-OBJEKT-KA5007       TO H-MELDUNGS-OBJEKT
163800       PERFORM MELDUNG-EINTRAGEN
163900       GO TO PROGRAMM-VERLASSEN
164000     END-IF
164100*
164200     .
164300 AUFRUF-KKA4AP-ANL-1002.
164400     EXIT.
164500/---------------------------------------------------------------*
164600* Aufruf des Auftrags KKA4SL                                    *
164700*---------------------------------------------------------------*
164800 AUFRUF-KKA4SL SECTION.
164900 AUFRUF-KKA4SL-1001.
165000*    Auftrag aufrufen
165100     CALL "CGSAUF"
165200     USING C-AUF-AUFRUF-AL
165300           C-KONFIG-ID-KA
165400           C-OBJEKT-AUF-KKA4SL
165500           GSOVER-VERSTAENDIGUNGSBEREICH
165600           KAI4SL1-EINGABEBEREICH
165700           KAO4SL1-AUSGABEBEREICH
165800           DUMMY
165900           KAXIND-INDICES
166000*
166100     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
166200     THEN
166300       GO TO PROGRAMM-VERLASSEN
166400     ELSE
166500       MOVE KAO4SL1-SCHLIESSUNGSNR
166600                                  TO H-MERK-SCHLIESSUNGSNUMMER
166700     END-IF
166800     .
166900 AUFRUF-KKA4SL-1002.
167000     EXIT.
167100/---------------------------------------------------------------*
167200* neue (maximale) Folgenummer bestimmen                         *
167300*---------------------------------------------------------------*
167400 MAX-FNR SECTION.
167500 MAX-FNR-1001.
167600*
167700     MOVE C-01-INT-LES-MAX-FNR    TO KAI5APM-FUNKTION
167800     MOVE H-MERK-AK-NR            TO KAI5APM-ABSTIMMKREIS-NR
167900     MOVE H-MERK-HERKUNFT-INTERN  TO KAI5APM-HERKUNFT
168000     MOVE H-MERK-KONTO-ID-INTERN  TO KAI5APM-KONTO-ID-ABSTIMM
168100     MOVE H-MERK-BUCHUNGSDATUM    TO KAI5APM-AUSZUGSDATUM
168200*
168300     CALL "CGSAUF"
168400     USING C-AUF-AUFRUF-AL
168500           C-KONFIG-ID-KA
168600           C-OBJEKT-AUF-KKA5AP
168700           GSOVER-VERSTAENDIGUNGSBEREICH
168800           KAI5APM-EINGABEBEREICH
168900           KAO5APM-AUSGABEBEREICH
169000           DUMMY
169100           DUMMY
169200           DUMMY
169300     END-CALL
169400*
169500     IF GSOVER-GEWICHT            < C-GEW-FEHLER
169600     THEN
169700*      Erhöhe die Folgenummer für Ausgleichsposten
169800       ADD C-1                    TO KAO5APM-MAX-FOLGE-NR
169900                                  GIVING H-MERK-NEUE-FOLGENUMMER
170000         ON SIZE ERROR
170100*          KA4114: Überlauf Folgenummer bei Abstimmkr./Konto
170200*                  @@@@@/@@@@@@@@@@@@@@@@@@@@
170300           MOVE C-OBJEKT-KA4114   TO H-MELDUNGS-OBJEKT
170400           MOVE H-MERK-AK-NR      TO GSTMEL-VAR-TEXT-1
170500           MOVE H-MERK-KONTO-ID-INTERN(1:20)
170600                                  TO GSTMEL-VAR-TEXT-2
170700           PERFORM MELDUNG-EINTRAGEN
170800           GO TO PROGRAMM-VERLASSEN
170900       END-ADD
171000     ELSE
171100       GO TO PROGRAMM-VERLASSEN
171200     END-IF
171300     .
171400 MAX-FNR-1002.
171500     EXIT.
171600/---------------------------------------------------------------*
171700* Programminitialisierung                                       *
171800*---------------------------------------------------------------*
171900 INITIALISIERUNG SECTION.
172000 INITIALISIERUNG-1001.
172100     INITIALIZE                   GSTMEL-TRANSIENTER-BEREICH
172200     MOVE SPACE                   TO H-FUNKTION
172300     MOVE FUNCTION CURRENT-DATE   TO H-TIMESTAMP-FIELDS
172400*
172500     PERFORM LESEN-ANMELDEDATEN
172600     .
172700 INITIALISIERUNG-1002.
172800     EXIT.
172900/---------------------------------------------------------------*
173000* Ermitteln zulässige Differenz aus TABEX (KA000AKRS)           *
173100*---------------------------------------------------------------*
173200 ERMITTELN-DIFF SECTION.
173300 ERMITTELN-DIFF-1001.
173400* Ermitteln Parameterwerte zum Abstimmkreis                       E01
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO KAI0AKR-ABSTIMM-ART         E01
173500     MOVE H-MERK-AK-NR             TO KAI0AKR-AK-NUMMER
173600     CALL "CGSTAB"
173700     USING
173800       C-TAB-LESEN-EQUAL
173900       C-KONFIG-ID-KA
174000       C-OBJEKT-TAB-KA01AKRS                                      E01
174100       GSOVER-VERSTAENDIGUNGSBEREICH
174200       KAI0AKR-EINGABEBEREICH
174300       KAO0AKR-AUSGABEBEREICH
174400       GSTTAB-EIN-AUSGABEBEREICH
174500*
174600     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
174700     THEN
174800* KA5003 @@@@@@@@: Fehler bei Tabellenzugriff @@@@@@@@@:
174900       MOVE C-OBJEKT-KA5003       TO H-MELDUNGS-OBJEKT
175000       MOVE C-AKAADI              TO GSTMEL-VAR-TEXT-1
175100       MOVE C-OBJEKT-TAB-KA01AKRS TO GSTMEL-VAR-TEXT-2            E01
175200       PERFORM MELDUNG-EINTRAGEN
175300       GO TO PROGRAMM-VERLASSEN
175400     ELSE
175500       MOVE KAO0AKR-WAEHRUNG-AK   TO H-MERK-WAEHRUNG
175600       MOVE KAO0AKR-DIFF-TOLER-MANU
175700                                  TO H-MERK-DIFF-TOLERIERT
175800       MOVE C-OBJEKT-KA0000       TO GSOVER-RETURNCODE
175900     END-IF
176000     .
176100 ERMITTELN-DIFF-1002.
176200     EXIT
176300     .
176400/---------------------------------------------------------------*
176500* internes Konto eines Abstimmkreises ermitteln                 *
176600*---------------------------------------------------------------*
176700 KONTO-INTERN SECTION.
176800 KONTO-INTERN-1001.
176900*
173400* Ermitteln Parameterwerte zum Abstimm-Konto                      E01
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO KAI0AKK-ABSTIMM-ART         E01
177000     MOVE H-MERK-AK-NR             TO  KAI0AKK-AK-NUMMER
177100     MOVE C-INTERN                 TO  KAI0AKK-ROLLE-KONTO
177200*
177300     CALL "CGSTAB"
177400     USING C-TAB-LESEN-EQUAL
177500           C-KONFIG-ID-KA
177600           C-OBJEKT-TAB-AKKTO
177700           GSOVER-VERSTAENDIGUNGSBEREICH
177800           KAI0AKK-EINGABEBEREICH
177900           KAO0AKK-AUSGABEBEREICH
178000           GSTTAB-EIN-AUSGABEBEREICH
178100     END-CALL
178200*
178300     EVALUATE GSOVER-GEWICHT
178400       WHEN C-GEW-NICHT-GESETZT
178500         MOVE KAO0AKK-KONTO-ID    TO H-MERK-KONTO-ID-INTERN
178600         MOVE KAO0AKK-HERKUNFT    TO H-MERK-HERKUNFT-INTERN
178700       WHEN C-GEW-ZUSTAND
178800*        KA4101 Abstimmkreis in der Parametertabelle nicht vorhanden
178900         MOVE C-OBJEKT-KA4101     TO H-MELDUNGS-OBJEKT
179000         PERFORM MELDUNG-EINTRAGEN
179100         GO TO PROGRAMM-VERLASSEN
179200       WHEN C-GEW-ABBRUCH
179300         GO TO PROGRAMM-VERLASSEN
179400       WHEN OTHER
179500         CONTINUE
179600     END-EVALUATE
179700     .
179800 KONTO-INTERN-1002.
179900     EXIT
180000     .
180100/-----------------------------------------------------------*
180200* Anlegen Jounal                                            *
180300*-----------------------------------------------------------*
180400 ANLEGEN-JOURNAL SECTION.
180500 ANLEGEN-JOURNAL-1001.
180600*
180700* Herkunftskennzeichen für KJD100 ermitteln
180800     CALL "CJDWRTE"
180900     USING C-FUNKTION-HERK-LIEFERN
181000           C-KONFIG-ID-KA
181100           C-OBJEKT-ESA-JD
181200           GSOVER-VERSTAENDIGUNGSBEREICH
181300           DUMMY
181400           JDOWRTI-AUSGABEBEREICH
181500           DUMMY
181600     IF GSOVER-GEWICHT            > C-GEW-NICHT-GESETZT
181700     THEN
181800* Meldung bereits eingetragen
181900       GO TO PROGRAMM-VERLASSEN
182000     END-IF
182100*
182200*    Protokollgrund
182300     MOVE C-PROT-EINGABE        TO JDI100-PROTOKOLLGRUND
182400     MOVE C-GV-KASCHLAN         TO JDI100-GV
182500     MOVE KAIADI1-BEMERKUNG (1:60)
182600       TO JDI100-BEMERKUNG1
182700*    GV-spezifische Verarbeitung
182800     MOVE ZERO                  TO H-IND
182900     ADD C-1                    TO H-IND
183000     MOVE C-FELD-KA000002       TO JDAENES-AEND-FELD(H-IND)
183100     MOVE C-AKTION-NEU
183200       TO JDAENES-AEND-FELDINHALT-NEU(H-IND)
183300*
183400* Eingabebereich versorgen
183500     MOVE H-IND                   TO JDI100-ANZAHL-AEN-INF
183600     MOVE C-VERARB-KZ-1           TO JDI100-VERARB-KZ
183700     MOVE JDOWRTI-HERKUNFT        TO JDI100-HERKUNFTS-KZ
183800     MOVE GSO1ANM-GV-DATUM        TO JDI100-DATUM-EINGABE
183900     MOVE C-PROT-LAUFNUMMER       TO JDI100-PROT-LAUFNUMMER
184000     MOVE C-ZUGRIFFSSCHUTZ        TO JDI100-ZUGRIFFSSCHUTZ
184100     MOVE C-0000                  TO JDI100-OBG-EINGABE
184200     MOVE C-0000                  TO JDI100-OBG-BESTAND
184300     MOVE C-0000                  TO JDI100-OBG-FREIGABE
184400     MOVE C-GV-VERSION            TO JDI100-GV-VERSION
184500* Zugriffskriterium SCHLIESSUNGSNUMMER
184600     MOVE H-MERK-SCHLIESSUNGSNUMMER
184700                                  TO H-ZUGRIFFSKRITERIUM
184800     MOVE H-ZUGRIFFSKRITERIUM     TO JDI100-ZUGRIFFSKRITERIUM
184900* Wirksam ab/bis
185000     MOVE GSO1ANM-QUELLE-DATUM    TO JDI100-DATUM-WIRKSAM-VON
185100     MOVE C-99991231              TO JDI100-DATUM-WIRKSAM-BIS
185200     CALL "CGSAUF"
185300     USING C-AUF-AUFRUF-AL
185400           C-KONFIG-ID-GS
185500           C-OBJEKT-KJD100
185600           GSOVER-VERSTAENDIGUNGSBEREICH
185700           JDI100-EINGABEBEREICH
185800           JDO100-AUSGABEBEREICH
185900           CJDIND-INDICES
186000           AENDERUNGEN
186100     IF GSOVER-GEWICHT            > C-GEW-WARNUNG
186200     THEN
186300* Meldung bereits eingetragen
186400       GO TO PROGRAMM-VERLASSEN
186500     END-IF
186600     MOVE C-OBJEKT-KA0000         TO GSOVER-RETURNCODE
186700     .
186800 ANLEGEN-JOURNAL-1002.
186900     EXIT
187000     .
187100/---------------------------------------------------------------*
187200* VERARB-IMP-ANF                                                *
187300* Anlage einer neuen Schliessungsnummer im Lauf des Massen-     *
187400* imports von Abstimmpositionen (Batch)                         *
187500*---------------------------------------------------------------*
187600 VERARB-IMP-ANF SECTION.
187700 VERARB-IMP-ANF-1001.
187800*
187900*    initialen Schließungssatz anlegen
188000     MOVE ZERO                    TO H-MERK-SCHLIESSUNGSNUMMER
188100     MOVE C-SCHLIESSART-IMPORT    TO H-MERK-SCHLIESSUNGSART
188200     PERFORM VERSORGE-KKA4SL-INITIAL
188300     PERFORM AUFRUF-KKA4SL
188400*
188500*    Die Schließung wurde angelegt
188600     MOVE KAO4SL1-SCHLIESSUNGSNR  TO KAOADI1-SCHLIESSUNGSNUMMER
188700     .
188800 VERARB-IMP-ANF-1002.
188900     EXIT.
189000/---------------------------------------------------------------*
189100* VERARB-IMP-APO                                                *
189200* Schließen der angegebenen Abstimmposition mit der angegebenen *
189300* Schliessungsnummer; falls die angegebene Abstimmposition nicht*
189400* (mehr) "offen" sein sollte oder einen anderen als den angege- *
189500* benen Betrag aufweisen sollte, wird eine entsprechende Fehler-*
189600* meldung eingetragen.                                           *
189700*---------------------------------------------------------------*
189800 VERARB-IMP-APO SECTION.
189900 VERARB-IMP-APO-1001.
190000*
190100*    Lesen der Abstimmposition
190200     PERFORM VERSORGE-IMP-KKA5AP
190300     PERFORM AUFRUF-KKA5AP
190400     PERFORM ERGEBNISSE-IMP-KKA5AP
190500*
190600*    Prüfen der Abstimmposition
190700     EVALUATE TRUE
190800       WHEN H-MERK-STATUS         NOT = C-STATUS-OFFEN
190900*        KA4202 Abstimmposition ist nicht offen
191000         MOVE C-OBJEKT-KA4202     TO H-MELDUNGS-OBJEKT
191100         PERFORM VERSORGE-ZUSATZTEXT-KA420X
191200         PERFORM MELDUNG-EINTRAGEN
191300         GO TO PROGRAMM-VERLASSEN
191400       WHEN H-MERK-BETRAGSSUMME    NOT = KAIADI3-BETRAG
191500*        KA4206 abweichender Betrag
191600         MOVE C-OBJEKT-KA4206     TO H-MELDUNGS-OBJEKT
191700         PERFORM VERSORGE-ZUSATZTEXT-KA420X
191800         PERFORM MELDUNG-EINTRAGEN
191900         GO TO PROGRAMM-VERLASSEN
192000       WHEN OTHER
192100         CONTINUE
192200     END-EVALUATE
192300*
192400*    Schließen der Abstimmposition
192500     PERFORM VERSORGE-IMP-KKA4AP
192600     PERFORM AUFRUF-KKA4AP
192700     .
192800 VERARB-IMP-APO-1002.
192900     EXIT.
193000/---------------------------------------------------------------*
193100* VERARB-IMP-END                                                *
193200* Update der neuen Schliessungsnummer im Lauf des Massen-       *
193300* imports von Abstimmpositionen (Batch) und Überprüfung, ob die *
193400* Toleranzgrenze eingehalten wurde; falls ja werden ggfs. auch  *
193500* die erforderlichen Ausgleichspositionen erzeugt.              *
193600*---------------------------------------------------------------*
193700 VERARB-IMP-END SECTION.
193800 VERARB-IMP-END-1001.
193900*
194000     PERFORM ERMITTELN-DIFF
194100*    wenn Betragssumme < zulässige Differenz
194200     MOVE KAIADI4-TATSAECHLICHE-DIFF
194300                                  TO H-MERK-BETRAGSSUMME
194400     MOVE H-MERK-BETRAGSSUMME     TO H-MERK-ABSOLUTBETRAG
194500     IF H-MERK-ABSOLUTBETRAG      <= H-MERK-DIFF-TOLERIERT
194600     THEN
194700*      Schließungssatz aktualisieren
194800       MOVE KAIADI4-SCHLIESSUNGSNUMMER
194900                                  TO H-MERK-SCHLIESSUNGSNUMMER
195000       MOVE C-SCHLIESSART-IMPORT  TO H-MERK-SCHLIESSUNGSART
195200       MOVE SPACE                 TO H-MERK-SCHLIESSUNG-BEMERK
195300       MOVE C-01-INT-AEN-SCH-IMP  TO KAI4SL1-FUNKTION
             MOVE C-GELDKTO-UMSATZ-ABSTIMM                              E01
                                        TO KAI4SL1-AKTUELLE-ABSTIMM-ART E01
195400       PERFORM VERSORGE-KKA4SL-FINAL
195500       PERFORM AUFRUF-KKA4SL
195600*
195700*      wenn Betragssumme <> 0, Ausgleichspostionen anlegen
195800       IF H-MERK-BETRAGSSUMME     NOT = ZERO
195900       THEN
196000*        ---------- Ausgleichsposition geschlossen
196100*        Eingabebereich versorgen
196200         PERFORM VERSORGE-1-KKA4AP-ANL
196300         PERFORM AUFRUF-KKA4AP-ANL
196400*
196500*        ---------- Ausgleichsposition offen
196600*        hier nur mehr abweichende Eingabeparameter versorgt
196700         PERFORM VERSORGE-2-KKA4AP-ANL
196800         PERFORM AUFRUF-KKA4AP-ANL
196900       END-IF
197000     ELSE
197100*      KA4203 Toleranz überschritten, Soll: @@@@@@@@@@@@@@@@
197200*             Ist: @@@@@@@@@@@@@@@@
197300       MOVE C-OBJEKT-KA4203       TO H-MELDUNGS-OBJEKT
197400       MOVE H-MERK-DIFF-TOLERIERT TO H-DIFFERENZ-ABDRUCKBAR
197500       MOVE H-DIFFERENZ-ABDRUCKBAR
197600                                  TO GSTMEL-VAR-TEXT-1
197700       MOVE H-MERK-ABSOLUTBETRAG  TO H-DIFFERENZ-ABDRUCKBAR
197800       MOVE H-DIFFERENZ-ABDRUCKBAR
197900                                  TO GSTMEL-VAR-TEXT-2
198000       PERFORM MELDUNG-EINTRAGEN
198100       GO TO PROGRAMM-VERLASSEN
198200     END-IF
198300     .
198400 VERARB-IMP-END-1002.
198500     EXIT.
198600/---------------------------------------------------------------*
198700* VERSORGE-1-KKA4AP-ANL                                         *
198800* Versorgt die Eingabedaten für das Anlegen einer geschlossenen *
198900* Ausgleichsposition.                                           *
199000*---------------------------------------------------------------*
199100 VERSORGE-1-KKA4AP-ANL SECTION.
199200 VERSORGE-1-KKA4AP-ANL-1001.
199300*
199400*    --- PK
199500     MOVE H-MERK-AK-NR            TO KAI4AP1-APO-ABSTIMMKREIS-NR
199600*    KONTO-ID = internes Konto des Abstimmkreises
199700     PERFORM KONTO-INTERN
199800     MOVE H-MERK-KONTO-ID-INTERN  TO KAI4AP1-APO-KONTO-ID-ABSTIMM
199900     MOVE H-MERK-HERKUNFT-INTERN  TO KAI4AP1-APO-HERKUNFT
200000*    Buchungsdatum in Auszugsdatum
200100     MOVE H-MERK-BUCHUNGSDATUM    TO KAI4AP1-APO-AUSZUGSDATUM
200200     MOVE ZERO                    TO KAI4AP1-APO-AUSZUGSNUMMER
200300*
200400*    höchste Folgenummer ermitteln
200500     PERFORM MAX-FNR
200600     MOVE H-MERK-NEUE-FOLGENUMMER TO KAI4AP1-APO-AUSZUG-FNR
200700*
200800     MOVE C-1                     TO KAI4AP1-APO-LFD-NR-APO
200900*    --- Transaktionsdaten
201000     MOVE C-NACHRICHTYP-AUSGL     TO
201100                                  KAI4AP1-APO-APO-NACHRICHTENTYP
201200     COMPUTE KAI4AP1-APO-BETRAG   = H-MERK-BETRAGSSUMME
201300                                    * C-MINUS-1
201400       ON SIZE ERROR
201500         CONTINUE
201600     END-COMPUTE
201700     MOVE H-MERK-WAEHRUNG         TO KAI4AP1-APO-WAEHRUNG
201800     MOVE H-MERK-BUCHUNGSDATUM    TO KAI4AP1-APO-BUTAG
201900                                     KAI4AP1-APO-VALUTA
202000     MOVE C-TXT-SL-9900           TO KAI4AP1-APO-ZUSATZ-TXT-SL
202100*    --- Verwaltungsdaten
202200     MOVE H-MERK-SCHLIESSUNG-STATUS
202300                                  TO KAI4AP1-APO-STATUS
202400     MOVE H-MERK-SCHLIESSUNGSNUMMER
202500                                  TO KAI4AP1-APO-SCHLIESSUNGSNR
202600     MOVE H-MERK-SCHLIESSUNGSART  TO KAI4AP1-APO-SCHLIESSUNGSART
202700*    KAI4AP1-APO-FACHBEREICH wird aus letzter APO übernommen
202800     MOVE C-BEMERK-GESCHL         TO KAI4AP1-APO-BEMERKUNG
202900     MOVE H-MERK-ABSOLUTBETRAG    TO KAI4AP1-APO-BETRAG-ABSOLUT
203000     MOVE H-DH-TIMESTAMP          TO KAI4AP1-APO-TIMESTAMP-ANL
203100                                    KAI4AP1-APO-TIMESTAMP-SCHLIESS
203200     MOVE GSO1ANM-BENUTZERIDENTIFIKATION
203300                                  TO KAI4AP1-APO-USER-SCHLIESS
203400*
203500*    KAI4AP1-APO-ABSTIMMKREIS-TYP wird aus letzter APO übernommen
203600     MOVE SPACE                   TO KAI4AP1-APO-REF-NACHRICHT
203700                                    KAI4AP1-APO-TRANSAKTION-TYP
203800                                    KAI4AP1-APO-REF-KONTOFUEHRER
203900                                    KAI4AP1-APO-REF-KONTOINH
204000                                    KAI4AP1-APO-ERG-TEXT
204100                                    KAI4AP1-APO-STORNO-KZ
204200                                    KAI4AP1-APO-TRANSAKTION-ID
204300                                    KAI4AP1-APO-TRANSAKTION-ID-FS
204400                                    KAI4AP1-APO-ISIN
204500                                    KAI4AP1-APO-GEGEN-KONTO-ID
204600                                    KAI4AP1-APO-REMOTE-KONTO-ID
204700                                    KAI4AP1-APO-KONTO-ID-ORIG
204800                                    KAI4AP1-APO-VERWENDUNGSZWECK
204900
205000                                    KAI4AP1-APO-TIMESTAMP-FREI
205100                                    KAI4AP1-APO-USER-FREI
205200                                    KAI4AP1-APO-TIMESTAMP-ABLEHN
205300                                    KAI4AP1-APO-USER-ABLEHN
205400                                    KAI4AP1-APO-TIMESTAMP-AUFHEBEN
205500                                    KAI4AP1-APO-USER-AUFHEBEN
205600*
205700     MOVE ZERO                    TO KAI4AP1-APO-GV-CODE
205800                                     KAI4AP1-APO-PRIMANOTA
205900                                     KAI4AP1-APO-NENNWERT
206000                                     KAI4AP1-APO-DATEINR
206100     .
206200 VERSORGE-1-KKA4AP-ANL-1002.
206300     EXIT.
206400/---------------------------------------------------------------*
206500* VERSORGE-2-KKA4AP-ANL                                         *
206600* Versorgt die Eingabedaten für das Anlegen einer offenen       *
206700* Ausgleichsposition.                                           *
206800* (hier nur mehr abweichende Eingabeparameter versorgt)         *
206900*---------------------------------------------------------------*
207000 VERSORGE-2-KKA4AP-ANL SECTION.
207100 VERSORGE-2-KKA4AP-ANL-1001.
207200*
207300     MOVE C-2                     TO KAI4AP1-APO-LFD-NR-APO
207400*    --- Transaktionsdaten
207500     MOVE H-MERK-BETRAGSSUMME     TO KAI4AP1-APO-BETRAG
207600*    --- Verwaltungsdaten
207700     MOVE C-STATUS-OFFEN          TO KAI4AP1-APO-STATUS
207800     MOVE ZERO                    TO KAI4AP1-APO-SCHLIESSUNGSNR
207900     MOVE SPACE                   TO KAI4AP1-APO-SCHLIESSUNGSART
208000     MOVE C-BEMERK-OFFEN          TO KAI4AP1-APO-BEMERKUNG
208100     MOVE SPACE                   TO KAI4AP1-APO-USER-SCHLIESS
208200                                    KAI4AP1-APO-TIMESTAMP-SCHLIESS
208300     .
208400 VERSORGE-2-KKA4AP-ANL-1002.
208500     EXIT.
208600/---------------------------------------------------------------*
208700* VERSORGE-KKA4SL-INITIAL                                       *
208800* Versorgt die Eingabedaten für das Anlegen einer neuen         *
208900* Schliessung mit minimalen Parametern.                         *
209000*---------------------------------------------------------------*
209100 VERSORGE-KKA4SL-INITIAL SECTION.
209200 VERSORGE-KKA4SL-INITIAL-1001.
209300*
209400     MOVE HIGH-VALUE               TO KAI4SL1-EINGABEBEREICH
209500     MOVE C-01-INT-ANL-SCH         TO KAI4SL1-FUNKTION
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO                             E01  
                                         KAI4SL1-AKTUELLE-ABSTIMM-ART   E01
209600     MOVE H-MERK-SCHLIESSUNGSNUMMER
209700                                   TO KAI4SL1-SCHLIESSUNGSNR
209800     MOVE H-MERK-SCHLIESSUNGSART   TO KAI4SL1-SCHLIESSUNGSART
209900     MOVE SPACE                    TO KAI4SL1-SCHLIESSUNG-BEMERK
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO KAI4SL1-ABSTIMM-ART         E01
           MOVE C-SCHLIESSQUALI-GU       TO KAI4SL1-SCHLIESSUNGSQUALI   E01
210000     MOVE H-DH-TIMESTAMP           TO KAI4SL1-TIMESTAMP-SCHLIESS
210100     MOVE GSO1ANM-BENUTZERIDENTIFIKATION
210200                                   TO KAI4SL1-USER-SCHLIESS
210300     MOVE SPACE                    TO KAI4SL1-TIMESTAMP-FREI
210400                                      KAI4SL1-USER-FREI
210500                                      KAI4SL1-TIMESTAMP-ABL-AUFH
210600                                      KAI4SL1-USER-ABL-AUFH
210700     .
210800 VERSORGE-KKA4SL-INITIAL-1002.
210900     EXIT.
211000/---------------------------------------------------------------*
211100* VERSORGE-KKA4SL-FINAL                                         *
211200* Versorgt die Eingabedaten für das Aktualisieren einer neuen   *
211300* Schliessung.                                                  *
211400*---------------------------------------------------------------*
211500 VERSORGE-KKA4SL-FINAL SECTION.
211600 VERSORGE-KKA4SL-FINAL-1001.
211700*
211800     MOVE H-MERK-SCHLIESSUNGSNUMMER
211900                                   TO KAI4SL1-SCHLIESSUNGSNR
212000     MOVE H-MERK-AK-NR             TO KAI4SL1-ABSTIMMKREIS-NR
212100     MOVE H-MERK-SCHLIESSUNGSART   TO KAI4SL1-SCHLIESSUNGSART
212200     MOVE ZERO                     TO KAI4SL1-SCHLIESSREGEL-NR
212300     MOVE H-MERK-SCHLIESSUNG-STATUS
212400                                   TO KAI4SL1-STATUS
212500     MOVE H-MERK-DIFF-TOLERIERT    TO KAI4SL1-DIFF-ZULAESSIG
212600     MOVE H-MERK-BETRAGSSUMME      TO KAI4SL1-DIFF-TATSAECHL
212700     MOVE H-MERK-SCHLIESSUNG-BEMERK
212800                                   TO KAI4SL1-SCHLIESSUNG-BEMERK
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO KAI4SL1-ABSTIMM-ART         E01
           MOVE C-SCHLIESSQUALI-GU       TO KAI4SL1-SCHLIESSUNGSQUALI   E01
212900     MOVE H-DH-TIMESTAMP           TO KAI4SL1-TIMESTAMP-SCHLIESS
213000     MOVE GSO1ANM-BENUTZERIDENTIFIKATION
213100                                   TO KAI4SL1-USER-SCHLIESS
213200     MOVE SPACE                    TO KAI4SL1-TIMESTAMP-FREI
213300                                      KAI4SL1-USER-FREI
213400                                      KAI4SL1-TIMESTAMP-ABL-AUFH
213500                                      KAI4SL1-USER-ABL-AUFH
213600     .
213700 VERSORGE-KKA4SL-FINAL-1002.
213800     EXIT.
213900/---------------------------------------------------------------*
214000* VERSORGE-DIA-KKA4AP                                           *
214100* Versorgt die Eingabeparameter im Dialogfall für KKA4AP        *
214200*---------------------------------------------------------------*
214300 VERSORGE-DIA-KKA4AP SECTION.
214400 VERSORGE-DIA-KKA4AP-1001.
214500*
214600     MOVE C-01-INT-AEN-APO-UCHK   TO KAI4AP1-FUNKTION
214700     MOVE KAHADI-KAHADI-KAAPO-TAB (H-ZAEHLER-ANZ)
214800                                  TO KAI4AP1-KAAPO-GESAMT
214900     MOVE H-MERK-SCHLIESSUNG-STATUS
215000                                  TO KAI4AP1-APO-STATUS
215100     MOVE H-MERK-SCHLIESSUNGSNUMMER
215200                                  TO KAI4AP1-APO-SCHLIESSUNGSNR
215300     MOVE C-SCHLIESSART-MANUELL   TO KAI4AP1-APO-SCHLIESSUNGSART
215400     MOVE H-DH-TIMESTAMP          TO
215500                                  KAI4AP1-APO-TIMESTAMP-SCHLIESS
215600     MOVE GSO1ANM-BENUTZERIDENTIFIKATION
215700                                  TO KAI4AP1-APO-USER-SCHLIESS
215800     .
215900 VERSORGE-DIA-KKA4AP-1002.
216000     EXIT.
216100/---------------------------------------------------------------*
216200* VERSORGE-IMP-KKA4AP                                           *
216300* Versorgt die Eingabeparameter bei IMPORT für KKA4AP           *
216400*---------------------------------------------------------------*
216500 VERSORGE-IMP-KKA4AP SECTION.
216600 VERSORGE-IMP-KKA4AP-1001.
216700*
216800     MOVE C-01-INT-AEN-APO-SCHL-1 TO KAI4AP2-FUNKTION
216900     MOVE KAIADI3-ABSTIMMKREIS-NR TO KAI4AP2-ABSTIMMKREIS-NR
217000     MOVE KAIADI3-HERKUNFT        TO KAI4AP2-HERKUNFT
217100     MOVE KAIADI3-KONTO-ID-ABSTIMM
217200                                  TO KAI4AP2-KONTO-ID-ABSTIMM
217300     MOVE KAIADI3-AUSZUGSDATUM    TO KAI4AP2-AUSZUGSDATUM
217400     MOVE KAIADI3-AUSZUGSNUMMER   TO KAI4AP2-AUSZUGSNUMMER
217500     MOVE KAIADI3-AUSZUG-FNR      TO KAI4AP2-AUSZUG-FNR
217600     MOVE KAIADI3-LFD-NR-APO      TO KAI4AP2-LFD-NR-APO
217700     MOVE H-MERK-SCHLIESSUNG-STATUS                               D01
217750                                  TO KAI4AP2-STATUS               D01
217800     MOVE KAIADI3-SCHLIESSUNGSNUMMER
217900                                  TO KAI4AP2-SCHLIESSUNGSNR
218000     MOVE C-SCHLIESSART-IMPORT    TO KAI4AP2-SCHLIESSUNGSART
218100     MOVE H-DH-TIMESTAMP          TO KAI4AP2-TIMESTAMP
218200     MOVE GSO1ANM-BENUTZERIDENTIFIKATION
218300                                  TO KAI4AP2-USER
218400     .
218500 VERSORGE-IMP-KKA4AP-1002.
218600     EXIT.
218700/---------------------------------------------------------------*
218800* VERSORGE-DIA-KKA5AP                                           *
218900* Versorgt die Eingabeparameter im Dialogfall für KKA5AP        *
219000*---------------------------------------------------------------*
219100 VERSORGE-DIA-KKA5AP SECTION.
219200 VERSORGE-DIA-KKA5AP-1001.
219300*
219400     MOVE C-01-INT-LES-APO-DETAIL TO KAI5AP1-FUNKTION
219500     MOVE KAIADI1-PK-SATZ (H-ZAEHLER-ANZ)
219600                                  TO KAI5AP1-APO-PK
219700     .
219800 VERSORGE-DIA-KKA5AP-1002.
219900     EXIT.
220000/---------------------------------------------------------------*
220100* VERSORGE-IMP-KKA5AP                                           *
220200* Versorgt die Eingabeparameter bei IMPORT für KKA5AP           *
220300*---------------------------------------------------------------*
220400 VERSORGE-IMP-KKA5AP SECTION.
220500 VERSORGE-IMP-KKA5AP-1001.
220600*
220700     MOVE C-01-INT-LES-APO-ABST-D TO KAI5AP1-FUNKTION
220800     MOVE KAIADI3-ABSTIMMKREIS-NR TO KAI5AP1-ABSTIMMKREIS-NR
220900     MOVE KAIADI3-HERKUNFT        TO KAI5AP1-HERKUNFT
221000     MOVE KAIADI3-KONTO-ID-ABSTIMM
221100                                  TO KAI5AP1-KONTO-ID-ABSTIMM
221200     MOVE KAIADI3-AUSZUGSDATUM    TO KAI5AP1-AUSZUGSDATUM
221300     MOVE KAIADI3-AUSZUGSNUMMER   TO KAI5AP1-AUSZUGSNUMMER
221400     MOVE KAIADI3-AUSZUG-FNR      TO KAI5AP1-AUSZUG-FNR
221500     MOVE KAIADI3-LFD-NR-APO      TO KAI5AP1-LFD-NR-APO
221600     .
221700 VERSORGE-IMP-KKA5AP-1002.
221800     EXIT.
221900/---------------------------------------------------------------*
222000* ERGEBNISSE-DIA-KKA5AP                                         *
222100* Versorgt die Ausgabeparameter im Dialog nach Auftrag KKA5AP   *
222200*---------------------------------------------------------------*
222300 ERGEBNISSE-DIA-KKA5AP SECTION.
222400 ERGEBNISSE-DIA-KKA5AP-1001.
222500*
222600     MOVE H-MERK-AK-NR            TO H-MERK-AK-NR-ALT
222700     MOVE KAO5AP1-APO-ABSTIMMKREIS-NR
222800                                  TO H-MERK-AK-NR
222900*
223000*    Prüfung, ob Abstimmkreis wechselt
223100     IF H-ZAEHLER-ANZ             > C-1
223200        AND H-MERK-AK-NR          NOT = H-MERK-AK-NR-ALT
223300     THEN
223400*      KA4201 abweichender Abstimmkreis:
223500       MOVE C-OBJEKT-KA4201       TO H-MELDUNGS-OBJEKT
223600       PERFORM VERSORGE-ZUSATZTEXT-KA420X
223700       PERFORM MELDUNG-EINTRAGEN
223800       GO TO PROGRAMM-VERLASSEN
223900     END-IF
224000*
224100     MOVE KAO5AP1-APO-HERKUNFT    TO H-MERK-HERKUNFT
224200     MOVE KAO5AP1-APO-KONTO-ID-ABSTIMM
224300                                  TO H-MERK-KONTO-ID
224400     MOVE KAO5AP1-APO-AUSZUGSDATUM
224500                                  TO H-MERK-AUSZUGSDATUM
224600     MOVE KAO5AP1-APO-AUSZUGSNUMMER
224700                                  TO H-MERK-AUSZUGSNUMMER
224800     MOVE KAO5AP1-APO-AUSZUG-FNR  TO H-MERK-AUSZUG-FNR
224900     MOVE KAO5AP1-APO-LFD-NR-APO  TO H-MERK-LFD-NR-APO
225000*
225100*    Betrag aufsummieren
225200     COMPUTE
225300       H-MERK-BETRAGSSUMME =
225400       H-MERK-BETRAGSSUMME + KAO5AP1-APO-BETRAG
225500       ON SIZE ERROR
225600*        KA4205 Überlauf bei Summierung
225700*               der Abstimmpositionsbeträge
225800         MOVE C-OBJEKT-KA4205     TO H-MELDUNGS-OBJEKT
225900         PERFORM MELDUNG-EINTRAGEN
226000         GO TO PROGRAMM-VERLASSEN
226100     END-COMPUTE
226200*
226300     MOVE KAO5AP1-APO-WAEHRUNG    TO H-MERK-WAEHRUNG
226400     MOVE KAO5AP1-APO-STATUS      TO H-MERK-STATUS
226500*
226600     MOVE KAO5AP1-AUSGABEBEREICH  TO KAHADI-KAHADI-KAAPO-TAB
226700                                     (H-ZAEHLER-ANZ)
226800     .
226900 ERGEBNISSE-DIA-KKA5AP-1002.
227000     EXIT.
227100/---------------------------------------------------------------*
227200* ERGEBNISSE-IMP-KKA5AP                                         *
227300* Versorgt die Ausgabeparameter bei IMPORT nach Auftrag KKA5AP  *
227400*---------------------------------------------------------------*
227500 ERGEBNISSE-IMP-KKA5AP SECTION.
227600 ERGEBNISSE-IMP-KKA5AP-1001.
227700*
227800     MOVE KAO5AP2-APO-ABSTIMMKREIS-NR
227900                                  TO H-MERK-AK-NR
228000     MOVE KAO5AP2-APO-HERKUNFT    TO H-MERK-HERKUNFT
228100     MOVE KAO5AP2-APO-KONTO-ID-ABSTIMM
228200                                  TO H-MERK-KONTO-ID
228300     MOVE KAO5AP2-APO-AUSZUGSDATUM
228400                                  TO H-MERK-AUSZUGSDATUM
228500     MOVE KAO5AP2-APO-AUSZUGSNUMMER
228600                                  TO H-MERK-AUSZUGSNUMMER
228700     MOVE KAO5AP2-APO-AUSZUG-FNR  TO H-MERK-AUSZUG-FNR
228800     MOVE KAO5AP2-APO-LFD-NR-APO  TO H-MERK-LFD-NR-APO
228900*
229000     MOVE KAO5AP2-APO-BETRAG      TO H-MERK-BETRAGSSUMME
229100                                     KAOADI2-APO-BETRAG
229200     MOVE KAO5AP2-APO-WAE-BETRAG  TO H-MERK-WAEHRUNG
229300                                     KAOADI2-APO-WAE-BETRAG
229400     MOVE KAO5AP2-APO-STATUS      TO H-MERK-STATUS
229500     .
229600 ERGEBNISSE-IMP-KKA5AP-1002.
229700     EXIT.
229800/---------------------------------------------------------------*
229900* VERSORGE-ZUSATZTEXT-KA420X                                    *
230000* Versorgt den Zusatztext für die Meldungen KA4201 und KA4202   *
230100*---------------------------------------------------------------*
230200 VERSORGE-ZUSATZTEXT-KA420X SECTION.
230300 VERSORGE-ZUSATZTEXT-KA420X-1001.
230400*
230500     MOVE H-MERK-AK-NR            TO KA420X-AK-NR
230600     MOVE H-MERK-KONTO-ID         TO KA420X-KONTO-ID
230700     MOVE H-MERK-AUSZUGSDATUM     TO KA420X-AUSZUG-DATUM
230800     MOVE H-MERK-AUSZUGSNUMMER    TO KA420X-AUSZUG-NR
230900     MOVE H-MERK-AUSZUG-FNR       TO KA420X-FOLGENUMMER
231000     MOVE H-MERK-LFD-NR-APO       TO KA420X-TRANSAKT-LFD-NR
231100     MOVE C-ZUSATZTEXT-KA420X     TO GSTMEL-ZUSATZTEXT
231200     MOVE C-LAENGE-ZUSATZTEXT-KA420X
231300                                  TO GSTMEL-ZUSATZTEXT-LAENGE
231400     .
231500 VERSORGE-ZUSATZTEXT-KA420X-1002.
231600     EXIT.
231700/---------------------------------------------------------------*
231800* Meldung eintragen                                             *
231900*---------------------------------------------------------------*
232000 MELDUNG-EINTRAGEN SECTION.
232100 MELDUNG-EINTRAGEN-1001.
232200     CALL "CGSMEL"
232300     USING C-MEL-EINTRAGEN
232400           C-KONFIG-ID-KA
232500           H-MELDUNGS-OBJEKT
232600           GSOVER-VERSTAENDIGUNGSBEREICH
232700           DUMMY
232800           GSOMEL-AUSGABEBEREICH
232900           GSTMEL-TRANSIENTER-BEREICH
233000     END-CALL
233100*
233200     IF GSOVER-GEWICHT            > C-GEW-FEHLER
233300     THEN
233400       GO TO PROGRAMM-VERLASSEN
233500     ELSE
233600       MOVE H-MELDUNGS-OBJEKT     TO GSOVER-RETURNCODE
233700     END-IF
233800     .
233900 MELDUNG-EINTRAGEN-1002.
234000     EXIT.
234100/-----------------------------------------------------------*
234200* ANMELDEDATEN LESEN                                        *
234300*-----------------------------------------------------------*
234400 LESEN-ANMELDEDATEN SECTION.
234500 LESEN-ANMELDEDATEN-1001.
234600     CALL "CGSTAB"
234700     USING
234800       C-TAB-ANM-DAT-LESEN
234900       C-KONFIG-ID-GS
235000       C-OBJEKT-TAB-ANMELDEDATEN
235100       GSOVER-VERSTAENDIGUNGSBEREICH
235200       DUMMY
235300       GSO1ANM-AUSGABEBEREICH
235400       GSTTAB-EIN-AUSGABEBEREICH
235500*
235600     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
235700     THEN
235800* KA5003 @@@@@@@@: Fehler bei Tabellenzugriff @@@@@@@@@:
235900       MOVE C-OBJEKT-KA5003       TO H-MELDUNGS-OBJEKT
236000       MOVE C-AKAADI              TO GSTMEL-VAR-TEXT-1
236100       MOVE C-OBJEKT-TAB-ANMELDEDATEN
236200                                  TO GSTMEL-VAR-TEXT-2
236300       PERFORM MELDUNG-EINTRAGEN
236400       GO TO PROGRAMM-VERLASSEN
236500     ELSE
236600       MOVE C-OBJEKT-KA0000       TO GSOVER-RETURNCODE
236700       MOVE GSO1ANM-QUELLE-DATUM  TO H-MERK-BUCHUNGSDATUM
236800     END-IF
236900     .
237000 LESEN-ANMELDEDATEN-1002.
237100     EXIT
237200     .
237300/---------------------------------------------------------------*
237400* Verlassen des Programms ueber einen Ausstiegspunkt            *
237500*---------------------------------------------------------------*
237600 PROGRAMM-VERLASSEN SECTION.
237700 PROGRAMM-VERLASSEN-1001.
237800     EXIT PROGRAM.
237900 PROGRAMM-VERLASSEN-1002.
238000     EXIT.


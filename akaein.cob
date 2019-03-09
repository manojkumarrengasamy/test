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
000160*@Titel         : Kontoabstimmung Einspeicherung
000160*@Elementname   : akaein.cob
000160*@Elementtyp    : cob
000160*@Version       : k162-00001
000160*@Cr_Date       : 20160607.122816
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
001000*@Title        : Kontoabstimmung Einspeicherung             *
001100* Verfasser    : Michael Benko, AtoS Graz                   *
001200* Erstelldatum : 27.02.2012                                 *
001400*                                                           *
001500*@A-ELEMENTBESCHREIBUNG                                     *
001600* Modul-Beschreibung:                                       *
001700* ------------------                                        *
001800* Der KORDOBA Auftrag stellt die Funktionen fuer            *
001900* - Verarbeitung eines Transaktionssatzes und               *
002000* - Verarbeitung am Ende des Übernahmelaufs                 *
002100* bereit.                                                   *
002200*                                                           *
002300*@E-ELEMENTBESCHREIBUNG                                     *
002400*                                                           *
002500*@A-FUNKTION-1                                              *
002600* Verarbeitung eines Transaktionssatzes                     *
002700*                                                           *
002800* Eingabefeldbelegungen:                                    *
002900* Funktion "01-INT-VERARB-TRANS"                            *
003000*                                                           *
003100*@E-FUNKTION-1                                              *
003200*                                                           *
003300*@A-FUNKTION-2                                              *
003400* Verarbeitung am Ende des Übernahmelaufes                  *
003500*                                                           *
003600* Eingabefeldbelegungen:                                    *
003700* Funktion "01-INT-UEBERNAHME-ENDE"                         *
003800* Aktualisierung der Statuseinträge in den                  *
003900* Daten-Verwaltungssätzen                                   *
004000*                                                           *
004100*@E-FUNKTION-2                                              *
004200*                                                           *
004300*@A-MODULAUFRUF                                             *
004400* Aufruf-Beispiel:                                          *
004500*                                                           *
004600* Aufrufparameter: 1. Funktion               (I)            *
004700*                  2. Konfigurations-Id      (I)            *
004800*                  3. Objekt                 (I)            *
004900*                  4. Verstaendigungsbereich (O)            *
005000*                  5. Eingabebereich         (I)            *
005100*                  6. Ausgabebereich         (O)            *
005200*                  7. Transientbereich       (I/O)          *
005300*                                                           *
005350* Aufruf-Beispiel (Fuer Funktion 1) "01-INT-VERARB-TRANS"   *     D02
005400* CALL "CGSAUF"                                             *
005500* USING C-AUF-AUFRUF-AL                                     *
005600*       C-KONFIG-ID-KA                                      *
005700*       C-OBJEKT-AUFTRAG-AKAEIN                             *
005800*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *
005900*       KAIEIN1-EINGABEBEREICH                              *     D02
006000*       KAOEIN1-AUSGABEBEREICH                              *     D02
006100*       KATEIN1-TRANSIENT-BEREICH                           *     D02
006200*                                                           *     D02
006250* Aufruf-Beispiel (Fuer Funktion 2) "01-INT-UEBERNAHME-ENDE *     D02
006251* CALL "CGSAUF"                                             *     D02
006252* USING C-AUF-AUFRUF-AL                                     *     D02
006253*       C-KONFIG-ID-KA                                      *     D02
006254*       C-OBJEKT-AUFTRAG-AKAEIN                             *     D02
006255*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *     D02
006256*       DUMMY                                               *     D02
006257*       KAOEIN2-AUSGABEBEREICH                              *     D02
006258*       DUMMY                                               *     D02
006259*                                                           *     D02
006300*@E-MODULAUFRUF                                             *
006400*                                                           *
006500*@A-RETURNCODE                                              *
006600* Meldungen/Returncodes:                                    *
006700* ----------------------                                    *
006800*                                                           *
006900* Folgende Fehlermeldungen werden von diesem KORDOBA-Auftrag*
007000* zureckgegeben bzw. in den Meldungs-Pool eingetragen:      *
007100* KA0000 : Verarbeitung erfolgreich durchgeführt            *
007150* KA3082 : TSA-Satz von Übernahme in APO-Bestand            *     D05
007151*          ausgeschlossen: BuDat <= Mig-Dat                 *     D05
007152* KA4007 : Gelieferter Endsaldo stimmt nicht mit Kontosaldo *     D05
007153*          überein                                          *     D05
007200* KA4207 Tabelle @@@@@@@@@@ enthält keinen passenden Eintrag*
007300* KA5002 @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@ *
007400* alle Meldungen der gerufenen Aufträge                     *
007500*                                                           *
007600*@E-RETURNCODE                                              *
007700*                                                           *
007800*@A-ENTRY                                                   *
007900* Entryname       : AKAEIN                                  *
008000*                                                           *
008100*@E-ENTRY                                                   *
008200*                                                           *
008300*@A-MODUL                                                   *
008400* Gerufene Moduln/Auftraege:                                *
008500*       CGSDZS   Datenzugriffsschicht                       *     D02
008600*       CGSMEL   Meldungsschnittstelle                      *     D02
008700*       CGSTAB   TABEX-Schnittstelle                        *     D02
008750*                                                           *     D02
008751*       MGSEBIC  Ermitteln eigene BIC                       *     D06
008760*       KKA4KT - Auftrag Pflege KA-Konto-Bestand            *     D02
008761*       KKA5KT - Lesen KA-Konto-Bestand                     *     D02
008762*       KKA4AP - Auftrag Pflege KA-Abstimmpos.-Bestand      *     D02
008765*       KKA4TS - Auftrag Pflege KA-TSA-Bestand              *     D02
008766*       KKA5TS - Lesen KA-TSA-Bestand                       *     D02
008767*       KKA4DA - Auftrag Pflege KA-Dateiverwalt-Bestand     *     D02
008768*       KKA5DA - Lesen KA-Dateiverwaltungs-Bestand          *     D02
008800*                                                           *
008900*@E-MODUL                                                   *
009000*                                                           *
009100*@A-COBOL-COPY                                              *
009200* Benoetigte Cobol-Copies:                                  *
009300* CGSI0MEL: Eingabebereich Meldungstabelle                  *
009400* CGSO0MEL: Ausgabebereich Meldungstabelle                  *
009500* CGSOMEL : Ausgabebereich Meldungsschnittstelle            *
009600* CGSTMEL : transienter Bereich Meldungsschnittstelle       *
009700* CGSOVER : Verstaendigungsbereich                          *
009800* CGSTTAB : transienter Bereich Zugriff Parametertabellen   *
009900* CGSO0ANM: Copy fuer taskspez. Anmeldedaten                *
009950* CGSIBIC : Eingabebereich MGSEBIC                          *     D06
009951* CGSOBIC : Ausgabebereich MGSEBIC                          *     D06
010000* CKAIEIN1: Eingabebereich AKAEIN-1                         *     D02
010050* CKAIEIN2: Eingabebereich AKAEIN-2                         *     D02
010100* CKAOEIN1: Ausgabebereich AKAEIN                           *
010200* CKAOEIN2: Ausgabebereich AKAEIN                           *
010300* CKATEIN1: transienter Bereich AKAEIN                      *
010400* CKAI4AP1: Eingabebereich KKA4AP                           *
010500* CKAI4KT1: Eingabebereich KKA4KT                           *
010600* CKAO4KT1: Ausgabebereich KKA4KT                           *
010700* CKAI5KT1: Eingabebereich KKA5KT                           *
010800* CKAO5KT1: Ausgabebereich KKA5KT                           *   
010850* CKAI4DA1: Eingabebereich KKA4DA                           *     D02
010851* CKAI5DA2: Eingabebereich KKA5DA                           *     D02
010852* CKAO5DA2: Ausngabebereich KKA5DA                          *     D02
010853* CKAT5DA1: Transienter-Bereich 1 KKA5DA                    *     D02
010860* CKAI5TS4: Eingabebereich KKA5TS                           *     D02
010861* CKAO5TS3: Ausngabebereich KKA5TS                          *     D02
010900* CKAI1AKK: Eingabebereich Sekundärkey zu Tab. KA000AKKTO   *     
011000* CKAO0AKK: Ausgabebereich zu Tab. KA000AKKTO               *
011100* CKAI0AKR: Eingabebereich Primärkey zu Tab. KA000AKKRS     *
011200* CKAO0AKR: Ausgabebereich zu Tab. KA000AKKRS               *
011300* CKAI0AKF: Eingabebereich Primärkey zu Tab. KA000AKFB      *
011400* CKAO0AKF: Ausgabebereich zu Tab. KA000AKFB                *
011500* DCTGRCGE: Meldungsgewichte                                *
011600*                                                           *
011700*@E-COBOL-COPY                                              *
011800*                                                           *
011900*@A-TABELLE                                                 *
012000* TABEX-Tabellen  : KA000AKRS.tuf                           *
012100*                   KA000AKFB.tuf                           *
012200*@E-TABELLE                                                 *
012300*                                                           *
012400*@A-BENUTZERSATZ                                            *
012500* Benutzersaetze  : <benutzersatz> (I/O/IO)                 *
012600* keine                                                     *
012700*                                                           *
012800*@E-BENUTZERSATZ                                            *
012900*                                                           *
013000*@A-DATEI                                                   *
013100* Dateien         : entfallen                               *
013200*                                                           *
013300*@E-DATEI                                                   *
013400*                                                           *
013500*@A-KONVENTIONEN                                            *
013600*@E-KONVENTIONEN                                            *
013700*                                                           *
013800*@A-DOKUMENT                                                *
013900* Die fachliche Beschreibung ist im Dokument                *
014000* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *
014100* hinterlegt.                                               *
014200*                                                           *
014300*@E-DOKUMENT                                                *
014400*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
090051* D01 R46827                                                *     D01
090052*     Auszug-/Folgenr.                                      *     D01
090053*     XREF : NEU / AKAEIN / COB                             *     D01
090054*     Datum: 19.06.2012                            NKZ: BEN *     D01
090055*                                                           *     D02
090061* D02 R49037                                                *     D02
090062*    -Die Analsyse zur Meldung R49037 hat ergeben, dass     *     D02
090064*     die im DVG vorgesehene AKAEIN-Funktion                *     D02
090065*     "INT-UEBERNAHME-ENDE", für die Statuspflege der       *     D02
090066*     Dateiverwaltungssätze (KA_TABLE_DAT) nicht            *     D02
090067*     implementiert wurde.                                  *     D02
090068*    -Laut DVG müsste SKAEIN am Ende des Übernahmelaufes    *     D02
090069*     diese Funktion rufen. Die Statuspflege der            *     D02
090070*     Dateiverwaltungssätze ist Voraussetzung für           *     D02
090071*     Reorganisation des Transaktionssammelbestandes        *     D02
090072*     (KA_TABLE_TSA) über den Batch SKARE2.                 *     D02
090073*    -Nachimplementierung diverser Funktionen, neue         *     D02
090074*     Schnittstellencopies, Anpassungen in diversen         *     D02
090075*     Elementen. (Siehe XREF beim Ticket):                  *     D02
090076*                                                           *     D02
090077*     Datum: 07.08.2012                            NKZ: SUM *     D02
090078*                                                           *     D02
090080* D03 R51580                                                *     D03
090081*     - Korrektur Prüfverhalten:                            *     D03
090082*       Berücksichtigung des vom SKAVOR im TSA-Satz         *     D03
090083*       (Feld VERARB-FKT-DETAIL) hinterlegten Prüf-Flags.   *     D03
090084*     Datum: 09.10.2012                            NKZ: SUM *     D03
090085*                                                           *     D03
090090* D04 R52939 -                                              *     D04
090091*     (Prüfung Auszugsdatum - Auszugsnummer -Folgenummer)   *     D04
090092*     - Wenn eine Nachricht mit einer neuen (der nächsten)  *     D04
090093*       Auszugsnummer. kommt, muss die Folgenummer = 1 sein.*     D04
090094*     - Korrektur der Prüfung des Auszugsdatum auf          *     D04
090095*       Jahreswechsel.                                      *     D04
090096*     Datum: 13.11.2012                            NKZ: SUM *     D04
090100*                                                           *     D04
090150* D05  R53383 (HPQC 8709)                                   *     D05
090151*   - Unterschiedliche Behandlung der Buchungen mit         *     D05
090152*     a) Buchungsdatum <= GO-LIVE-Datum                     *     D05
090153*        (Sätze nicht in APO-Bestand übernehmen,            *     D05
090154*         Sonderroutinen bei Prüfen/Update der KA_TABLE_KTO)*     D05
090155*     b) Buchungsdatum > GO-LIVE-Datum                      *     D05
090156*        (Sätze in APO-Bestand übernehmen ...)              *     D05
090157*     Datum: 24.11.2012                        NKZ: TRO/SUM *     D05
090158*                                                           *     D05
090159* D06  R53775 (HPQC 8799)                                   *     D06
090160*   - Die Prüfung, ob ein TSA-Satz u.a. wegen dem           *     D06
090161*     Buchungsdatum von der Übernahme in den APO-Bestand    *     D06
090162*     auszuschließen ist, wurde um Zusatzkriterien erweitert*     D06
090163*   - Zur Ermittlung ob die Nachricht aus KOR-MIT stammt,   *     D06
090164*     wird die eigene BIC über CGSEBIC ermittelt. Diese BIC *     D06
090165*     wird gegen die BIC im Attribut HERKUNFT verglichen.   *     D06
090166*   - Neuer Schalterwert F-KTO-INITIALISIERT f. Saldoprüfung*     D06
090167*     (Posten aus Migration müssen immer akzeptiert werden).*     D06
090168*     Datum: 05.12.2012                           NKZ: SUM  *     D06
090169*                                                           *     D06
090170* D07  R53775 (HPQC 8799) - Zusätzliche Anpassung           *     D07
090171*     Auflösung der Local-Storage mit Übernahme der darin   *     D07
090172*     definierten Hilfsfelder in die Working Storage.       *     D07
090173*     Datum: 05.12.2012                           NKZ: SUM  *     D07
090174*                                                           *     D07
090175* D08  R53937                                               *     D08
090176*     Ausbau der Abfrage auf CSOVER-Returncode KA4069 nach  *     D08
090177*     KKA5DA-Aufruf zum Suchen von Dateiverwaltungssätzen.  *     D08
090178*     Datum: 07.12.2012                           NKZ: SUM  *     D08
090179*                                                           *     D08
      * E01 R77134                                                *     E01
      *     Erweiterungen wegen Projekt WP-Stückeabstimmung       *     E01
      *     (bzgl. KA000AKKTO und KA000AKRS).                     *     E01
      *     Datum: 08.12.2014                            NKZ: SUM *     E01
      *                                                           *     E01
      * D09 R91742                                                *     D09
      *      Fixing truncation issue                              *     D09
      *                                                           *     D09
      *     Datum: 03.06.2016                            NKZ: KAL *     D09
      *                                                           *     D09
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/
100200 IDENTIFICATION DIVISION.
100300 PROGRAM-ID. AKAEIN.
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
101550     05  FILLER PIC X(13) VALUE "ELEM=akaein  ".                  CCC
101551     05  FILLER PIC X(15) VALUE "VERS=k162-00001".                CCC
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
103150    05 C-OBJEKT-KA3082            PIC X(006) VALUE "KA3082".      D05
103200    05 C-OBJEKT-KA4002            PIC X(006) VALUE "KA4002".
103300    05 C-OBJEKT-KA4003            PIC X(006) VALUE "KA4003".
103400    05 C-OBJEKT-KA4005            PIC X(006) VALUE "KA4005".
103450    05 C-OBJEKT-KA4007            PIC X(006) VALUE "KA4007".      D05
103500    05 C-OBJEKT-KA4068            PIC X(006) VALUE "KA4068".
103600    05 C-OBJEKT-KA4207            PIC X(006) VALUE "KA4207".
103700    05 C-OBJEKT-KA5002            PIC X(006) VALUE "KA5002".
103800/---------------------------------------------------------------*
103900* Lokale Konstante fuer KORDOBA-Auftrag AKAEIN                  *
104000*---------------------------------------------------------------*
104100 01 KONSTANTE-AKAEIN.
104200    05 C-01-INT-VERARB-TRANS      PIC X(040) VALUE
104300                                  "01-INT-VERARB-TRANS".
104400    05 C-01-INT-UEBERNAHME-ENDE   PIC X(040) VALUE
104500                                  "01-INT-UEBERNAHME-ENDE".
104600    05 C-KONFIG-ID-KA             PIC X(002) VALUE "KA".
104700    05 C-KONFIG-ID-GS             PIC X(002) VALUE "GS".
104800    05 C-AUF-AUFRUF-AL            PIC X(040) VALUE "AUFRUF-AL".
104900    05 C-AKAEIN                   PIC X(008) VALUE "AKAEIN".
105000    05 C-1                        PIC 9(001) VALUE 1.
105100    05 C-4                        PIC 9(001) VALUE 4.
105150    05 C-100                      PIC 9(003) VALUE 100.           D02
105200    05 C-A                        PIC X(001) VALUE "A".
105300    05 C-E                        PIC X(001) VALUE "E".
105400    05 C-J                        PIC X(001) VALUE "J".
105500    05 C-P                        PIC X(001) VAlUE "P".           D02
105600    05 C-T                        PIC X(001) VAlUE "T".           D02
105650    05 C-N                        PIC X(001) VALUE "N".           D02
105660    05 C-STATUS-TSA-EINGELESEN    PIC X(001) VALUE "0".           D02
105661    05 C-STATUS-DATEI-VOLLST-UEBERF                               D02
105662                                  PIC X(001) VALUE "V".           D02
105663    05 C-STATUS-DATEI-UNV-UEBERF  PIC X(001) VALUE "U".           D02
105664    05 C-MIT-PRUEFUNG             PIC X(002) VALUE "MP".          D03
105665    05 C-OHNE-PRUEFUNG            PIC X(002) VALUE "OP".          D03
          05 C-GELDKTO-UMSATZ-ABSTIMM   PIC X(002) VALUE "GU".          E01
105668    05 C-TYP-MIGRATION            PIC X(020) VALUE "MIGRATION".   D06
105670    05 C-99999999                 PIC 9(008) VALUE 99999999.      D02
105671    05 C-999999999999             PIC 9(012) VALUE 999999999999.  D02
105700    05 C-NULL                     PIC X(001) VAlue "0".
105800 01 C-STATI.
105900    05 C-STATUS-OFFEN             PIC 9(001) VALUE 2.
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
107100     05 C-OBJEKT-TAB-ANMELDEDATEN PIC X(020) VALUE "ANMELDEDATEN".
107200     05 C-TAB-LESEN-EQUAL         PIC X(040) VALUE "LESEN-EQUAL".
107300     05 C-TAB-ANM-DAT-LESEN       PIC X(040) VALUE
107400                                  "ANM-DAT-LESEN".
107450     05 C-OBJEKT-TAB-KA01AKRS     PIC X(009) VALUE "KA01AKRS".    E01
107451     05 C-OBJEKT-TAB-KA00AKFB     PIC X(009) VALUE "KA00AKFB".
107452     05 C-OBJEKT-TAB-KA01AKKTO    PIC X(009) VALUE "KA01AKKTO".
107453*                                                                 D06
107500/---------------------------------------------------------------* D06 
107551* Meldungsschnittstelle                                         * D06 
107552*---------------------------------------------------------------* D06 
107553 COPY CGSOMEL.                                                    D06 
107554 COPY CGSTMEL.                                                    D06 
107560/---------------------------------------------------------------* D06 
107561* Anmeldedaten                                                  * D06 
107562*---------------------------------------------------------------* D06 
107563 COPY CGSO0ANM.                                                   D06 
107600/---------------------------------------------------------------* D06 
107650* Tabelle Abstimmkreise                                         * D06 
107651*---------------------------------------------------------------* D06 
107652 COPY CKAI1AKK.                                                   D06 
107653 COPY CKAO0AKK.                                                   D06 
107654 COPY CKAI0AKR.                                                   D06 
107655 COPY CKAO0AKR.                                                   D06 
107656 COPY CKAI0AKF.                                                   D06 
107657 COPY CKAO0AKF.                                                   D06 
107700/---------------------------------------------------------------* D06 
107750* Uebergabeparameter fuer CGSTAB                                * D06 
107751*---------------------------------------------------------------* D06 
107760 COPY CGSTTAB.                                                    D06 
107800*---------------------------------------------------------------* D06 
107850* Schnittstelle MGSEBIC                                         * D06 
107851*---------------------------------------------------------------* D06 
107852 01 MGSEBIC-SCHNITTSTELLE.                                        D06 
107853     05 C-01-STD-PRUEF-EIG-BIC      PIC X(040)                    D06 
107854                                    VALUE "01-STD-PRUEF-EIG-BIC". D06 
107855     05 C-OBJEKT-BIC                PIC X(020) VALUE "BIC".       D06 
107856     05 C-EIGENE-BIC                PIC X(011) VALUE "AAAABBCC".  D06 
107857     05 C-BIC-UNDEF                 PIC X(003) VALUE "XXX".       D06 
107858 COPY CGSIBIC                   REPLACING 01 BY 05,               D06 
107859                                   ==(01)== BY ==(01)==.          D06 
107860 COPY CGSOBIC                   REPLACING 01 BY 05,               D06 
107861                                   ==(01)== BY ==(01)==.          D06 
107900/                                                                     
108000*---------------------------------------------------------------*
108050* Schnittstellenparameter für Auftrag KKA5KT                    *
108051*---------------------------------------------------------------*
108100 01 C-OBJEKT-AUFTRAG-KKA5KT       PIC X(020) VALUE "KKA5KT".
108200 01 C-01-INT-LES-KTO              PIC X(040) VALUE
108300                                  "01-INT-LES-KTO".
108400 COPY CKAI5KT1.
108500 COPY CKAO5KT1.
108600*---------------------------------------------------------------*
108700* Schnittstellenparameter für Auftrag KKA4KT                    *
108800*---------------------------------------------------------------*
108900 01 C-OBJEKT-AUFTRAG-KKA4KT       PIC X(020) VALUE "KKA4KT".
109000 01 C-01-INT-ANL-KTO              PIC X(040) VALUE
109100                                  "01-INT-ANL-KTO".
109200 01 C-01-INT-AEN-KTO              PIC X(040) VALUE
109300                                  "01-INT-AEN-KTO".
109400 COPY CKAI4KT1.
109500 COPY CKAO4KT1.
109600*---------------------------------------------------------------*
109700* Schnittstellenparameter für Auftrag KKA4AP                    *
109800*---------------------------------------------------------------*
109900 01 C-OBJEKT-AUFTRAG-KKA4AP       PIC X(020) VALUE "KKA4AP".
109950 01 C-01-INT-ANL-APO              PIC X(040) VALUE                D02
109951                                  "01-INT-ANL-APO".               D02
109960 COPY CKAI4AP1.                                                   D02
110000*---------------------------------------------------------------* D02
110050* Schnittstellenparameter für Auftrag KKA5DA                    * D02
110051*---------------------------------------------------------------* D02
110052 01 C-OBJEKT-AUFTRAG-KKA5DA       PIC X(020) VALUE "KKA5DA".      D02
110053 01 C-01-INT-LIST-DAT-X           PIC X(040) VALUE                D02
110054                                  "01-INT-LIST-DAT-X".            D02
110055 COPY CKAI5DA2.                                                   D02
110056 COPY CKAO5DA2.                                                   D02
110057 COPY CKAT5DA1.                                                   D02
110100*---------------------------------------------------------------* D02
110150* Schnittstellenparameter für Auftrag KKA4DA                    * D02
110151*---------------------------------------------------------------* D02
110152 01 C-OBJEKT-AUFTRAG-KKA4DA       PIC X(020) VALUE "KKA4DA".      D02
110153 01 C-01-INT-AEN-DAT              PIC X(040) VALUE                D02
110154                                  "01-INT-AEN-DAT".               D02
110155 COPY CKAI4DA1.                                                   D02
110200*---------------------------------------------------------------* D02
110250* Schnittstellenparameter für Auftrag KKA5TS                    * D02
110251*---------------------------------------------------------------* D02
110252 01 C-OBJEKT-AUFTRAG-KKA5TS       PIC X(020) VALUE "KKA5TS".      D02
110253                                                                  D02
110254 01 C-01-INT-COUNT-TSA-STAT       PIC X(040) VALUE                D02
110255                                  "01-INT-COUNT-TSA-STAT".        D02
110256 COPY CKAI5TS4.                                                   D02
110257 COPY CKAO5TS3.                                                   D02
110300*                                                                 D02
110500/---------------------------------------------------------------* D02
110550* Hilfsfelder                                                   * D02
110551*---------------------------------------------------------------* D02
110600 01 HILFSFELDER.
110650*   Transaktionsdaten                                             D02
110700    05 H-AK-NUMMER                PIC 9(005).
110800    05 H-AK-TYP                   PIC X(008).
110900    05 H-AK-FACHBER               PIC X(008).
111000    05 H-AUSZUGNR                 PIC 9(005).
111100    05 H-FOLGENR                  PIC 9(005).
111150    05 H-AUSZUGJAHR               PIC 9(004).                     D02
111151    05 H-EIN-AUSZUGSDATUM-NUM     PIC 9(008).                     D04
111152    05 H-KTO-DATUM-LE-AUSZUG-NUM  PIC 9(008).                     D04
111200*   Zähler                                                        D02
111251    05 H-ANZ-DAT-SAETZE-UPDATE    PIC 9(007).                     D02
111260*   Weitere Hilfsfelder                                           D02
111261    05 H-AKT-DATEINUMMER          PIC 9(012).                     D02
111262    05 H-KZ-FOLGE                 PIC X(001).                     D02
111263    05 H-AKT-SALDO                PIC S9(015)V9(003).             D05
111264    05 DUMMY                      PIC X(001).                     D07
111265*                                                                 D07
111280 01 H-TIMESTAMP-FIELDS.                                           D07
111281     05  H-DH-TIMESTAMP.                                          D07
111282      10  H-CURRENT-YEAR            PIC X(004).                   D07
111283      10  H-CURRENT-MONTH           PIC X(002).                   D07
111284      10  H-CURRENT-DAY             PIC X(002).                   D07
111285      10  H-CURRENT-HOUR            PIC X(002).                   D07
111286      10  H-CURRENT-MINUTE          PIC X(002).                   D07
111287      10  H-CURRENT-SECOND          PIC X(002).                   D07
111288      10  H-CURRENT-MS              PIC X(002).                   D07
111289     05  FILLER                     PIC X(005).                   D07
111290*                                                                 D02
111291 01 H-TIMESTAMP.                                                  D02
111292     05 H-TIMESTAMP-DAT-1-8       PIC 9(008).                     D02
111293     05 H-TIMESTAMP-DAT-9-16      PIC 9(008).                     D02
111294*                                                                 D02
111295 01 H-MELDUNGS-OBJEKT             PIC X(006).                     D07 
111296 01 H-FUNKTION.                                                   D07
111297     05 H-FUNKTION-MLD            PIC X(020).                     D07
111298     05 H-FUNKTION-REST           PIC X(020).                     D07
111300*---------------------------------------------------------------* D02
111350*   INDEX-FELDER                                                * D02
111351*---------------------------------------------------------------* D02
111352 01 INDEX-FELDER.                                                 D02
111353     05 I                              PIC 9(003) PACKED-DECIMAL. D02
111400*---------------------------------------------------------------* D02
111450*  FLAGS - SCHALTER                                             * D02
111451*---------------------------------------------------------------* D02
111452 01 FLAGS.                                                        D02
111453*   Schalter für Update-Steuerung des Datei-Verwaltungs-Bestandes D02
111454    05 F-DAT-BESTAND-UPDATE-SCHALTER   PIC X(001)  VALUE "W".     D02
111455      88 F-DAT-BESTAND-WEITER          VALUE "W".                 D02
111456      88 F-DAT-BESTAND-ENDE            VALUE "E".                 D02
111457*   Schalter für Update-Steuerung des Datei-Verwaltungs-Bestandes D02
111458    05 F-DATEI-UEBERFUEHRUNGS-STATUS   PIC X(001)   VALUE "U".    D02
111459      88 F-DATEI-VOLLST-UEBERFUEHRT    VALUE "V".                 D02
111460      88 F-DATEI-UNVOLLST-UEBERFUEHRT  VALUE "U".                 D02
111461*                                                                 D02
111470*   Schalter für (Prüfungs-) und (Saldenupdate-) Relevanz         D05
111471    05 F-SATZ-RELEVANT                 PIC X(001).                D05
111472      88 F-SATZ-RELEVANT-JA            VALUE "J".                 D05
111473      88 F-SATZ-RELEVANT-NEIN          VALUE "N".                 D05
111474*                                                                 D05
111475    05 F-SALDO-RELEVANT                PIC X(001).                D05
111476      88 F-SALDO-RELEVANT-JA           VALUE "J".                 D05
111477      88 F-SALDO-RELEVANT-NEIN         VALUE "N".                 D05
111480*   Schalter ob eine Prüfung gegen Kto-Tab-Daten vorzunehmen ist  D05
111481    05 F-PRUEFUNG-GEGEN-KTO-TAB-SATZ    PIC X(001).               D05
111482      88 F-KTO-SATZ-PRUEFEN            VALUE "J".                 D05
111483      88 F-KTO-SATZ-NICHT-PRUEFEN      VALUE "N".                 D05
111484*                                                                 D05
111490*   Schalter ob (nach Verarbeitung des Anfangssatzes) ein         D05
111491*   Konto-Satz in der KA_TABLE_KTO vorliegt.                      D05
111492    05 F-KTO-SATZ-EXISTENZ             PIC X(001).                D05
111493      88 F-KTO-SATZ-VORHANDEN          VALUE "V".                 D06
111494      88 F-KTO-SATZ-NICHT-VORHANDEN    VALUE "N".                 D05
111495      88 F-KTO-SATZ-INITIALISIERT      VALUE "I".                 D06
111500                                                                  D06
115800/****************************************************************
115900 LINKAGE SECTION.
116000*****************************************************************
116100*---------------------------------------------------------------*
116200* Funktion                                                      *
116300*---------------------------------------------------------------*
116400 01 AUF-FUNKTION                  PIC X(040).
116500*---------------------------------------------------------------*
116600* Konfigurations-Kennzeichen                                    *
116700*---------------------------------------------------------------*
116800 01 KONFIG-ID                     PIC X(002).
116900*---------------------------------------------------------------*
117000* Auftragsname                                                  *
117100*---------------------------------------------------------------*
117200 01 OBJEKT-AUFTRAGS-ID            PIC X(020).
117300*---------------------------------------------------------------*
117400* VerstAendigungsbereich des Aufrufers                          *
117500*---------------------------------------------------------------*
117600 COPY CGSOVER.
117700*---------------------------------------------------------------*
117800* Eingabebereich fuer den StandAlone-Auftrag AKAEIN             *
117900*---------------------------------------------------------------*
118000 01 LS-EINGABEBEREICH             PIC X(001).                     D02
118050 01 LS-EIN-BER-01                 REDEFINES LS-EINGABEBEREICH.    D02
118051     COPY CKAIEIN1                REPLACING 01 BY 05,             D02
118052                                  ==(01)== BY ==(01)==.           D02
118053 01 LS-EIN-BER-02                 REDEFINES LS-EINGABEBEREICH.    D02
118054     COPY CKAIEIN2                REPLACING 01 BY 05,             D02
118055                                  ==(01)== BY ==(01)==.           D02
118100*---------------------------------------------------------------*
118200* Ausgabebereich fuer den StandAlone-Auftrag AKAEIN             *
118300*---------------------------------------------------------------*
118400 01 LS-AUSGABEBEREICH             PIC X(001).
118500 01 LS-AUS-BER-01                 REDEFINES LS-AUSGABEBEREICH.
118600     COPY CKAOEIN1                REPLACING 01 BY 05,
118700                                  ==(01)== BY ==(01)==.
118800 01 LS-AUS-BER-02                 REDEFINES LS-AUSGABEBEREICH.    D02
118900     COPY CKAOEIN2                REPLACING 01 BY 05,             D02
119000                                  ==(01)== BY ==(01)==.           D02
119100*---------------------------------------------------------------*
119200* Transientbereich im Auftragsformat fuer den Auftrag AKAEIN    * D02
119300*---------------------------------------------------------------*
119400 01 LS-TRANSBEREICH               PIC X(001).                     D02 
119451 01 LS-TRANS-BER-01               REDEFINES LS-TRANSBEREICH.      D02
119452     COPY CKATEIN1                REPLACING 01 BY 05,             D02
119453                                  ==(01)== BY ==(01)==.           D02
119454*
119500/
119600 PROCEDURE DIVISION
119700     USING AUF-FUNKTION
119800           KONFIG-ID
119900           OBJEKT-AUFTRAGS-ID
120000           GSOVER-VERSTAENDIGUNGSBEREICH
120100           LS-EINGABEBEREICH                                      D02
120200           LS-AUSGABEBEREICH
120300           LS-TRANSBEREICH                                        D02
120400           .
120500/---------------------------------------------------------------*
120600* Hier wird die Steuerung des KORDOBA-Auftrags durchgefuehrt    *
120700*---------------------------------------------------------------*
120800 STEUER-AKAEIN SECTION.
120900 STEUER-AKAEIN-1001.
121000     PERFORM INITIALISIERUNG
121100     EVALUATE KAIEIN1-FUNKTION
121200     WHEN C-01-INT-VERARB-TRANS
121250       PERFORM VERARB-TRANS                                       D02
121300     WHEN C-01-INT-UEBERNAHME-ENDE                                D02
121350*      Übernahme-Ende: Abschlussarbeiten.                         D02
121351*      (Aktualisierung der Status Einträge in der KA_TABLE_DAT)   D02
121352       PERFORM UEBERNAHME-ENDE                                    D02
121400     WHEN OTHER                                                   
121500* KA5002: @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@
121600       MOVE C-OBJEKT-KA5002       TO H-MELDUNGS-OBJEKT
121700       MOVE C-AKAEIN              TO GSTMEL-VAR-TEXT-1
121800       MOVE KAIEIN1-FUNKTION      TO H-FUNKTION
121900       MOVE H-FUNKTION-MLD        TO GSTMEL-VAR-TEXT-2
122000       PERFORM MELDUNG-EINTRAGEN
122100       GO TO PROGRAMM-VERLASSEN
122200     END-EVALUATE
122300     .
122400 STEUER-AKAEIN-1002.
122500     GO TO PROGRAMM-VERLASSEN.
122600/---------------------------------------------------------------*
122650* Verarbeitung Transaktionssatz                                 *
122660*---------------------------------------------------------------*
122700 VERARB-TRANS SECTION.
122750 VERARB-TRANS-1001.
122751*
122800*    Flag belegen, ob TSA-Satz für Übernahme in den APO-Bestand   D06
122900*    relevant ist                                                 D06
123000     PERFORM SATZ-RELEVANT-FLAG-BELEG                             D06
123100*                                                                 D06
123200     PERFORM AK-DATEN-ERMITTELN
123300*
123400     PERFORM ANFANGSATZ-BEARB
123500*
123600     PERFORM EINGABE-BELEGEN
123700*
123800     PERFORM AUFRUF-KKA4AP-ANL
123900*
124000     PERFORM ENDESATZ-BEARB
124100     .
124200 VERARB-TRANS-1002.
124300     EXIT.
124400/---------------------------------------------------------------*
124500* Abstimmkreis Daten ermitteln                                  *
124600*---------------------------------------------------------------*
124700 AK-DATEN-ERMITTELN SECTION.
124800 AK-DATEN-ERMITTELN-1001.
124900*
125000* AK-Nummer
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO KAI1AKK-ABSTIMM-ART         E01
125100     MOVE KAIEIN1-HERKUNFT         TO KAI1AKK-HERKUNFT
125200     MOVE KAIEIN1-KONTO-ID         TO KAI1AKK-KONTO-ID
125300*
125400     CALL "CGSTAB"
125500     USING C-TAB-LESEN-EQUAL
125600           C-KONFIG-ID-KA
125700           C-OBJEKT-TAB-KA01AKKTO
125800           GSOVER-VERSTAENDIGUNGSBEREICH
125900           KAI1AKK-EINGABEBEREICH
126000           KAO0AKK-AUSGABEBEREICH
126100           GSTTAB-EIN-AUSGABEBEREICH
126200*    END-CALL
126300*
126400     IF GSOVER-GEWICHT            = C-GEW-NICHT-GESETZT
126500     THEN
126600       MOVE KAO0AKK-AK-NUMMER     TO H-AK-NUMMER
126700     ELSE
126800       IF GSOVER-GEWICHT          = C-GEW-ZUSTAND
126900       THEN
127000*        KA4207: Tabelle @@@@@@@@@@ hat keinen passenden Eintrag
127100         MOVE C-OBJEKT-KA4207     TO H-MELDUNGS-OBJEKT
127200         MOVE C-OBJEKT-TAB-KA01AKKTO
127300                                  TO GSTMEL-VAR-TEXT-1
127400         PERFORM MELDUNG-EINTRAGEN
127500       END-IF
127600       GO TO PROGRAMM-VERLASSEN
127700     END-IF
127800*
      * Ermitteln Parameterwerte zum Abstimmkreis                       E01
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO KAI0AKR-ABSTIMM-ART         E01
128000     MOVE H-AK-NUMMER              TO KAI0AKR-AK-NUMMER
128100*
128200     CALL "CGSTAB"
128300     USING C-TAB-LESEN-EQUAL
128400           C-KONFIG-ID-KA
128500           C-OBJEKT-TAB-KA01AKRS                                  E01
128600           GSOVER-VERSTAENDIGUNGSBEREICH
128700           KAI0AKR-EINGABEBEREICH
128800           KAO0AKR-AUSGABEBEREICH
128900           GSTTAB-EIN-AUSGABEBEREICH
129000     END-CALL
129100*
129200     IF GSOVER-GEWICHT            = C-GEW-NICHT-GESETZT
129300     THEN
129400       MOVE KAO0AKR-AK-TYP        TO H-AK-TYP
129500     ELSE
129600       IF GSOVER-GEWICHT          = C-GEW-ZUSTAND
129700       THEN
129800*        KA4207: Tabelle @@@@@@@@@@ hat keinen passenden Eintrag
129900         MOVE C-OBJEKT-KA4207     TO H-MELDUNGS-OBJEKT
130000         MOVE C-OBJEKT-TAB-KA01AKRS                               E01
130100                                  TO GSTMEL-VAR-TEXT-1
130200         PERFORM MELDUNG-EINTRAGEN
130300       END-IF
130400       GO TO PROGRAMM-VERLASSEN
130500     END-IF
130600*
130700* AK-Fachbereich
130800     MOVE H-AK-TYP                TO KAI0AKF-AK-TYP
130900     MOVE KAIEIN1-ZUSATZTEXT-SL   TO KAI0AKF-ZUSATZ-TEXT-SL
131000     MOVE ZERO                    TO KAI0AKF-PRIMANOTA
131100*
131200     PERFORM AUFRUF-KA00AKFB
131300*
131400     IF GSOVER-GEWICHT            = C-GEW-NICHT-GESETZT
131500     THEN
131600       MOVE KAO0AKF-FACHBEREICH   TO H-AK-FACHBER
131700     ELSE
131800       IF GSOVER-GEWICHT          = C-GEW-ZUSTAND
131900       THEN 
132000         MOVE H-AK-TYP            TO KAI0AKF-AK-TYP
132100         MOVE ZERO                TO KAI0AKF-ZUSATZ-TEXT-SL
132200         MOVE KAIEIN1-PRIMANOTA   TO KAI0AKF-PRIMANOTA
132300*
132400         PERFORM AUFRUF-KA00AKFB
132500*
132600         IF GSOVER-GEWICHT        = C-GEW-NICHT-GESETZT
132700         THEN
132800           MOVE KAO0AKF-FACHBEREICH
132900                                  TO H-AK-FACHBER
133000         ELSE
133100           IF GSOVER-GEWICHT      = C-GEW-ZUSTAND
133200           THEN
133300             MOVE H-AK-TYP        TO KAI0AKF-AK-TYP
133400             MOVE ZERO            TO KAI0AKF-ZUSATZ-TEXT-SL
133500             MOVE ZERO            TO KAI0AKF-PRIMANOTA
133600             
133700             PERFORM AUFRUF-KA00AKFB
133800             
133900             IF GSOVER-GEWICHT    = C-GEW-NICHT-GESETZT
134000             THEN
134100               MOVE KAO0AKF-FACHBEREICH
134200                                  TO H-AK-FACHBER
134300             ELSE
134400               IF GSOVER-GEWICHT  = C-GEW-ZUSTAND
134500               THEN
134600                 MOVE SPACE       TO H-AK-FACHBER
134700               ELSE
134800                 GO TO PROGRAMM-VERLASSEN
134900               END-IF
135000             END-IF
135100           ELSE
135200             GO TO PROGRAMM-VERLASSEN
135300           END-IF
135400         END-IF
135500       ELSE
135600         GO TO PROGRAMM-VERLASSEN
135700       END-IF
135800     END-IF
135900     .
136000 AK-DATEN-ERMITTELN-1002.
136100     EXIT.
136200/---------------------------------------------------------------*
136300* TABEX Tabelle KA00AKFB                                        *
136400*---------------------------------------------------------------*
136500 AUFRUF-KA00AKFB SECTION.
136600 AUFRUF-KA00AKFB-1001.
136700*
136800     CALL "CGSTAB"
136900     USING C-TAB-LESEN-EQUAL
137000           C-KONFIG-ID-KA
137100           C-OBJEKT-TAB-KA00AKFB
137200           GSOVER-VERSTAENDIGUNGSBEREICH
137300           KAI0AKF-EINGABEBEREICH
137400           KAO0AKF-AUSGABEBEREICH
137500           GSTTAB-EIN-AUSGABEBEREICH
137600     END-CALL
137700     .
137800 AUFRUF-KA00AKFB-1002.
137900     EXIT.
138000/---------------------------------------------------------------*
138100* Anfangssatz untersuchen                                       *
138200*---------------------------------------------------------------*
138300 ANFANGSATZ-BEARB SECTION.
138400 ANFANGSATZ-BEARB-1001.
138500*
138600     IF KAIEIN1-SATZART = C-NULL
138700     OR KAIEIN1-SATZART = C-1
138800     OR KAIEIN1-SATZART = C-A
138900     THEN
138951*                                                                 D05
138952* Initialisierungen für Saldo-Prüfungen                           D05
138953       MOVE ZERO                  TO H-AKT-SALDO                  D05
138954       SET F-SALDO-RELEVANT-JA    TO TRUE                         D05
138960* Prüfungs-Flag setzen                                            D05
138961       IF KAIEIN1-PRUEFUNG            = C-J   AND                 D05
138962          KAIEIN1-VERARB-FKT-DETAIL   = C-MIT-PRUEFUNG            D05
138965       THEN                                                       D05
138966         SET F-KTO-SATZ-PRUEFEN       TO TRUE                     D05
138970       ELSE                                                       D05
138971         SET F-KTO-SATZ-NICHT-PRUEFEN TO TRUE                     D05
138975       END-IF                                                     D05
139000* Funktion
139100       MOVE C-01-INT-LES-KTO      TO KAI5KT1-FUNKTION
139200* Eingabe
139300       MOVE KAIEIN1-HERKUNFT      TO KAI5KT1-HERKUNFT
139400       MOVE KAIEIN1-KONTO-ID      TO KAI5KT1-KONTO-ID
139500*
139600* Auftrag aufrufen
139700       CALL "CGSAUF"
139800       USING C-AUF-AUFRUF-AL
139900             C-KONFIG-ID-KA
140000             C-OBJEKT-AUFTRAG-KKA5KT
140100             GSOVER-VERSTAENDIGUNGSBEREICH
140200             KAI5KT1-EINGABEBEREICH
140300             KAO5KT1-AUSGABEBEREICH
140400             DUMMY
140500       END-CALL
140600*
140700       EVALUATE GSOVER-GEWICHT
140800       WHEN C-GEW-NICHT-GESETZT
140850         SET F-KTO-SATZ-VORHANDEN       TO TRUE                   D05
140900         IF F-KTO-SATZ-PRUEFEN                                    D05
141000         THEN
141050           MOVE KAO5KT1-SALDO           TO H-AKT-SALDO            D05
141100           PERFORM DATEN-PRUEFEN
141200         END-IF
141300       WHEN C-GEW-ABBRUCH
141400         GO TO PROGRAMM-VERLASSEN
141500       WHEN OTHER
141600* Kein Eintrag in KA_TABLE_KTO
141700         IF GSOVER-RETURNCODE           = C-OBJEKT-KA4068
141800         THEN
141900           MOVE C-OBJEKT-KA0000         TO GSOVER-RETURNCODE
142000         END-IF
142100*        Von einem nicht relevanten TSA-Satz darf kein KTO-Satz   D05
142150*        angelegt werden. Es kann sein, dass alle Sätze eines     D05
142151*        HST-Blockes nicht relevant sind. Ein nicht relevanter    D05
142152*        Satz darf seine Werte nicht im KTO-Bestand hinterlegen.  D05
142160         IF F-SATZ-RELEVANT-JA                                    D05
142161         THEN                                                     D05
142162           PERFORM KONTO-ANLEGEN                                  D05
142170         ELSE                                                     D05
142171           SET F-KTO-SATZ-NICHT-VORHANDEN  TO TRUE                D05
142180         END-IF                                                   D05
142200       END-EVALUATE
142300*
142400     END-IF
142500     .
142600 ANFANGSATZ-BEARB-1002.
142700     EXIT.
142800/---------------------------------------------------------------*
142850* Anfangssaldo überprüfen                                       *
142861*---------------------------------------------------------------*
142900 DATEN-PRUEFEN SECTION.
142950 DATEN-PRUEFEN-1001.                                              D05
143000*                                                                 D05
143050* Schalter für Saldo-Relevanz setzen:                             D05
143051* Saldo-Relevanz-JA ist gegeben, wenn die aktuelle Identifikation D05
143052* des Auszugs (Auszugsdatum,Auszugsnummer, Folgenummer) größer    D05
143053* als die Identifikation des zuletzt übernommenen Auszugs ist.    D05
143060*                                                                 D05
143061     IF (KAIEIN1-AUSZUGSDATUM    > KAO5KT1-DATUM-LE-AUSZUG  OR    D05
143062        (KAIEIN1-AUSZUGSDATUM    = KAO5KT1-DATUM-LE-AUSZUG    AND D05
143063        KAIEIN1-AUSZUGSNUMMER   > KAO5KT1-NR-LE-AUSZUG)    OR     D05
143064        (KAIEIN1-AUSZUGSDATUM    = KAO5KT1-DATUM-LE-AUSZUG    AND D05
143065         KAIEIN1-AUSZUGSNUMMER   = KAO5KT1-NR-LE-AUSZUG       AND D05
143066         KAIEIN1-AUSZUG-FNR      > KAO5KT1-FOLGENR-LE-AUSZUG))    D05
143070     THEN                                                         D05
143071       SET F-SALDO-RELEVANT-JA   TO TRUE                          D05
143080     ELSE                                                         D05
143082       SET F-SALDO-RELEVANT-NEIN TO TRUE                          D05
143090     END-IF                                                       D05
143150*                                                                 D05
143200* Plausi nur für relevante Sätze (BUDAT nach GO-LIVE) durchführen D05
143250     IF F-SATZ-RELEVANT-JA                                        D05
143300     THEN                                                         D05
143350*  Auszugs-Datumsfelder (gepackt) in nicht gepackte Hilfsfelder   D04
143351*  übertragen.                                                    D04
143352       MOVE KAIEIN1-AUSZUGSDATUM    TO H-EIN-AUSZUGSDATUM-NUM     D04
143353       MOVE KAO5KT1-DATUM-LE-AUSZUG TO H-KTO-DATUM-LE-AUSZUG-NUM  D04
143400* Auszugsdatum
143500       IF H-EIN-AUSZUGSDATUM-NUM    <  H-KTO-DATUM-LE-AUSZUG-NUM  D04
143600       THEN
143700* KA4002:
143800* Geliefertes Auszugsdatum ist nicht aufsteigend
143900         MOVE C-OBJEKT-KA4002       TO H-MELDUNGS-OBJEKT
144000         PERFORM MELDUNG-EINTRAGEN
144100       END-IF
144200*
144300* Auszugs- / Folgenummer
144400       IF  (KAIEIN1-AUSZUGSNUMMER    NOT = ZERO
144500            OR 
144600            KAIEIN1-AUSZUG-FNR       NOT = ZERO)                  D01
144700            AND KAO5KT1-NR-LE-AUSZUG NOT = ZERO
144800       THEN
144900         IF H-EIN-AUSZUGSDATUM-NUM   (C-1:C-4)  =                 D04
145000            H-KTO-DATUM-LE-AUSZUG-NUM(C-1:C-4)                    D04
145200         THEN
145300           COMPUTE H-AUSZUGNR       = KAO5KT1-NR-LE-AUSZUG + C-1  D01
145400           COMPUTE H-FOLGENR        = KAO5KT1-FOLGENR-LE-AUSZUG   D01
145500                                      + C-1
145600           IF KAIEIN1-AUSZUGSNUMMER = H-AUSZUGNR
145700           THEN
145800*            Nachricht zu einer neuen, nächsthöheren AuszugsnummerD04
145850             IF KAIEIN1-AUSZUG-FNR   NOT = C-1                    D04
145851             THEN                                                 D04
145852               MOVE C-OBJEKT-KA4003 TO H-MELDUNGS-OBJEKT          D04
145853               PERFORM MELDUNG-EINTRAGEN                          D04
145854             END-IF                                               D04
145900           ELSE
145950*            Nachricht zur alten, gleichen Auszugsnummer          D04
146000             IF  KAIEIN1-AUSZUGSNUMMER
146100                                    = KAO5KT1-NR-LE-AUSZUG
146200             AND KAIEIN1-AUSZUG-FNR = H-FOLGENR
146300             THEN
146400               CONTINUE
146500             ELSE
146600* KA4003:
146700* Gelieferte Auszugs-/Folgenr ist nicht aufsteigend
146800               MOVE C-OBJEKT-KA4003 TO H-MELDUNGS-OBJEKT
146900               PERFORM MELDUNG-EINTRAGEN
147000             END-IF
147100           END-IF
147200         ELSE
147300           MOVE H-KTO-DATUM-LE-AUSZUG-NUM(C-1:C-4)                D04
147400                                    TO H-AUSZUGJAHR               
147500           COMPUTE H-AUSZUGJAHR     = H-AUSZUGJAHR + C-1          
147550*          Erste Nachricht nach Jahreswechsel                     D04
147600           IF  H-EIN-AUSZUGSDATUM-NUM(C-1:C-4)                    D04
147700                                    = H-AUSZUGJAHR
147800               AND KAIEIN1-AUSZUGSNUMMER = C-1                    D04
147950               AND KAIEIN1-AUSZUG-FNR    = C-1                    D04
148000           THEN                                                     
148100             CONTINUE
148200           ELSE
148300* KA4003:
148400* Gelieferte Auszugs-/Folgenr ist nicht aufsteigend
148500             MOVE C-OBJEKT-KA4003 TO H-MELDUNGS-OBJEKT
148600             PERFORM MELDUNG-EINTRAGEN
148700           END-IF
148800         END-IF
148900       END-IF
149000*
149050* folgende Plausi nur durchführen, falls Saldoprüfung relevant istD05
149051       IF F-SALDO-RELEVANT-JA                                     D05
149052          AND F-KTO-SATZ-VORHANDEN                                D06
149053       THEN                                                       D05
149100* Anfangssaldo
149200         IF KAIEIN1-ANFANGSSALDO      NOT = KAO5KT1-SALDO
149300         THEN
149400* KA4005:
149500* Gelieferter Anfangssaldo stimmt nicht mit Kontosaldo überein
149600           MOVE C-OBJEKT-KA4005       TO H-MELDUNGS-OBJEKT
149700           PERFORM MELDUNG-EINTRAGEN
149800         END-IF
149850       END-IF                                                     D05
149860     END-IF                                                       D05
149900     .
150000 DATEN-PRUEFEN-1002.
150100     EXIT.
150200/---------------------------------------------------------------*
150300* Eintrag in KA_TABLE_KTO anlegen                               *
150400*---------------------------------------------------------------*
150500 KONTO-ANLEGEN SECTION.
150600 KONTO-ANLEGEN-1001.
150700*
150800* Funktion
150900     MOVE C-01-INT-ANL-KTO        TO KAI4KT1-FUNKTION
151000* Eingabe
151100     MOVE KAIEIN1-HERKUNFT        TO KAI4KT1-HERKUNFT
151200     MOVE KAIEIN1-KONTO-ID        TO KAI4KT1-KONTO-ID
151300     MOVE ZERO                    TO KAI4KT1-DATUM-LE-AUSZUG
151400     MOVE ZERO                    TO KAI4KT1-NR-LE-AUSZUG
151500     MOVE ZERO                    TO KAI4KT1-FOLGENR-LE-AUSZUG
151600     MOVE ZERO                    TO KAI4KT1-SALDO
151700     MOVE SPACE                   TO KAI4KT1-WAEHRUNG
151800     MOVE FUNCTION CURRENT-DATE   TO KAI4KT1-TIMESTAMP-ANL(1:16)  D09
151900     MOVE SPACE                   TO KAI4KT1-USER-LE-AENDERUNG
152000     MOVE SPACE                   TO KAI4KT1-TIMESTAMP-BKAKTO
152100*
152200* Produktionsmodus
152300     IF KAIEIN1-TEST              = C-P
152350        AND F-SATZ-RELEVANT-JA                                    D05
152400     THEN
152500* Auftrag aufrufen
152600       CALL "CGSAUF"
152700       USING C-AUF-AUFRUF-AL
152800             C-KONFIG-ID-KA
152900             C-OBJEKT-AUFTRAG-KKA4KT
153000             GSOVER-VERSTAENDIGUNGSBEREICH
153100             KAI4KT1-EINGABEBEREICH
153200             KAO4KT1-AUSGABEBEREICH
153300             DUMMY
153400       END-CALL
153500     ELSE
153600       MOVE C-GEW-NICHT-GESETZT   TO GSOVER-GEWICHT
153700     END-IF
153800*
153900     IF GSOVER-GEWICHT            = C-GEW-NICHT-GESETZT
154000     THEN
154100* Produktionsmodus
154200       IF KAIEIN1-TEST            = C-P
154250          AND F-SATZ-RELEVANT-JA                                  D05
154300       THEN
154400         MOVE C-J                 TO
154500                                  KATEIN1-KTO-AUS-TABEX-ANGELEGT
154550         SET F-KTO-SATZ-INITIALISIERT    TO TRUE                  D06
154600       END-IF
154700     ELSE
154800       GO TO PROGRAMM-VERLASSEN
154900     END-IF
155000     .
155100 KONTO-ANLEGEN-1002.
155200     EXIT.
155300/---------------------------------------------------------------*
155400* Belegen der Eingabefelder                                     *
155500*---------------------------------------------------------------*
155600 EINGABE-BELEGEN SECTION.
155700 EINGABE-BELEGEN-1001.
155800*
155900* APO-PK
156000     MOVE H-AK-NUMMER             TO 
156100                               KAI4AP1-APO-ABSTIMMKREIS-NR
156200     MOVE KAIEIN1-HERKUNFT        TO KAI4AP1-APO-HERKUNFT
156300     MOVE KAIEIN1-KONTO-ID        TO 
156400                               KAI4AP1-APO-KONTO-ID-ABSTIMM
156500     MOVE KAIEIN1-AUSZUGSDATUM    TO KAI4AP1-APO-AUSZUGSDATUM
156600     MOVE KAIEIN1-AUSZUGSNUMMER   TO KAI4AP1-APO-AUSZUGSNUMMER
156700     MOVE KAIEIN1-AUSZUG-FNR      TO KAI4AP1-APO-AUSZUG-FNR
156800     MOVE KAIEIN1-LFD-NR-TSA      TO KAI4AP1-APO-LFD-NR-APO
156900* APO-DATEN
157000     MOVE KAIEIN1-NACHRICHTENTYP  TO 
157100                               KAI4AP1-APO-APO-NACHRICHTENTYP
157200     MOVE KAIEIN1-REF-NACHRICHT   TO KAI4AP1-APO-REF-NACHRICHT
157300     MOVE KAIEIN1-TRANSAKT-TYP    TO 
157400                               KAI4AP1-APO-TRANSAKTION-TYP
157500     MOVE KAIEIN1-BETRAG          TO KAI4AP1-APO-BETRAG
157550*                                                                 D05
157551     IF F-SATZ-RELEVANT-JA                                        D05
157552     THEN                                                         D05
157553       COMPUTE H-AKT-SALDO        = H-AKT-SALDO                   D05
157554                                    + KAIEIN1-BETRAG              D05
157555     END-IF                                                       D05
157556*                                                                 D05
157600     MOVE KAIEIN1-WAE-BETRAG      TO KAI4AP1-APO-WAEHRUNG
157700     MOVE KAIEIN1-BUCHUNGSDATUM   TO KAI4AP1-APO-BUTAG
157800     MOVE KAIEIN1-VALUTADATUM     TO KAI4AP1-APO-VALUTA
157900     MOVE KAIEIN1-REF-KONTOFUEHRER
158000                                  TO 
158100                               KAI4AP1-APO-REF-KONTOFUEHRER
158200     MOVE KAIEIN1-REF-KONTOINHABER
158300                                  TO KAI4AP1-APO-REF-KONTOINH
158400     MOVE KAIEIN1-ERGAENZUNGSTEXT TO KAI4AP1-APO-ERG-TEXT
158500     MOVE KAIEIN1-GESCH-VORFALL-CODE
158600                                  TO KAI4AP1-APO-GV-CODE
158700     MOVE KAIEIN1-ZUSATZTEXT-SL   TO KAI4AP1-APO-ZUSATZ-TXT-SL
158800     MOVE KAIEIN1-PRIMANOTA       TO KAI4AP1-APO-PRIMANOTA
158900     MOVE KAIEIN1-STORNO-KZ       TO KAI4AP1-APO-STORNO-KZ
159000     MOVE KAIEIN1-TRANSAKT-ID     TO KAI4AP1-APO-TRANSAKTION-ID
159100     MOVE KAIEIN1-TRANSAKT-ID-FRESYS
159200                                  TO 
159300                               KAI4AP1-APO-TRANSAKTION-ID-FS
159400     MOVE KAIEIN1-ISIN            TO KAI4AP1-APO-ISIN
159500     MOVE KAIEIN1-NENNWERT        TO KAI4AP1-APO-NENNWERT
159600     MOVE KAIEIN1-GEGENKONTO-ID   TO KAI4AP1-APO-GEGEN-KONTO-ID
159700     MOVE KAIEIN1-REMOTE-KONTO-ID TO 
159800                               KAI4AP1-APO-REMOTE-KONTO-ID
159900     MOVE KAIEIN1-ORGINALKONTO-ID TO KAI4AP1-APO-KONTO-ID-ORIG
160000     MOVE KAIEIN1-VERWENDUNGSZWECK
160100                                  TO 
160200                               KAI4AP1-APO-VERWENDUNGSZWECK
160300* APO-VERWALTUNGSDATEN
160400     MOVE H-AK-TYP                TO 
160500                               KAI4AP1-APO-ABSTIMMKREIS-TYP
160600     MOVE C-STATUS-OFFEN          TO KAI4AP1-APO-STATUS
160700     MOVE ZERO                    TO KAI4AP1-APO-SCHLIESSUNGSNR
160800     MOVE SPACE                   TO 
160900                               KAI4AP1-APO-SCHLIESSUNGSART
161000     MOVE H-AK-FACHBER            TO KAI4AP1-APO-FACHBEREICH
161100     MOVE SPACE                   TO KAI4AP1-APO-BEMERKUNG
161200     MOVE FUNCTION ABS (KAIEIN1-BETRAG)
161300                                  TO KAI4AP1-APO-BETRAG-ABSOLUT
161400     MOVE KAIEIN1-DATEINR         TO KAI4AP1-APO-DATEINR
161500     MOVE FUNCTION CURRENT-DATE   TO H-TIMESTAMP-FIELDS
161600     MOVE H-DH-TIMESTAMP          TO KAI4AP1-APO-TIMESTAMP-ANL
161700     MOVE SPACE                   TO 
161800                               KAI4AP1-APO-TIMESTAMP-SCHLIESS
161900     MOVE SPACE                   TO KAI4AP1-APO-USER-SCHLIESS
162000     MOVE SPACE                   TO KAI4AP1-APO-TIMESTAMP-FREI
162100     MOVE SPACE                   TO KAI4AP1-APO-USER-FREI
162200     MOVE SPACE                   TO 
162300                               KAI4AP1-APO-TIMESTAMP-ABLEHN
162400     MOVE SPACE                   TO KAI4AP1-APO-USER-ABLEHN
162500     MOVE SPACE                   TO 
162600                               KAI4AP1-APO-TIMESTAMP-AUFHEBEN
162700     MOVE SPACE                   TO KAI4AP1-APO-USER-AUFHEBEN
162800     MOVE SPACE                   TO 
162900                               KAI4AP1-APO-TIMESTAMP-BKAAPO
163000* Ausgabe belegen
163100     MOVE KAI4AP1-KAAPO-GESAMT    TO KAOEIN1-APO-SATZ
163200     .
163300 EINGABE-BELEGEN-1002.
163400     EXIT.
163500/---------------------------------------------------------------*
163600* Aufruf des Auftrags KKA4AP zur Anlage von                     *
163700* Ausgleichspositionen                                          *
163800*---------------------------------------------------------------*
163900 AUFRUF-KKA4AP-ANL SECTION.
164000 AUFRUF-KKA4AP-ANL-1001.
164100*
164200* Funktion
164300     MOVE C-01-INT-ANL-APO        TO KAI4AP1-FUNKTION
164400*
164500* Produktionsmodus
164600     IF KAIEIN1-TEST              = C-P
164650        AND F-SATZ-RELEVANT-JA                                    D05
164700     THEN
164800* Auftrag aufrufen
164900       CALL "CGSAUF"
165000       USING C-AUF-AUFRUF-AL
165100             C-KONFIG-ID-KA
165200             C-OBJEKT-AUFTRAG-KKA4AP
165300             GSOVER-VERSTAENDIGUNGSBEREICH
165400             KAI4AP1-EINGABEBEREICH
165500             DUMMY
165600             DUMMY
165700             DUMMY
165800             DUMMY
165900       END-CALL
166000     ELSE
166100       MOVE C-GEW-NICHT-GESETZT   TO GSOVER-GEWICHT
166200     END-IF
166300*
166400     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
166500     THEN
166600       GO TO PROGRAMM-VERLASSEN
166700     END-IF
166800*
166900     .
167000 AUFRUF-KKA4AP-ANL-1002.
167100     EXIT.
167200/---------------------------------------------------------------*
167300* Endesatz verwursten                                           *
167400*---------------------------------------------------------------*
167500 ENDESATZ-BEARB SECTION.
167600 ENDESATZ-BEARB-1001.
167700*
167800     IF KAIEIN1-SATZART = C-NULL
167900     OR KAIEIN1-SATZART = C-1
168000     OR KAIEIN1-SATZART = C-E
168100     THEN
168200       IF F-KTO-SATZ-VORHANDEN    AND                             D06
168250          F-KTO-SATZ-PRUEFEN      AND                             D05
168251          F-SATZ-RELEVANT-JA      AND                             D05
168252          F-SALDO-RELEVANT-JA                                     D05
168300       THEN                   
168400       IF KAIEIN1-ENDSALDO        NOT = H-AKT-SALDO               D05
168450******   IF KAIEIN1-ENDSALDO      NOT = KATEIN1-ENDSALDO          D05
168500         THEN                 
168550           MOVE C-OBJEKT-KA4007   TO H-MELDUNGS-OBJEKT            D05
168551           PERFORM MELDUNG-EINTRAGEN                              D05
168600           GO TO PROGRAMM-VERLASSEN
168700         END-IF               
168800       END-IF                 
168900*  Konto-Satz: Falls noch kein Konto-Satz im DB-Bestand vorliegt  D05
169049*              und der Block-Endsatz relevant ist, die Anlage     D05
169050*              des KTO-Satzes hier nachzuholen.                   D05
169051       IF F-KTO-SATZ-NICHT-VORHANDEN   AND                        D05
169052          F-SATZ-RELEVANT-JA                                      D05
169053       THEN                                                       D05
169054         PERFORM KONTO-ANLEGEN                                    D05
169056       END-IF                                                     D05
169100* Funktion                                                        D05
169150       MOVE C-01-INT-LES-KTO      TO KAI5KT1-FUNKTION             D05
169200* Eingabe                     
169300       MOVE KAIEIN1-HERKUNFT      TO KAI5KT1-HERKUNFT
169400       MOVE KAIEIN1-KONTO-ID      TO KAI5KT1-KONTO-ID
169500*                             
169600* Auftrag aufrufen            
169700       CALL "CGSAUF"          
169800       USING C-AUF-AUFRUF-AL  
169900             C-KONFIG-ID-KA   
170000             C-OBJEKT-AUFTRAG-KKA5KT
170100             GSOVER-VERSTAENDIGUNGSBEREICH
170200             KAI5KT1-EINGABEBEREICH
170300             KAO5KT1-AUSGABEBEREICH
170400             DUMMY            
170500       END-CALL               
170600*                             
170700* Testmodus                   
170800       IF KAIEIN1-TEST            = C-T
170900       THEN                   
171000         MOVE C-GEW-NICHT-GESETZT TO GSOVER-GEWICHT
171100       END-IF                 
171200*                             
171300       EVALUATE GSOVER-GEWICHT
171400       WHEN C-GEW-NICHT-GESETZT
171500         CONTINUE             
171600       WHEN OTHER             
171700         GO TO PROGRAMM-VERLASSEN
171800       END-EVALUATE           
171900*                             
172000* Funktion                    
172100       MOVE C-01-INT-AEN-KTO      TO KAI4KT1-FUNKTION
172200* Eingabe                     
172300       MOVE KAIEIN1-HERKUNFT      TO KAI4KT1-HERKUNFT
172400       MOVE KAIEIN1-KONTO-ID      TO KAI4KT1-KONTO-ID
172500       MOVE KAIEIN1-AUSZUGSDATUM  TO KAI4KT1-DATUM-LE-AUSZUG
172600       MOVE KAIEIN1-AUSZUGSNUMMER TO KAI4KT1-NR-LE-AUSZUG
172700       MOVE KAIEIN1-AUSZUG-FNR    TO KAI4KT1-FOLGENR-LE-AUSZUG
172800       MOVE KAIEIN1-ENDSALDO      TO KAI4KT1-SALDO
172900       MOVE KAIEIN1-WAEHRUNF-ENDSALDO
173000                                  TO KAI4KT1-WAEHRUNG
173100       MOVE KAO5KT1-TIMESTAMP-ANL TO KAI4KT1-TIMESTAMP-ANL
173200       MOVE SPACE                 TO KAI4KT1-USER-LE-AENDERUNG
173300       MOVE KAO5KT1-TIMESTAMP-BKAKTO
173400                                  TO KAI4KT1-TIMESTAMP-BKAKTO
173500*
173600* Produktionsmodus
173700       IF KAIEIN1-TEST            = C-P
173750          AND F-SATZ-RELEVANT-JA                                  D05
173751          AND F-SALDO-RELEVANT-JA                                 D05
173800       THEN
173900* Auftrag aufrufen
174000         CALL "CGSAUF"
174100         USING C-AUF-AUFRUF-AL
174200               C-KONFIG-ID-KA
174300               C-OBJEKT-AUFTRAG-KKA4KT
174400               GSOVER-VERSTAENDIGUNGSBEREICH
174500               KAI4KT1-EINGABEBEREICH
174600               KAO4KT1-AUSGABEBEREICH
174700               DUMMY
174800         END-CALL
174900       ELSE
175000         MOVE C-GEW-NICHT-GESETZT TO GSOVER-GEWICHT
175100       END-IF
175200*
175300       IF GSOVER-GEWICHT          NOT = C-GEW-NICHT-GESETZT
175400       THEN
175500         GO TO PROGRAMM-VERLASSEN
175600       END-IF
175700     END-IF
175800     .
175900 ENDESATZ-BEARB-1002.                                             D05
176000     EXIT.
176100/---------------------------------------------------------------*
176200* Programminitialisierung                                       *
176300*---------------------------------------------------------------*
176400 INITIALISIERUNG SECTION.
176500 INITIALISIERUNG-1001.
176600     INITIALIZE                   GSTMEL-TRANSIENTER-BEREICH
176700     MOVE SPACE                   TO H-FUNKTION
176800*
176900     PERFORM LESEN-ANMELDEDATEN
177000* Ermitteln der Instituts-eigenen BIC                             D06
177050       PERFORM ERMITTELN-EIG-BIC                                  D06
177200     .                                                            D06
177250 INITIALISIERUNG-1002.                                            D06
177251     EXIT.                                                        D06
177300/---------------------------------------------------------------*
177400* Lesen der Anmeldedaten                                        *
177500*---------------------------------------------------------------*
177600 LESEN-ANMELDEDATEN SECTION.
177700 LESEN-ANMELDEDATEN-1001.
177800     CALL "CGSTAB"
177900     USING C-TAB-ANM-DAT-LESEN
178000           C-KONFIG-ID-GS
178100           C-OBJEKT-TAB-ANMELDEDATEN
178200           GSOVER-VERSTAENDIGUNGSBEREICH
178300           DUMMY
178400           GSO0ANM-AUSGABEBEREICH
178500           GSTTAB-EIN-AUSGABEBEREICH
178600     END-CALL
178700*
178800     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
178900     THEN
179000       GO TO PROGRAMM-VERLASSEN
179100     END-IF
179200      .
179300 LESEN-ANMELDEDATEN-1002.
179400     EXIT.
179500/---------------------------------------------------------------*
179600* Meldung eintragen                                             *
179700*---------------------------------------------------------------*
179800 MELDUNG-EINTRAGEN SECTION.
179900 MELDUNG-EINTRAGEN-1001.
180000     CALL "CGSMEL"
180100     USING C-MEL-EINTRAGEN
180200           C-KONFIG-ID-KA
180300           H-MELDUNGS-OBJEKT
180400           GSOVER-VERSTAENDIGUNGSBEREICH
180500           DUMMY
180600           GSOMEL-AUSGABEBEREICH
180700           GSTMEL-TRANSIENTER-BEREICH
180800     END-CALL
180900     .
181000 MELDUNG-EINTRAGEN-1002.
181100     EXIT.
181500*                                                                 D02
181600/---------------------------------------------------------------* D02
181700* Verarbeitung zum Übernahme-Ende                               * D02
181800*---------------------------------------------------------------* D02
181900 UEBERNAHME-ENDE SECTION.                                         D02
182000 UEBERNAHME-ENDE-1001.                                            D02
182100*                                                                 D02
182200*    Anzahl Treffer initialisieren                                D02
182300     MOVE ZERO                    TO KAOEIN2-ANZ-SAETZE-UPDATE    D02
182400     MOVE ZERO                    TO H-ANZ-DAT-SAETZE-UPDATE      D02
182500*                                                                 D02
182600     SET F-DAT-BESTAND-WEITER     TO TRUE                         D02
182700     MOVE C-N                     TO H-KZ-FOLGE                   D02
182800*                                                                 D02
182900     PERFORM UNTIL F-DAT-BESTAND-ENDE                             D02
183000*                                                                 D02
183100*      Lesen Liste der noch nicht vollständig überführten Dateien D02
183200       PERFORM LESEN-DATEIVERW                                    D02
183300*                                                                 D02
183400       IF KAO5DA2-IND-LETZT       > ZERO                          D02
183500       THEN                                                       D02
183600         PERFORM VERARB-DATEIVERW                                 D02
183700*                                                                 D02
183800         IF KAO5DA2-KZ-WEITER     = C-N                           D02
183900         THEN                                                     D02
184000           SET F-DAT-BESTAND-ENDE TO TRUE                         D02
184100         ELSE                                                     D02
184200           MOVE C-J               TO H-KZ-FOLGE                   D02
184300         END-IF                                                   D02
184350*                                                                 D08
184400       ELSE                                                       D08
184450*        Wenn kein Dateiverwaltungssatz gefunden wurde            D08
184451         SET F-DAT-BESTAND-ENDE TO TRUE                           D08                     
184500       END-IF                                                     D02
184600     END-PERFORM                                                  D02
184650*                                                                 D02
184700*    Ausgabebereich versorgen                                     D02
184800     MOVE H-ANZ-DAT-SAETZE-UPDATE TO                              D02
184900                                  KAOEIN2-ANZ-SAETZE-UPDATE       D02
185000     .                                                            D02
185100 UEBERNAHME-ENDE-1002.                                            D02
185200     EXIT.                                                        D02
185300*                                                                 D02
185400/---------------------------------------------------------------* D02
185500* LESEN-DATEIVERW:                                              * D02
185600* Lesen der Saetze aus KA_TABLE_DAT über Auftrag KKA5DA,        * D02
185700* die noch den Status "unvollständig überführt" aufweisen.      * D02
185800*---------------------------------------------------------------* D02
185900 LESEN-DATEIVERW SECTION.                                         D02
186000 LESEN-DATEIVERW-1001.                                            D02
186100*                                                                 D02
186200     MOVE C-01-INT-LIST-DAT-X     TO KAI5DA2-FUNKTION             D02
186300     MOVE C-100                   TO KAI5DA2-ANF-ANZ-TREFFER      D02
186400     MOVE H-KZ-FOLGE              TO KAI5DA2-ANF-KZ-FOLGEAUFRUF   D02
186500     MOVE C-99999999              TO H-TIMESTAMP-DAT-1-8          D02
186600     MOVE ZERO                    TO H-TIMESTAMP-DAT-9-16         D02
186700     MOVE H-TIMESTAMP             TO KAI5DA2-DATUM-LETZT-AEND-BIS D02
186800     MOVE ZERO                    TO KAI5DA2-DATEINUMMER-VON      D02
186900     MOVE C-999999999999          TO KAI5DA2-DATEINUMMER-BIS      D02
187000     MOVE C-STATUS-DATEI-UNV-UEBERF                               D02
187100                                  TO KAI5DA2-DATEI-SATZ-STATUS-1  D02
187200     MOVE C-STATUS-DATEI-UNV-UEBERF                               D02
187300                                  TO KAI5DA2-DATEI-SATZ-STATUS-2  D02
187400*                                                                 D02
187500     CALL "CGSAUF" USING                                          D02
187600           C-AUF-AUFRUF-AL                                        D02
187700           C-KONFIG-ID-KA                                         D02
187800           C-OBJEKT-AUFTRAG-KKA5DA                                D02
187900           GSOVER-VERSTAENDIGUNGSBEREICH                          D02
188000           KAI5DA2-EINGABEBEREICH                                 D02
188100           KAO5DA2-AUSGABEBEREICH                                 D02
188200           KAT5DA1-TRANSIENT-BEREICH                              D02
188300     END-CALL                                                     D02
188400*                                                                 D02
188500     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT       D02
188600     THEN                                                         D02
188700*      Funktion INT-LIST-DAT-X muss immer RC-GEW 0 zurückliefern  D08
188750*      (ansonsten wurde bereits eine Abbruch-Meldung eingetragen) D08
189300       GO TO PROGRAMM-VERLASSEN                                   D08
189500     END-IF                                                       D02
189600     .                                                            D02
189700 LESEN-DATEIVERW-1002.                                            D02
189800     EXIT.                                                        D02
189900*                                                                 D02
190000/---------------------------------------------------------------* D02
190100* VERARB-DATEIVERW:                                             * D02
190200* Verarbeitet die Tabelle mit Dateiverwaltungssaetzen und nimmt * D02
190300* nimmt für jeden Eintrag folgende Verarbeitung vor:            * D02
190400* 1. Prüfen zum Dateiverwaltungssatz noch nicht überführte      * D02
190500*    TSA-Sätze vorliegen.                                       * D02
190600* 2. Wenn alls TSA-Sätze zum Dateiverwaltungssatz überführt     * D02
190700*    sind, wird der Status im Dateiverwaltungssatz auf          * D02
190800*    "vollständig überführt" gesetzt.                           * D02
190900*---------------------------------------------------------------* D02
191000 VERARB-DATEIVERW SECTION.                                        D02
191100 VERARB-DATEIVERW-1001.                                           D02
191200*                                                                 D02
191300     MOVE C-1                     TO I                            D02
191400*                                                                 D02
191500     PERFORM UNTIL I              > KAO5DA2-IND-LETZT             D02
191600*                                                                 D02
191700       MOVE KAO5DA2-DATEINR(I)    TO H-AKT-DATEINUMMER            D02
191800*      Prüfen ob alle TSA-Sätze der Datei überführt sind.         D02
191900       PERFORM ZAEHLEN-TSA-NUE                                    D02
192000*                                                                 D02
192100       IF F-DATEI-VOLLST-UEBERFUEHRT                              D02
192200       THEN                                                       D02
192300*        Update Status im Dateiverwaltungssatz                    D02
192400         PERFORM AENDERN-DATEIVERW                                D02
192500       END-IF                                                     D02
192600       ADD C-1                    TO I                            D02
192700     END-PERFORM                                                  D02
192800     .                                                            D02
192900 VERARB-DATEIVERW-1002.                                           D02
193000     EXIT.                                                        D02
193100*                                                                 D02
193200/---------------------------------------------------------------* D02
193300* ZAEHLEN-TSA-NUE:                                              * D02
193400* Suchen/Zaehlen der nicht überführten Transaktionen aus der    * D02
193500* Tabelle KA_TABLE_TSA über den Auftrag KKA5TS                  * D02
193600*---------------------------------------------------------------* D02
193700 ZAEHLEN-TSA-NUE SECTION.                                         D02
193800 ZAEHLEN-TSA-NUE-1001.                                            D02
193900*                                                                 D02
194000     MOVE C-01-INT-COUNT-TSA-STAT                                 D02
194100                                TO KAI5TS4-FUNKTION               D02
194200     MOVE H-AKT-DATEINUMMER     TO KAI5TS4-S-DATEINUMMER          D02
194300     MOVE C-J                   TO KAI5TS4-ANF-STATUS-EINGELESEN  D02
194400     MOVE C-N                   TO KAI5TS4-ANF-STATUS-UEBERFUEHRT D02
194500*                                                                 D02
194600     CALL "CGSAUF" USING                                          D02
194700           C-AUF-AUFRUF-AL                                        D02
194800           C-KONFIG-ID-KA                                         D02
194900           C-OBJEKT-AUFTRAG-KKA5TS                                D02
195000           GSOVER-VERSTAENDIGUNGSBEREICH                          D02
195100           KAI5TS4-EINGABEBEREICH                                 D02
195200           KAO5TS3-AUSGABEBEREICH                                 D02
195300           DUMMY                                                  D02
195400     END-CALL                                                     D02
195500*                                                                 D02
195600     IF GSOVER-GEWICHT      NOT = C-GEW-NICHT-GESETZT             D02
195700     THEN                                                         D02
195800       GO TO PROGRAMM-VERLASSEN                                   D02
195900     END-IF                                                       D02
196000*                                                                 D02
196100*    Flag setzen, ob alle TSA-Sätze einer Datei überführt sind:   D02
196200     IF KAO5TS3-ANZ-STATUS-EINGELESEN     = ZERO                  D02
196300     THEN                                                         D02
196400       SET F-DATEI-VOLLST-UEBERFUEHRT     TO TRUE                 D02
196500     ELSE                                                         D02
196600       SET F-DATEI-UNVOLLST-UEBERFUEHRT   TO TRUE                 D02
196700     END-IF                                                       D02
196800     .                                                            D02
196900 ZAEHLEN-TSA-NUE-1002.                                            D02
197000     EXIT.                                                        D02
197100*                                                                 D02
197200/---------------------------------------------------------------* D02
197300* AENDERN-DATEIVERW:                                            * D02
197400* AENDERN des Status im aktuellen Dateiverwaltungs-Satz         * D02
197500* (KA_TABLE_DAT) auf "Vollständig-Überführt" über Auftrag KKA4DA* D02
197600*---------------------------------------------------------------* D02
197700 AENDERN-DATEIVERW SECTION.                                       D02
197800 AENDERN-DATEIVERW-1001.                                          D02
197900*                                                                 D02
198000     MOVE C-01-INT-AEN-DAT          TO KAI4DA1-FUNKTION           D02
198100*                                                                 D02
198200     MOVE KAO5DA2-DATEINR(I)        TO KAI4DA1-DATEINR            D02
198300     MOVE KAO5DA2-HERKUNFT(I)       TO KAI4DA1-HERKUNFT           D02
198400     MOVE KAO5DA2-HERKUNFT-TECH(I)  TO KAI4DA1-HERKUNFT-TECH      D02
198500     MOVE C-STATUS-DATEI-VOLLST-UEBERF                            D02 
198550                                    TO KAI4DA1-STATUS             D02
198600     MOVE KAO5DA2-DATEI-EINLES-ERG(I)                             D02
198700                                    TO KAI4DA1-DATEI-EINLES-ERG   D02
198800     MOVE KAO5DA2-ANZ-ERFOL-VER-BLOE(I)                           D02
198900                                    TO KAI4DA1-ANZ-ERFOL-VER-BLOE D02
199000     MOVE KAO5DA2-ANZ-TRANS-UEBERNOM(I)                           D02
199100                                    TO KAI4DA1-ANZ-TRANS-UEBERNOM D02
199200     MOVE KAO5DA2-TIMESTAMP-ANLAGE(I)                             D02
199300                                    TO KAI4DA1-TIMESTAMP-ANLAGE   D02
199400     MOVE KAO5DA2-TIMESTAMP-BKADAT(I)                             D02
199500                                    TO KAI4DA1-TIMESTAMP-BKADAT   D02
199600*                                                                 D02
199700     CALL "CGSAUF" USING                                          D02
199800           C-AUF-AUFRUF-AL                                        D02
199900           C-KONFIG-ID-KA                                         D02
200000           C-OBJEKT-AUFTRAG-KKA4DA                                D02
200100           GSOVER-VERSTAENDIGUNGSBEREICH                          D02
200200           KAI4DA1-EINGABEBEREICH                                 D02
200300           DUMMY                                                  D02
200400           DUMMY                                                  D02
200500     END-CALL                                                     D02
200600*                                                                 D02
200700     IF GSOVER-GEWICHT         NOT = C-GEW-NICHT-GESETZT          D02
200800     THEN                                                         D02
200900       GO TO PROGRAMM-VERLASSEN                                   D02
201000     ELSE                                                         D02
201100       ADD C-1                    TO H-ANZ-DAT-SAETZE-UPDATE      D02
201200     END-IF                                                       D02
201300     .                                                            D02
201400 AENDERN-DATEIVERW-1002.                                          D02
201500     EXIT.                                                        D02
201600*                                                                 D02
202000*---------------------------------------------------------------- D06
202100* Ermitteln der Bankeigenen BIC                                   D06
202200*----------------------------------------------------------------*D06
202300 ERMITTELN-EIG-BIC SECTION.                                       D06
202400 ERMITTELN-EIG-BIC-1001.                                          D06
202500* Lesen Eigene BIC                                                D06
202600* Eigene BIC noch nicht ermittelt                                 D06
202700     MOVE C-EIGENE-BIC            TO GSIBIC-BIC                   D06
202800* Aufruf MGSEBIC                                                  D06
202900     CALL "MGSEBIC"                                               D06
203000     USING C-01-STD-PRUEF-EIG-BIC                                 D06
203100           C-KONFIG-ID-GS                                         D06
203200           C-OBJEKT-BIC                                           D06
203300           GSOVER-VERSTAENDIGUNGSBEREICH                          D06
203400           GSIBIC-EINGABEBEREICH                                  D06
203500           GSOBIC-AUSGABEBEREICH                                  D06
203600           DUMMY                                                  D06
203700     IF GSOVER-GEWICHT            >= C-GEW-FEHLER                 D06
203800     THEN                                                         D06
203900* Fehler der Gewichtung 4 werden ubernommen und eingetragen       D06
204000       MOVE GSOVER-RETURNCODE     TO H-MELDUNGS-OBJEKT            D06
204100       MOVE GSOVER-TEXTE          TO GSTMEL-TEXTE                 D06
204200       PERFORM MELDUNG-EINTRAGEN                                  D06
204300     ELSE                                                         D06
204400       MOVE C-OBJEKT-KA0000       TO GSOVER-RETURNCODE            D06
204500     END-IF                                                       D06
204600     .                                                            D06
204700 ERMITTELN-EIG-BIC-1002.                                          D06
204800     EXIT                                                         D06
204900     .                                                            D06
205000*                                                                 D06
206000*---------------------------------------------------------------* D06
206100* SATZ-RELEVANT-FLAG-BELEGEN                                    * D06
206200*                                                               * D06
206300*   Hier erfolgt das Setzen des SATZ-RELEVANT-FLAGS:            * D06
206400*                                                               * D06
206500*   Ein TSA-Satz ist immer dann in den APO-Bestand              * D06
206600*   zu überführen (d.h. ist immer dann relevant), wenn          * D06
206700*   er nicht durch folgende Bedingungenkombination              * D06
206800*   ausgeschlossen wird.                                        * D06
206900*                                                               * D06
207000*   - Ein Ausschluss, des TSA-Satzes erfolgt nur, wenn:         * D06
207100*     a) das Buchungsdatum <= dem Migrationsdatum ist  und      * D06
207200*     b) es sich um eine Nachricht mit eigener BIC              * D06
207300*        (über KOR-MIT erzeugt) handelt                und      * D06
207400*     c) das Attribut Nachrichtentyp  n i c h t                 * D06
207500*        dem Wert "MIGRATION" belegt ist.                       * D06
207600*                                                               * D06
207700*---------------------------------------------------------------* D06
207800 SATZ-RELEVANT-FLAG-BELEG SECTION.                                D06
207900 SATZ-RELEVANT-FLAG-BELEG-1001.                                   D06
208000*                                                                 D06
208100* Schalter für Prüfungen versorgen                                D06
208200     IF KAIEIN1-BUCHUNGSDATUM     <= KAIEIN1-MIGRATIONS-DATUM AND D06
208300        KAIEIN1-HERKUNFT           = GSOBIC-HAUPT-BIC         AND D06
208400        KAIEIN1-NACHRICHTENTYP NOT = C-TYP-MIGRATION              D06
208500     THEN                                                         D06
208600       SET F-SATZ-RELEVANT-NEIN TO TRUE                           D06
208700*      Übernahme-Info in T-Bereich belegen und Warnung ausgeben   D06
208800       MOVE C-N                 TO KATEIN1-TSA-IN-APO-UEBERFUEHRT D06
208900*      KA3082: TSA-Satz von Übernahme in APO-Bestand ausgeschloss.D06
209000       MOVE C-OBJEKT-KA3082      TO H-MELDUNGS-OBJEKT             D06
209100       PERFORM MELDUNG-EINTRAGEN                                  D06
209200     ELSE                                                         D06
209300       SET F-SATZ-RELEVANT-JA  TO TRUE                            D06
209400       MOVE C-J                TO KATEIN1-TSA-IN-APO-UEBERFUEHRT  D06
209500     END-IF                                                       D06
209600     .                                                            D06
209700 SATZ-RELEVANT-FLAG-BELEG-1002.                                   D06
209800     EXIT                                                         D06
209900     .                                                            D06
210000*                                                                 D06
900000/---------------------------------------------------------------* D02
900100* Verlassen des Programms ueber einen Ausstiegspunkt            * D02
900200*---------------------------------------------------------------* D02
900300 PROGRAMM-VERLASSEN SECTION.                                      D02
900400 PROGRAMM-VERLASSEN-1001.                                         D02
900500     EXIT PROGRAM                                                 D02
900600     .                                                            D02
900700 PROGRAMM-VERLASSEN-1002.                                         D02
900800     EXIT.                                                        D02

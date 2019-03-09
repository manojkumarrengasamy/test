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
000160*@Titel         : Pflege Abstimmpositionen
000160*@Elementname   : kka4ap.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20150107.094242
000160*@Produkt       : ak
000160*@Lieferpaket   : 
000160*@Liefertiefe   : ja
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
001000*@Title        : Pflege Abstimmpositionen                   *
001100* Verfasser    : Stefan Poetsch                             *
001200* Erstelldatum : 09.02.2012                                 *
001400*                                                           *
001500*@A-ELEMENTBESCHREIBUNG                                     *
001600* Modul-Beschreibung:                                       *
001700* ------------------                                        *
001800* In diesem KORDOBA Auftrag wird die Verarbeitung fuer die  *
001900* fachlichen Anforderungen                                  *
002000* - Pflege Abstimmpositionen(en)                            *
002100* durchgefuehrt.                                            *
002200*                                                           *
002300*@E-ELEMENTBESCHREIBUNG                                     *
002400*                                                           *
002500*@A-FUNKTION-1                                              *
002600* Neuanlage einer APO (Insert)                              *
002700*                                                           *
002800* Eingabefeldbelegungen:                                    *
002900* Funktion "01-INT-ANL-APO"                                 *
003000* BKAAPO-Gesamtsatz                                         *
003100*                                                           *
003200*@E-FUNKTION-1                                              *
003300*                                                           *
003400*@A-FUNKTION-2                                              *
003500* Änderung einer Abstimmposition mi UPDC                    *
003600*                                                           *
003700* Eingabefeldbelegungen:                                    *
003800* Funktion "01-INT-AEN-APO-UCHK"                            *
003900* BKAAPO-Gesamtsatz                                         *
004000*                                                           *
004100*@E-FUNKTION-2                                              *
004200*                                                           *
004300*@A-FUNKTION-3                                              *
004400* APO Einzelupdate (eine APO) bei Schließung                *
004500*                                                           *
004600* Eingabefeldbelegungen:                                    *
004700* Funktion "01-INT-AEN-APO-SCHL-1"                          *
004800* BKAAPO-Primärkey                                          *
004900* Update-Attribute                                          *
005000*                                                           *
005100*@E-FUNKTION-3                                              *
005200*                                                           *
005300*@A-FUNKTION-5                                              *
005400* Abstimmpositions-Massenänderung -                         *
005500* bei Schließungsfreigabe                                   *
005600*                                                           *
005700* Eingabefeldbelegungen:                                    *
005800* Funktion "01-INT-AEN-APO-FREI"                            *
005900* Schließungsnummer                                         *
006000* Update-Attribute                                          *
006100*                                                           *
006200*@E-FUNKTION-5                                              *
006300*                                                           *
006400*@A-FUNKTION-6                                              *
006500* Abstimmpositions-Massenänderung -                         *
006600* bei Schließungsablehnung                                  *
006700*                                                           *
006800* Eingabefeldbelegungen:                                    *
006900* Funktion "01-INT-AEN-APO-AUFH"                            *
007000* Schließungsnummer                                         *
007100* Update-Attribute                                          *
007200*                                                           *
007300*@E-FUNKTION-6                                              *
007400*                                                           *
007500*@A-FUNKTION-7                                              *
007600* Abstimmpositions-Massenänderung -                         *
007700* bei Schließungsaufhebung                                  *
007800*                                                           *
007900* Eingabefeldbelegungen:                                    *
008000* Funktion "01-INT-AEN-APO-AUFH"                            *
008100* Schließungsnummer                                         *
008200* Update-Attribute                                          *
008300*                                                           *
008400*@E-FUNKTION-7                                              *
008500*                                                           *
008600*@A-FUNKTION-8                                              *
008700* Löschung aller Abstimmpositionen zu einer Schließung      *
008800* (Delete im Rahmen der Reorganisation)                     *
008900*                                                           *
009000* Eingabefeldbelegungen:                                    *
009100* Funktion "01-INT-LOE-APO-Z-SCH"                           *
009200* Schließungsnummer                                         *
009300*                                                           *
009400*@E-FUNKTION-8                                              *
009500*                                                           *
009600*@A-FUNKTION-9                                              *
009700* Update-Funktion für Schließregeln.                        *
009800*                                                           *
009900* Eingabefeldbelegungen:                                    *
010000* Funktion "01-INT-UPD-SR"                                  *
010100* Daten für CGSDZS-Aufruf                                   *
010200* Anforderungen                                             *
010300*                                                           *
010400* Zusätzlicher Eingabebereich:                              *
010500* Eingabestruktur des APO-Zugriffsbausteins, in dem         *
010600* die Parameter definiert sind.                             *
010700* Im Standard: Copy CKAIAPO                                 *
010800*                                                           *
010900*@E-FUNKTION-9                                              *
011000*                                                           *
011100*@A-MODULAUFRUF                                             *
011200* Aufruf-Beispiel:                                          *
011300*                                                           *
011400* Aufrufparameter: 1. Funktion               (I)            *
011500*                  2. Konfigurations-Id      (I)            *
011600*                  3. Objekt                 (I)            *
011700*                  4. Verstaendigungsbereich (O)            *
011800*                  5. Eingabebereich         (I)            *
011900*                  6. Ausgabebereich         (O)            *
012000*                  7. DUMMY                  (I/O)          *
012100*                  8. Indices                (I)            *
012200*                  9. Zusätzl. Eingabeber.   (I)            *
012300
012400* CALL "CGSAUF"                                             *
012500* USING C-AUF-AUFRUF-AL                                     *
012600*       C-KONFIG-ID-KA                                      *
012700*       C-OBJEKT-AUFTRAG-KKA4AP                             *
012800*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *
012900*       KAI5AP1-EINGABEBEREICH                              *
013000*                                                           *
013100*@E-MODULAUFRUF                                             *
013200*                                                           *
013300*@A-RETURNCODE                                              *
013400* Meldungen/Returncodes:                                    *
013500* ----------------------                                    *
013600
013700* Folgende Fehlermeldungen werden von diesem KORDOBA-Auftrag*
013800* zureckgegeben bzw. in den Meldungs-Pool eingetragen:      *
013900* KA0000 : Verarbeitung erfolgreich durchgeführt            *
014000*                                                           *
014100*@E-RETURNCODE                                              *
014200*                                                           *
014300*@A-ENTRY                                                   *
014400* Entryname       : KKA4AP                                  *
014500*                                                           *
014600*@E-ENTRY                                                   *
014700*                                                           *
014800*@A-MODUL                                                   *
014900* Gerufene Moduln/Auftraege:                                *
015000* CGSDZS   Datenzugriffsschicht                             *
015100* CGSMEL   Meldungsschnittstelle                            *
015200*                                                           *
015300*@E-MODUL                                                   *
015400*                                                           *
015500*@A-COBOL-COPY                                              *
015600* Benoetigte Cobol-Copies:                                  *
015700* CGSI0MEL: Eingabebereich Meldungstabelle                  *
015800* CGSO0MEL: Ausgabebereich Meldungstabelle                  *
015900* CGSOMEL : Ausgabebereich Meldungsschnittstelle            *
016000* CGSTMEL : transienter Bereich Meldungsschnittstelle       *
016100* CGSOVER : Verstaendigungsbereich                          *
016200* CGSTTAB : transienter Bereich Zugriff Parametertabellen   *
016300* CGSO0ANM: Copy fuer taskspez. Anmeldedaten                *
016400* CGSODZSC: Ausgabebereich CGSDZS                           *
016500* CKAI4AP1: Eingabebereich KKA4AP                           *
016600* CKAI4AP2: Eingabebereich KKA4AP                           *
016700* CKAI4AP4: Eingabebereich KKA4AP                           *
016800* DCTGRCGE: Meldungsgewichte                                *
016900* CBKAAPO :  Benutzersatz Abschliessposition                *
017000* CKAOAPO : Ausgabebereich ZKAAPO                           *
017100*                                                           *
017200*@E-COBOL-COPY                                              *
017300*                                                           *
017400*@A-TABELLE                                                 *
017500* TABEX-Tabellen  :                                         *
017600*                                                           *
017700*@E-TABELLE                                                 *
017800*                                                           *
017900*@A-BENUTZERSATZ                                            *
018000* Benutzersaetze  : <benutzersatz> (I/O/IO)                 *
018100* BKAAPO (O):   Abstimmposition                             *
018200*                                                           *
018300*@E-BENUTZERSATZ                                            *
018400*                                                           *
018500*@A-DATEI                                                   *
018600* Dateien         : entfallen                               *
018700*                                                           *
018800*@E-DATEI                                                   *
018900*                                                           *
019000*@A-KONVENTIONEN                                            *
019100*@E-KONVENTIONEN                                            *
019200*                                                           *
019300*@A-DOKUMENT                                                *
019400* Die fachliche Beschreibung ist im Dokument                *
019500* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *
019600* hinterlegt.                                               *
019700*@E-DOKUMENT                                                *
019800*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
090051* A01 nnnnnn                                                *     A01
090052*     XREF : <txt>                                          *     A01
090053*     Datum: tt.mm.jjjj                            NKZ: ??? *     A01
090054*                                                           *     A01
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/
100200 IDENTIFICATION DIVISION.
100300 PROGRAM-ID. KKA4AP.
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
101550     05  FILLER PIC X(13) VALUE "ELEM=kka4ap  ".                  CCC
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
103400    05 C-OBJEKT-KA4851            PIC X(006) VALUE "KA4851".
103500    05 C-OBJEKT-KA4852            PIC X(006) VALUE "KA4852".
103600    05 C-OBJEKT-KA4853            PIC X(006) VALUE "KA4853".
103700    05 C-OBJEKT-KA4856            PIC X(006) VALUE "KA4856".
103800    05 C-OBJEKT-KA4857            PIC X(006) VALUE "KA4857".
103900    05 C-OBJEKT-KA4858            PIC X(006) VALUE "KA4858".
104000    05 C-OBJEKT-KA4859            PIC X(006) VALUE "KA4859".
104100    05 C-OBJEKT-KA5002            PIC X(006) VALUE "KA5002".
104200    05 C-OBJEKT-KA5007            PIC X(006) VALUE "KA5007".
104300/---------------------------------------------------------------*
104400* Lokale Konstante fuer KORDOBA-Auftrag KKA4AP                  *
104500*---------------------------------------------------------------*
104600 01 KONSTANTE-KKA4AP.
104700    05 C-01-INT-ANL-APO           PIC X(040) VALUE
104800                                  "01-INT-ANL-APO".
104900    05 C-01-INT-AEN-APO-UCHK      PIC X(040) VALUE
105000                                  "01-INT-AEN-APO-UCHK".
105100    05 C-01-INT-AEN-APO-SCHL-1    PIC X(040) VALUE
105200                                  "01-INT-AEN-APO-SCHL-1".
105300    05 C-01-INT-AEN-APO-FREI      PIC X(040) VALUE
105400                                  "01-INT-AEN-APO-FREI".
105500    05 C-01-INT-AEN-APO-ABLE      PIC X(040) VALUE
105600                                  "01-INT-AEN-APO-ABLE".
105700    05 C-01-INT-AEN-APO-AUFH      PIC X(040) VALUE
105800                                  "01-INT-AEN-APO-AUFH".
105900    05 C-01-INT-UPD-SR            PIC X(040) VALUE
106000                                  "01-INT-UPD-SR".
106100    05 C-01-INT-LOE-APO-Z-SCH     PIC X(040) VALUE   
106200                                  "01-INT-LOE-APO-Z-SCH".   
106300    05 C-KONFIG-ID-KA             PIC X(002) VALUE "KA".
106400    05 C-KONFIG-ID-GS             PIC X(002) VALUE "GS".
106500    05 C-KKA4AP                   PIC X(008) VALUE "KKA4AP".
106600    05 C-AUF-AUFRUF-AL            PIC X(040) VALUE "AUFRUF-AL".
106700    05 C-1                        PIC 9(001) VALUE 1.
106800    05 C-J                        PIC X(001) VALUE "J".
106900    05 C-N                        PIC X(001) VALUE "N".
107000    05 C-STAT-GESCHL              PIC X(001) VALUE "8".
107100/---------------------------------------------------------------*
107200* CGSDZS                                                        *
107300*---------------------------------------------------------------*
107400 01 CGSDZS-DEFINITIONEN.
107500    05 C-DZS-ZPKINS               PIC X(040) VALUE "ZPKINS".
107600    05 C-DZS-ZPKUPDC              PIC X(040) 
107700                                  VALUE "ZKAAPO_MAN_ZPKUPDC".
107800    05 C-DZS-ZPKUPD               PIC X(040) VALUE "ZPKUPD".
107900    05 C-DZS-ZKAAPO-U1-SCHLIESS   PIC X(040) 
108000                                  VALUE "ZKAAPO_U1_SCHLIESS".
108100    05 C-DZS-ZKAAPO-U-FREI        PIC X(040) 
108200                                  VALUE "ZKAAPO_U_FREI".
108300    05 C-DZS-ZKAAPO-U-ABLE        PIC X(040) 
108400                                  VALUE "ZKAAPO_U_ABLE".
108500    05 C-DZS-ZKAAPO-U-AUFH        PIC X(040) 
108600                                  VALUE "ZKAAPO_U_AUFH".
108700    05 C-DZS-ZKAAPO-COUNT-PRF1    PIC X(040) 
108800                                  VALUE "ZKAAPO_COUNT_PRF1".
108900    05 C-DZS-ZKAAPO-DEL-REO       PIC X(040)
109000                                  VALUE "ZKAAPO_DEL_REO".
109100    05 C-OBJEKT-BKAAPO            PIC X(018) VALUE "BKAAPO".
109200    05 H-ZUGRIFFSNAME             PIC X(040) VALUE SPACE.
109300    05 H-ZUGRIFFS-NAME            PIC X(018) VALUE SPACE.
109400    05 H-ZUGRIFFS-OPTION          PIC X(005) VALUE SPACE.
109500    05 H-NEXT                     PIC X(005) VALUE "_NEXT".
109600 COPY CGSODZSC.
109700/---------------------------------------------------------------*
109800* CGSMEL                                                        *
109900*---------------------------------------------------------------*
110000 01 CGSMEL-DEFINITIONEN.
110100     05 C-MEL-EINTRAGEN           PIC X(040) VALUE "EINTRAGEN".
110200     05 C-MEL-AUSTRAGEN           PIC X(040) VALUE "AUSTRAGEN".
110300     05 C-OBJEKT-MEL-GSPOOL       PIC X(006) VALUE SPACE.
110400/---------------------------------------------------------------*
110500* CGSTAB                                                        *
110600*---------------------------------------------------------------*
110700 01 CGSTAB-DEFINITIONEN.
110800     05 C-OBJEKT-LOG-NAME         PIC X(009) VALUE "KA00INSTA".
110900     05 C-OBJEKT-TAB-ANMELDEDATEN PIC X(020) VALUE "ANMELDEDATEN".
111000     05 C-TAB-LESEN-ZEILE         PIC X(040) VALUE "LESEN-ZEILE".
111100     05 C-TAB-LESEN-EQUAL         PIC X(040) VALUE "LESEN-EQUAL".
111200     05 C-TAB-ANM-DAT-LESEN       PIC X(040) VALUE
111300                                  "ANM-DAT-LESEN".
111400/---------------------------------------------------------------*
111500* Hilfsfelder                                                   *
111600*---------------------------------------------------------------*
111700 01 C-STATI.
111800     05 C-STATUS-ABGELEHNT        PIC 9(001) VALUE 6.
111900     05 C-STATUS-GESCHLOSSEN      PIC 9(001) VALUE 8.
112000     05 C-STATUS-AUFGEHOBEN       PIC 9(001) VALUE 9.
112100/---------------------------------------------------------------*
112200* Plausiprüfungen mit TKAPRF                                    *
112300*---------------------------------------------------------------*
112400 01 KONSTANTE-TKAPRF.
112500   05 C-TKAPRF-01-INT-PRF-ALLG    PIC X(040)
112600                                  VALUE "TKAPRF-01-INT-PRF-ALLG".
112700   05 C-TKAPRF                    PIC X(008) VALUE "TKAPRF".
112800 COPY CKAIPRF.
112900/---------------------------------------------------------------*
113000*   LOKALE ARBEITSFELDER                                        *
113100*---------------------------------------------------------------*
113200 LOCAL-STORAGE SECTION.
113300/---------------------------------------------------------------*
113400* Meldungsschnittstelle                                         *
113500*---------------------------------------------------------------*
113600 COPY CGSOMEL.
113700 COPY CGSTMEL.
113800/---------------------------------------------------------------*
113900* Benutzersatz Abstimmposition und Eingabebereich               *
114000*---------------------------------------------------------------*
114100 COPY CBKAAPO.
114200 COPY CKAIAPO.
114300 COPY CKAOAPO.
114400/---------------------------------------------------------------*
114500* Meldungstabelle                                               *
114600*---------------------------------------------------------------*
114700 COPY CGSI0MEL.
114800 COPY CGSO0MEL.
114900/---------------------------------------------------------------*
115000* Anmeldedaten                                                  *
115100*---------------------------------------------------------------*
115200 COPY CGSO0ANM.
115300* Uebergabeparameter fuer CGSTAB                                *
115400*---------------------------------------------------------------*
115500 COPY CGSTTAB.
115600/---------------------------------------------------------------*
115700* Hilfsfelder                                                   *
115800*---------------------------------------------------------------*
115900 01 H-MELDUNGS-OBJEKT             PIC X(006).
116000 01 H-FUNKTION.
116100     05 H-FUNKTION-MLD            PIC X(020).
116200     05 H-FUNKTION-REST           PIC X(020).
116300 01 DUMMY                         PIC X(001).
116400/****************************************************************
116500 LINKAGE SECTION.
116600*****************************************************************
116700*---------------------------------------------------------------*
116800* Funktion                                                      *
116900*---------------------------------------------------------------*
117000 01 AUF-FUNKTION                  PIC X(040).
117100*---------------------------------------------------------------*
117200* Konfigurations-Kennzeichen                                    *
117300*---------------------------------------------------------------*
117400 01 KONFIG-ID                     PIC X(002).
117500*---------------------------------------------------------------*
117600* Auftragsname                                                  *
117700*---------------------------------------------------------------*
117800 01 OBJEKT-AUFTRAGS-ID            PIC X(020).
117900*---------------------------------------------------------------*
118000* VerstAendigungsbereich des Aufrufers                          *
118100*---------------------------------------------------------------*
118200 COPY CGSOVER.
118300*---------------------------------------------------------------*
118400* Eingabebereich fuer den StandAlone-Auftrag KKA4AP             *
118500*---------------------------------------------------------------*
118600 01 LS-EINGABEBEREICH             PIC X(001).                      
118700 01 LS-EIN-BER-01                 REDEFINES LS-EINGABEBEREICH. 
118800     COPY CKAI4AP1                REPLACING 01 BY 05,
118900                                  ==(01)== BY ==(01)==.
119000 01 LS-EIN-BER-02                 REDEFINES LS-EINGABEBEREICH. 
119100     COPY CKAI4AP2                REPLACING 01 BY 05,
119200                                  ==(01)== BY ==(01)==.
119300 01 LS-EIN-BER-04                 REDEFINES LS-EINGABEBEREICH. 
119400     COPY CKAI4AP4                REPLACING 01 BY 05,
119500                                  ==(01)== BY ==(01)==.
119600 01 LS-EIN-BER-A                  REDEFINES LS-EINGABEBEREICH. 
119700     COPY CKAI4APU                REPLACING 01 BY 05,
119800                                  ==(01)== BY ==(01)==.
119900 01 LS-EIN-BER-A                  REDEFINES LS-EINGABEBEREICH. 
120000     COPY CKAI4AP5                REPLACING 01 BY 05,
120100                                  ==(01)== BY ==(01)==.
120200*---------------------------------------------------------------*
120300* DUMMYS                                                        *
120400*---------------------------------------------------------------*
120500 01 AB-DUMMY                      PIC X(001).
120600 01 TB-DUMMY                      PIC X(001).
120700*---------------------------------------------------------------*
120800* Indices                                                       *
120900*---------------------------------------------------------------*
121000 COPY CKAXIND.
121100*---------------------------------------------------------------*
121200* Zusätzlicher Eingabebereich                                   *
121300*---------------------------------------------------------------*
121400 01 LS-CKAIAPO                    PIC X(001). 
121500/
121600 PROCEDURE DIVISION
121700     USING AUF-FUNKTION
121800           KONFIG-ID
121900           OBJEKT-AUFTRAGS-ID
122000           GSOVER-VERSTAENDIGUNGSBEREICH
122100           LS-EINGABEBEREICH
122200           AB-DUMMY
122300           TB-DUMMY
122400           KAXIND-INDICES
122500           LS-CKAIAPO
122600           .
122700/---------------------------------------------------------------*
122800* Hier wird die Steuerung des KORDOBA-Auftrags durchgefuehrt    *
122900*---------------------------------------------------------------*
123000 STEUER-KKA4AP SECTION.
123100 STEUER-KKA4AP-1001.
123200     PERFORM INITIALISIERUNG
123300     EVALUATE KAI4AP1-FUNKTION
123400     WHEN C-01-INT-ANL-APO
123500       PERFORM VERARB-ANL
123600     WHEN C-01-INT-AEN-APO-UCHK
123700       PERFORM VERARB-UCHK
123800     WHEN C-01-INT-AEN-APO-SCHL-1
123900       PERFORM VERARB-APO-SCHL1
124000     WHEN C-01-INT-AEN-APO-FREI
124100     WHEN C-01-INT-AEN-APO-ABLE
124200     WHEN C-01-INT-AEN-APO-AUFH
124300       PERFORM VERARB-APO-AEND
124400     WHEN C-01-INT-UPD-SR
124500       PERFORM VERARB-APO-UPD
124600     WHEN C-01-INT-LOE-APO-Z-SCH           
124700       PERFORM VERARB-APO-LOE
124800     WHEN OTHER
124900* KA5002: @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@
125000       MOVE C-OBJEKT-KA5002       TO H-MELDUNGS-OBJEKT
125100       MOVE C-KKA4AP              TO GSTMEL-VAR-TEXT-1
125200       MOVE KAI4AP1-FUNKTION      TO H-FUNKTION
125300       MOVE H-FUNKTION-MLD        TO GSTMEL-VAR-TEXT-2
125400       PERFORM MELDUNG-EINTRAGEN
125500       GO TO PROGRAMM-VERLASSEN
125600     END-EVALUATE
125700     .
125800 STEUER-KKA4AP-1002.
125900     GO TO PROGRAMM-VERLASSEN.
126000/---------------------------------------------------------------*
126100* Neuanlage                                                     *
126200*---------------------------------------------------------------*
126300 VERARB-ANL SECTION.
126400 VERARB-ANL-1001.
126500*     
126600     PERFORM PRUEFEN-ANL
126700*
126800     MOVE C-DZS-ZPKINS            TO H-ZUGRIFFSNAME
126900* 
127000     PERFORM BKAAPO-FUELLEN
127100     PERFORM ZUGRIFF-APO
127200     .
127300 VERARB-ANL-1002.
127400     EXIT.
127500/---------------------------------------------------------------*
127600* Prüfen der Eingabeparamter bei Neuanlage                      *
127700*---------------------------------------------------------------*
127800 PRUEFEN-ANL SECTION.
127900 PRUEFEN-ANL-1001.
128000*
128100     MOVE C-TKAPRF-01-INT-PRF-ALLG
128200       TO KAIPRF-FUNKTION
128300     MOVE HIGH-VALUE              TO KAIPRF-PRUEFFELDER
128400*
128500     MOVE KAI4AP1-APO-ABSTIMMKREIS-NR
128600       TO KAIPRF-ABSTIMMKREIS-NR
128700*
128800     MOVE KAI4AP1-APO-BETRAG    TO KAIPRF-BETRAG
128900     MOVE KAI4AP1-APO-BUTAG       TO KAIPRF-BUTAG
129000     MOVE KAI4AP1-APO-VALUTA      TO KAIPRF-VALUTA
129100     MOVE KAI4AP1-APO-ZUSATZ-TXT-SL 
129200       TO KAIPRF-ZUSATZ-TXT-SL
129300     MOVE KAI4AP1-APO-PRIMANOTA TO KAIPRF-PRIMANOTA      
129400*
129500***  MOVE KAI4AP1-APO-ABSTIMMKREIS-TYP
129600***    TO KAIPRF-ABSTIMMKREIS-TYP
129700     MOVE KAI4AP1-APO-STATUS      TO KAIPRF-STATUS
129800***  MOVE KAI4AP1-APO-FACHBEREICH 
129900***    TO KAIPRF-FACHBEREICH
130000*
130100     CALL "TKAPRF"
130200          USING  C-AUF-AUFRUF-AL
130300          C-KONFIG-ID-KA
130400          C-TKAPRF
130500          GSOVER-VERSTAENDIGUNGSBEREICH
130600          KAIPRF-EINGABEBEREICH
130700          DUMMY
130800          DUMMY
130900          KAXIND-INDICES
131000     END-CALL
131100*
131200     IF GSOVER-GEWICHT            > C-GEW-ZUSTAND
131300     THEN
131400       GO TO PROGRAMM-VERLASSEN
131500     END-IF
131600     .
131700 PRUEFEN-ANL-1002.
131800     EXIT.
131900/---------------------------------------------------------------*
132000* Änderung einer APO bei Schließung                             *
132100*---------------------------------------------------------------*
132200 VERARB-APO-SCHL1 SECTION.
132300 VERARB-APO-SCHL1-1001.
132400*     
132500     PERFORM PRUEFEN-SCHL1
132600*
132700     MOVE C-DZS-ZKAAPO-U1-SCHLIESS
132800       TO H-ZUGRIFFSNAME
132900* 
133000     MOVE KAI4AP2-ABSTIMMKREIS-NR 
133100       TO KAIAPO-U1S-ABSTIMMKREIS-NR  
133200     MOVE KAI4AP2-HERKUNFT 
133300       TO KAIAPO-U1S-HERKUNFT
133400     MOVE KAI4AP2-KONTO-ID-ABSTIMM 
133500       TO KAIAPO-U1S-KONTO-ID-ABSTIMM
133600     MOVE KAI4AP2-AUSZUGSDATUM 
133700       TO KAIAPO-U1S-AUSZUGSDATUM
133800     MOVE KAI4AP2-AUSZUGSNUMMER 
133900       TO KAIAPO-U1S-AUSZUGSNUMMER 
134000     MOVE KAI4AP2-AUSZUG-FNR  
134100       TO KAIAPO-U1S-FOLGENUMMER
134200     MOVE KAI4AP2-LFD-NR-APO
134300       TO KAIAPO-U1S-TRANSAKT-LFD-NR
134400*
134500     MOVE KAI4AP2-STATUS
134600       TO KAIAPO-U1S-STATUS 
134700     MOVE KAI4AP2-SCHLIESSUNGSNR 
134800       TO KAIAPO-U1S-SCHLIESSUNGSNUMMER
134900     MOVE KAI4AP2-SCHLIESSUNGSART 
135000       TO KAIAPO-U1S-SCHLIESSUNGSART
135100     MOVE KAI4AP2-TIMESTAMP 
135200       TO KAIAPO-U1S-TIMESTAMP-SCHLIESS 
135300     MOVE KAI4AP2-USER 
135400       TO KAIAPO-U1S-USER-SCHLIESS 
135500*
135600     PERFORM ZUGRIFF-APO
135700     .
135800 VERARB-APO-SCHL1-1002.
135900     EXIT.
136000/---------------------------------------------------------------*
136100* Prüfen der Eingabeparamter bei Neuanlage                      *
136200*---------------------------------------------------------------*
136300 PRUEFEN-SCHL1 SECTION.
136400 PRUEFEN-SCHL1-1001.
136500*
136600     MOVE C-TKAPRF-01-INT-PRF-ALLG
136700       TO KAIPRF-FUNKTION
136800     MOVE HIGH-VALUE              TO KAIPRF-PRUEFFELDER
136900*
137000     MOVE KAI4AP2-ABSTIMMKREIS-NR
137100       TO KAIPRF-ABSTIMMKREIS-NR
137200     MOVE KAI4AP2-STATUS          TO KAIPRF-STATUS
137300*
137400     CALL "TKAPRF"
137500          USING  C-AUF-AUFRUF-AL
137600          C-KONFIG-ID-KA
137700          C-TKAPRF
137800          GSOVER-VERSTAENDIGUNGSBEREICH
137900          KAIPRF-EINGABEBEREICH
138000          DUMMY
138100          DUMMY
138200          KAXIND-INDICES
138300     END-CALL
138400*
138500     IF GSOVER-GEWICHT            > C-GEW-ZUSTAND
138600     THEN
138700       GO TO PROGRAMM-VERLASSEN
138800     END-IF
138900     .
139000 PRUEFEN-SCHL1-1002.
139100     EXIT.
139200/---------------------------------------------------------------*
139300* Änderung mit Update-Check                                     *
139400*---------------------------------------------------------------*
139500 VERARB-UCHK SECTION.
139600 VERARB-UCHK-1001.
139700*    gleiches Copy und gleiche Prüfungen wie bei Anlage
139800     PERFORM PRUEFEN-ANL
139900*     
140000     MOVE C-DZS-ZPKUPDC           TO H-ZUGRIFFSNAME
140100* 
140200     PERFORM BKAAPO-FUELLEN
140300     PERFORM ZUGRIFF-APO
140400     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
140500     THEN
140600*      KA4856 Die Daten wurden nicht gespeichert
140700       MOVE C-OBJEKT-KA4856       TO H-MELDUNGS-OBJEKT
140800       PERFORM MELDUNG-EINTRAGEN
140900       GO TO PROGRAMM-VERLASSEN
141000     END-IF
141100     .
141200 VERARB-UCHK-1002.
141300     EXIT.
141400/---------------------------------------------------------------*
141500* APO Massenänderung                                            *
141600*---------------------------------------------------------------*
141700 VERARB-APO-AEND SECTION.
141800 VERARB-APO-AEND-1001.
141900*     
142000     EVALUATE KAI4AP1-FUNKTION
142100     WHEN C-01-INT-AEN-APO-FREI
142200       MOVE C-DZS-ZKAAPO-U-FREI
142300         TO H-ZUGRIFFSNAME
142400     WHEN C-01-INT-AEN-APO-ABLE
142500       MOVE C-DZS-ZKAAPO-U-ABLE
142600         TO H-ZUGRIFFSNAME
142700     WHEN C-01-INT-AEN-APO-AUFH
142800       MOVE C-DZS-ZKAAPO-U-AUFH
142900         TO H-ZUGRIFFSNAME    
143000     WHEN OTHER
143100       CONTINUE
143200     END-EVALUATE
143300*
143400     MOVE KAI4AP4-SCHLIESSUNGSNR  
143500       TO KAIAPO-UFR-SCHLIESSUNGSNUMMER 
143600     MOVE KAI4AP4-TIMESTAMP       TO KAIAPO-UFR-TIMESTAMP-FREIGABE
143700     MOVE KAI4AP4-USER            TO KAIAPO-UFR-USER-FREIGABE
143800*    alle APOs ändern
143900     PERFORM ZUGRIFF-APO
144000     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
144100     THEN
144200
144300       EVALUATE KAI4AP1-FUNKTION
144400       WHEN C-01-INT-AEN-APO-FREI
144500*        KA4852 Die Freigabe wurde nicht durchgeführt
144600         MOVE C-OBJEKT-KA4852     TO H-MELDUNGS-OBJEKT
144700       WHEN C-01-INT-AEN-APO-ABLE
144800*        KA4853 Die Ablehnung wurde nicht durchgeführt
144900         MOVE C-OBJEKT-KA4853     TO H-MELDUNGS-OBJEKT
145000       WHEN C-01-INT-AEN-APO-AUFH
145100*        KA4851 Die Aufhebung wurde nicht durchgeführt
145200         MOVE C-OBJEKT-KA4851     TO H-MELDUNGS-OBJEKT
145300       WHEN OTHER
145400         CONTINUE
145500       END-EVALUATE
145600       PERFORM MELDUNG-EINTRAGEN
145700       GO TO PROGRAMM-VERLASSEN
145800
145900*      KA4856 Die Daten wurden nicht gespeichert
146000       MOVE C-OBJEKT-KA4856       TO H-MELDUNGS-OBJEKT
146100       PERFORM MELDUNG-EINTRAGEN
146200       GO TO PROGRAMM-VERLASSEN
146300     END-IF
146400*    Prüf-Zugriff
146500     MOVE KAI4AP4-SCHLIESSUNGSNR
146600       TO KAIAPO-CPR-SCHLIESSUNGSNUMMER
146700*
146800     EVALUATE KAI4AP1-FUNKTION
146900     WHEN C-01-INT-AEN-APO-FREI
147000       MOVE C-STATUS-GESCHLOSSEN  TO KAIAPO-CPR-STATUS-PRUEF
147100     WHEN C-01-INT-AEN-APO-ABLE
147200       MOVE C-STATUS-ABGELEHNT    TO KAIAPO-CPR-STATUS-PRUEF
147300     WHEN C-01-INT-AEN-APO-AUFH
147400       MOVE C-STATUS-AUFGEHOBEN   TO KAIAPO-CPR-STATUS-PRUEF
147500     WHEN OTHER
147600       CONTINUE
147700     END-EVALUATE
147800*
147900     MOVE C-DZS-ZKAAPO-COUNT-PRF1 TO H-ZUGRIFFSNAME
148000     PERFORM ZUGRIFF-APO
148100     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
148200     THEN
148300*      KA5007 (DB-Fehler)
148400       MOVE C-OBJEKT-KA5007       TO H-MELDUNGS-OBJEKT
148500       PERFORM MELDUNG-EINTRAGEN
148600       GO TO PROGRAMM-VERLASSEN
148700     END-IF
148800*    wenn Count-Ergebnis > 0, KA4857
148900     IF KAOAPO-C-ROW-COUNTER      > ZERO
149000     THEN
149100       EVALUATE KAI4AP1-FUNKTION
149200       WHEN C-01-INT-AEN-APO-FREI
149300         MOVE C-OBJEKT-KA4857     TO H-MELDUNGS-OBJEKT
149400       WHEN C-01-INT-AEN-APO-ABLE
149500         MOVE C-OBJEKT-KA4859     TO H-MELDUNGS-OBJEKT
149600       WHEN C-01-INT-AEN-APO-AUFH
149700         MOVE C-OBJEKT-KA4858     TO H-MELDUNGS-OBJEKT
149800       WHEN OTHER
149900         CONTINUE
150000       END-EVALUATE
150100       PERFORM MELDUNG-EINTRAGEN
150200       GO TO PROGRAMM-VERLASSEN
150300     END-IF
150400     .
150500 VERARB-APO-AEND-1002.
150600     EXIT.
150700/---------------------------------------------------------------*
150800* Update für Schließregelverarbeitung                           *
150900*---------------------------------------------------------------*
151000 VERARB-APO-UPD SECTION.
151100 VERARB-APO-UPD-1001.
151200*
151300     CALL "CGSDZS"
151400     USING KAI4APU-DZS-ZUGRIFFSNAME
151500           KAI4APU-DZS-KONFIGURATIONS-ID
151600           C-OBJEKT-BKAAPO
151700           GSOVER-VERSTAENDIGUNGSBEREICH
151800           LS-CKAIAPO
151900           KAOAPO-AUSGABEBEREICH
152000           KAAPO-BENUTZERSATZ
152100     END-CALL
152200
152300     EVALUATE GSOVER-GEWICHT
152400       WHEN C-GEW-NICHT-GESETZT
152500         CONTINUE
152600       WHEN C-GEW-ZUSTAND
152700         CONTINUE
152800       WHEN OTHER
152900*        Abbruchfehler in Datenbasis
153000         GO TO PROGRAMM-VERLASSEN
153100     END-EVALUATE
153200     .
153300 VERARB-APO-UPD-1002.
153400     EXIT.
153500/---------------------------------------------------------------*
153600* Löschen aller APO's zu einer Schliessung                      *
153700*---------------------------------------------------------------*
153800 VERARB-APO-LOE SECTION.
153900 VERARB-APO-LOE-1001.
154000*
154100     MOVE KAI4AP5-S-SCHLIESSUNGSNUMMER  
154200                                  TO KAIAPO-DR-SCHLIESSUNGSNUMMER
154300     MOVE C-STAT-GESCHL           TO KAIAPO-DR-STATUS
154400* alle APO's zur Schließung löschen                                                                                        
154500     CALL "CGSDZS"
154600     USING C-DZS-ZKAAPO-DEL-REO
154700           C-KONFIG-ID-KA
154800           C-OBJEKT-BKAAPO
154900           GSOVER-VERSTAENDIGUNGSBEREICH
155000           KAIAPO-EINGABEBEREICH
155100           KAOAPO-AUSGABEBEREICH
155200           KAAPO-BENUTZERSATZ
155300     END-CALL
155400
155500     EVALUATE GSOVER-GEWICHT
155600       WHEN C-GEW-NICHT-GESETZT
155700         CONTINUE
155800       WHEN C-GEW-ZUSTAND
155900         CONTINUE
156000       WHEN OTHER
156100*        Abbruchfehler in Datenbasis
156200         GO TO PROGRAMM-VERLASSEN
156300     END-EVALUATE
156400     .
156500 VERARB-APO-LOE-1002.
156600     EXIT.
156700/---------------------------------------------------------------*
156800* Datenzugriffsschicht                                          *
156900*---------------------------------------------------------------*
157000 ZUGRIFF-APO SECTION.
157100 ZUGRIFF-APO-1001.
157200*
157300     CALL "CGSDZS"
157400     USING H-ZUGRIFFSNAME
157500           C-KONFIG-ID-KA
157600           C-OBJEKT-BKAAPO
157700           GSOVER-VERSTAENDIGUNGSBEREICH
157800           KAIAPO-EINGABEBEREICH
157900           KAOAPO-AUSGABEBEREICH
158000           KAAPO-BENUTZERSATZ
158100     END-CALL
158200*
158300     IF GSOVER-GEWICHT            >= C-GEW-FEHLER
158400     THEN
158500* Abbruchfehler -> Verlassen des Programms
158600       GO TO PROGRAMM-VERLASSEN
158700     END-IF
158800     .
158900 ZUGRIFF-APO-1002.
159000     EXIT.
159100/---------------------------------------------------------------*
159200* Ausgabebereich füllen KAO5AP1                                 *
159300*---------------------------------------------------------------*
159400 BKAAPO-FUELLEN SECTION.
159500 BKAAPO-FUELLEN-1001.
159600*
159700     MOVE KAI4AP1-APO-ABSTIMMKREIS-NR 
159800       TO APO-ABSTIMMKREIS-NR
159900     MOVE KAI4AP1-APO-HERKUNFT 
160000       TO APO-HERKUNFT
160100     MOVE KAI4AP1-APO-KONTO-ID-ABSTIMM 
160200       TO APO-KONTO-ID-ABSTIMM
160300     MOVE KAI4AP1-APO-AUSZUGSDATUM 
160400       TO APO-AUSZUGSDATUM
160500     MOVE KAI4AP1-APO-AUSZUGSNUMMER 
160600       TO APO-AUSZUGSNUMMER
160700     MOVE KAI4AP1-APO-AUSZUG-FNR  
160800       TO APO-FOLGENUMMER
160900     MOVE KAI4AP1-APO-LFD-NR-APO 
161000       TO APO-TRANSAKT-LFD-NR
161100*
161200     MOVE KAI4AP1-APO-APO-NACHRICHTENTYP 
161300       TO APO-NACHRICHTENTYP
161400     MOVE KAI4AP1-APO-REF-NACHRICHT 
161500       TO APO-REF-NACHRICHT
161600     MOVE KAI4AP1-APO-TRANSAKTION-TYP 
161700       TO APO-TRANSAKT-TYP
161800     MOVE KAI4AP1-APO-BETRAG 
161900       TO APO-BETRAG
162000     MOVE KAI4AP1-APO-WAEHRUNG 
162100       TO APO-WAE-BETRAG
162200     MOVE KAI4AP1-APO-BUTAG 
162300       TO APO-BUCHUNGSDATUM
162400     MOVE KAI4AP1-APO-VALUTA 
162500       TO APO-VALUTADATUM
162600     MOVE KAI4AP1-APO-REF-KONTOFUEHRER 
162700       TO APO-REF-KONTOFUEHRER
162800     MOVE KAI4AP1-APO-REF-KONTOINH 
162900       TO APO-REF-KONTOINHABER    
163000     MOVE KAI4AP1-APO-ERG-TEXT 
163100       TO APO-ERGAENZUNGSTEXT
163200     MOVE KAI4AP1-APO-GV-CODE 
163300       TO APO-GESCH-VORFALL-CODE
163400     MOVE KAI4AP1-APO-ZUSATZ-TXT-SL 
163500       TO APO-ZUSATZTEXT-SL
163600     MOVE KAI4AP1-APO-PRIMANOTA 
163700       TO APO-PRIMANOTA
163800     MOVE KAI4AP1-APO-STORNO-KZ 
163900       TO APO-STORNO-KZ
164000     MOVE KAI4AP1-APO-TRANSAKTION-ID 
164100       TO APO-TRANSAKT-ID
164200     MOVE KAI4AP1-APO-TRANSAKTION-ID-FS
164300       TO APO-TRANSAKT-ID-FRESYS
164400     MOVE KAI4AP1-APO-ISIN 
164500       TO APO-ISIN
164600     MOVE KAI4AP1-APO-NENNWERT 
164700       TO APO-NENNWERT
164800     MOVE KAI4AP1-APO-GEGEN-KONTO-ID 
164900       TO APO-GEGENKONTO-ID
165000     MOVE KAI4AP1-APO-REMOTE-KONTO-ID 
165100       TO APO-REMOTE-KONTO-ID
165200     MOVE KAI4AP1-APO-KONTO-ID-ORIG 
165300       TO APO-ORGINALKONTO-ID
165400     MOVE KAI4AP1-APO-VERWENDUNGSZWECK 
165500       TO APO-VERWENDUNGSZWECK    
165600*
165700     MOVE KAI4AP1-APO-ABSTIMMKREIS-TYP 
165800       TO APO-ABSTIMMKREIS-TYP
165900     MOVE KAI4AP1-APO-STATUS 
166000       TO APO-STATUS
166100     MOVE KAI4AP1-APO-SCHLIESSUNGSNR 
166200       TO APO-SCHLIESSUNGSNUMMER
166300     MOVE KAI4AP1-APO-SCHLIESSUNGSART 
166400       TO APO-SCHLIESSUNGSART
166500     MOVE KAI4AP1-APO-FACHBEREICH 
166600       TO APO-ZUST-FACHBEREICH
166700     MOVE KAI4AP1-APO-BEMERKUNG 
166800       TO APO-BEMERKUNG-APO
166900     MOVE KAI4AP1-APO-BETRAG-ABSOLUT 
167000       TO APO-BETRAG-ABSOLUTWERT
167100     MOVE KAI4AP1-APO-DATEINR 
167200       TO APO-DATEINUMMER
167300     MOVE KAI4AP1-APO-TIMESTAMP-ANL 
167400       TO APO-TIMESTAMP-NEUANL
167500     MOVE KAI4AP1-APO-TIMESTAMP-SCHLIESS 
167600       TO APO-TIMESTAMP-SCHLIESS
167700     MOVE KAI4AP1-APO-USER-SCHLIESS 
167800       TO APO-USER-SCHLIESS
167900     MOVE KAI4AP1-APO-TIMESTAMP-FREI 
168000       TO APO-TIMESTAMP-FREIGABE
168100     MOVE KAI4AP1-APO-USER-FREI 
168200       TO APO-USER-FREIGABE
168300     MOVE KAI4AP1-APO-TIMESTAMP-ABLEHN 
168400       TO APO-TIMESTAMP-ABLEHNEN
168500     MOVE KAI4AP1-APO-USER-ABLEHN 
168600       TO APO-USER-ABLEHNEN
168700     MOVE KAI4AP1-APO-TIMESTAMP-AUFHEBEN 
168800       TO APO-TIMESTAMP-AUFHEBEN
168900     MOVE KAI4AP1-APO-USER-AUFHEBEN 
169000       TO APO-USER-AUFHEBEN
169100     MOVE KAI4AP1-APO-TIMESTAMP-BKAAPO 
169200       TO APO-BKAAPO-TIMESTAMP
169300          KAIAPO-BKAAPO-TIMESTAMP
169400     .
169500 BKAAPO-FUELLEN-1002.
169600     EXIT.
169700/---------------------------------------------------------------*
169800* Programminitialisierung                                       *
169900*---------------------------------------------------------------*
170000 INITIALISIERUNG SECTION.
170100 INITIALISIERUNG-1001.
170200     INITIALIZE                   GSTMEL-TRANSIENTER-BEREICH
170300     MOVE SPACE                   TO H-FUNKTION
170400*
170500     PERFORM LESEN-ANMELDEDATEN
170600     .
170700 INITIALISIERUNG-1002.
170800     EXIT.
170900/---------------------------------------------------------------*
171000* Lesen der Anmeldedaten                                        *
171100*---------------------------------------------------------------*
171200 LESEN-ANMELDEDATEN SECTION.
171300 LESEN-ANMELDEDATEN-1001.
171400     CALL "CGSTAB"
171500     USING C-TAB-ANM-DAT-LESEN
171600           C-KONFIG-ID-GS
171700           C-OBJEKT-TAB-ANMELDEDATEN
171800           GSOVER-VERSTAENDIGUNGSBEREICH
171900           DUMMY
172000           GSO0ANM-AUSGABEBEREICH
172100           GSTTAB-EIN-AUSGABEBEREICH
172200     END-CALL
172300
172400     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
172500     THEN
172600       GO TO PROGRAMM-VERLASSEN
172700     END-IF
172800      .
172900 LESEN-ANMELDEDATEN-1002.
173000     EXIT.
173100/---------------------------------------------------------------*
173200* Meldung eintragen                                             *
173300*---------------------------------------------------------------*
173400 MELDUNG-EINTRAGEN SECTION.
173500 MELDUNG-EINTRAGEN-1001.
173600     CALL "CGSMEL"
173700     USING C-MEL-EINTRAGEN
173800           C-KONFIG-ID-KA
173900           H-MELDUNGS-OBJEKT
174000           GSOVER-VERSTAENDIGUNGSBEREICH
174100           DUMMY
174200           GSOMEL-AUSGABEBEREICH
174300           GSTMEL-TRANSIENTER-BEREICH
174400     END-CALL
174500*
174600     IF GSOVER-GEWICHT            > C-GEW-FEHLER
174700     THEN
174800       GO TO PROGRAMM-VERLASSEN
174900     ELSE
175000       MOVE H-MELDUNGS-OBJEKT     TO GSOVER-RETURNCODE
175100     END-IF
175200     .
175300 MELDUNG-EINTRAGEN-1002.
175400     EXIT.
175500/*-------------------------------------------------------------*
175600* Meldungen aus Meldungspool loeschen.                         *
175700*--------------------------------------------------------------*
175800 MELDUNG-AUSTRAGEN SECTION.
175900 MELDUNG-AUSTRAGEN-1001.
176000     CALL "CGSMEL"
176100     USING C-MEL-AUSTRAGEN
176200           C-KONFIG-ID-KA
176300           C-OBJEKT-MEL-GSPOOL
176400           GSOVER-VERSTAENDIGUNGSBEREICH
176500           DUMMY
176600           GSOMEL-AUSGABEBEREICH
176700           GSTMEL-TRANSIENTER-BEREICH
176800
176900     IF GSOMEL-MAX-GEW > C-GEW-WARNUNG
177000     THEN
177100       GO TO PROGRAMM-VERLASSEN
177200     END-IF
177300     .
177400 MELDUNG-AUSTRAGEN-1002.
177500     EXIT.
177600/---------------------------------------------------------------*
177700* Verlassen des Programms ueber einen Ausstiegspunkt            *
177800*---------------------------------------------------------------*
177900 PROGRAMM-VERLASSEN SECTION.
178000 PROGRAMM-VERLASSEN-1001.
178100     EXIT PROGRAM.
178200 PROGRAMM-VERLASSEN-1002.
178300     EXIT.

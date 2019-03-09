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
000160*@Titel         : Pflege Abstimmkonten
000160*@Elementname   : kka4kt.cob
000160*@Elementtyp    : cob
000160*@Version       : k151-00002
000160*@Cr_Date       : 20141223.111259
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
001000*@Title        : Pflege Abstimmkonten                       *
001100* Verfasser    : Martin Schneider                           *
001200* Erstelldatum : 05.03.2012                                 *
001400*                                                           *
001500*@A-ELEMENTBESCHREIBUNG                                     *
001600* Modul-Beschreibung:                                       *
001700* ------------------                                        *
001800* In diesem KORDOBA Auftrag wird die Verarbeitung fuer die  *
001900* fachlichen Anforderungen                                  *
002000* - Pflege Abstimmkonten                                    *
002100* durchgefuehrt.                                            *
002200*                                                           *
002300*@E-ELEMENTBESCHREIBUNG                                     *
002400*                                                           *
002500*@A-FUNKTION-1                                              *
002600* Neuanlage eines Kontosatzes (Insert)                      *
002700*                                                           *
002800* Eingabefeldbelegungen:                                    *
002900* Funktion "01-INT-ANL-KTO"                                 *
003000* BKAAPO-Gesamtsatz                                         *
003100*                                                           *
003200*@E-FUNKTION-1                                              *
003300*                                                           *
003400*@A-FUNKTION-2                                              *
003500* Änderung eines Konto-Satzes (Update)                      *
003600*                                                           *
003700* Eingabefeldbelegungen:                                    *
003800* Funktion "01-INT-AEN-KTO"                                 *
003900* BKAAPO-Gesamtsatz                                         *
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
005200*                  7. Transienter Bereich    (I/O)          *
005300*                                                           *
005400* CALL "CGSAUF"                                             *
005500* USING C-AUF-AUFRUF-AL                                     *
005600*       C-KONFIG-ID-KA                                      *
005700*       C-OBJEKT-AUFTRAG-KKA4KT                             *
005800*       CGSOVER-VERSTAENDIGUNGSBEREICH                      *
005900*       KAI4KT1-EINGABEBEREICH                              *
006000*       KAO4KT1-AUSGABEBEREICH                              *
006100*                                                           *
006200*@E-MODULAUFRUF                                             *
006300*                                                           *
006400*@A-RETURNCODE                                              *
006500* Meldungen/Returncodes:                                    *
006600* ----------------------                                    *
006700*                                                           *
006800* Folgende Fehlermeldungen werden von diesem KORDOBA-Auftrag*
006900* zureckgegeben bzw. in den Meldungs-Pool eingetragen:      *
007000* KA0000 : Verarbeitung erfolgreich durchgeführt            *
007100*                                                           *
007200*@E-RETURNCODE                                              *
007300*                                                           *
007400*@A-ENTRY                                                   *
007500* Entryname       : KKA4KT                                  *
007600*                                                           *
007700*@E-ENTRY                                                   *
007800*                                                           *
007900*@A-MODUL                                                   *
008000* Gerufene Moduln/Auftraege:                                *
008100* CGSDZS   Datenzugriffsschicht                             *
008200* CGSMEL   Meldungsschnittstelle                            *
008300*                                                           *
008400*@E-MODUL                                                   *
008500*                                                           *
008600*@A-COBOL-COPY                                              *
008700* Benoetigte Cobol-Copies:                                  *
008800* CGSI0MEL: Eingabebereich Meldungstabelle                  *
008900* CGSO0MEL: Ausgabebereich Meldungstabelle                  *
009000* CGSOMEL : Ausgabebereich Meldungsschnittstelle            *
009100* CGSTMEL : transienter Bereich Meldungsschnittstelle       *
009200* CGSOVER : Verstaendigungsbereich                          *
009300* CGSTTAB : transienter Bereich Zugriff Parametertabellen   *
009400* CGSO0ANM: Copy fuer taskspez. Anmeldedaten                *
009500* CGSODZSC: Ausgabebereich CGSDZS                           *
009600* CKAI4KT1: Eingabebereich KKA4KT                           *
009700* DCTGRCGE: Meldungsgewichte                                *
009800* CBKAKTO : Benutzersatz Abstimmkonten                      *
009900* CKAOKTO : Ausgabebereich ZKAKTO                           *
010000*                                                           *
010100*@E-COBOL-COPY                                              *
010200*                                                           *
010300*@A-TABELLE                                                 *
010400* TABEX-Tabellen  :                                         *
010500*                                                           *
010600*@E-TABELLE                                                 *
010700*                                                           *
010800*@A-BENUTZERSATZ                                            *
010900* Benutzersaetze  : <benutzersatz> (I/O/IO)                 *
011000* BKAKTO (O):   Abstimmkonten                               *
011100*                                                           *
011200*@E-BENUTZERSATZ                                            *
011300*                                                           *
011400*@A-DATEI                                                   *
011500* Dateien         : entfallen                               *
011600*                                                           *
011700*@E-DATEI                                                   *
011800*                                                           *
011900*@A-KONVENTIONEN                                            *
012000*@E-KONVENTIONEN                                            *
012100*                                                           *
012200*@A-DOKUMENT                                                *
012300* Die fachliche Beschreibung ist im Dokument                *
012400* - C24_K12.01_Fachkonzept_Kontoabstimmung.docx             *
012500* hinterlegt.                                               *
012600*@E-DOKUMENT                                                *
012700*                                                           *
090000* AENDERUNGSPROTOKOLL:                                      *
090050* --------------------                                      *
      * E01 R77134                                                *     E01
      *     Korrektur bei bisher nicht aktivierter Prüf-Routine   *     E01
      *     für die Prüfung der Kontonummer gegen die KA000AKKTO. *     E01
      *     Datum: 14.12.2014                            NKZ: SUM *     E01
090054*                                                           *     E01
      * This Version has been modified to meet KOJAK requirements       CCC
      * at March 1st 2017                                               CCC
100000* ENDE ELEMENTKOPF ****************************************%*
100100/
100200 IDENTIFICATION DIVISION.
100300 PROGRAM-ID. KKA4KT.
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
101550     05  FILLER PIC X(13) VALUE "ELEM=kka4kt  ".                  CCC
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
103300    05 C-OBJEKT-KA4070            PIC X(006) VALUE "KA4070".
103400    05 C-OBJEKT-KA4856            PIC X(006) VALUE "KA4856".
103500    05 C-OBJEKT-KA5002            PIC X(006) VALUE "KA5002".
103600/---------------------------------------------------------------*
103700* Lokale Konstante fuer KORDOBA-Auftrag KKA4KT                  *
103800*---------------------------------------------------------------*
103900 01 KONSTANTE-KKA4KT.
104000    05 C-01-INT-ANL-KTO           PIC X(040) VALUE
104100                                  "01-INT-ANL-KTO".
104200    05 C-01-INT-AEN-KTO           PIC X(040) VALUE
104300                                  "01-INT-AEN-KTO".
104400    05 C-KONFIG-ID-KA             PIC X(002) VALUE "KA".
104500    05 C-KONFIG-ID-GS             PIC X(002) VALUE "GS".
104600    05 C-KKA4KT                   PIC X(008) VALUE "KKA4KT".
104700    05 C-AUF-AUFRUF-AL            PIC X(040) VALUE "AUFRUF-AL".
      *    ABSTIMM-ART (Geldkonto- oder Wertpapierabstimmung")          E01
           05 C-GELDKTO-UMSATZ-ABSTIMM  PIC X(002) VALUE "GU".          E01
104800/---------------------------------------------------------------*
104900* CGSDZS                                                        *
105000*---------------------------------------------------------------*
105100 01 CGSDZS-DEFINITIONEN.
105200    05 C-DZS-ZPKINS               PIC X(040) VALUE "ZPKINS".
105300    05 C-DZS-ZPKUPDC              PIC X(040) 
105400                                  VALUE "KAKTO_MAN_ZPKUPDC".
105500    05 C-OBJEKT-BKAKTO            PIC X(018) VALUE "BKAKTO".
105600    05 H-ZUGRIFFSNAME             PIC X(040) VALUE SPACE.
105700 COPY CGSODZSC.
105800/---------------------------------------------------------------*
105900* CGSMEL                                                        *
106000*---------------------------------------------------------------*
106100 01 CGSMEL-DEFINITIONEN.
106200     05 C-MEL-EINTRAGEN           PIC X(040) VALUE "EINTRAGEN".
106300     05 C-MEL-AUSTRAGEN           PIC X(040) VALUE "AUSTRAGEN".
106400     05 C-OBJEKT-MEL-GSPOOL       PIC X(006) VALUE SPACE.
106500/---------------------------------------------------------------*
106600* CGSTAB                                                        *
106700*---------------------------------------------------------------*
106800 01 CGSTAB-DEFINITIONEN.
106900     05 C-OBJEKT-LOG-NAME         PIC X(009) VALUE "KA00INSTA".
107000     05 C-OBJEKT-TAB-ANMELDEDATEN PIC X(020) VALUE "ANMELDEDATEN".
107100     05 C-TAB-LESEN-ZEILE         PIC X(040) VALUE "LESEN-ZEILE".
107200     05 C-TAB-LESEN-EQUAL         PIC X(040) VALUE "LESEN-EQUAL".
107300     05 C-TAB-ANM-DAT-LESEN       PIC X(040) VALUE
107400                                  "ANM-DAT-LESEN".
107500     05 C-OBJEKT-TAB-KA01AKKTO    PIC X(009) VALUE "KA01AKKTO".   E01
107600/---------------------------------------------------------------*
107700*   LOKALE ARBEITSFELDER                                        *
107800*---------------------------------------------------------------*
107900 LOCAL-STORAGE SECTION.
108000/---------------------------------------------------------------*
108100* Meldungsschnittstelle                                         *
108200*---------------------------------------------------------------*
108300 COPY CGSOMEL.
108400 COPY CGSTMEL.
108500/---------------------------------------------------------------*
108600* Benutzersatz Abstimmkonten und Eingabebereich                 *
108700*---------------------------------------------------------------*
108800 COPY CBKAKTO.
108900 COPY CKAIKTO.
109000/---------------------------------------------------------------*
109100* Ein/ausgabebereich Copy fuer Tabexzugriffe
109200*---------------------------------------------------------------*
109300  COPY CKAI1AKK.                                                  E01
109400  COPY CKAO0AKK.
109500/---------------------------------------------------------------*
109600* Meldungstabelle                                               *
109700*---------------------------------------------------------------*
109800 COPY CGSI0MEL.
109900 COPY CGSO0MEL.
110000/---------------------------------------------------------------*
110100* Anmeldedaten                                                  *
110200*---------------------------------------------------------------*
110300 COPY CGSO0ANM.
110400* Uebergabeparameter fuer CGSTAB                                *
110500*---------------------------------------------------------------*
110600 COPY CGSTTAB.
110700/---------------------------------------------------------------*
110800* Hilfsfelder                                                   *
110900*---------------------------------------------------------------*
111000 01 H-MELDUNGS-OBJEKT             PIC X(006).
111100 01 H-FUNKTION.
111200     05 H-FUNKTION-MLD            PIC X(020).
111300     05 H-FUNKTION-REST           PIC X(020).
111400 01 DUMMY                         PIC X(001).
111500/****************************************************************
111600 LINKAGE SECTION.
111700*****************************************************************
111800*---------------------------------------------------------------*
111900* Funktion                                                      *
112000*---------------------------------------------------------------*
112100 01 AUF-FUNKTION                  PIC X(040).
112200*---------------------------------------------------------------*
112300* Konfigurations-Kennzeichen                                    *
112400*---------------------------------------------------------------*
112500 01 KONFIG-ID                     PIC X(002).
112600*---------------------------------------------------------------*
112700* Auftragsname                                                  *
112800*---------------------------------------------------------------*
112900 01 OBJEKT-AUFTRAGS-ID            PIC X(020).
113000*---------------------------------------------------------------*
113100* VerstAendigungsbereich des Aufrufers                          *
113200*---------------------------------------------------------------*
113300 COPY CGSOVER.
113400*---------------------------------------------------------------*
113500* Eingabebereich fuer den StandAlone-Auftrag KKA4KT             *
113600*---------------------------------------------------------------*
113700 01 LS-EINGABEBEREICH             PIC X(001).                      
113800 01 LS-EIN-BER-01                 REDEFINES LS-EINGABEBEREICH. 
113900     COPY CKAI4KT1                REPLACING 01 BY 05,
114000                                  ==(01)== BY ==(01)==.
114100*---------------------------------------------------------------*
114200* Ausgabebereich fuer den StandAlone-Auftrag KKA4KT             *
114300*---------------------------------------------------------------*
114400 01 LS-AUSGABEBEREICH             PIC X(001).                      
114500 01 LS-AUS-BER-01                 REDEFINES LS-AUSGABEBEREICH. 
114600     COPY CKAO4KT1                REPLACING 01 BY 05,
114700                                  ==(01)== BY ==(01)==.
114800*---------------------------------------------------------------*
114900* DUMMYS                                                        *
115000*---------------------------------------------------------------*
115100 01 TB-DUMMY                      PIC X(001).
115200 01 DB-DUMMY                      PIC X(001).
115300*---------------------------------------------------------------*
115400* Indices                                                       *
115500*---------------------------------------------------------------*
115600 COPY CKAXIND.
115700*---------------------------------------------------------------*
115800* Zusätzlicher Eingabebereich                                   *
115900*---------------------------------------------------------------*
116000 01 LS-CKAIAPO                    PIC X(001). 
116100/
116200 PROCEDURE DIVISION
116300     USING AUF-FUNKTION
116400           KONFIG-ID
116500           OBJEKT-AUFTRAGS-ID
116600           GSOVER-VERSTAENDIGUNGSBEREICH
116700           LS-EINGABEBEREICH
116800           LS-AUSGABEBEREICH
116900           TB-DUMMY
117000           .
117100/---------------------------------------------------------------*
117200* Hier wird die Steuerung des KORDOBA-Auftrags durchgefuehrt    *
117300*---------------------------------------------------------------*
117400 STEUER-KKA4KT SECTION.
117500 STEUER-KKA4KT-1001.
117600     PERFORM INITIALISIERUNG
117700     EVALUATE KAI4KT1-FUNKTION
117800     WHEN C-01-INT-ANL-KTO
117900       PERFORM VERARB-ANL-KTO
118000     WHEN C-01-INT-AEN-KTO
118100       PERFORM VERARB-AEN-KTO
118200     WHEN OTHER
118300* KA5002: @@@@@@@@: Unbekannte Funktion @@@@@@@@@@@@@@@@@@@@
118400       MOVE C-OBJEKT-KA5002       TO H-MELDUNGS-OBJEKT
118500       MOVE C-KKA4KT              TO GSTMEL-VAR-TEXT-1
118600       MOVE KAI4KT1-FUNKTION      TO H-FUNKTION
118700       MOVE H-FUNKTION-MLD        TO GSTMEL-VAR-TEXT-2
118800       PERFORM MELDUNG-EINTRAGEN
118900       GO TO PROGRAMM-VERLASSEN
119000     END-EVALUATE
119100     .
119200 STEUER-KKA4KT-1002.
119300     GO TO PROGRAMM-VERLASSEN.
119400/---------------------------------------------------------------*
119500* Neuanlage                                                     *
119600*---------------------------------------------------------------*
119700 VERARB-ANL-KTO SECTION.
119800 VERARB-ANL-KTO-1001.
119900*     
120000*    PERFORM PRUEFEN-ANL-KTO
120100*
120200     MOVE C-DZS-ZPKINS            TO H-ZUGRIFFSNAME
120300* 
120400     PERFORM EINGABEBEREICH-FUELLEN-1
120500* 
120600     PERFORM DB-ZUGRIFF-BKAKTO
120700* 
120800     IF GSOVER-GEWICHT = C-GEW-ZUSTAND
120900     THEN
121000       MOVE C-OBJEKT-KA4856       TO H-MELDUNGS-OBJEKT
121100       PERFORM MELDUNG-EINTRAGEN
121200       GO TO PROGRAMM-VERLASSEN
121300     END-IF
121400* 
121500     PERFORM AUSGABEBEREICH-FUELLEN-1
121600     .
121700 VERARB-ANL-KTO-1002.
121800     EXIT.
121900/---------------------------------------------------------------*
122000* Prüfen der Eingabeparamter bei Neuanlage                      *
      *                                                               * E01
      * (Diese Prüf-Section für das AKKTO bleibt vorerst ohne Aufruf, * E01
      *  da Prüfung bereits beim Einspeichern im MKAAUF erfolgt.)     * E01
122100*---------------------------------------------------------------*
122200 PRUEFEN-ANL-KTO SECTION.
122300 PRUEFEN-ANL-KTO-1001.
122400* Prüfung ob das Konto vorhanden ist:                             E01
      * Ermitteln Parameterwerte zum Abstimmkreis-Konto                 E01
           MOVE C-GELDKTO-UMSATZ-ABSTIMM TO KAI1AKK-ABSTIMM-ART         E01
           MOVE KAI4KT1-HERKUNFT         TO KAI1AKK-HERKUNFT            E01     
           MOVE KAI4KT1-KONTO-ID         TO KAI1AKK-KONTO-ID            E01
122600*
122700     CALL "CGSTAB"
122800     USING C-TAB-LESEN-EQUAL
122900           C-KONFIG-ID-KA
123000           C-OBJEKT-TAB-KA01AKKTO                                 E01
123100           GSOVER-VERSTAENDIGUNGSBEREICH
123200           KAI1AKK-EINGABEBEREICH                                 E01
123300           KAO0AKK-AUSGABEBEREICH
123400           GSTTAB-EIN-AUSGABEBEREICH
123500     END-CALL
123600     .
123700     EVALUATE GSOVER-GEWICHT
123800       WHEN C-GEW-NICHT-GESETZT
123900         CONTINUE
124000       WHEN C-GEW-ZUSTAND
124100         MOVE C-OBJEKT-KA4070     TO H-MELDUNGS-OBJEKT
124200         PERFORM MELDUNG-EINTRAGEN
124300       WHEN C-GEW-ABBRUCH
124400         GO TO PROGRAMM-VERLASSEN
124500       WHEN OTHER
124600         CONTINUE
124700     END-EVALUATE
124800     .
124900 PRUEFEN-ANL-KTO-1002.
125000     EXIT.
125100/---------------------------------------------------------------*
125200* Änderung mit Update-Check                                     *
125300*---------------------------------------------------------------*
125400 VERARB-AEN-KTO SECTION.
125500 VERARB-AEN-KTO-1001.
125600*     
125700     MOVE C-DZS-ZPKUPDC           TO H-ZUGRIFFSNAME
125800* 
125900     PERFORM EINGABEBEREICH-FUELLEN-1
126000* 
126100     PERFORM DB-ZUGRIFF-BKAKTO
126200* 
126300     IF GSOVER-GEWICHT = C-GEW-ZUSTAND
126400     THEN
126500       MOVE C-OBJEKT-KA4856       TO H-MELDUNGS-OBJEKT
126600       PERFORM MELDUNG-EINTRAGEN
126700       GO TO PROGRAMM-VERLASSEN
126800     END-IF
126900* 
127000     PERFORM AUSGABEBEREICH-FUELLEN-1
127100     .
127200 VERARB-AEN-KTO-1002.
127300     EXIT.
127400/---------------------------------------------------------------*
127500* Datenzugriffsschicht                                          *
127600*---------------------------------------------------------------*
127700 DB-ZUGRIFF-BKAKTO SECTION.
127800 DB-ZUGRIFF-BKAKTO-1001.
127900*
128000     CALL "CGSDZS"
128100     USING H-ZUGRIFFSNAME
128200           C-KONFIG-ID-KA
128300           C-OBJEKT-BKAKTO
128400           GSOVER-VERSTAENDIGUNGSBEREICH
128500           KAIKTO-EINGABEBEREICH
128600           DB-DUMMY             
128700           KAKTO-BENUTZERSATZ
128800     END-CALL
128900*
129000     EVALUATE GSOVER-GEWICHT
129100       WHEN C-GEW-NICHT-GESETZT
129200         CONTINUE
129300       WHEN C-GEW-ZUSTAND
129400         CONTINUE                                        
129500       WHEN OTHER
129600*        Abbruchfehler in Datenbasis
129700         GO TO PROGRAMM-VERLASSEN
129800     END-EVALUATE
129900     .
130000 DB-ZUGRIFF-BKAKTO-1002.
130100     EXIT.
130200/---------------------------------------------------------------*
130300* Eingabebereich füllen KAI4KT1                                 *
130400*---------------------------------------------------------------*
130500 EINGABEBEREICH-FUELLEN-1 SECTION.
130600 EINGABEBEREICH-FUELLEN-1-1001.
130700*
130800     MOVE KAI4KT1-HERKUNFT
130900       TO KTO-HERKUNFT
131000     MOVE KAI4KT1-KONTO-ID
131100       TO KTO-KONTO-ID-ABSTIMM
131200     MOVE KAI4KT1-DATUM-LE-AUSZUG
131300       TO KTO-DATUM-LE-AUSZUG
131400     MOVE KAI4KT1-NR-LE-AUSZUG
131500       TO KTO-NR-LE-AUSZUG
131600     MOVE KAI4KT1-FOLGENR-LE-AUSZUG
131700       TO KTO-FOLGENR-LE-AUSZUG
131800     MOVE KAI4KT1-SALDO
131900       TO KTO-SALDO
132000     MOVE KAI4KT1-WAEHRUNG
132100       TO KTO-WAE-SALDO
132200     MOVE KAI4KT1-TIMESTAMP-ANL
132300       TO KTO-TIMESTAMP-ANLAGE
132400     MOVE KAI4KT1-USER-LE-AENDERUNG
132500       TO KTO-USER-LE-AENDERUNG
132600     MOVE KAI4KT1-TIMESTAMP-BKAKTO
132700       TO KTO-BKAKTO-TIMESTAMP
132800          KAIKTO-BKAKTO-TIMESTAMP
132900     .
133000 EINGABEBEREICH-FUELLEN-1-1002.
133100     EXIT.
133200/---------------------------------------------------------------*
133300* Ausgabebereich füllen KAO4KT1                                 *
133400*---------------------------------------------------------------*
133500 AUSGABEBEREICH-FUELLEN-1 SECTION.
133600 AUSGABEBEREICH-FUELLEN-1-1001.
133700*
133800     MOVE KTO-HERKUNFT
133900       TO KAO4KT1-HERKUNFT
134000     MOVE KTO-KONTO-ID-ABSTIMM
134100       TO KAO4KT1-KONTO-ID
134200     MOVE KTO-DATUM-LE-AUSZUG
134300       TO KAO4KT1-DATUM-LE-AUSZUG
134400     MOVE KTO-NR-LE-AUSZUG
134500       TO KAO4KT1-NR-LE-AUSZUG
134600     MOVE KTO-FOLGENR-LE-AUSZUG
134700       TO KAO4KT1-FOLGENR-LE-AUSZUG
134800     MOVE KTO-SALDO
134900       TO KAO4KT1-SALDO
135000     MOVE KTO-WAE-SALDO
135100       TO KAO4KT1-WAEHRUNG
135200     MOVE KTO-TIMESTAMP-ANLAGE
135300       TO KAO4KT1-TIMESTAMP-ANL
135400     MOVE KTO-USER-LE-AENDERUNG
135500       TO KAO4KT1-USER-LE-AENDERUNG
135600     MOVE KTO-BKAKTO-TIMESTAMP
135700       TO KAO4KT1-TIMESTAMP-BKAKTO
135800     .
135900 AUSGABEBEREICH-FUELLEN-1-1002.
136000     EXIT.
136100/---------------------------------------------------------------*
136200* Programminitialisierung                                       *
136300*---------------------------------------------------------------*
136400 INITIALISIERUNG SECTION.
136500 INITIALISIERUNG-1001.
136600     INITIALIZE                   GSTMEL-TRANSIENTER-BEREICH
136700     MOVE SPACE                   TO H-FUNKTION
136800*
136900     PERFORM LESEN-ANMELDEDATEN
137000     .
137100 INITIALISIERUNG-1002.
137200     EXIT.
137300/---------------------------------------------------------------*
137400* Lesen der Anmeldedaten                                        *
137500*---------------------------------------------------------------*
137600 LESEN-ANMELDEDATEN SECTION.
137700 LESEN-ANMELDEDATEN-1001.
137800     CALL "CGSTAB"
137900     USING C-TAB-ANM-DAT-LESEN
138000           C-KONFIG-ID-GS
138100           C-OBJEKT-TAB-ANMELDEDATEN
138200           GSOVER-VERSTAENDIGUNGSBEREICH
138300           DUMMY
138400           GSO0ANM-AUSGABEBEREICH
138500           GSTTAB-EIN-AUSGABEBEREICH
138600     END-CALL
138700
138800     IF GSOVER-GEWICHT            NOT = C-GEW-NICHT-GESETZT
138900     THEN
139000       GO TO PROGRAMM-VERLASSEN
139100     END-IF
139200      .
139300 LESEN-ANMELDEDATEN-1002.
139400     EXIT.
139500/---------------------------------------------------------------*
139600* Meldung eintragen                                             *
139700*---------------------------------------------------------------*
139800 MELDUNG-EINTRAGEN SECTION.
139900 MELDUNG-EINTRAGEN-1001.
140000     CALL "CGSMEL"
140100     USING C-MEL-EINTRAGEN
140200           C-KONFIG-ID-KA
140300           H-MELDUNGS-OBJEKT
140400           GSOVER-VERSTAENDIGUNGSBEREICH
140500           DUMMY
140600           GSOMEL-AUSGABEBEREICH
140700           GSTMEL-TRANSIENTER-BEREICH
140800     END-CALL
140900*
141000     IF GSOVER-GEWICHT            > C-GEW-FEHLER
141100     THEN
141200       GO TO PROGRAMM-VERLASSEN
141300     ELSE
141400       MOVE H-MELDUNGS-OBJEKT     TO GSOVER-RETURNCODE
141500     END-IF
141600     .
141700 MELDUNG-EINTRAGEN-1002.
141800     EXIT.
141900/*-------------------------------------------------------------*
142000* Meldungen aus Meldungspool loeschen.                         *
142100*--------------------------------------------------------------*
142200 MELDUNG-AUSTRAGEN SECTION.
142300 MELDUNG-AUSTRAGEN-1001.
142400     CALL "CGSMEL"
142500     USING C-MEL-AUSTRAGEN
142600           C-KONFIG-ID-KA
142700           C-OBJEKT-MEL-GSPOOL
142800           GSOVER-VERSTAENDIGUNGSBEREICH
142900           DUMMY
143000           GSOMEL-AUSGABEBEREICH
143100           GSTMEL-TRANSIENTER-BEREICH
143200
143300     IF GSOMEL-MAX-GEW > C-GEW-WARNUNG
143400     THEN
143500       GO TO PROGRAMM-VERLASSEN
143600     END-IF
143700     .
143800 MELDUNG-AUSTRAGEN-1002.
143900     EXIT.
144000/---------------------------------------------------------------*
144100* Verlassen des Programms ueber einen Ausstiegspunkt            *
144200*---------------------------------------------------------------*
144300 PROGRAMM-VERLASSEN SECTION.
144400 PROGRAMM-VERLASSEN-1001.
144500     EXIT PROGRAM.
144600 PROGRAMM-VERLASSEN-1002.
144700     EXIT.

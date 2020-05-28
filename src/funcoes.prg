#include "fenix.ch"

STATIC static13
STATIC static14
STATIC static1 := "ÕÍ¸³¾ÍÔ³"
STATIC static2 := ""
STATIC static3 := {1, 1, 0, 0, 0, 0, 0, 0, 0, 24, 79, 1, 0, 0, 0, 1, 8, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, -999, 0, 0, Nil}

function CorNormal()
********************
	setcolor("w+/b")
	return nil

function bcor()
***************
   setcolor("w/b+")

function icor()
	setcolor("r+/r")

function tcor()
***************
	setcolor("w+/b")

function cab()
**************
	oPrinter:TextOut( oPrinter:PrinterName + ": MaxRow() = " + hb_ntos( oPrinter:MaxRow() ) + "   MaxCol() = " + hb_ntos( oPrinter:MaxCol() ) )
	oPrinter:SetColor( RED )
	oPrinter:SetPrc(oPrinter:Prow()+3, Pcol()+25 )
	oPrinter:SetFont('monotype corsiva',30,{-1,14}, 0, .T., .F.)
	oPrinter:TextOut( "CLAMAR CONSERVAS NATURAIS" )
	oPrinter:NewLine()

	oPrinter:UnderLine( .F. )
	oPrinter:Italic( .F. )
	oPrinter:SetFont( "Lucida Console", 8, { 3, -50 } )

	oPrinter:NewLine()
	oPrinter:TextOut("Impressao: "+dtoc(date()))
	oPrinter:SetPrc(oPrinter:PROW(), Pcol()+30 )
	oPrinter:TextOut("Pedido: ")
	oPrinter:TextOut(NP)
	oPrinter:NewLine()

	nColFixed   := 2 * oPrinter:CharWidth
	nColTTF     := 40 * oPrinter:CharWidth
	nColCharSet := 60 * oPrinter:CharWidth
	oPrinter:NewLine()

function mdsha()
****************
	set bell on
	Tone(200,5)
	Alert(" ATENÃ‡ÃƒO!!!;;SENHA INCORRETA ! ", , "W+/B")
	set bell off
	return nil


function mdsuces()
******************
	ErrorBeep()
	alert(" DADOS REGISTRADOS COM;; SUCESSO !!! ", , "W+/B")
	return nil

function mdcli()
****************
	ErrorBeep()
	Alert(" ATEN€ÇO !!!;;CLIENTE NÇO LOCALIZADO ", , "W+/B")
	return nil

function mdanul()
*****************
	set bell on
	TONE(200,5)
	ALERT(" O REGISTRO FOI ANULADO !!! ", , "W+/B")
	set bell off

function mddad()
****************
	set bell on
	TONE(200,5)
	ALERT(" DADOS NÇO LOCALIZADO;;REDIGITE ! ", , "W+/B")
	set bell off

function mdest()
****************
	set bell on
	TONE(200,5)
	ALERT(" NÆo Cadastrado;;REDIGITE ! ", , "W+/B")
	set bell off

function mdfunc()
******************
	set bell on
	TONE(200,5)
	ALERT(" ATEN€ÇO !!!;;FUNCIONµRIO NÇO LOCALIZADO ", , "W+/B")
	set bell off


function mdnroped()
*******************
	set bell on
	TONE(200,5)
	ALERT(" ATEN€ÇO !!!;;NRO.PEDIDO NÇO LOCALIZADO ", , "W+/B")
	set bell off

function exiscad()
******************
	set bell on
	tone(900)
	ALERT(" O Cadastro ja Existe;; REDIGITE !!! ", , "W+/B")
	set bell off

function ctr_user()
*******************
	public Ycadastro,Yvenda,Yregv,Ybxv,Yedtv,Yestqv,Yetqed,Ylstv,Ypsqv,Yftv,Ynfv
	public Ycompra,Yregc,Ybxc,Yedtc,Ylstc,Yestqc,Ypsqc,Ynfc,Yetqc,Yestoque,Yplne,Ycnce
	public Yedte,Yrgpe,Ycheq,Ydpe,Ylja,Yfna,Ynfe,Ynfen,Ynfsa,Ypere,Ydvv
	public Yclicad,Yforcad,Ymercad,Yprocad,Ycfocad,Ycdbcad,Yestcad,Yclacad,Yembcad,Ymuncad,Yrepcad,Ytracad,Ycescad

	stor cadastro to Ycadastro
	stor clicad to Yclicad
	stor forcad to Yforcad
	stor mercad to Ymercad
	stor procad to Yprocad
     stor cfocad to Ycfocad
     stor cdbcad to Ycdbcad
     stor estcad to Yestcad
     stor clacad to Yclacad
     stor embcad to Yembcad
     stor muncad to Ymuncad
     stor repcad to Yrepcad
     stor tracad to Ytracad
     stor cescad to Ycescad
     stor venda to Yvenda
     stor regv to Yregv
     stor bxv to Ybxv
     stor edtv to Yedtv
     stor estqv to Yestqv
     stor etqed to Yetqed
     stor lstv to Ylstv
     stor psqv to Ypsqv
     stor ftv to Yftv
     stor nfv to Ynfv
     stor dvv to Ydvv
	stor compra to Ycompra
	stor regc to Yregc
	stor bxc to Ybxc
	stor edtc to Yedtc
	stor lstc to Ylstc
	stor estqc to Yestqc
	stor psqc to Ypsqc
	stor nfc to Ynfc
	stor etqc to Yetqc
	stor estoque to Yestoque
	stor plne to Yplne
	stor cnce to Ycnce
	stor edte to Yedte
	stor pere to Ypere
	stor rgpe to Yrgpe
	stor cheq to Ycheq
	stor dpe to Ydpe
	stor lja to Ylja
   stor fna to Yfna
   stor nfe to Ynfe
   stor nfen to Ynfen
   stor nfsa to Ynfsa
	return nil


function imp_cadc( Cpar1 )
**************************
   LOCAL nPrn     := 1
   LOCAL cBMPFile := "C:\hb32\clamar\imagem.bmp"
   LOCAL GetList  := {}
   LOCAL aPrn     := win_printerList()

   if Empty( aPrn )
      Alert( "Nao foi localizado nenhuma impressora instalada!!!" )
   else
      while nPrn != 0
         vcTela = savescreen(07, 12, 23, 69)
         @ 08,13 to 22,68
         setcolor("n/w,w+/g")
         @ 09, 14 clear to 21,67
         @ 09, 14 say " Sele‡Æo de impressora                                " color "w+/r"
         @ 21, 14 say " " +chr(24)+chr(25)+": Movimenta | Enter: Seleciona |  ESC: Cancelar    " color "w+/Gr"
         nPrn := AChoice(10,15,20,66,aPrn, .T.,, "myFuncao" )
         IF nPrn != 0
            PrnTest( aPrn[ nPrn ], cBMPFile, iif( HB_ISSTRING( cPar1 ) .AND. Lower( cPar1 ) == "ask", .T., NIL ) )
         endif
         restscreen(07, 12, 23, 69,vcTela)
         exit
      enddo
   endif
   return nil

STATIC PROCEDURE PrnTest( cPrinter, cBMPFile, lAsk )

   LOCAL oPrinter := win_Prn():New( cPrinter )
   LOCAL aFonts
   LOCAL x
   LOCAL nColFixed
   LOCAL nColTTF
   LOCAL nColCharSet

   oPrinter:Landscape := .F.
   oPrinter:Copies    := 1
   IF HB_ISLOGICAL( lAsk )
      oPrinter:AskProperties := lAsk
   ENDIF

   IF ! oPrinter:Create()
      Alert( "Nao pode criar uma impressora!" )
   ELSE
      IF ! oPrinter:startDoc( "win_Prn(Doc name in Printer Properties)" )
         Alert( "StartDoc() failed" )
      ELSE
         oPrinter:TextOut( oPrinter:PrinterName + ": MaxRow() = " + hb_ntos( oPrinter:MaxRow() ) + "   MaxCol() = " + hb_ntos( oPrinter:MaxCol() ) )

         oPrinter:UnderLine( .F. )
         oPrinter:Italic( .F. )
         oPrinter:NewLine()
         oPrinter:NewLine()
         oPrinter:NewLine()
         oPrinter:NewLine()
         oPrinter:NewLine()
         oPrinter:NewLine()
         oPrinter:NewLine()

*         oPrinter:SetColor( RED )
         oPrinter:SetFont('Lucida Console',12,{-1,14}, 0, .F., .F.)
         oPrinter:SetPrc(oPrinter:Prow(), Pcol()+5 )
         oPrinter:TextOut("Data Impressao: "+dtoc(date()))
         oPrinter:SetPrc(oPrinter:Prow(), Pcol()+45 )
         oPrinter:TextOut("FICHA DE CADASTRO DE CLIENTE")
         oPrinter:NewLine()
         oPrinter:Bold(0)
         oPrinter:TextOut(" __________________________________________________________________________________")
         oPrinter:NewLine()
         oPrinter:NewLine()

         Area(oMenu:aDbfs[5])
         loca for codc = PEC
         if eof()
            mdcli()
            retu
         endi
         store cnae to Ccnae
         store data to cdata
         store sit to Csit
         store codc to Ccodc
         store cliente to Ccliente
         store razao to Crazao
         store ender to Cender
         store nroend to Cnroend
         store compl to Ccompl
         store bairro to Cbairro
         store cida to Ccida
         store paiis to Cpais
         store est to Cest
         store cnpj to Ccnpj
         store inscr to Cinscr
         store cpf to Ccpf
         store inscrp to Cinscrp
         store fone1 to Cfone1
         store fone2 to Cfone2
         store prazo to Cprazo
         store prazo2 to Cprazo2
         store obs to Cobs
         store email to Cmail
         store exml to Cexml
         store cep to ccep

         store ender2 to Cender2
         store nroend2 to Cnroend2
         store compl2 to Ccompl2
         store bairro2 to Cbairro2
         store cida2 to Ccida2
         store est2 to Cest2
         store cep2 to ccep2
         store hrrec to Chrrec

         store contato to Ccontato
         store tpdesc to Ctpdesc
         store dscnto to Cdesc
         store tpag to Ctpag
         store ativo to Cativo
         store nf to Cnf
         store prnf to Cprnf
         store pedcli to Cpedcli
         store despacho to Cdespacho
         store linha to Clinha
         store reg_apur to Creg_apur
         store codrp to Ccodrp
         store nrepre to Cnrepre
         store Vmin to Cvmin
         store restric to Crestric
         store justst to CjustST
         store indie to Cindie
         store obssep to Cobssep
         store isest to Cisest
         Rpais = 'BRASIL'

         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+2 )
         oPrinter:Textout("Fantasia: ")
         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+13 )
         oPrinter:Textout(Ccliente)
         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+40 )
         oprinter:Textout("   Codigo do Cliente: "+PEC)
         oPrinter:SetPrc(oPrinter:PROW()+1, Pcol()+02 )
         oPrinter:Textout("E-mail: "+Cmail)
         oPrinter:SetPrc(oPrinter:PROW()+1, Pcol()+02 )
         oPrinter:Textout("E-mail para XML: "+Cexml)
         oPrinter:SetPrc(oPrinter:PROW()+1, Pcol()+02 )
         oprinter:Textout("Razao Social: "+Crazao)
         if Csit = "EMPRESA"
            oPrinter:SetPrc(oPrinter:PROW()+1, Pcol()+02 )
            Oprinter:Textout("CNPJ: "+Ccnpj)
            oPrinter:SetPrc(oPrinter:PROW()+1, Pcol()+40 )
            Oprinter:Textout("Inscr.Est.: "+Cinscr)
         else
            oPrinter:SetPrc(oPrinter:PROW()+1, Pcol()+02 )
            Oprinter:Textout("CPF: "+Ccpf)
            oPrinter:SetPrc(oPrinter:PROW()+1, Pcol()+40 )
            Oprinter:Textout("RG: "+Cinscrp)
         endi


*         oprinteR:textout(EMBAL)
*         eQUANT:=str(QUANT)
*         oPrinter:Textout(eQUANT)
*         stor round(unit,2) to unit
*         eUNIT:=str(UNIT)
*         oPrinter:Textout(eUNIT)
*         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+110 )
*         oPrinter:Textout(LOTE)
*         oPrinter:NewLine()





*             @ ln+5,02 say 'Contato:'
*             @ ln+5,11 say Ccontato
*             @ ln+5,35 say 'Fone:'
*             @ ln+5,41 say Cfone1
*             @ ln+5,56 say 'ou:'
*             @ ln+5,60 say Cfone2
*             @ ln+7,02 say 'Regime de Apuracao:'
*             if Creg_apur = ' '
*                @ ln+7,22 say 'NAO CADASTRADO'
*             elseif Creg_apur = '1'
*                @ ln+7,22 say '1-SIMPLES NACIONAL'
*             elseif Creg_apur = '2'
*                @ ln+7,22 say '2-OUTROS REGIMES'
*             elseif Creg_apur = '3'
*                @ ln+7,22 say '3-ISENTO'
*             endi
*             @ ln+7,55 say 'Cnae:'
*             @ ln+7,61 say Ccnae
*             ln=ln+8
*             @ ln,02 say 'Lagradouro:'
*             @ ln,14 say Cender
*             @ ln,63 say Cnroend
*             @ ln,55 say 'N£mero:'
*             @ ln+1,02 say 'Complemento:'
*             @ ln+1,15 say Ccompl
*             @ ln+1,37 say 'Bairro:'
*             @ ln+1,45 say Cbairro
*             @ ln+1,62 say 'CEP:'
*             @ ln+1,67 say CCEP
*             @ ln+2,02 say 'Pa¡s:'
*             @ ln+2,08 say Cpais
*             @ ln+2,18 say 'Estado:'
*             @ ln+2,26 say Cest
*             @ ln+2,39 say 'Cidade:'
*             @ ln+2,47 say Ccida
*             @ ln+3,02 say 'Recebimento de Mercadorias:'
*             @ ln+3,32 say Chrrec








*         Area(oMenu:aDbfs[15])
*         go top
*         do whil .not. eof()
*         if nroped # NP
*            skip
*            loop
*         endi
*         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+2 )
*         oPrinter:Textout(dtoc(DATA))
*         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+13 )
*         oPrinter:Textout(PRODUTO)
*         oprinteR:textout(EMBAL)
*         eQUANT:=str(QUANT)
*         oPrinter:Textout(eQUANT)
*         stor round(unit,2) to unit
*         eUNIT:=str(UNIT)
*         oPrinter:Textout(eUNIT)
*         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+110 )
*         oPrinter:Textout(LOTE)
*         oPrinter:NewLine()
*         skip
*         endd
*         Unlock
*         Use

         PrintBitmap( oPrinter, cBMPFile )


         oPrinter:EndDoc()
      ENDIF
      oPrinter:Destroy()
   ENDIF

   RETURN


STATIC PROCEDURE PrintBitmap( oPrn, cBitFile )

   LOCAL oBMP

   IF ! Empty( cBitFile )
      IF hb_FileExists( cBitFile )
         oBMP := win_BMP():New()
         IF oBmp:loadFile( cBitFile )

            oBmp:Draw( oPrn, { 2000, 120, 800, 300 } )
#if 0
            /* Note: Can also use this method to print bitmap */
            oBmp:Rect := { 200, 200, 2000, 1500 }
            oPrn:DrawBitmap( oBmp )
#endif
         ENDIF
         oBMP:Destroy()
      ELSE
         Alert( hb_StrFormat( "%1$s not found ", cBitFile ) )
      ENDIF
   ENDIF

   RETURN

function myFuncao()
*******************
   local vnRetorno
   do case
       case lastkey() = 19 .or. lastkey() = 4
           vnRetorno := 2
       case lastkey() = 13 .or. lastkey() = 16
           vnRetorno := 1
       case lastkey() = 27
           vnRetorno := 0
       otherwise
           vnRetorno := 2
       endcase
   return(vnRetorno)

   
function psq_lin()
****************
LOCAL Tela := SaveScreen()
LHA := spac(40)
do whil LHA = spac(40)
   @ 00,00 clea to 17,29
   @ 00,00 to 17,29
   @ 02,01 say 'Digite Linha:'
   @ 04,01 get LHA pict '!!!!!!!!!!!!!!!'
   read
   if LHA = '     '
      Restela(Tela)
      retu
   endi
   Area("Cadlin")
   loca for linha = trim(LHA)
   if eof()
      mdfor()
      LHA := spac(40)
      loop
   endi
   @ 01,01 clea to 16,28
   @ 01,01 say 'CodL    Linha          '
   ln := 3
   index on linha to lnh
   set index to lnh
   go top
   do whil .not. eof()
      if linha != trim(LHA)
         skip
         loop
      endi
      @ ln,01 say codl
      @ ln,09 say linha
      skip
      ln := ln + 1
      t := ' '
      if ln > 15
         @ 16,03 say ' Tecle Algo:' get t
         read
         @ 02,01 clea to 16,28
         ln := 3
         loop
      endi
   endd
   @ 16,03 say ' Tecle Algo:' get t
   read
endd
Restela(Tela)

   function psqlin()
*******************************************
Local tela := SaveScreen()
LHA := spac(40)
do whil LHA = spac(40)
   @ 00,00 clea to 17,29
   @ 00,00 to 17,29
   @ 02,01 say 'Digite Linha:'
   @ 04,01 get LHA pict '!!!!!!!!!!!!!!!'
   read
   if LHA = '     '
      Restela(tela)
      retu
   endi
    Area(oMenu:aDbfs[38])
   loca for linha = trim(LHA)
   if eof()
      mdfor()
      LHA := spac(40)
      loop
   endi
   @ 01,01 clea to 16,28
   set color to w/r+
   @ 01,01 say 'CodL    Linha          '
   set color to c/w/r+
   ln := 3
   index on linha to lnh
   set index to lnh
   go top
   do whil .not. eof()
      if linha <> trim(LHA)
         skip
         loop
      endi
      @ ln,01 say codl
      @ ln,09 say linha
      skip
      ln := ln + 1
      t := ' '
      if ln > 15
         @ 16,03 say 'Tecle Algo:' get t
         read
         @ 02,01 clea to 16,28
         ln := 3
         loop
      endi
   endd
   @ 16,03 say 'Tecle Algo:' get t
   read
endd
Restela(Tela)

function psqfor()

LOCAL Tela := SaveScreen()
t:=0
do whil t = 0
CNP := spac(18)
RZ := spac(40)
MNOME := SPACE(15)
if cdtr = 'X'
   @ 09,04 prompt 'NOME FANTASIA'
   @ 10,04 prompt 'RAZAO SOCIAL'
   @ 11,04 prompt 'CNPJ'
   menu to TT
else
   TT := 1
endi
   @ 00,00 clea to 23,29
   @ 00,00 to 23,29
if TT = 1
   @ 02,01 say 'Digite o Nome do Fornecedor:'
   @ 03,01 get MNOME pict '@!'
elseif TT = 2
   @ 02,01 say "Digite a RazÆo Social:"
   @ 03,01 GET RZ PICT "!!!!!!!!!!!!!!!!!!!!"
elseif TT = 3
   @ 02,01 say "Digite o CNPJ:"
   @ 03,01 GET CNP PICT "99.999.999/9999-99"
endi
READ
if TT = 0
   Restela(tela)
   retu
endi
if TT = 1 .and. Mnome = '     '
   Restela(tela)
   retu
elseif TT = 2 .and. RZ = '    '
   Restela(tela)
   retu
elseif TT = 3 .and. CNP = '  '
   Restela(tela)
   retu
endi
read
  Area(oMenu:aDbfs[4])
DBGOTOP()
if TT = 1
   LOCATE FOR ALLTRIM(MNOME)$nfor
elseif TT = 2
   LOCATE FOR ALLTRIM(RZ)$RAZAO
elseif TT = 3
   LOCATE FOR ALLTRIM(CNP)$CNPJ
endi
   if eof()
      mdfor()
      inkey(0)
      if cdtr = 'X'
         Restela(tela)
      endi
      t := 0
      loop
   endi
   @ 01,01 clea to 16,28
   bcor()
   @ 01,01 say 'Codg    Fornecedor          '
   tcor()
   ln := 3
   CONTA := 0
Do whil .t.
   conta++
   @ ln,01 say codf
   @ ln,09 say nfor
   if TT # 1
      @ ln+1,01 say subs(razao,1,25)
      if sit = 'EMPRESA'
         @ ln+2,01 say cnpj
      else
         @ ln+2,01 say cpf
      endi
   endi
   if TT = 1
      ln := ln + 1
   else
      ln := ln + 4
   endi
   if ln > 20
      @ 22,01 say 'Tecle algo...'
      inkey(0)
      @ 03,01 clea to 22,28
      ln := 3
   endi
   IF EOF()
      @ 22,01 SAY "Fim da Busca !"
      inkey(10)
      Restela(tela)
      retu(.f.)
   ENDIF
   CONTINUE
endd
cdtr := ' '
Restela(tela)
endd

 
   
   
   function psqrepre()
*******************
LOCAL Tela := SaveScreen()
NMC := spac(15)

while NMC = spac(15)
   @ 00,50 clea to 17,79
   @ 00,50 to 17,79
   @ 02,51 say 'Digite o Nome Representante:'
   @ 04,51 get NMC pict '!!!!!!!!!!!!!!!'
   read
   if Empty(NMC)
      Restela(Tela)
      return
   endi

   Area(oMenu:aDbfs[49])
   DBGOTOP()
   LOCATE FOR ALLTRIM(NMC)$NREP
   IF EOF()
      TONE(200,5)
      ALERT(" ATEN€ÇO !!!;;REPRESENTANTE NÇO LOCALIZADO ", , "W+/B")
       if cdtr = 'X'
          rest scre from tela
       endi
       NMC := spac(15)
       loop
   ENDIF
   CONTA:=0
   @ 01,51 clea to 16,78
   set color to w/r+
   @ 01,51 say 'Codigo  Representante       '
   set color to c/w/r+
   ln := 3
   do whil .t.
      conta++
      @ ln,51 say codr
      @ ln,59 say nrep
      skip
      ln := ln + 1
      if ln > 14
         stor recno() to reg49
         @ 16,53 say ' Tecle Algo:' get z
         read
         @ 01,51 clea to 16,77
         ln := 3
         Area(oMenu:aDbfs[49])
         set index to c49
         go reg49
         loop
      endi
      IF EOF()
         @ 16,53 SAY "Fim da Busca !"
         inkey(0)
         rest scre from tela
         retu
      ENDI
      CONTINUE
   endd
   z := ' '
endd
rest scre from tela



*--------------------------------------------------------------------------*
def MaBox( nTopo, nEsq, nFundo, nDireita, Cabecalho, Rodape, lInverterCor )
*--------------------------------------------------------------------------*
	LOCAL cPattern := " "
	LOCAL pfore 	:= 31
	LOCAL pback    := Roloc(31)
	LOCAL cCor     := Roloc(31)
	LOCAL pUns     := Roloc( pFore )

	hb_default(@nTopo, 0)
	hb_default(@nEsq, 0)
	hb_default(@nFundo,   maxrow())
	hb_default(@nDireita, maxcol())

	if(nDireita > maxcol(), nDireita := maxcol(), nDireita)
	if(nFundo   > maxrow(), nFundo   := maxrow(), nFundo)

   DispBegin()
	hb_DispBox( nTopo, nEsq, nFundo, nDireita, M_Frame() + cPattern, pfore )

	if !(IsNil(Cabecalho))
		aPrint( nTopo, nEsq+1, "Û", cCor, (nDireita-nEsq)-1)
		aPrint( nTopo, nEsq+1, Padc( Cabecalho, ( nDireita-nEsq)-1), cCor )
	endif

	if !(IsNil(Rodape))
		aPrint( nFundo, nEsq+1, "Û", cCor, (nDireita-nEsq)-1)
		aPrint( nFundo, nEsq+1, Padc( Rodape, ( nDireita-nEsq)-1), cCor )
	endif
	nSetColor( pfore, pback, pUns )
   DispEnd()
	return NIL
endef

def Conf( Texto, aPrompt, cor)
   LOCAL cScreen   := SaveScreen()	
	LOCAL Les		 := 19
	LOCAL Exceto	 := .F.
	LOCAL Ativo 	 :=  1
	LOCAL aArray	 := { " Sim ", " Nao " }
	LOCAL cFundo	 := 207
	LOCAL cFrente	 := 192
	LOCAL Largjan	 := Len( Texto ) + 2
	LOCAL cFrame    := oAmbiente:Frame
	LOCAL nRetVal
	LOCAL PBack
	LOCAL nLen
	LOCAL Ces
	LOCAL Com
	LOCAL Coluna
	LOCAL nRow
	LOCAL nCol
	LOCAL nComp
	LOCAL nChoice
	LOCAL Centralizar := false
	LOCAL lPrompt     := true
	
	__DefaultNIL(@cor, oAmbiente:CorMsg)
	if aPrompt == nil .OR. !(IsArray(aPrompt))
	   aPrompt := aArray	
	endif
	nRetval := AlertaPy(Texto + ';-;;', cor, centralizar, lPrompt, aPrompt)
	restela(cScreen)
	return( nRetVal == 1 )
		
	LargJan := Iif( LargJan < 16, 16, LargJan )
	Les	  := Iif( Les = Nil .OR. Les = 0, 19, Les )
	Ces	  := (MaxCol()-LargJan)/2
	Com	  := Ces + LargJan
	Coluna  := (LargJan - 9 ) / 2
	nRow	  := Les + 2
	nCol	  := Ces + Coluna
	nBot	  := Les + 3
	nComp   := ( Com - Ces )-1
	
	M_Title( Texto )
	if aPrompt != NIL
		nLen := Len( aPrompt )
		//ColorSet( @cFundo, @PBack )
		MSFrame( Les-nLen, Ces, Les+3, Com, oAmbiente:CorMsg )
		nChoice := aChoice( (Les-nLen)+3, Ces+4, Les+5, Com-3, aPrompt )
		ResTela( cScreen )
		return( nChoice )
	endif
	//ColorSet( @cFundo, @PBack )
	MsFrame( Les-2, Ces, Les+3, Com, oAmbiente:CorMsg )
	nRetVal := aChoice( Les+1, Ces+4, Les+5, Com-3, aArray )
	ResTela( cScreen )
	return( nRetVal == 1 )

def MsFrame( nTopo, nEsquerda, nFundo, nDireita, Cor )
***********************************************************
	LOCAL cFrame2	:= SubStr( oAmbiente:Frame, 2, 1 )
	LOCAL pFore 	:= Iif( Cor = NIL, Cor(), Cor )
	LOCAL cPattern := " "
	LOCAL pBack

	ColorSet( @pfore, @pback )
	Box( nTopo, nEsquerda, nFundo, nDireita, oAmbiente:Frame + cPattern, pFore  )
	cSetColor( SetColor())
	nSetColor( pFore, Roloc( pFore ))
	@ nTopo+2, nEsquerda+1 SAY Repl( cFrame2, (nDireita - nEsquerda )-1 )
	@ nTopo+3, nEsquerda+2 TO  nFundo-1,nEsquerda+2
	@ nTopo+1, nEsquerda+1 SAY Padc( M_Title(), nDireita-nEsquerda-1)
	@ nTopo+3, nDireita-2  TO  nFundo-1, nDireita-2
return( NIL )

def Alerta( cString, aArray, Color )
*----------------------------------*
	__DefaultNIL(@cString, '(Pressione qualquer tecla)')	
	__DefaultNIL(@Color, oAmbiente:CorAlerta)
	__DefaultNIL(@aArray, ' Ok ')		
	return( alert( cString, aArray, ColorIntToStr(Color)))
endef	

function Nada(cString)
**********************
	LOCAL cScreen := SaveScreen()

	hb_default( @cString, "INFO: Nada consta nos parametros informados.")
	ErrorBeep()
	Alerta( cString )
	return(ResTela( cScreen ))

def Mensagem( String, Color, nLine, nCol, centralizar, nOk )
	LOCAL cScreen := SaveScreen()
	LOCAL pstrlen := len(string) + 6
	LOCAL nlinhas := strcount(';', string)
	LOCAL cFundo  := 112
	LOCAL pBack
	LOCAL Row
	LOCAL Col
	LOCAL Col2
	
	__DefaultNIL(@centralizar, true)    
	__DefaultNIL(@color, oAmbiente:CorMsg)    
   __DefaultNIL(@nOk, false)    
	Do case
		case nLine == nil .and. nLinhas = 0	
			String := "Fenix" + ";-;" + String
			AlertaPy(string, Color, centralizar, nOK)
			return(cScreen)
		case nLine == nil .and. nLinhas > 0
			String := "Fenix" + ";-;" + String
			AlertaPy(string, Color, centralizar, nOK)		
			return( cScreen )
		case nLine != nil .and. nLinhas > 0			
			AlertaPy(string, Color, centralizar, nOK)
			return(cScreen)
	endcase
	
	if nLine == Nil
		Row	 := ((  LastRow() + 1 ) / 2 ) - 2
		Col	 := ((( LastCol() + 1 ) - PstrLen ) ) / 2
		Col2	 := ((( LastCol() + 1 ) / 2 ) - 10 )
	else
		Row	 := nLine
		if nCol == NIL
			Col	 := ((( LastCol() + 1 ) - PstrLen ) ) / 2
			Col2	 := ((( LastCol() + 1 ) / 2 ) - 10 )
		else
			Col	 := nCol
			Col2	 := ((( LastCol() + 1 ) / 2 ) - 10 )
		endif	
	endif
	hb_default( @color, CorAlerta())

	/*
	MsBox( Row, Col, Row+4, Col+ PstrLen, Color, false )
	WriteBox( Row + 2, Col + 4, String )
	*/

	ColorSet( @cFundo, @PBack )
	Box( Row, Col, Row+4, Col+PstrLen, M_Frame() + " ", Color )
	Print( Row + 2, Col + 4, String, Color)
	return( cScreen )
endef	
    
def Mens( String, Color, nLine )
*********************************
	LOCAL cScreen := SaveScreen()
	LOCAL pstrlen := len(string) + 6
	LOCAL Row
	LOCAL Col
	LOCAL Col2

	if nLine = Nil
		Row	 := ((  LastRow() + 1 ) / 2 ) - 2
		Col	 := ((( LastCol() + 1 ) - PstrLen ) ) / 2
		Col2	 := ((( LastCol() + 1 ) / 2 ) - 10 )
	else
		Row	 := nLine
		Col	 := ((( LastCol() + 1 ) - PstrLen ) ) / 2
		Col2	 := ((( LastCol() + 1 ) / 2 ) - 10 )
	endif
	MsBox( Row, Col, Row+4, Col+ PstrLen, Color, false )
	WriteBox( Row + 2, Col + 4, String )
	return cScreen

Function ColorSet( pfore, pback, pUns )
***************************************
	if pfore == nil
		 pfore := Standard()
		 pback := Enhanced()
	elseif pfore < 0
		 pfore := Standard()
		 pback := Enhanced()
	else
		 pback := Roloc(pfore)
	endif
	return( nil )

function m_frame()
	return B_SINGLE_DOUBLE

function cor()
	return 31

Function MS_Box( nRow, nCol, nRow1, nCol1, cFrame, nCor)
********************************************************
	LOCAL nComp 	 := ( nCol1 - nCol )-1
	DEFAU cFrame TO M_Frame()
	DEFAU nCor	 TO Cor()
	return(Hb_DispBox( nRow, nCol, nRow1, nCol1, cFrame + " ", nCor))

Function Roloc(nColor)
**********************
LOCAL cColor  := ColorIntToStr(nColor)
LOCAL inverse := FT_InvClr( cColor)
Return(nColor := ColorStrToInt(inverse))


FUNCTION nSetColor(std, enh, uns)
*********************************
LOCAL cStd, ;
	   cEnh, ;
		cUns, ;
		cColor

cStd	 := attrtoa(std)
cEnh	 := attrtoa(enh)
cUns	 := attrtoa(uns)
//cColor := setcolor()

ColorStandard(std)
ColorEnhanced(enh)
ColorUnselected(uns)
cColor := cStd + ',' + cEnh + ',,,' + cUns

//cColor := strswap(cColor, "," , 1, cStd)
//cColor := strswap(cColor, "," , 2, cEnh)
//cColor := strswap(cColor, "," , 4, cUns)
Setcolor( cColor )
Return Nil

//******************************************************************************

FUNCTION cSetColor(ColorStr)
****************************
LOCAL nStd, ;
		nEnh, ;
		nUns

nStd := atoattr( strextract( ColorStr, ",", 1))
nEnh := atoattr( strextract( ColorStr, ",", 2))
nUns := atoattr( strextract( ColorStr, ",", 4))

/*
* Set FUNCky Colors
*/
ColorStandard(nStd)
ColorEnhanced(nEnh)
Colorunselected(nUns)

/* Set Clipper Colors */
SetColor( ColorStr )
return Nil

//******************************************************************************

Function atoattr(cColor)
************************
return (ColorStrToInt(cColor))

//******************************************************************************

function attrtoa(nColor)
************************
return (ColorIntToStr(nColor))

//******************************************************************************

function ColorStandard( nStd )

   // ***************************
   STATI nStandard
   LOCAL nSwap := nStandard

   IF ( ISNIL( nStd ) )
      RETURN nStandard
   ELSE
      nStandard := nStd
   ENDIF
   RETURN nSwap

// ******************************************************************************

   FUNCTION ColorEnhanced( nEnh )

   // ***************************
   STATI nEnhanced
   LOCAL nSwap := nEnhanced

   IF ( ISNIL( nEnh ) )
      RETURN nEnhanced
   ELSE
      nEnhanced := nEnh
   ENDIF
   RETURN nSwap

// ******************************************************************************

   FUNCTION ColorUnselected( nUns )

   // ***************************
   STATI nUnselected
   LOCAL nSwap := nUnselected

   IF ( ISNIL( nUns ) )
      RETURN nUnselected
   ELSE
      nUnselected := nUns
   ENDIF
   RETURN nSwap

	 FUNCTION ColorIntToStr( xColor )

   // ***************************
   LOCAL cColor
   Return( cColor := ft_N2Color( xColor ) )

   FUNCTION ColorStrToInt( xColor )

   // ***************************
   LOCAL nColor
   Return( nColor := ft_Color2N( xColor ) )

def aMaxStrLen( xArray )
*----------------------------*
	LOCAL nTam    := Len(xArray)
	LOCAL nLen    := 0
	LOCAL nMaxLen := 0
	LOCAL x

	For x := 1 To nTam
		nLen := Len(xArray[x])
		if nMaxLen < nLen
			nMaxLen := nLen
		endif	
	Next
	return( nMaxLen )

//******************************************************************************

Function aPrintLen( xArray )
*****************************
return( Len( xArray))


Function StrExtract( string, delims, ocurrence )
************************************************
LOCAL nInicio := 1
LOCAL nConta  := GT_StrCount(delims, string)
LOCAL aArray  := {}
LOCAL aNum    := {}
LOCAL nLen    := Len(delims)
LOCAL cChar   := Repl('%',nLen)
LOCAL cNewStr := String
LOCAL nPosIni := 1
LOCAL aPos
LOCAL nFim
LOCAL x
LOCAL nPos

IF cChar == delims
   cChar := Repl("*",nLen)
EndIF

IF nConta = 0 .AND. ocurrence > 0
   return(string)
ENDIF


/*
For x := 1 to nConta
   nInicio   := At( Delims, cNewStr)
   cNewStr   := Stuff(cNewStr, nInicio, 1, cChar)
	nFim      := At( Delims, cNewStr)
	cString   := SubStr(cNewStr, nInicio+1, nFim-nInicio-1)
	if !Empty(cString)
	   Aadd( aArray, cString)
	End
Next
*/

/*
For x := 1 to nConta
   nPos      := At( Delims, cNewStr)
   cNewStr   := Stuff(cNewStr, nPos, 1, cChar)
	nLen      := nPos-nPosini
	cString   := SubStr(cNewStr, nPosIni, nLen)
	nFim      := At( Delims, cNewStr)
	nPosIni   := nPos+1
	if !Empty(cString)
	   Aadd( aArray, cString)
	End
Next
*/

aPos   := aStrPos(string, Delims)
nConta := Len(aPos)
For x := 1 to nConta
   nInicio  := aPos[x]
	IF x = 1
	   cString   := Left(String, nInicio-1)
	Else
		nFim     := aPos[x-1]
	   cString  := SubStr(String, nFim+1, nInicio-nFim-1)
	EndIF
	Aadd( aArray, cString)
Next

nConta := Len(aArray)
IF ocurrence > nConta .OR. oCurrence = 0
   return(string)
EndIF

Return(aArray[ocurrence])


Function StrSwap( string, cChar, nPos, cSwap)
*********************************************
	LOCAL nConta := GT_StrCount( cChar, string ),;
	      aPos,;
	      nX,;
			nLen

	IF nConta > 0
      aPos := aStrPos(string, cChar)
		nLen := Len(aPos)
		IF nLen >= 0
		   IF nPos <= nLen
		      string := Stuff(string, aPos[nPos], Len(cChar), cSwap)
		   EndIF
		EndIF
	EndIF
return( string)

//******************************************************************************

Function aStrPos(string, delims)
********************************
LOCAL nConta  := GT_StrCount(delims, string)
LOCAL nLen    := Len(delims)
LOCAL cChar   := Repl("%",nLen)
LOCAL aNum    := {}
LOCAL x

IF cChar == delims
   cChar := Repl("*",delims)
EndIF

IF nConta = 0
   Return(aNum)
EndIF

FOR x := 1 To nConta
   nPos   := At( Delims, string )
	string := Stuff(string, nPos, 1, cChar)
	Aadd( aNum, nPos)
Next
Aadd( aNum, Len(string)+1)
Return(aNum)

//******************************************************************************

function isnil(x)
	return(HB_ISNIL(x))

Function FazMenu( nTopo, nEsquerda, aArray, Cor )
*************************************************
	LOCAL cFrame2	  := SubStr( M_Frame(), 2, 1 )
	LOCAL nFundo	  := ( nTopo + Len( aArray ) + 3 )
	LOCAL cTitulo    := "ESCOLHA UMA OPCAO"
	LOCAL nTamTitle  := ( Len( cTitulo ) + 12 )
	LOCAL nDireita   := ( nEsquerda + AmaxStrLen( aArray ) + 1 )
	LOCAL cChar      := chr(186) + chr(61) + chr(186) + chr(24) + chr(186) + chr(25) + chr(186)

	IF ( nDireita - nEsquerda ) <  nTamTitle
		nDireita := ( nEsquerda + nTamTitle )
	EndIF
	Cor := IIF( Cor = NIL, Cor(), Cor )
	//MaBox( nTopo, nEsquerda, nFundo, nDireita )
	MS_Box( nTopo, nEsquerda, nFundo, nDireita )
	Print(nFundo-2, nEsquerda+1, Repl(SubStr(M_Frame(),2,1),(nDireita-nEsquerda)-1), Cor())
	Print(nFundo-1, nEsquerda+1, cTitulo, Roloc(Cor()), (nDireita-nEsquerda)-1)
	Print(nFundo-1, nDireita-8, cChar, Roloc(Cor()))
	//nChoice := Mx_Choice( @nTopo, @nEsquerda, aArray, Cor )
	nSetColor(Cor)
	nChoice := Achoice( nTopo+1, nEsquerda+1, nFundo-1, nDireita-1, aArray)
return( nChoice )


Function ResTela( cScreen )
***************************
Return( RestScreen( 0, 0, MaxRow(), MaxCol(),  cScreen ))


function order(Ordem)
*********************
	hb_default( @ordem, 0)
	DbSetOrder( Ordem )
	DbGoto( Recno())   // fixar bug
	return( IndexOrd())


function AreaAnt( Arq_Ant, Ind_Ant )
************************************
	IF !Empty( Arq_Ant )
		Select( Arq_Ant )
		Order( Ind_Ant )
	EndIF
	return nil

def MsDecrypt( Pal )
**************************
	LOCAL cChave	:= ""
	LOCAL nX 		:= 0

	For nX := 0 To 10
		cChave += Chr( Asc( Chr( nX )))
	Next
	return( Decrypt( Pal, cChave ))

def MsEncrypt( Pal )
*************************
	LOCAL cChave	:= ""
	LOCAL nX 		:= 0

	For nX := 0 To 10
		cChave += Chr( Asc( Chr( nX )))
	Next
	return( Encrypt( Pal, cChave ))



Function Escolhe
Param Col1, Lin1, Col2, Nome_Campo, Cabecalho, aRotina, lExcecao, aRotinaAlteracao, aRotinaExclusao, lLimpaTela, lDbSeek
************************************************************************************************************************
LOCAL _Atela  := SaveScreen()
LOCAL _corant := SetColor()
LOCAL Arq_Ant := Alias()
LOCAL Ind_Ant := IndexOrd()
LOCAL _Tam
LOCAL Lin2
LOCAL nRecno
		cCampo  := Nome_Campo
      Col2    := IF( Col2 == 22, (MaxRow()-2), Col2)
      nCol    := Col2
		nLin	  := Lin1+1
PRIVA aScroll
IF ValType( Nome_Campo ) != "A"
	Cabecalho := IIF( Cabecalho = Nil, "", Cabecalho )
	IF ValType( &Nome_Campo ) = "D"
		Lin2 := Lin1 + 9
	Else
		nTam := Len( &Nome_Campo. )
		nCab := Len( Cabecalho )
		Lin2 := IIF( nTam >= nCab, nTam + ( Lin1 + 1 ), nCab + ( Lin1 + 1 ) )
	EndIF
	_Vetor1 := { Nome_Campo }
	_Vetor2 := { IF ( Cabecalho = Nil, Cabecalho := .T. , Cabecalho := Upper( Cabecalho ) ) }
   IF Lin2 >= 78
      Lin2 := 78
	EndIF
Else
	_Vetor1 := Nome_Campo
	_Vetor2 := Cabecalho
	Lin2	  := 70
EndIF
IF lLimpaTela = NIL .OR. lLimpatela = OK
	oMenu:Limpa()
EndIF
MaBox( Col1, Lin1,	Col2, Lin2+2, /*Cabecalho*/ )
MaBox( Col1, Lin1+2, Col2, Lin2+2, /*Cabecalho*/ )
Print( Col1, Lin1+2, SubStr( B_SINGLE_DOUBLE, 1, 1 ), Cor())
Print( Col2, Lin1+2, SubStr( B_SINGLE_DOUBLE, 5, 1 ), Cor())

IF aRotina != NIL
	IF Alias() = "LISTA"
		IF aRotinaAlteracao != NIL
			Print( Col2, Lin1+3, "INSERT _Incluir DELETE _Excluir F2 _Cod Fabr CTRL+ENTER _Alterar", Roloc( Cor()), Lin2 - (Lin1+1))
		Else
			Print( Col2, Lin1+3, "INSERT _Incluir DELETE _Excluir F2 _Cod Fabr", Roloc( Cor()), Lin2 - (Lin1+1))
		EndIF
	Else
		IF aRotinaAlteracao != NIL
			Print( Col2, Lin1+3, "INSERT _Incluir DELETE _Excluir F2 _Filtro CTRL+ENTER _Alterar", Roloc( Cor()), Lin2 - (Lin1+1))
		Else
			Print( Col2, Lin1+3, "INSERT _Incluir DELETE _Excluir F2 _Filtro", Roloc( Cor()), Lin2 - (Lin1+1))
		EndIF
	EndIF
EndIF
IF lDbSeek != NIL
	nRecno := Recno()
EndIF
DbGoTop()
IF Eof()
	IF aRotina != NIL
		IF Conf("Arquivo Vazio... Deseja Incluir Registros ?")
			Eval( aRotina[1])
			AreaAnt( Arq_Ant, Ind_Ant )
		EndIF
	EndIF
EndIF
IF lDbSeek != NIL
	DbGoto( nRecno )
EndIF
ScrollBarDisplay( aScroll := ScrollBarNew( Col1+1, Lin1+1, Col2-1, Roloc(Cor()),1))
DbEdit((Col1+1), (Lin1+3), (Col2-1), (Lin2+1), _Vetor1, "_Funcao", OK, _Vetor2 )
ResTela( _Atela )
SetColor(_corant )
Return( OK )

Function _Funcao( Modo, Ponteiro , Var)
***************************************
LOCAL GetList		:= {}
LOCAL cScreen		:= SaveScreen()
LOCAL Key			:= LastKey()
LOCAL Arq_Ant		:= Alias()
LOCAL Ind_Ant		:= IndexOrd()
LOCAL cN_Original := Space(15)
STATI nPosicao 	:= 1
LOCAL nLastrec 	:= Lastrec()
LOCAL Registro
LOCAL Salva_tela

ScrollBarUpdate( aScroll, Recno(), Lastrec(), OK )
Do Case
	Case Key = F2
		IF Alias() = "LISTA"
			//oMenu:Limpa()
			//MaBox( 10, 10, 12, 48 )
			//@ 11, 11 Say "Codigo Fabricante..." Get cN_Original Pict "@!" Valid CodiOriginal( @cN_Original )
			//Read
			//IF LastKey() = ESC
			//	ResTela( cScreen )
		   //		Return(1)
			//EndIF
			//ResTela( cScreen )
		Else
			IF Alias() = "RECEBER"
				//oMenu:Limpa()
				//ClientesFiltro()
				ResTela( cScreen )
			EndIF
		EndiF
		AreaAnt( Arq_Ant, Ind_Ant )
		Return(1)

	Case Key = K_INS
		IF aRotina != Nil
			IF PodeIncluir()
				Eval( aRotina[1])
			Else
				IF lExcecao != Nil
					Eval( aRotina[1])
				EndiF
			EndIF
		EndIF
		AreaAnt( Arq_Ant, Ind_Ant )
		Return(1)

	Case Key = K_CTRL_RET		 // Ctrl-Enter
		IF aRotinaAlteracao != Nil
			IF PodeAlterar()
				Eval( aRotinaAlteracao[1])
			Else
				IF lExcecao != Nil
					Eval( aRotinaAlteracao[1])
				EndiF
			EndIF
		EndIF
		AreaAnt( Arq_Ant, Ind_Ant )
		Return(1)

	Case Key = K_DEL
		IF aRotina != Nil
			IF PodeExcluir()
				IF aRotinaExclusao != NIL
					IF !Eval( aRotinaExclusao[1] )
						Return(1)
					EndIF
				EndIF
				ErrorBeep()
				IF Conf("Pergunta: Excluir Registro sob o Cursor ?")
					IF TravaReg()
						DbDelete()
						Libera()
					  Keyb Chr( K_CTRL_PGUP )
					EndIF
				EndIF
			EndIF
		EndIF
		Return(1)

	Case Modo < 4
		Return(1)

	CASE LastKey() = 27
		nPosicao := 1
		Return(0)

	CASE LastKey() = 13
      Return(0)

	CASE LastKey() >= 48 .AND. LastKey() <= 122	&&  1 a Z
		IF   ValType( cCampo ) = "C"
			xVar := Upper(Chr(Key))
			xVar := xVar + Space( nTam - Len( xVar))
			Keyb(Chr(K_RIGHT))
			@ nCol-1, nLin+2 Get xVar Pict "@!"
			Read

		ElseIf ValType( cCampo ) = "N"
			IF nKey < Chr(48) .OR. nKey > Chr(57) // 0 a 9
				Return(1)
			EndIF
			xVar := Chr(nKey)
			Keyb(Chr(K_RIGHT))
			@ nCol-1, nLin+2 Get xVar
			Read

		ElseIf ValType( cCampo ) = "D"
			xVar := Date()
			@ nCol-1, nLin+2 Get xVar Pict "##/##/##"
			Read
		EndIF
		IF LasTKey() = ESC
			ResTela( cScreen )
			Return(1)
		EndIF
		xVar := IIF( ValType( cCampo ) = "C", AllTrim( xVar ), xVar)
		ResTela( cScreen )
		DbSeek( xVar )
		Return(1)

	OTHERWISE
		IF Alias() = "RECEBER"
		EndIF
		Return(1)

ENDCASE

FUNCTION ScrollBarNew( nTopRow, nTopColumn, nBottomRow, cColorString, nInitPosition )
*************************************************************************************
	LOCAL aScrollBar := ARRAY( TB_ELEMENTS )

	aScrollBar[ TB_ROWTOP ] 	:= nTopRow
	aScrollBar[ TB_COLTOP ] 	:= nTopColumn
	aScrollBar[ TB_ROWBOTTOM ] := nBottomRow
	aScrollBar[ TB_COLBOTTOM ] := nTopColumn

	IF cColorString == NIL
		cColorString := "W/N"
	ENDIF
	aScrollBar[ TB_COLOR ] := cColorString

	IF nInitPosition == NIL
		nInitPosition := 1
	ENDIF
	aScrollBar[ TB_POSITION ] := nInitPosition

	RETURN ( aScrollBar )

FUNCTION ScrollBarDisplay( aScrollBar )
***************************************
LOCAL cOldColor
LOCAL nRow

cOldColor := SETCOLOR( aScrollBar[ TB_COLOR ] )
@ aScrollBar[ TB_ROWTOP ], aScrollBar[ TB_COLTOP ] SAY TB_UPARROW
@ aScrollBar[ TB_ROWBOTTOM ], aScrollBar[ TB_COLBOTTOM ] SAY TB_DNARROW

FOR nRow := (aScrollBar[ TB_ROWTOP ] + 1) TO (aScrollBar[ TB_ROWBOTTOM ] - 1)
	@ nRow, aScrollBar[ TB_COLTOP ] SAY TB_BACKGROUND
NEXT
SETCOLOR( cOldColor )
RETURN ( aScrollBar )

FUNCTION ScrollBarUpdate( aScrollBar, nCurrent, nTotal, lForceUpdate )
*******************************************************************
LOCAL cOldColor
LOCAL nNewPosition
LOCAL nScrollHeight := ( aScrollBar[TB_ROWBOTTOM] - 1 ) - ( aScrollBar[TB_ROWTOP] )

IF nTotal < 1
	nTotal := 1
ENDIF

IF nCurrent < 1
	nCurrent := 1
ENDIF

IF nCurrent > nTotal
	nCurrent := nTotal
ENDIF

IF lForceUpdate == NIL
	lForceUpdate := .F.
ENDIF

cOldColor := SETCOLOR( aScrollBar[ TB_COLOR ] )

nNewPosition := ROUND( (nCurrent / nTotal) * nScrollHeight, 0 )

nNewPosition := IIF( nNewPosition < 1, 1, nNewPosition )
nNewPosition := IIF( nCurrent == 1, 1, nNewPosition )
nNewPosition := IIF( nCurrent >= nTotal, nScrollHeight, nNewPosition )

IF nNewPosition <> aScrollBar[ TB_POSITION ] .OR. lForceUpdate
	@ (aScrollBar[ TB_POSITION ] + aScrollBar[ TB_ROWTOP ]), aScrollBar[ TB_COLTOP ] SAY TB_BACKGROUND
	@ (nNewPosition + aScrollBar[ TB_ROWTOP ]), aScrollBar[ TB_COLTOP ] SAY TB_HIGHLIGHT
	aScrollBar[ TB_POSITION ] := nNewPosition
ENDIF
SETCOLOR( cOldColor )
RETURN ( aScrollBar )

Function Refresh()
******************
DbSkip(0)
Return Nil

Function TravaReg( nTentativa, aRegistros )
******************************************
LOCAL cScreen := SaveScreen()
LOCAL lContinua, Restart := OK
nTentativa := IIF( nTentativa = Nil, 2, nTentativa )
lContinua  := ( nTentativa == 0 )

WHILE Restart
	WHILE ( !RLock() .AND. ( nTentativa > 0 .OR. lContinua ))
		  Mensagem(" Travando Registro " + AllTrim(Str( Recno())) + " no Arquivo " + Alias(), CorBox())
		  IF InKey(1) = ESC
			  Exit
		  EndIF
		  nTentativa--
	EndDo
	IF !RLock()
		IF !Conf("Registro em uso. Tentar Novamente ? " )
			 ResTela( cScreen )
			 Return( FALSO )
		EndIF
		ResTart := OK
		nTentativa := 4

	Else
		ResTela( cScreen )
		Return( OK )
	EndIF
EndDo

Function TravaArq()
*******************
	IF Flock()
		Return( OK )
	EndIF
	WHILE !FLock()
		ErrorBeep()
		IF !Conf("Arquivo em uso em outra Esta‡ao. Tentar Novamente ?" )
			Return( FALSO )
		EndIF
		IF FLock()
			Return( OK )
		EndIF
	EndDo
	Return( OK )

Function Incluiu()
******************
	DbAppend()
	IF !NetErr()
		Return( OK )
	EndIF
	DbAppend()
	WHILE NetErr()
		ErrorBeep()
		IF !Conf("Registro em uso em outra estaÃ§Ã£o. Tentar Novamente ? " )
			Return( FALSO )
		EndIF
		DbAppend()
		IF !NetErr()
			Return( OK )
		EndIF
	EndDo
	return( OK )

Function Libera()
*****************
//DbCommit()			  // Atualiza Buffers
DbSkip(0)				// Refresh
DbGoto( Recno())		// Refresh
DbUnLock()				// Libera Registros / Arquivos
Return Nil


function podeincluir()
	return OK

function podeexcluir()
	return OK

function podealterar()
	return OK

function Write( Linha, Col, xString, nCor)
*-----------------------------------*
	LOCAL Color_Ant := SetCOlor()

	Linha   := Iif( Linha	= NIL, Row(),	Linha   )
	Col	  := Iif( Col		= NIL, Col(),	Col	  )
	xString := Iif( xString = NIL, "",     xString )

	if nCor = nil
		//SetColor(ColorIntToStr(Color_Ant))
		DevPos( Linha, Col ) ; Qqout( xString )
	else
		Print( Linha, Col, xString, nCor )
      SetColor( Color_Ant)
   endif
	return nil

function Print( row, col, string, attrib, length, cChar)
*+-----------------------------------------------------+*
	LOCAL Color_Ant := SetColor()
	LOCAL nLen      := Len(string)
	DEFAU attrib    TO oMenu:CorMenu //ColorStrToInt(Color_Ant)
	DEFAU length    TO nLen
	DEFAU cChar     TO Space(1)

	if length > nLen
		string += Repl(cChar,length-nlen)
		nLen   := length
	endif
	SetColor(ColorIntToStr(attrib))
	DevPos(row, col) ; DevOut(Left(string,nLen))
	//hb_DispOutAt( row, col, Left(string,nLen))
	SetColor( Color_Ant)
	return NIL

function printf(string, attrib)
	LOCAL Color_Ant := SetColor()
	LOCAL row       := row()
	LOCAL col       := col()
	DEFAU attrib  TO oMenu:CorMenu //ColorStrToInt(Color_Ant)

	SetColor(ColorIntToStr(attrib))
	DevPos(row, col) ; DevOut(string)
	//hb_DispOutAt( row, col, string)
	SetColor( Color_Ant)
	return string

function aPrint( row, col, string, attrib, length)
	LOCAL Color_Ant := SetColor()
	LOCAL nLen      := Len(string)

	hb_default(@attrib, ColorStrToInt(SetColor()))
	hb_default(@length, nLen)

	if length > nLen
		string += Repl(Space(1),length-nlen)
		nLen   := length
	endif

	dispbegin()
	SetColor(ColorIntToStr(attrib))
	DevPos(row, col) ; DevOut(Left(string,nLen))
	SetColor( Color_Ant)
	dispend()
	return NIL

def FechaTudo()
*-------------------*
	DbCloseAll()
	return
endef

def MsgOK( String, nOK)
   __DefaultNIL(@String, "Tecle algo")
   __DefaultNIL(@nOk, true)
   return(mensagem( String, nil , nil , nil , nil, nOk ))
endef   

def AlertPy(string, cor, centralizar, nOK, cOk)
*----------------------------------------------*
	AlertaPy(string, cor, centralizar, nOK, cOk)
	return nil
endef

def AlertaPy(string, Cor, Centralizar, lOK, aPrompt)
*--------------------------------------------------*
	LOCAL nlinhas := 0
	LOCAL aString := ""
	LOCAL nLen    := 0
	LOCAL nPv     := 0
	LOCAL nSep    := 0
	LOCAL nRow
	LOCAL nCol
	LOCAL nRow1
	LOCAL nCol1
   LOCAL nMax
   LOCAL xTemp
	LOCAL x	
    
   hb_default(@string, "AlertaPy")    
   //hb_default(@cor, 31)    
	hb_default(@centralizar, false)    
	hb_default(@lOk, true) 
   hb_default(@aPrompt, {" Ok "}) 
   
   nlinhas := strcount(';', string)
	aString := StrSplit( string, ';', -1)  
	nLen    := amaxstrlen( aString)   
   nMax    := Len(aString)	     		   
     
   if aPrompt == nil .or. len(aPrompt) == 0 .or. !IsArray(aPrompt)
		aPrompt := {" Ok "}
	endif
	
	// verifica se a string contem separador de linhas ;-; 
	
	for x := 1 To nMax
		switch aString[x] 
			case ';'; nPv++ ;	exit
			case '-'; nSep++;	exit
		endswitch
	next
	 
	if nSep == 0 // Sem linha horizontal
		string  += ';-;'
		nlinhas := strcount(';', string)
		aString := StrSplit( string, ';', -1)  
		nLen    := amaxstrlen( aString)	
	endif		

   nMax    := Len(aString)	     		   
   
   if !IsArray(Cor)
      xTemp := Cor
      Cor   := Array(nMax)      
      Afill( Cor, xTemp)
   endif   
   
   if !IsArray(Centralizar)
      xTemp       := Centralizar 
      Centralizar := Array(nMax)
      Afill(Centralizar, xTemp )
   endif    
   
   if nLen < 6
		nLen = 6
	endif	 
   
	row     := (maxrow() / 2) - (nlinhas / 2) - 4
	col     := (maxcol() - nLen) / 2	 
	cScreen := SaveScreen()	 
	nrow    := row
	ncol    := (col-2)
	nrow1   := (row+4+nlinhas)
	ncol1   := (col+nLen+1)	 	 
	 
	nTamPrompt := 0
	nLenaPrompt := Len(aPrompt)	
	for k := 1 to nLenaPrompt
		nTamPrompt += Len(aPrompt[k])
	next	
	 
	center  := (maxcol()/2) - (nTamPrompt/2)
	 
//==================== 20/2 = 10
       //center
	 
    setcursor(0)    
    box(nrow, ncol, nrow1, ncol1, m_frame(), Cor[1])
    for x := 1 To Len(aString)	     
	     cString := aString[x]
        if centralizar[x]
            ncol := (maxcol() - len(cString)) / 2
        else
            ncol := col
		  endif		
		  if cString == '-'
			  LinhaHorizontal(row + 1, Col - 2, Col + nlen, cor[x])
		  else	  
				aprint(row + 1, ncol, cString, cor[x])
		  endif		
        row := row + 1
	 next	  
	 if lOk
		if nLenaPrompt = 1
			aprint(row + 2, center, aPrompt[1], roloc(cor[1]))
			inkey(0)
			restela(cScreen) 	 
			return(cScreen) 	 
		else			
			//nSetColor(cor)
			return( nRetval := aChoice( row, Col, row + 4, Col + nLen, aPrompt))
		endif
	 endif
	 return(cScreen) 	 
endef	 

*==================================================================================================*

def LinhaHorizontal(nrow, ncol, nlen, ncor)
	LOCAL nComp  := (nLen - nCol)
	LOCAL cFrame := m_Frame()

	aprint(nRow, nCol, chr(195), nCor, 1)
	//aprint(nRow, nCol + 1, replicate(substr(cFrame, 2, 1), nComp), nCor, 1)
	aprint(nRow, nCol + 1, replicate(chr(196), nComp), nCor, 1)
	aprint(nRow, nCol + nComp + 1, chr(180), nCor, 1)
	return NIL
endef

*==================================================================================================*

def StrSplit( string, delims)
	LOCAL nInicio := 1
	LOCAL nConta  := GT_StrCount(delims, string)
	LOCAL aArray  := {}
	LOCAL aNum    := {}
	LOCAL nLen    := Len(delims)
	LOCAL cChar   := Repl('%',nLen)
	LOCAL cNewStr := String
	LOCAL nPosIni := 1
	LOCAL aPos
	LOCAL nFim
	LOCAL x
	LOCAL nPos

	if cChar == delims
		cChar := Repl("*",nLen)
	endif

	if nConta = 0 
		return { string }
	endif
		
	aPos   := aStrPos(string, Delims)
	nConta := Len(aPos)
	For x := 1 to nConta 
		nInicio  := aPos[x]
		if x = 1
			cString   := Left(String, nInicio-1)
		else
			nFim     := aPos[x-1]
			cString  := SubStr(String, nFim+1, nInicio-nFim-1)
		endif	
		Aadd( aArray, cString)
	Next
	return(aArray)
endef

*==================================================================================================*


def ms_swap_use(cBcoDados, lModo, cAlias)
	LOCAL cExt       := GetFileExtension(cBcoDados)
	LOCAL cBcoSemExt := StrTran( cBcoDados, cExt)

	hb_default(@lModo, MONO)
	hb_default(@cAlias, cBcoDados)
	cBcoDados := Upper(cBcoDados)     // para compatibilidade em linux
	cAlias    := Iif( cAlias = NIL, cBcoSemExt, cAlias )

	if (oAmbiente:Letoativo)
		cBcoDados := oAmbiente:LetoPath + cBcoDados
	endif

	if lModo
		Use (cBcoDados) Shared Alias (cAlias) New
	else
		Use (cBcoDados) Exclusive Alias (cAlias) New
	endif

endef

*==================================================================================================*

*==================================================================================================*

def ms_swap_dbcreate(cFile, aStru)
	LOCAL cLocalFile := ms_swap_sep(cFile)
	return DbCreate(cLocalFile, aStru)
endef

*==================================================================================================*

def ms_swap_ferase(cFile)
	LOCAL cLocalFile := ms_swap_sep(cFile)

	return Ferase(cLocalFile)

endef

*==================================================================================================*

def ms_swap_rename(cFile, cNewFile)
	LOCAL cLocalFile := ms_swap_sep(cFile)
	LOCAL cLocalNew  := ms_swap_sep(cNewFile)

	return msrename(cLocalFile, cLocalNew)

endef

*==================================================================================================*

def ms_swap_sep(cFile)
	LOCAL cOldFile := cFile

	if right(TrimStr(oAmbiente:xBase),1) == "/" .OR. ;
	   right(TrimStr(oAmbiente:xBase),1) == "\"
		cBase := left(oAmbiente:xBase, len(oAmbiente:xBase)-1)
	else
		cBase := oAmbiente:xBase
	endif
	if (oAmbiente:Letoativo)
		_SEP_ := '/'
	else
		_SEP_ := DEF_SEP
	endif
	cFile := cBase + _SEP_ + cFile

/*
	alert(;
				oAmbiente:xBase + " : " + cBase + ";" + ;
				cOldfile + ";" + ;
				cfile    + ";" + ;
				"SWAP_SEP : " + Procname(1) + '(' + strzero(procline(1),4) + ');' +	;
				"SWAP_SEP : " + Procname(2) + '(' + strzero(procline(2),4) + ');' + ;
				"SWAP_SEP : " + Procname(3) + '(' + strzero(procline(3),4) + ');' + ;
				"SWAP_SEP : " + Procname(4) + '(' + strzero(procline(4),4) + ');' + ;
				"SWAP_SEP : " + Procname(5) + '(' + strzero(procline(5),4) + ');' + ;
				"SWAP_SEP : " + Procname(6) + '(' + strzero(procline(6),4) + ');' + ;
				"SWAP_SEP : " + Procname(7) + '(' + strzero(procline(7),4) + ')';
			)
*/

	return(cFile)
endef

*==================================================================================================*

def ms_swap_dir(cFile)
	LOCAL cBase := alltrim(oAmbiente:xRoot)

	if right(cBase, 1) == "/" .OR. right(cBase, 1) == "\"
		cBase := left(cBase, len(cBase)-1)
	endif
	cBase += DEF_SEP
	return(cBase)
endef

*==================================================================================================*

def ms_swap_file(cFile)
	LOCAL cLocalFile := ms_swap_sep(cFile)

	//alert(cLocalFile)

	return File(cLocalFile)
endef

*==================================================================================================*

def ms_swap_fopen(cFile, modo)
	LOCAL cLocalFile := ms_swap_sep(cFile)
	LOCAL Handle

	return Fopen(cFile, Modo)
endef

*==================================================================================================*

def ms_swap_fcreate(cFile, modo)
	LOCAL cLocalFile := ms_swap_sep(cFile)
	LOCAL handle

	return Fcreate(cLocalFile, modo)
endef

*==================================================================================================*

def ms_swap_ferror()
   LOCAL nError

	return Ferror()
endef

*==================================================================================================*

def ms_swap_fclose(handle)

	return Fclose(handle)

endef

*==================================================================================================*

def ms_swap_fseek(handle, n, modo)

	return fseek(handle, n, modo)
endef

*==================================================================================================*

def ms_swap_fwrite(handle, cbuffer)

	return(fwrite(handle, cbuffer))
endef

*==================================================================================================*

def ms_swap_fread(Handle, cBuffer, nFileLen)

	return fread(Handle, @cBuffer, nFileLen)
endef

*==================================================================================================*

def ms_swap_extensao(cFile, cNewExt)
	LOCAL cOldExt  := GetFileExtension(cFile)
	LOCAL cNewFile
   LOCAL nAt      := AT( ".", cFile )

   if nAt != 0
      nAt--
   else
      nAt := Len(cFile)
   endif

	cNewFile := Left(cFile, nAt)
   cNewFile += cNewExt
	return cNewFile
endef

*==================================================================================================*

def ms_remove_extensao(cFile)
	LOCAL cOldExt  := GetFileExtension(cFile)
	LOCAL cNewFile
   LOCAL nAt      := Rat( ".", cFile)

   if nAt != 0
      nAt--
   else
      nAt := Len(cFile)
   endif

	cNewFile := Left(cFile, nAt)
	return cNewFile
endef

*==================================================================================================*

def ms_remove_path(cFile)
	LOCAL cNewFile := ""
   LOCAL nPos

   cFile := ms_remove_extensao(cFile)
   if (nPos := RAT( _SLASH_, cFile)) != 0
      cNewFile = SUBSTR(cFile, ++nPos, Len(cFile))
   endif
	return cNewFile
endef

*==================================================================================================*

def GetRoot(cstring)
	LOCAL nLen    := len(cstring)
	LOCAL sep     := DEF_SEP
	LOCAL npos    := 0

	if (npos := rat( sep, cString)) > 0
	  //alert(hb_strFormat("%s : %d", cstring, npos))
	  return(left(cstring, --npos))
	endif
	return ""

*==================================================================================================*

def ms_mem_dbCreate(cFile, aStru, cAlias, _rddname)
	 /*
	DBCREATE( <cDatabase>, <aStruct>, [<cDriver>], [<lOpen>], [<cAlias>] )
	<cDatabase> Name of database to be create
	<aStruct> Name of a multidimensional array that contains the database structure
	<cDriver> Name of the RDD
	<lOpenNew> 3-way toggle to Open the file in New or Current workarea:
								  NIL     The file is not opened.
								  True    It is opened in a New area.
								  False   It is opened in the current area.
	<cAlias> Name of database Alias
	*/

	/*
	//  usando normal pelo nome do alias
	xAlias  := FaturaNew(FTempMemory(), "XALIAS")
	nHandle := FTempMemory()
	xAlias  := FaturaNew(nHandle, "XALIAS")
	xNtx	  := FTempMemory()
	? 1, xALias
	? 2, (xalias)

	Area("XALIAS"))
	? alias()
	Inde On Codigo To mem:(xNtx)
	? xalias->(Recno())
	? xAlias->Codigo
	ms_mem_dbclosearea(nHandle)

	// usando macro
	xTemp  := FaturaNew(FTempMemory(),)
	xTemp  := FaturaNew(FTempMemory(),"XTEMP")
	xTemp  := FaturaNew(,"XTEMP")
	xTemp  := FaturaNew()
	Area((xTemp))
	? (xTemp)->(Recno())
	? (xTemp)->Codigo
	*/

	REQUEST HB_MEMIO
	hb_default(@cFile, FTempMemory())
	hb_default(@cAlias, cFile)
	hb_default(@_rddname, nil)	// default sistema
	dbCreate( "mem:" + (cFile), aStru, _rddname, true, cAlias)
	return Alias()
endef

*==================================================================================================*

def ms_mem_dbclosearea(cFile)
	(cFile)->(DbCloseArea())
   dbDrop( "mem:" + (cFile))
	return nil
endef

*==================================================================================================*

def truefalse(xvar)
	if xvar
		return "true"
	else
		return "false"
	endif
endef

*==================================================================================================*

def formatavar(xvar)
	switch valtype(xvar)
		case "C"
			return(trimstr(xvar))
		case "N"
			return(trimstr(xvar))
		case "L"
			return(truefalse(xvar))
		case "D"
			return(dtoc(xvar))
	endswitch
endef

*==================================================================================================*

def ValueAndTypeVar(xvar)
	switch valtype(xvar)
		case "C"
			AlertaPy("Tipo : C ; Valor : " + trimstr(xvar))
         exit
		case "N"
         AlertaPy("Tipo : N ; Valor : " + trimstr(xvar))
         exit
		case "L"
         AlertaPy("Tipo : L ; Valor : " + truefalse(xvar))
         exit
		case "D"
         AlertaPy("Tipo : D ; Valor : " + dtoc(xvar))
         exit
      case "U"
         AlertaPy("Tipo : U ; Valor : NIL")
         exit
	endswitch
endef

*==================================================================================================*

def FTempMemory()
*----------------*
	LOCAL cFile := ""
	LOCAL nNumber
	LOCAL cNumber
	LOCAL snRandom := Seconds() / Exp(1)
   LOCAL nLimit   := 65535

	snRandom := Log( snRandom + Sqrt(2) ) * Exp(3)
   snRandom := Val( Str(snRandom - Int(snRandom), 17, 15 ) )
	nNumber  := HB_RandomInt(snRandom, 999999)
	cNumber  := StrZero(nNumber, 7)
	cFile    := 'mem' + cNumber
	return cFile
endef

def FTempRandomName( xCoringa, cDir )
*+-----------------------------------+*
	LOCAL cFile  := ""
	LOCAL cExt
	LOCAL nNumber
	LOCAL cNumber
	LOCAL snRandom := Seconds() / Exp(1)
   LOCAL nLimit   := 65535

	hb_default(@xCoringa, "t*.tmp")
   if at(".", xCoringa ) != 0
      cExt := "." + GetFileExtension(xCoringa)
   else
      cExt := "." + xCoringa
   endif
	snRandom := Log( snRandom + Sqrt(2) ) * Exp(3)
   snRandom := Val( Str(snRandom - Int(snRandom), 17, 15 ) )
	nNumber  := HB_RandomInt(snRandom, 999999)
	cNumber  := StrZero(nNumber,7)
	cFile    := 't' + cNumber + cExt
	return cFile
endef

*----------------------------------------------------------------------------------------------------------------------*

def GetFileExtension(cFile)
	return(substr( cFile, at( ".", cFile ) + 1, 3 ))
endef

*----------------------------------------------------------------------------------------------------------------------*

def FTempName( xCoringa, cDir )
	LOCAL cTempFile := ""
	LOCAL nConta    := 0
	LOCAL cTela     := Mensagem("Aguarde, Criando Arquivo Temporario.")

	hb_default(@cDir, ms_swap_tmp())
	hb_default(@xCoringa, "t*.tmp")
	//Aeval( Directory( cDir + xCoringa), { | aFile | ms_swap_ferase( aFile[F_NAME])})

	cTempFile := cDir + FTempRandomName(xCoringa, cDir)
	While !file(cTempFile) .AND. nConta <= 100
		cTempFile := cDir + FTempRandomName(xCoringa, cDir)
		nConta++
	EndDo
	restela(cTela)
	return( cTempFile )
endef

*----------------------------------------------------------------------------------------------------------------------*

def FTempPorExt(cExt, cDir)
   LOCAL cFile := ""

   hb_default(@cExt, 'tmp')
   switch lower(cExt)
   case 'txt'
   case 'prn'
      if isnil(cDir)
         cDir := oAmbiente:xBaseTmp
      endif
      cDir += _SLASH_
      return FTempName(cExt, cDir)
      exit
   case 'htm'
      if isnil(cDir)
         cDir := oAmbiente:xBaseHtm
      endif
      cDir += _SLASH_
      return FTempName(cExt, cDir)
      exit
   case 'doc'
      if isnil(cDir)
         cDir := oAmbiente:xBaseDoc
      endif
      cDir += _SLASH_
      return FTempName(cExt, cDir)
      exit
   otherwise
      if isnil(cDir)
         cDir := oAmbiente:xBaseTmp
      endif
      cDir += _SLASH_
      return FTempName('tmp', cDir)
      exit
   endswitch
endef

*==================================================================================================*

def HB_TempName()
*********************
   LOCAL nFileHandle
   LOCAL cFileName

   nFileHandle := HB_FTempCreate( ,,, @cFileName )

   if nFileHandle > 0
     FClose( nFileHandle )
   endif
   return cFileName

def MS_TempName( xCoringa, cDir )
*-------------------------------*
	//return(FT_TEMPFIL( FCurdir()))
	//return(HB_FTEMPCREATE())
	//return(HB_FTEMPCREATEeX())
	LOCAL nPos     := Rat(".", xCoringa)
	LOCAL nLen     := Len(xCoringa)
	DEFAU cDir TO oAmbiente:xBaseTmp
			xCoringa := AllTrim(xCoringa)
			xCoringa := SubStr(xCoringa, nPos, 4)

	return(Upper(TempFile(cDir, xcoringa)))

def nTrim( nVal)
*********************
	return( Trim(ValToStr(nVal)))
endef

def xt_Random( nLimit )
****************************
   STATIC snRandom := Nil
   LOCAL nDecimals
	LOCAL cLimit

   DEFAULT snRandom TO Seconds() / Exp(1)
   DEFAULT nLimit   TO 65535
   snRandom  := Log( snRandom + Sqrt(2) ) * Exp(3)
   snRandom  := Val( Str(snRandom - Int(snRandom), 17, 15 ) )

   nDecimals := At(".", cLimit)
   if nDecimals > 0
      nDecimals := Len(cLimit)-nDecimals
   endif
   return Round( nLimit * snRandom, nDecimals )

Proc Sx_Filter( xStrTop, xStrBottom )
*************************************
	Sx_ClrScope( 0 )
	Sx_ClrScope( 1 )
	Sx_SetScope( 0, xStrTop )
	Sx_SetScope( 1, xStrBottom )
	return

Proc Sx_DbSetFilter( xStrTop, xStrBottom )
******************************************
	Sx_ClrScope( S_TOP )
	Sx_ClrScope( S_BOTTOM )
	Sx_SetScope( S_TOP, xStrTop )
	Sx_SetScope( S_BOTTOM, xStrBottom )
	return

Proc Sx_DbClearFilter()
***********************
	Sx_ClrScope( S_TOP )
	Sx_ClrScope( S_BOTTOM )
	DbGoTop()
	return

def Sx_Count()
*******************
	if !Eof()
		return( 1 )
	endif
	return( 0)

def lAnoBissexto( dData )
	LOCAL nAno := Year( dData )
	return( nAno % 4 == 0 .AND. nAno % 100 != 0)
endef

def DaysInAMonth(dIni, nMes, lString)
******************************************
	LOCAL aDias := {31 , 28 , 31 , 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31}
	LOCAL Result

	hb_default(@dIni, Date())
	hb_default(@nMes, Month(dIni))
	hb_default(@lString, FALSO)

	Result := aDias[nMes]
	if (nMes = 2) .and. IsLeapYear(dIni)
		Result := 29
	endif
	return(if(lString == true , strzero(result,2), result))

def NomeMesesDoAno(dIni, nMes, lAbreviado, lUpper)
*******************************************************
	LOCAL aStringMes := {"Janeiro","Fevereiro","Marco","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"}
	LOCAL Result

	hb_default(@dIni, Date())
	hb_default(@nMes, Month(dIni))
	hb_default(@lAbreviado, FALSO)
	hb_default(@lUpper, FALSO)

	Result := aStringMes[nMes]
	return(if(lUpper, upper(if(lAbreviado, Left(Result,3), Result)), Result))

def LastDayOfMonth(dIni, nMes, lString)
********************************************
	return(DaysInAMonth(dIni, nMes, lString))

def StringToData(cString)
******************************
	hb_default(@cString, Dtoc(Date()))
	return(cTod(cString))

def DataToString(dData)
****************************
	hb_default(@dData, Date())
	return(Dtoc(dData))

def FirstDayOfMonth(dIni, nMes, lString)
*********************************************
	LOCAL Result
	hb_default(@dIni, Date())
	hb_default(@nMes, Month(dIni))
	Result := 1
	return(if(lString == true , strzero(result, 2), result))

def NextMonth(dIni)
************************
	hb_default(@dIni, Date())
	return(month(dIni + 1))

def IsLeapYear(dData)
**************************
	LOCAL nAno := Year( dData )
	return( nAno % 4 == 0 .AND. nAno % 100 != 0)

def DayOfWeek(dIni)
*************************
	hb_default(@dIni, Date())
	return(Day(dIni))

*==================================================================================================*

def DateToStr( dParms )
   Return( Dtos( dParms ))
endef

*==================================================================================================*

def StrToVal( nParms )
   Return(Val(StrTran(nParms,",",".")))
   Return( Str( nParms ))
endef

*==================================================================================================*

def ValToStr( nParms )
   Return( Str( nParms ))
endef

*==================================================================================================*

def IntToStr( nParms )
   Return( AllTrim(Str( nParms )))
endef

*==================================================================================================*

def ms_swap_tmp()
	LOCAL cBase := alltrim(oAmbiente:xRoot)

	if right(cBase, 1) == "/" .OR. right(cBase, 1) == "\"
		cBase := left(cBase, len(cBase)-1)
	endif
	cBase += DEF_SEP
	cBase += "tmp"
	cBase += DEF_SEP
	return(cBase)
endef

*==================================================================================================*

def DosShell(cComando)
      !( GetEnv( _SHELLENV_ ))
      return nil
endef

*==================================================================================================*

def Ascan2( aArray, Variavel, PosElem )
********************************************
/* aArray := { { "01.00.0001", "FECHADURA METAL COM CHAVE", 125.00 } }
	cCodigo := "01.00.0001"
	nPos := Ascan2( aArray, cCodigo, 1 )
	if nPos = 0
		Alerta(' Produto Nao Encontrado ' )

	endif
*/

_Tam := Len( aArray )
ifNil( PosElem, 1 )
For i := 1 To _Tam
	if aArray[ i, PosElem ] == Variavel
		return( i )
	endif
Next
return( 0 )

def Confirma( cString )
****************************
return( Alerta( cString , { " Sim ", " Nao " } ) )

def ErrorBeep(lOK)
***********************
DEFAU lOk TO FALSO

//return Nil // aff, sem som
if lOk   // Good Sound
   Tone(  500, 1 )
   //Tone( 4000, 1 )
   //Tone( 2500, 1 )
else     // Bad Sound
   Tone(  300, 1 )
   //Tone(  499, 5 )
   //Tone(  700, 5 )
endif

//TONE(87.3,1)
//TONE(40,3.5)
return Nil

def MS_Version()
   LOCAL k
   ? "-------------------------------------------------------------------"
	? "Harbour vers?o:                    " , hb_Version( 0 )
	? "Compilador usado:                  " , hb_Version( HB_VERSION_COMPILER )
   ? "Harbour build date:                " , hb_Version( HB_VERSION_BUILD_DATE_STR )
   ? "Major version number:              " , hb_Version( HB_VERSION_MAJOR )
   ? "Minor version number:              " , hb_Version( HB_VERSION_MINOR )
   ? "Revision number:                   " , hb_Version( HB_VERSION_RELEASE )
   ? "Build status:                      " , hb_Version( HB_VERSION_STATUS )
	? "PCode:                             " , hb_Version( 10 )
	? "Compilado em:                      " , hb_Version( 11 )
	? "Ambiente:                          " , hb_Version( 21 )
	? "Cpu:                               " , hb_Version( 24 )
	? "-------------------------------------------------------------------"

	for k = 0 TO 25
      ? k , hb_Version( k )
   next k
   ? "-------------------------------------------------------------------"


   return
endef

*==================================================================================================*

*+-----------------------------------------------------------------------------------

def M_Message( cString, cCor)
	LOCAL nMaxRow := MaxRow()
	LOCAL nMaxCol := MaxCol()
	LOCAL nLen    := Len(cString)
	LOCAL row     := ((nMaxRow/2)-5)
	LOCAL Col     := ((nMaxCol-nLen)/2)

	MS_Box(row, col, row+4, col+ nLen+6, M_Frame(), cCor)
	Print(row+2, col+3, cString, cCor)
	return(NIL)
endef

*+-----------------------------------------------------------------------------------

def FTruncate()
	return NIL
endef

*+-----------------------------------------------------------------------------------

def Shr
	return nil
endef

def achartest
	return nil
endef

def M_Prompt
	return NIL
endef

def m_title( cTitulo )
   LOCAL pTitulo := Static2

   if (IsNil( cTitulo ))
      return Static2
   else
      Static2 := cTitulo
   endif
   return( pTitulo )
endef


Function AchaCor(nCor, nPos)
	return((aCor:= Pattern())[Ascan(aCor[nCor,1]), nPos])

Function AllColors()
********************
LOCAL aPattern := {}
LOCAL x

For x:= 0 To 255 step 16
	nBlack         := x + 00
	nBlue          := x + 01
	nGreen         := x + 02
	nCyan          := x + 03
	nRed           := x + 04
	nMagenta       := x + 05
	nBrown         := x + 06
	nWhite         := x + 07
	nGray          := x + 08
	nBrightBlue    := x + 09
	nBrightGreen   := x + 10
	nBrightCyan    := x + 11
	nBrightRed     := x + 12
	nBrightMagenta := x + 13
	nYellow        := x + 14
	nBrightWhite   := x + 15
   Aadd( aPattern, { /* 01 */ nBlack,;
							/* 02 */ nBlue,;
							/* 03 */ nGreen,;
							/* 04 */ nCyan,;
							/* 05 */ nRed,;
							/* 06 */ nMagenta,;
							/* 07 */ nBrown,;
							/* 08 */ nWhite,;
							/* 09 */ nGray,;
							/* 10 */ nBrightBlue,;
							/* 11 */ nBrightGreen,;
							/* 12 */ nBrightCyan,;
							/* 13 */ nBrightRed,;
							/* 14 */ nBrightMagenta,;
							/* 15 */ nYellow,;
							/* 16 */ nBrightWhite})
next
return ( aPattern )

def AscanCor(nPos)
***********************
   LOCAL aPattern := AllColors()
   LOCAL nCor     := int(oAmbiente:CorMenu/16)+1
   LOCAL nX
   LOCAL nY

   //nX := Ascan( aPattern, {|aPattern|aPattern[11] == xCor })
   return aPattern[nCor, nPos]

   for nX := 1 To 16
      for nY := 1 To 16
         if nCor = aPattern[nX,nY]
            return( aPattern[nX,nPos])
         endif
      next
   next
   return( 0 )
endef

def Pattern()
*************
   LOCAL aPattern := {}
   LOCAL nCorIni
   LOCAL nCorFim
   LOCAL nCorHKLightBar
   LOCAL nCorHotKey
   LOCAL nCorDesativada
   LOCAL nAzul
   LOCAL x

   For x:= 0 To 255 step 16
      nCorIni        := x
      nCorFim        := x + 15
      nCorHKLightBar := x + 12 // encarnado
      nCorHotKey     := x + 10 // verdola
      nCorDesativada := x + 08 // cinza

      nBlack         := x + 00
      nBlue          := x + 01
      nGreen         := x + 02
      nCyan          := x + 03
      nRed           := x + 04
      nMagenta       := x + 05
      nBrown         := x + 06
      nWhite         := x + 07
      nGray          := x + 08
      nBrightBlue    := x + 09
      nBrightGreen   := x + 10
      nBrightCyan    := x + 11
      nBrightRed     := x + 12
      nBrightMagenta := x + 13
      nYellow        := x + 14
      nBrightWhite   := x + 15
      Aadd( aPattern, { /* 01 */ nCorIni,;
                        /* 02 */ nCorFim,;
                        /* 03 */ nCorHKLightBar,;
                        /* 04 */ nCorHotKey,;
                        /* 05 */ nCorDesativada,;
                        /* 06 */ nBlack,;
                        /* 07 */ nBlue,;
                        /* 08 */ nGreen,;
                        /* 09 */ nCyan,;
                        /* 10 */ nRed,;
                        /* 11 */ nMagenta,;
                        /* 12 */ nBrown,;
                        /* 13 */ nWhite,;
                        /* 14 */ nGray,;
                        /* 15 */ nBrightBlue,;
                        /* 16 */ nBrightGreen,;
                        /* 17 */ nBrightCyan,;
                        /* 18 */ nBrightRed,;
                        /* 19 */ nBrightMagenta,;
                        /* 20 */ nYellow,;
                        /* 21 */ nBrightWhite})
   next
   return ( aPattern )
endef

Function AscanCorHKLightBar(nCor)
*********************************
LOCAL aPattern := Pattern()
LOCAL nX

For nX := 1 To Len( aPattern)
   if nCor >= aPattern[nX,1] .AND. nCor <= aPattern[nX,2]
	   return( aPattern[nX,3])
	endif
next
return( 0 )

Function AscanCorHotKey(nCor)
***************************
LOCAL aPattern := Pattern()
LOCAL nX

For nX := 1 To Len( aPattern)
   if nCor >= aPattern[nX,1] .AND. nCor <= aPattern[nX,2]
	   return( aPattern[nX,4])
	endif
next
return( 0 )

Function AscanCorDesativada(nCor)
*********************************
LOCAL aPattern := Pattern()
LOCAL nX

For nX := 1 To Len( aPattern)
   if nCor >= aPattern[nX,1] .AND. nCor <= aPattern[nX,2]
	   return( aPattern[nX,5])
	endif
next
return( 0 )

Function AscanCorMenu(nCor)
***************************
LOCAL aPattern := Pattern()
LOCAL nX

For nX := 1 To Len( aPattern)
   if nCor >= aPattern[nX,1] .AND. nCor <= aPattern[nX,2]
	   return( aPattern[nX,5])
	endif
next
return( 0 )

Function AscanCorBlue(nCor)
***************************
LOCAL aPattern := Pattern()
LOCAL nX

For nX := 1 To Len( aPattern)
   if nCor >= aPattern[nX,1] .AND. nCor <= aPattern[nX,2]
	   return( aPattern[nX,15])
	endif
next
return( 0 )

def Cls( CorFundo, PanoFundo, lforcar )
	LOCAL nDelay     := 0
	LOCAL row        := 0
	LOCAL col        := 0
	LOCAL row1       := MaxRow()
	LOCAL col1       := MaxCol() 
	LOCAL nComp      := ( col1 - col )
	LOCAL nLen       := Len( Panofundo)
	LOCAL cString    := ""
	LOCAL xString    := ""
	LOCAL nConta     := 0
	LOCAL y          := 0
	LOCAL x          := 0
	STATI cScreen    := NIL
	STATI xPanoFundo := ""
	STATI xCorFundo  := NIL
	DEFAU CorFundo   TO oAmbiente:CorFundo
	DEFAU PanoFundo  TO oAmbiente:PanoFundo

	//HB3.2/3.4
	//FT_CLS( row, col, row1, col1, corfundo)
	//HB3.0
	//hb_DispBox( 00, 00, maxrow(), maxcol(), Repl(PanoFundo,9))

	ms_cls(CorFundo, PanoFundo, nDelay)
   return nil
   
	//Tela(CorFundo, PanoFundo)
	//Ms_Char(CorFundo, PanoFundo)
	//Ms_Cls(CorFundo, PanoFundo)
	//return NIL


	if lforcar = nil
		if !(xPanoFundo == PanoFundo ) .OR. !(xCorFundo == CorFundo )
			cScreen := NIL
		endif
	else
		cScreen := NIL
	endif

	if cScreen == NIL
		//for x := row To row1
			//ft_WrtChr( nX, nY, PanoFundo, Cor())
			//ft_VidStr( x, col, Panofundo, corfundo) 
		//   Print( x, col, Panofundo, corfundo, MaxCol(), panofundo)
		//next
		nConta = row1 * col1 
		for x := 1 TO nConta STEP nlen
			//ft_WrtChr( nX, nY, PanoFundo, Cor())
			//ft_VidStr( x, col, Panofundo, corfundo) 
			cString += PanoFundo       
		next
		y := 0
		for x := 1 to nConta STEP col1
			xString := SubStr( cString, x, col1)
			Print( y++, 0, xString, corfundo, col1, xString)
		next
		xPanoFundo := PanoFundo
		xCorFundo  := CorFundo
		cScreen    := SaveScreen()
	endif
	//FT_Shadow(oAmbiente:sombra)
	return( restela( cScreen ))
endef

/*
Function Cls( CorFundo, PanoFundo )
***********************************
LOCAL row   := 0
LOCAL col   := 0
LOCAL row1  := MaxRow()
LOCAL col1  := MaxCol()
LOCAL nComp := ( col1 - col )
LOCAL nLen  := Len( Panofundo)
FT_CLS( row, col, row1, col1, corfundo)

//hb_DispBox( 00, 00, maxrow(), maxcol(), Repl(PanoFundo,nLen))

for x := row To row1
   Print( x, col, Panofundo, corfundo, MaxCol(), panofundo)
next
return NIL
*/


def Rep_Ok()
	LOCAL cScreen := SaveScreen()
	LOCAL cCor	  := SetColor()

	if Inkey() = 27
		Set Devi To Screen
		if Conf("Pergunta: Deseja Interromper a Tarefa ?")
			return( false )
		endif
		SetColor( cCor )
		ResTela( cScreen )
	endif
	return( true )
endef

def Spooler()
*************
   LOCAL GetList     := {}
   LOCAL cScreen     := SaveScreen()
   LOCAL Arq_Ant     := Alias()
   LOCAL Ind_Ant     := IndexOrd()
   LOCAL cFile       := ""
   LOCAL Files       := '*.txt'
   LOCAL aMenuChoice := { " Limpar Spooler                 ",;
                          " Enviar Arquivo para Impressora ",;
                          " Visualizar Arquivo             ",;
                          " Escolher Impressora            "}
   while true
      oMenu:Limpa()
      M_Title("SPOOLER DE IMPRESSAO")
      nChoice := FazMenu( 05, 10, aMenuChoice )

      do case
      case nChoice = 0
         if !Empty( Arq_Ant)
            Select( Arq_Ant )
            Order( Ind_Ant )
         endif
         return(ResTela( cScreen ))

      case nChoice = 1
         oAmbiente:cArquivo := ""
         oAmbiente:Spooler  := false
         Alerta("Limpeza efetuada com sucesso")
         Loop

      case nChoice = 2
         cFile := iif( Empty( oAmbiente:cArquivo), Space(len(FTempPorExt("txt", oAmbiente:xBaseTxt) + Space(10))), oAmbiente:cArquivo )
         MaBox( 15, 10, 17 , MaxCol()-1 )
         @ 16, 11 Say "Arquivo para Impressao : " Get cFile Pict "@!" valid PickTemp( @cFile)
         Read
         if LastKey() = 27
            oAmbiente:cArquivo := ""
            Loop
         endif
         oAmbiente:cArquivo := TrimStr(cFile)
         Instru80(, oAmbiente:cArquivo )
         loop

      case nChoice = 3
         cFile := iif( Empty( oAmbiente:cArquivo), Space(len(FTempPorExt("txt", oAmbiente:xBaseTxt) + Space(10))), oAmbiente:cArquivo )
         MaBox( 15, 10, 17 , MaxCol()-1 )
         @ 16, 11 Say "Arquivo para Visualizar : " Get cFile Pict "@!" valid PickTemp( @cFile)
         Read
         if LastKey() = 27
            loop
         endif
         oAmbiente:cArquivo := TrimStr(cFile)
         oAmbiente:Externo  := FALSO
         oAmbiente:Spooler  := OK
         #if defined( __PLATFORM__UNIX )
            M_View( 00, 00, MaxRow(), MaxCol(), oAmbiente:cArquivo, Cor())
         #else
            ShellRun("NOTEPAD " + oAmbiente:cArquivo )
         #endif
         CloseSpooler()
         oAmbiente:Spooler := FALSO
         loop

      case nChoice = 4
         Impressora()
      endcase
   enddo
   return
endef

def _Instru80( Mode, nCorrente, nRowPos )
******************************************
	LOCAL cCodi     := Space(02)
	LOCAL cPath     := FChdir()
   LOCAL aArryaPrn := {}
   LOCAL nIndex    := 0

   #define default    otherwise
   #define CTRL_PGDN  30

	do case
	case LastKey() = K_CTRL_PGDN .or. lastkey() = CTRL_PGDN
	  lCancelou := true
	  return( 0 )

	case Mode = 0
		return(2)

	case Mode = 1 .OR. Mode = 2
		ErrorBeep()
		return(2)

	case LastKey() = K_ESC
		return(0)

	case LastKey() = K_ENTER
		return(1)

   #define K_SH_ENTER 284
	case LastKey() = K_CTRL_RET .or. Lastkey() = K_SH_ENTER
      MudaImpressora(nCorrente, @aMenu)
		return(2)

	default
		return(2)

	EndCase
endef

*==================================================================================================*

def CupsArrayPrinter()
   LOCAL aPrinter := {} //cupsGetDests()
   LOCAL aModelo  := {}
   LOCAL aMenu    := {}
   LOCAL aAction	:= { "PRONTA         ","FORA DE LINHA  ","DESLIGADA      ","SEM PAPEL      ", "NAO CONECTADA  "}
   LOCAL aComPort := { "DISPONIVEL     ","INDISPONIVEL   " }
   LOCAL aStatus  := RetPrinterStatus()
   LOCAL nIndex   := 0
   LOCAL nPr
   MEMVAR cStr

   aMenu := {  " LPT1 ¦ " + aAction[ aStatus[1]] + " ¦ " + oAmbiente:aLpt1[1,2],;
					" LPT2 ¦ " + aAction[ aStatus[2]] + " ¦ " + oAmbiente:aLpt2[1,2],;
					" LPT3 ¦ " + aAction[ aStatus[3]] + " ¦ " + oAmbiente:aLpt3[1,2],;
					" COM1 ¦ " + Iif( FIsPrinter("COM1"), aComPort[1], aComPort[2]) + " ¦ " + "PORTA SERIAL 1",;
					" COM2 ¦ " + Iif( FIsPrinter("COM2"), aComPort[1], aComPort[2]) + " ¦ " + "PORTA SERIAL 2",;
					" COM3 ¦ " + Iif( FIsPrinter("COM3"), aComPort[1], aComPort[2]) + " ¦ " + "PORTA SERIAL 3",;
					" USB  ¦ " + aAction[ aStatus[1]] + " ¦ IMPRESSORA USB",;
					" VISUALIZAR   ¦ ",;
					" ENVIAR EMAIL ¦ ",;
					" WEB BROWSER  ¦ ",;
					" SPOOLER      ¦ ",;
					" CANCELAR     ¦ ";
            }

   FOR EACH nPr IN aPrinter
      //? nPr:__enumIndex(), i
      //nWidth := Max( nWidth, Len( nPr ) )
      nIndex++
      cStr := &( "oAmbiente:aLpd" + trimstr(nIndex))
      Aadd( aMenu, " LPD" + TrimStr(nPr:__enumIndex()) + "  ¦ REDE CUPS      ¦ " + Left(cStr[1,2],17) + " em " + nPr)
      Aadd( aModelo, nPr)
   NEXT
   return {aMenu, aModelo, aAction, aStatus, aPrinter}
endef

*==================================================================================================*

def SetarVariavel( aNewLpt )
****************************
	LOCAL nPos       := 2
	PUBLIC _CPI10	  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC _CPI12	  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC GD		  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC PQ		  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC NG		  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC NR		  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC CA		  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC C18		  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC LIGSUB	  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC DESSUB	  := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC _SALTOOFF := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC _SPACO1_8 := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC _SPACO1_6 := MsDecToChr( aNewLpt[1,++nPos] )
	PUBLIC RESETA	  := MsDecToChr( aNewLpt[1,++nPos] )
	return
endef



def Instruim()
*******************
   return( Instru80() )
endef

def InstruEt()
**************
   LOCAL cScreen := SaveScreen()
   LOCAL nChoice
   oMenu:Limpa()
   ErrorBeep()
   nChoice := Alert(" INSTRUÇÃO PARA EMISSÃO DE ETIQUETAS      " + ;
                     ";; v Coloque Formulario Etiqueta.        " + ;
                     "; v Acerte a Altura do Picote           " + ;
                     "; v Resete ou Ligue a Impressora        ", { "Imprimir", "Visualizar", "Cancelar"})
   ResTela( cScreen )
   if nChoice = 1
      oAmbiente:cArquivo := ""
      oAmbiente:Spooler  := FALSO
      return( true )
   elseif nChoice = 2
      SaidaParaArquivo()
      return( true )
   else
      return( false )
   endif
endef

Proc CadastroImpressoras()
**************************
LOCAL GetList	  := {}
LOCAL cScreen	  := SaveScreen()
LOCAL cCodi 	  := Space(02)
LOCAL cNome 	  := Space(30)
LOCAL c_Cpi10	  := Space(30)
LOCAL c_Cpi12	  := Space(30)
LOCAL cGd		  := Space(30)
LOCAL cPq		  := Space(30)
LOCAL cNg		  := Space(30)
LOCAL cNr		  := Space(30)
LOCAL cCa		  := Space(30)
LOCAL cC18		  := Space(30)
LOCAL cLigSub	  := Space(30)
LOCAL cDesSub	  := Space(30)
LOCAL c_SaltoOff := Space(30)
LOCAL c_Spaco1_6 := Space(30)
LOCAL c_Spaco1_8 := Space(30)
LOCAL cReseta	  := Space(30)
LOCAL nOpcao
LOCAL nTam
LOCAL nCol
LOCAL nRow

FIELD Codi
FIELD Nome
FIELD Gd
FIELD Pq
FIELD Ng
FIELD Nr
FIELD Ca
FIELD C18
FIELD LigSub
FIELD DesSub
FIELD _SaltoOff
FIELD _Spaco1_6
FIELD _Spaco1_8
FIELD Reseta

if !UsaArquivo("PRINTER")
	return
endif
Area("Printer")
Printer->(DbGoBottom())
nTam	:= Printer->(Len( Codi ))
cCodi := Printer->(StrZero( Val( Codi ) +1, nTam ))
oMenu:Limpa()
MaBox( 05, 10, 22, 60, "INCLUSAO DE IMPRESSORAS" )
nCol := 11
nRow := 06
WHILE OK
	@ nRow,	  nCol Say "Codigo...........:" Get cCodi Pict "99" Valid PrinterCerto( @cCodi )
	@ Row()+1, nCol Say "Modelo...........:" Get cNome Pict "@!"
	@ Row()+1, nCol Say "Ligar 05 CPI.....:" Get cGd        Pict "@!"
	@ Row()+1, nCol Say "Desl  05 CPI.....:" Get cCA        Pict "@!"
	@ Row()+1, nCol Say "Ligar 10 CPI.....:" Get c_Cpi10    Pict "@!"
	@ Row()+1, nCol Say "Ligar 12 CPI.....:" Get c_Cpi12    Pict "@!"
	@ Row()+1, nCol Say "Ligar 15 CPI.....:" Get cPQ        Pict "@!"
	@ Row()+1, nCol Say "Desl  15 CPI.....:" Get cC18       Pict "@!"
	@ Row()+1, nCol Say "Ligar NEGRITO....:" Get cNG        Pict "@!"
	@ Row()+1, nCol Say "Desl  NEGRITO....:" Get cNR        Pict "@!"
	@ Row()+1, nCol Say "Ligar SUBLINHADO.:" Get cLigSub    Pict "@!"
	@ Row()+1, nCol Say "Desl  SUBLINHADO.:" Get cDesSub    Pict "@!"
	@ Row()+1, nCol Say "Desl SALTO PAG...:" Get c_SaltoOff Pict "@!"
	@ Row()+1, nCol Say "Espacamento 1/8..:" Get c_Spaco1_8 Pict "@!"
	@ Row()+1, nCol Say "Espacamento 1/6..:" Get c_Spaco1_6 Pict "@!"
	@ Row()+1, nCol Say "RESETAR..........:" Get cReseta    Pict "@!"
	Read
	if LastKey() = ESC
		ResTela( cScreen )
		Exit
	endif
	ErrorBeep()
	nOpcao := Alerta(" Pergunta: Voce Deseja ? ", {" Incluir ", " Alterar ", " Sair " })
	if nOpcao = 1 // Incluir
		if PrinterCerto( @cCodi )
			if Printer->(Incluiu())
				Printer->Codi		 := cCodi
				Printer->Nome		 := cNome
				Printer->_Cpi10	 := c_Cpi10
				Printer->_Cpi12	 := c_Cpi12
				Printer->Gd 		 := cGd
				Printer->Pq 		 := cPq
				Printer->Ng 		 := cNg
				Printer->Nr 		 := cNr
				Printer->Ca 		 := cCa
				Printer->C18		 := cC18
				Printer->LigSub	 := cLigSub
				Printer->DesSub	 := cDesSub
				Printer->_SaltoOff := c_SaltoOff
				Printer->_Spaco1_6 := c_Spaco1_6
				Printer->_Spaco1_8 := c_Spaco1_8
				Printer->Reseta	 := cReseta
				cCodi 				 := Printer->(StrZero( Val( Codi ) +1, nTam ))
				Printer->(Libera())
			endif
		endif
	elseif nOpcao = 2 // Alterar
		Loop
	elseif nOpcao = 3 // Sair
		ResTela( cScreen )
		Exit
	endif
END

def PrinterCerto( cCodi )
******************************
LOCAL nTam	  := Printer->(Len( Codi ))
LOCAL Arq_Ant := Alias()
LOCAL Ind_Ant := IndexOrd()
LOCAL lRetVal := OK

Area("Printer")
Printer->(Order( PRINTER_CODI ))
if Printer->(DbSeek( cCodi ))
	ErrorBeep()
	Alerta("Erro: Codigo ja Registrado.")
	cCodi := StrZero( Val( cCodi ) + 1, nTam )
	lRetVal := FALSO
endif
AreaAnt( Arq_Ant, Ind_Ant )
return( lRetVal )

*==================================================================================================*

def Instru80( nQualPorta, cArquivo )
   MEMVAR cStr
	LOCAL cScreen				:= SaveScreen()
	LOCAL Arq_Ant				:= Alias()
	LOCAL Ind_Ant				:= IndexOrd()
   LOCAL aPrinter          := {}
	LOCAL nChoice
	LOCAL aNewLpt
   LOCAL nTamJan           := 0
	LOCAL i						:= 0
	LOCAL nStatus				:= 0
	STATI nPortaDeImpressao := 1
	PUBLI lCancelou			:= FALSO
	PRIVA aStatus				:= {}
	PRIVA aAction				:= {}
	PRIVA aComPort 			:= {}
   PRIVA aModelo           := {}
   PRIVA nPr               := 0
   PRIVA nIndex            := 0
	PRIVA aMenu
   PRIVA aModelo

	if len(oAmbiente:aLpt1) == 0 .or. len(oAmbiente:aLpd1) == 0
		oPrinter:EscolheImpressoraUsuario()
	endif

	if nQualPorta != NIL
		nQualPorta := nPortaDeImpressao
		return( true )
	endif

	ErrorBeep()
	while(true)
		oMenu:Limpa()
      aPrinter := CupsArrayPrinter()
		aMenu  	:= aPrinter[CUPS_MENU]
      aModelo 	:= aPrinter[CUPS_MODELO]
		aAction	:= aPrinter[CUPS_ACTION]
      aStatus  := aPrinter[CUPS_STATUS]
		aComPort := { "DISPONIVEL     ","INDISPONIVEL   " }
		alDisp   := { OK, OK, OK, OK, OK, OK, OK, OK, OK, OK, OK, true }
      nTamJan  := AmaxStrLen(aMenu) + 3
      nIndex   := Len(aMenu)

		MaBox( 05, 10, 05 + nIndex + 1, nTamJan + 1, nil , "ENTER=IMPRIMIR¦CTRL/ALT+ENTER=ESCOLHER¦CTRL+PGDN=ONLINE")
		nChoice := aChoice( 06, 11, 04 + nIndex + 1, nTamJan, aMenu, alDisp, "_Instru80" )
		if nChoice = 0 .OR. nChoice = 12
         if Conf("Pergunta: Cancelar Impressao ?")
            lCancelou := OK
            return false
         endif
			Loop
		endif

      aNewLpt := oAmbiente:aLpt1
      switch nChoice
      case 1
      case 7
      case 8
      case 9
      case 11
         aNewLpt := oAmbiente:aLpt1
         exit
      case 2
         aNewLpt := oAmbiente:aLpt2
         exit
      case 3
         aNewLpt := oAmbiente:aLpt3
         exit
      case 13
      case 14
      case 15
      case 16
      case 17
      case 18
      case 19
      case 20
      case 21
         aNewLpt := &("oAmbiente:aLpd" + trimstr(nChoice-12))
         exit
      endswitch

		AreaAnt( Arq_Ant, Ind_Ant )
		SetarVariavel( aNewLpt )
      oAmbiente:IsPrinter := nChoice
      do Case
		case nChoice = 0 .OR. nChoice = 12
			if lCancelou
				lCancelou := FALSO
				Loop
			endif
			if Conf("Pergunta: Cancelar Impressao ?")
				return( false )
			endif
		case nChoice = 7
			nPortaDeImpressao := 1
         return(SaidaParaUsb())
		case nChoice = 8 // Visualizar
			nPortaDeImpressao     := 1
         oAmbiente:lVisSpooler := true
			return( SaidaParaArquivo())
		case nChoice = 9
			nPortaDeImpressao := 1
			return(SaidaParaEmail())
		case nChoice = 10
			nPortaDeImpressao := 1
			return(SaidaParaHtml())
		case nChoice = 11
			nPortaDeImpressao     := 1
         oAmbiente:lVisSpooler := true
			return(SaidaParaSpooler())
      case nChoice >= 13 .and. nChoice <= 21
         oAmbiente:CupsPrinter := aModelo[nChoice-12]
         nPortaDeImpressao     := nChoice
         oAmbiente:lVisSpooler := false
         if !(Isnil(cArquivo))
            oAmbiente:cArquivo := cArquivo
            //cupsPrintFile( oAmbiente:CupsPrinter, cArquivo, "Macrosoft SCI for Linux")
            loop
         endif
			return(SaidaParaRedeCups(cArquivo))
		otherwise
			nPortaDeImpressao     := Iif( nChoice = 0, 1, nChoice )
			oAmbiente:cArquivo    := ""
			oAmbiente:Spooler     := FALSO
         oAmbiente:lVisSpooler := false
			oAmbiente:IsPrinter   := nChoice
			nQualPorta			    := nChoice
			if LptOk()
				ResTela( cScreen )
				return( true )
			endif
		endcase
	enddo
	ResTela( cScreen )
endef

*==================================================================================================*

def PrintOn( lFechaSpooler )
	LOCAL nQualPorta := 1
	LOCAL cSaida	  := ""
   LOCAL cLpr       := "|lpr -h -l -P"

	if lFechaSpooler = NIL
		AbreSpooler()
	endif
	Instru80( @nQualPorta )

	switch nQualPorta
   case 1
		cSaida := "LPT1"
      exit
	case 2
		cSaida := "LPT2"
      exit
	case 3
		cSaida := "LPT3"
      exit
	case 4
		cSaida := "COM1"
      exit
	case 5
		cSaida := "COM2"
      exit
	case 6
		cSaida := "COM3"
      exit
	endswitch

   cSaida := cLpr += cSaida
	if lFechaSpooler == nil
		oMenu:StatInf()
		oAmbiente:nRegistrosImpressos := 0
	endif
	Set Cons Off
	Set Devi To Print
	if !oAmbiente:Spooler
		if nQualPorta != 1
			Set Print To ( cSaida )
		endif
	endif
	Set Print On
	FPrint( RESETA )
	SetPrc(0,0)
	return Nil
endef

*==================================================================================================*

def PrintOff()
	PrintOn( true )
	FPrint( RESETA )
	Set Devi To Screen
	Set Prin Off
	Set Cons On
	Set Print to
	CloseSpooler()
	return Nil
endef

*==================================================================================================*

def Rel_Ok(cMensagem)
	LOCAL cScreen    := SaveScreen()
	LOCAL nChoice    := 2
	LOCAL nRow	     := Prow()
	LOCAL nCol	     := PCol()
   LOCAL lPrinter   := SET(_SET_PRINTER)
   LOCAL cDevice    := SET(_SET_DEVICE)
   LOCAL lConsole   := SET(_SET_CONSOLE)

   if lPrinter
      SET(_SET_PRINTER, false)
      SET(_SET_DEVICE, "SCREEN")
      SET(_SET_CONSOLE, true)
   endif
	if inkey() == K_ESC
		ErrorBeep()
		if Conf("Pergunta: Deseja cancelar a impressao ?") .or. !LptOk()
         CloseSpooler()
			restela( cScreen )
			break
			return false
		endif
		restela( cScreen )
	endif
	if cMensagem != Nil
      oMenu:StatReg(cMensagem)
	else
      oMenu:StatReg("REG# " + StrTrim(++oAmbiente:nRegistrosImpressos))
	endif
   if lPrinter
      SET(_SET_PRINTER, lPrinter)
      SET(_SET_DEVICE, cDevice)
      SET(_SET_CONSOLE, lConsole)
      SetPrc( nRow, nCol )
   endif
	return true
endef

*==================================================================================================*

def LptOk()
	LOCAL cScreen
	LOCAL nComPort := 1
	LOCAL nStatus
	LOCAL lRetorno := OK
	STATI lMaluco  := FALSO
	LOCAL aAction	:= { "ERRO: IMPRESSORA FORA DE LINHA. ",;
							  "ERRO: IMPRESSORA DESLIGADA.     ",;
							  "ERRO: IMPRESSORA SEM PAPEL.     ",;
							  "ERRO: IMPRESSORA NAO CONECTADA. ",;
							  "ERRO: IMPRESSORA NAO PRONTA.    ",;
							  "OK: IMPRESSORA ONLINE NOVAMENTE."}
	LOCAL cMsg := ";;1)Verifique a impressora se ligada, cabeamento, conexoes "
			cMsg += "  e mapeamentos de rede, etc. Lembre-se que impressoras  "
			cMsg += "  mapeadas sempre estarao com status de PRONTA devido ao "
			cMsg += "  SPOOL de impressao da rede.                            "

			cMsg += ";2)Voce pode verificar status de online novamente. Escolha"
			cMsg += " (TENTAR).                                               "
			cMsg += ";3)Ao escolher a opcao (IMPRIMIR ASSIM MESMO) podera haver"
			cMsg += "   um travamento completo do sistema.                    "
			cMsg += ";4)Escolha (RETORNAR) para cancelar a impressão.          "

	if lMaluco
		return( lMaluco)
	endif

   switch oAmbiente:Isprinter
   case 1
   case 2
   case 3
		nStatus := PrnStatus( oAmbiente:Isprinter )
		if !oAmbiente:Spooler
			cScreen := SaveScreen()
			oMenu:Limpa()
			WHILE !IsPrinter( oAmbiente:Isprinter )
				nStatus := PrnStatus( oAmbiente:IsPrinter )
				if nStatus = 0 // Windows sempre retorna 0
					nStatus := Iif( IsPrinter(oAmbiente:Isprinter), 6, 1)
				else
					if nStatus = -1
						nStatus := 5
					endif
				endif
				ErrorBeep()
				nDecisao := Alerta( aAction[ nStatus] + cMsg, {"TENTAR", "IMPRIMIR ASSIM MESMO", "CANCELAR", "MAPEAR"} )
				if nDecisao = 3 .OR. nDecisao = 0
					lMaluco  := FALSO
					lRetorno := FALSO
					exit
				endif
				if nDecisao = 2
					lMaluco  := OK
					lRetorno := OK
					exit
				endif
				if nDecisao = 4
					Cls
					DosShell("CMD net")
					lMaluco  := FALSO
					lRetorno := FALSO
					exit
				endif
			EndDo
			ResTela( cScreen )
		endif
      exit
	case 4
	case 5
	case 6
		nComPort := ( oAmbiente:IsPrinter - 4 )
		lRetorno := ( nStatus := FIsPrinter( nComPort ))
      exit
   otherwise
      lRetorno := true
      exit
   endswitch
	return( lRetorno )
endef

*==================================================================================================*

def AbreSpooler()
*----------------*
	iif( oAmbiente:Spooler, Set( _SET_PRINTFILE, oAmbiente:cArquivo, false ), Set( _SET_PRINTFILE, "" ))
	return NULL
endef

*==================================================================================================*

def CloseSpooler()
******************
   LOCAL cScreen	   := SaveScreen()
   LOCAL lSpooler	   := oAmbiente:Spooler
   LOCAL cTemp 	   := oAmbiente:cArquivo
   LOCAL lexterno    := oAmbiente:externo
   LOCAL lVisualizar := oAmbiente:lVisSpooler
   LOCAL cComando
   LOCAL i

   Set(_SET_PRINTFILE, "" )
   Set Print To

   if oAmbiente:SendMail
      oAmbiente:externo     := false
      oAmbiente:Spooler     := false
      oAmbiente:lVisSpooler := false
      SendMail()
      return nil
   endif

   if lexterno
      #if defined( __PLATFORM__UNIX )
         //ms_system("gnome-terminal --command '/opt/shell.sh'");
         ms_system("nano " + cTemp)
      #else
         cComando := 'firefox.exe ' + cTemp
         cComando := "C:\Program Files\Mozilla Firefox\firefox.exe " + cTemp
         cComando := "chrome.exe " + cTemp
         ShellRun("NOTEPAD " + cTemp )
         //ShellRun( cComando )
         /*
         i = SWPUSEEMS(OK)
         i = SWPUSEXMS(OK)
         i = SWPUSEUMB(OK)
         i = SWPCURDIR(OK)
         i = SWPVIDMDE(OK)
         //i = SWPDISMSG(OK)
         i = SWPRUNCMD( cComando, 0, "", "")
         */
      #endif
      oAmbiente:externo := false
   else
      if lSpooler
         if lVisualizar
            oMenu:Limpa()
            oMenu:StatInf()
            oMenu:StatReg("IMPRESSO #" + StrZero( oAmbiente:nRegistrosImpressos, 7))
            M_Title( "ESC - Retorna ¦Setas CIMA/BAIXO Move")
            M_View( 00, 00, MaxRow()-1, MaxCol(), cTemp, Cor())
            //ShellRun("NOTEPAD " + cTemp )
            ResTela( cScreen )
         else
            //cupsPrintFile( oAmbiente:CupsPrinter, oAmbiente:cArquivo, "Macrosoft SCI for Linux")
         endif
      endif
   endif
   //oAmbiente:cArquivo := ""
   oAmbiente:Spooler     := false
   oAmbiente:lVisSpooler := false
   return nil
endef

*==================================================================================================*

def SaidaParaRedeCups()
	LOCAL cDir     := oAmbiente:xBaseTxt
   LOCAL xArquivo := ""

   xArquivo           := TrimStr(FTempPorExt('txt', cDir))
	oAmbiente:cArquivo := xArquivo
   oAmbiente:Spooler  := true
	Set Print To (xArquivo)
	return true
endef

*==================================================================================================*
def PickAviso(cvar, cmsg)
   return if(Empty(cvar), ( ErrorBeep(), Alerta(cMsg ), false ), true )
endef

*==================================================================================================*

def MsMemoEdit( cString, cTitulo, nTop, nLeft, nBottom, nRight )
   LOCAL cScreen := SaveScreen()

   Mabox(nTop, nLeft, nBottom, nRight, cTitulo)
   cString = MemoEdit(cString, nTop+1, nLeft+1, nBottom-1, nRight-1)
   Restela(cScreen)
   return true
endef

*==================================================================================================*

def SaidaParaEmail()
	LOCAL GetList	:= {}
   LOCAL cScreen	:= SaveScreen()
	LOCAL cDir     := oAmbiente:xBaseTxt
	LOCAL xArquivo := ""

	oMenu:Limpa()
   xArquivo           := TrimStr(FTempPorExt('txt', cDir))
   oAmbiente:SendMail := true
   oAmbiente:cArquivo := xArquivo
	oAmbiente:Spooler  := true
	Set Print To (xArquivo)
	ResTela( cScreen )
	return true
endef

def SendMail()
	LOCAL cScreen	:= SaveScreen()
	LOCAL GetList	:= {}
	LOCAL cDir     := oAmbiente:xBaseTxt
	LOCAL xArquivo := oAmbiente:cArquivo
	LOCAL cTo		:= "vcatafesta@sybernet.com.br" + Space(40)
	LOCAL cFrom 	:= oIni:ReadString('sistema', 'email', "vcatafesta@gmail.com" + Space(40))
	LOCAL cSubject := 'Arquivo em Anexo:' + xArquivo
	LOCAL xServer	:= oIni:ReadString('sistema','smtp', 'SMTP.MICROBRAS.COM.BR' + Space(19))
	LOCAL xString
   LOCAL cString
	LOCAL i

	oMenu:Limpa()
	MaBox( 15, 00, 21, 79, "NOVA MENSAGEM")
	@ 16, 01 Say "Para     : " Get cTo      Valid PickAviso(cTo, "Ooops!: Vai enviar para quem ?")
	@ 17, 01 Say "De       : " Get cFrom    Valid if(Empty(cFrom),    ( ErrorBeep(), Alerta("Ooops!: Nao vai dizer o email de quem enviou ?"), false ), true )
	@ 18, 01 Say "Anexo    : " Get xArquivo Valid PickTemp( @xArquivo)
	@ 19, 01 Say "Assunto  : " Get cSubject Valid if(Empty(cSubject), ( ErrorBeep(), Alerta("Ooops!: Entre com o Assunto!"), false ), true )
	@ 20, 01 Say "Servidor : " Get xServer  Valid if(Empty(xServer),  ( ErrorBeep(), Alerta("Ooops!: Entre com o servidor!"), false ), true )
	@ 23, 01                   Get cString  Valid MsMemoEdit( @cString, "CORPO DA MENSAGEM - CTRL+W GRAVAR", 22, 00, 30, 79, true, false)
	Read

	if LastKey() = K_ESC
      oAmbiente:SendMail := false
      oAmbiente:Spooler  := false
		oAmbiente:cArquivo := ""
      ResTela(cScreen)
      return false
	endif

	cFrom 				 := AllTrim( cFrom )
	cTo					 := AllTrim( cTo )
	cSubject           := AllTrim( cSubject )
	xServer				 := AllTrim( xServer )

	Mensagem('Aguarde, Enviando Email.')
	/*
	xString := 'mail.bat'
	xString += ' -a ' + xArquivo
	xString += '  ' + xServer
	xString += '  ' + cFrom
	xString += '  ' + cTo
	*/

   #ifdef __PLATFORM__WINDOWS
      xstring := 'mail.bat'
      i = SWPVIDMDE(OK)
      i = SWPDISMSG(OK)
      i = SWPFREEMS(640)
      i = SWPFREXMS(640)
      i = SWPSETENV(32000)
      i = SWPADDENV(2048)
      i := SWPRUNCMD( xString , 100, "", "")
   #else
      #if defined( __PLATFORM__UNIX )
         xString := 'echo "' + (cSubject) + '"'
         xString += ' | mutt -s ' + '"' + (cSubJect) + '"'
         xString += ' -a '      + oAmbiente:cArquivo
         xString += ' -- '      + cTo
         alert(xstring)
         ms_system( xString)
      #endif
   #endif
   oAmbiente:SendMail := false
   oAmbiente:Spooler  := false
	ResTela(cScreen)
   return true
endef

*==================================================================================================*

def SaidaParaArquivo()
	LOCAL GetList	:= {}
   LOCAL cScreen	:= SaveScreen()
	LOCAL cDir     := oAmbiente:xBaseTxt
	LOCAL xArquivo := ""

	oMenu:Limpa()
	xArquivo := FTempPorExt('txt', cDir) + Space(10)
	MaBox( 15, 00, 17, MaxCol()-1 )
	@ 16, 01 Say "Visualizar no Arquivo: " Get xArquivo Pict "@!"
	Read

	if LastKey() = K_ESC
		if Conf("Pergunta: Cancelar Impressao ?")
			oAmbiente:cArquivo := ""
			ResTela( cScreen )
			return false
		endif
	endif
	xArquivo           := StrTrim(xArquivo)
   oAmbiente:cArquivo := xArquivo
	oAmbiente:Spooler  := true
   oAmbiente:externo  := true
	Set Print To (xArquivo)
	ResTela( cScreen )
	return true
endef

*==================================================================================================*

def SaidaParaSpooler()
   LOCAL GetList	:= {}
	LOCAL cScreen	:= SaveScreen()
	LOCAL cDir     := oAmbiente:xBaseTxt
   LOCAL xArquivo := ""

	oMenu:Limpa()
	xArquivo := FTempPorExt('txt', cDir) + Space(10)
	MaBox( 15, 00, 17, MaxCol()-1 )
	@ 16, 01 Say "Visualizar no Arquivo: " Get xArquivo Pict "@!"
	Read

	if LastKey() = K_ESC
		oAmbiente:cArquivo := ""
		ResTela( cScreen )
      return false
	endif

	xArquivo           := StrTrim(xArquivo)
   oAmbiente:cArquivo := xArquivo
	oAmbiente:Spooler  := true
	Set Print To (xArquivo)
	ResTela( cScreen )
   return true
endef

*==================================================================================================*

def SaidaParaHtml()
   LOCAL GetList	:= {}
	LOCAL cScreen	:= SaveScreen()
	LOCAL cDir     := oAmbiente:xBaseHtm
   LOCAL xArquivo := ""

	oMenu:Limpa()
	xArquivo := FTempPorExt('htm', cDir) + Space(10)
   MaBox( 15, 00, 17, MaxCol()-1 )
	@ 16, 01 Say "Visualizar no Arquivo: " Get xArquivo Pict "@!"
	Read

	if LastKey() = K_ESC
		oAmbiente:cArquivo := ""
		ResTela( cScreen )
      return false
	endif

   xArquivo           := StrTrim(xArquivo)
   oAmbiente:cArquivo := xArquivo
	oAmbiente:Spooler  := true
	oAmbiente:externo  := true
	Set Print To ( xArquivo )
	ResTela( cScreen )
   return true
endef

*==================================================================================================*

def SaidaParaUsb()
	LOCAL cScreen	:= SaveScreen()
	LOCAL GetList	:= {}
	LOCAL xArquivo := ""
	LOCAL cDir     := oAmbiente:xBaseTmp
	LOCAL i

	oMenu:Limpa()
	xArquivo           := StrTrim(FTempPorExt('txt', cDir))
	oAmbiente:Spooler  := FALSO
	oAmbiente:cArquivo := xArquivo
	xArquivo           := AllTrim(xArquivo)
	Set Print To (xArquivo)
	i = SWPUSEEMS(OK)
	i = SWPUSEXMS(OK)
	i = SWPUSEUMB(OK)
	i = SWPVIDMDE(OK)
	i = SWPCURDIR(OK)
	i = SWPDISMSG(FALSO) // Mostrar Mensagem
	i = SWPGETKEY(FALSO) // Aguardar Tecla
	xString := "COPY /B " + xArquivo + " PRN"
	i		  := SWPRUNCMD( xString, 0, "", "" )
	ResTela( cScreen )
	return true
endef

*==================================================================================================*


def boxpy(nRow, nCol, nRow1, nCol1, cFrame, nCor, titulo)
    nComp = (nCol1 - nCol)
    center = maxcol() / 2

    for x := nRow TO nRow1
        aprint(x, nCol, space(nComp), nCor, nComp)
    next

    aprint(nRow, nCol, left(cFrame, 1), nCor, 1)
    aprint(nRow, nCol + 1, replicate(substr(cFrame, 5, 1), nComp), nCor, 1)
    aprint(nRow, nCol1, substr(cFrame, 2, 1), nCor, 1)

    for x := nRow + 1 TO nRow1
        aprint(x, nCol, substr(cFrame, 6, 1), nCor, 1)
        aprint(x, nCol1, substr(cFrame, 6, 1), nCor, 1)
	 next
    aprint(nRow1, nCol, substr(cFrame, 3, 1), nCor, 1)
    aprint(nRow1, nCol + 1, replicate(substr(cFrame, 5, 1), nComp), nCor, 1)
    aprint(nRow1, nCol1, substr(cFrame, 4, 1), nCor, 1)
    if titulo != NIL
        aprint(nRow, nCol + 1, '', roloc(nCor), nComp)
        aprint(nRow, center, titulo, roloc(nCor), 1)
	endif
	return nil
endef

Function Linha1( Tam, Pagina )
********************************
LOCAL nDiv := Tam / 2
Return( Padr( "Pagina N?" + StrZero(++Pagina,5), nDiv ) + Padl(Time(), nDiv ))

Function Linha2()
*****************
Return(Date())

Function Linha3( Tam )
**********************
Return( Padc( XNOMEFIR, Tam ))

Function Linha4( Tam, cSistema )
********************************
Return(Padc( cSistema, Tam ))

Function Linha5( Tam )
**********************
Tam := IF( Tam = Nil, 80, Tam)
Return(Repl( SEP, Tam ))

def PickTemp(cFile)
   LOCAL cScreen := SaveScreen()
   LOCAL cDir    := oAmbiente:xBaseTxt + _SLASH_
   LOCAL Files   := cDir + '*.txt'

   if !file(cFile)
      oMenu:Limpa()
      M_Title( "Setas CIMA/BAIXO Move")
      cFile := cDir + Mx_PopFile( 03, 10, 15, 61, Files, Cor())
      if Empty( cFile )
         ErrorBeep()
         Alerta("Erro: O Arquivo Nao Existe. ")
         ResTela(cScreen)
         return false
      endif
      ResTela(cScreen)
   endif
   return true
endef


def ShellRun( cComando )
*****************************
LOCAL intWindowStyle := 0
LOCAL WshShell
LOCAL lRet
LOCAL oExec

/*
intWindowStyle
0 Hides the window and activates another window.
1 Activates and displays a window. if the window is minimized or maximized, the system restores it to its original size and position. An application should specify this flag when displaying the window for the first time.
2 Activates the window and displays it as a minimized window.
3 Activates the window and displays it as a maximized window.
4 Displays a window in its most recent size and position. The active window remains active.
5 Activates the window and displays it in its current size and position.
6 Minimizes the specified window and activates the next top-level window in the Z order.
7 Displays the window as a minimized window. The active window remains active.
8 Displays the window in its current state. The active window remains active.
9 Activates and displays the window. if the window is minimized or maximized, the system restores it to its original size and position. An application should specify this flag when restoring a minimized window.
10 Sets the show-state based on the state of the program that started the application.
*/

#ifdef __XHARBOUR__
   WshShell := CreateObject("WScript.Shell")
#else
   WshShell := win_oleCreateObject("WScript.Shell")
#endif

lRet     := WshShell:Run("%comspec% /c " + cComando, intWindowStyle, .F.)
WshShell := NIL
return Iif( lRet = 0, .T., .F.)

*==================================================================================================*

def ShellExec( cComando )
	LOCAL intWindowStyle := 0
	LOCAL WshShell
	LOCAL lRet
	LOCAL oExec

	/*
	intWindowStyle
	0 Hides the window and activates another window.
	1 Activates and displays a window. if the window is minimized or maximized, the system restores it to its original size and position. An application should specify this flag when displaying the window for the first time.
	2 Activates the window and displays it as a minimized window.
	3 Activates the window and displays it as a maximized window.
	4 Displays a window in its most recent size and position. The active window remains active.
	5 Activates the window and displays it in its current size and position.
	6 Minimizes the specified window and activates the next top-level window in the Z order.
	7 Displays the window as a minimized window. The active window remains active.
	8 Displays the window in its current state. The active window remains active.
	9 Activates and displays the window. if the window is minimized or maximized, the system restores it to its original size and position. An application should specify this flag when restoring a minimized window.
	10 Sets the show-state based on the state of the program that started the application.
	*/

	#ifdef __XHARBOUR__
		WshShell := CreateObject("WScript.Shell")
	#else
		//WshShell := win_oleCreateObject("WScript.Shell")
	#endif

	//oExec := oShell:Run("%comspec% /c " + cComando, intWindowStyle, .F.)
	oExec    := WshShell:Exec(cComando)
	lRet     := oExec:Status
	WshShell := NIL
	return Iif( lRet = 0, .T., .F.)
endef

*==================================================================================================*

def M_View( row, col, row1, col1, cFile, nCor )
	MaBox(row, col, row1, col1)
	FT_DFSetup(cFile, row+1, col+1, row1-1, col1-1, 1, nCor, Roloc(nCor),"EeQqXx", .T., 5, col1-1, 8196)
	cKey := FT_DispFile()
	FT_DFClose()
	return NIL
endef

*==================================================================================================*

def MX_PopFile( row, col, row1, col1, xCoringa, nColor)
	LOCAL aFileList  := {}
	LOCAL nChoice

   hb_default(@row, 02)
   hb_default(@col, 10)
   hb_default(@row1, MaxRow()-2)
   hb_default(@col1, Maxcol()-1)
   hb_default(@ncolor, 31)

	Aeval( Directory( xCoringa ), {|aDirectory|;
								Aadd( aFileList,;
								PADR( aDirectory[F_NAME], 15 ) + ;
								if( SUBSTR( aDirectory[F_ATTR], 1,1) == "D", "   <DIR>", ;
								TRAN(       aDirectory[F_SIZE], "99,999,999 B"))  + "  " + ;
								DTOC(       aDirectory[F_DATE])       + "  " + ;
								SUBSTR(     aDirectory[F_TIME], 1, 5) + "  " + ;
								SUBSTR(     aDirectory[F_ATTR], 1, 4) + "  " )})
	if (nChoice := FazMenu(row, col, aFileList, nColor)) = 0
		return ""
	endif
	return( AllTrim(left(aFileList[nChoice],15)))
endef

*==================================================================================================*

def MSDecToChr( cString )
	LOCAL cNewString := ""
	LOCAL nTam
	LOCAL nX
	LOCAL cNumero

	nTam := StrCount( "#", cString )
	For nX := 1 To nTam
		cNumero := StrExtract( cString, "#", nX+1 )
		cNewString += Chr( Val( cNumero ))
	Next
	return ( cNewString )
endef

*==================================================================================================*

def Impressora()
****************
   LOCAL cScreen  := SaveScreen()
   LOCAL nChoice  := 0
   LOCAL aMenu    := {}
   LOCAL aPrinter := {}

   oMenu:Limpa()
   while true
      aPrinter := CupsArrayPrinter()
      aMenu    := aPrinter[CUPS_MENU]
      M_Title(" TECLE ENTER PARA ESCOLHER, ESC CANCELAR")
      nChoice := FazMenu( 09, 14, aMenu, Cor())
      if  nChoice = 0
         ResTela( cScreen )
         return
      else
         MudaImpressora(nChoice)
      endif
   enddo
endef

def RetPrinterStatus()
   LOCAL i := 0
   LOCAL aStatus := {}

   for i := 1 to 3
      nStatus := PrnStatus(i)
      if nStatus = 0
         nStatus := Iif(IsPrinter(i), 1, 2 )
      else
        if nStatus = -1
           nStatus = 4
        else
           nStatus++
         endif
      endif
      Aadd( aStatus, nStatus )
   next
   return aStatus
endef

def MudaImpressora( nCorrente, aMenu )
**************************************
   LOCAL cCodi    := Space(02)
   LOCAL aPrinter := CupsArrayPrinter()
   LOCAL aModelo 	:= aPrinter[CUPS_MODELO]
	LOCAL aAction	:= aPrinter[CUPS_ACTION]
   LOCAL aStatus  := aPrinter[CUPS_STATUS]

   if IsNil( aMenu)
      aMenu := aPrinter[CUPS_MENU]
   endif

	if UsaArquivo("PRINTER")
		PrinterErrada( @cCodi )
      aArrayPrn := {;
                     Printer->Codi,;
                     Printer->Nome, ;
                     Printer->_Cpi10,;
                     Printer->_Cpi12,;
                     Printer->Gd,;
                     Printer->Pq,;
                     Printer->Ng,;
                     Printer->Nr,;
                     Printer->Ca,;
                     Printer->c18,;
                     Printer->LigSub,;
                     Printer->DesSub,;
                     Printer->_SaltoOff,;
                     Printer->_Spaco1_6,;
                     Printer->_Spaco1_8,;
                     Printer->Reseta;
                  }
      switch nCorrente
      case 1
      case 2
      case 3
         nIndex := nCorrente
         &("oAmbiente:aLpt" + trimstr(nIndex)) := {}
         Aadd( &("oAmbiente:aLpt" + trimstr(nIndex)), aArrayPrn)
         cStr := &("oAmbiente:aLpt" + trimstr(nIndex))
         aMenu[nIndex] := " LPT" + trimstr(nIndex) + " ¦ " + aAction[aStatus[nIndex]] + " ¦ " + cStr[1,2]
         exit
		case 13
		case 14
		case 15
		case 16
		case 17
		case 18
		case 19
		case 20
		case 21
         nIndex := ( nCorrente - 12 )
         &("oAmbiente:aLpd" + trimstr(nIndex)) := {}
			Aadd( &("oAmbiente:aLpd" + trimstr(nIndex)), aArrayPrn)
         cStr := &("oAmbiente:aLpd" + trimstr(nIndex))
         aMenu[nCorrente] := " LPD" + TrimStr(nIndex) + "  ¦ REDE CUPS      ¦ " + Left(cStr[1,2],17) + " em " + aModelo[nIndex]
         exit
      endswitch

		Printer->(DbCloseArea())
		if UsaArquivo("USUARIO")
			if Usuario->(DbSeek( oAmbiente:xUsuario ))
				if Usuario->(TravaReg())
					Usuario->Lpt1 := Iif( oAmbiente:aLpt1[1,1] = NIL, "", oAmbiente:aLpt1[1,1])
					Usuario->Lpt2 := Iif( oAmbiente:aLpt2[1,1] = NIL, "", oAmbiente:aLpt2[1,1])
					Usuario->Lpt3 := Iif( oAmbiente:aLpt3[1,1] = NIL, "", oAmbiente:aLpt3[1,1])
					Usuario->Lpd1 := Iif( oAmbiente:aLpd1[1,1] = NIL, "", oAmbiente:aLpd1[1,1])
					Usuario->Lpd2 := Iif( oAmbiente:aLpd2[1,1] = NIL, "", oAmbiente:aLpd2[1,1])
					Usuario->Lpd3 := Iif( oAmbiente:aLpd3[1,1] = NIL, "", oAmbiente:aLpd3[1,1])
					Usuario->Lpd4 := Iif( oAmbiente:aLpd4[1,1] = NIL, "", oAmbiente:aLpd4[1,1])
					Usuario->Lpd5 := Iif( oAmbiente:aLpd5[1,1] = NIL, "", oAmbiente:aLpd5[1,1])
					Usuario->Lpd6 := Iif( oAmbiente:aLpd6[1,1] = NIL, "", oAmbiente:aLpd6[1,1])
					Usuario->Lpd7 := Iif( oAmbiente:aLpd7[1,1] = NIL, "", oAmbiente:aLpd7[1,1])
					Usuario->Lpd8 := Iif( oAmbiente:aLpd8[1,1] = NIL, "", oAmbiente:aLpd8[1,1])
					Usuario->Lpd9 := Iif( oAmbiente:aLpd9[1,1] = NIL, "", oAmbiente:aLpd9[1,1])
					Usuario->(Libera())
				endif
			endif
			Usuario->(DbCloseArea())
		endif
	endif
endef

def PrinterErrada( cCodi )
*******************************
   LOCAL aRotina := {{|| CadastroImpressoras() }}
   LOCAL Arq_Ant := Alias()
   LOCAL Ind_Ant := IndexOrd()
   LOCAL lRetVal := OK

   Area("Printer")
   Printer->(Order( PRINTER_CODI ))
   if Printer->(!DbSeek( cCodi ))
      Printer->(Order( PRINTER_NOME ))
      Printer->(Escolhe( 02, 00, LastRow()-2, "Codi + chr(186) + Nome", "ID NOME DA IMPRESSORA", aRotina ))
      cCodi := Printer->Codi
   endif
   AreaAnt( Arq_Ant, Ind_Ant )
   return( lRetVal )
endef

*==================================================================================================*

def PrinterDbedit()
************************
   LOCAL Arq_Ant	:= Alias()
   LOCAL Ind_Ant	:= IndexOrd()
   LOCAL cScreen	:= SaveScreen()
   LOCAL oBrowse	:= MsBrowse():New()
   LOCAL nField
   Set Key -8 To

   if !UsaArquivo("Printer")
      return( nil )
   endif

   oMenu:Limpa()
   Area("Printer")
   Printer->(Order( PRINTER_CODI ))
   Printer->(DbGoBottom())

   for nField := 1 To Printer->(FCount())
      cName := Printer->(FieldName( nField ))
      oBrowse:Add( cName, cName, NIL, "PRINTER")
   next

   //oBrowse:Add( "INICIO",     "inicio", PIC_DATA )
   //oBrowse:Add( "FIM",        "fim",    PIC_DATA )
   //oBrowse:Add( "INDICE",     "indice", '9999.9999')
   //oBrowse:Add( "OBSERVACAO", "obs",   '@!')
   oBrowse:Titulo   := "CONSULTA/ALTERACAO DE IMPRESSORAS"
   oBrowse:PreDoGet := {|| PodeAlterar() }
   oBrowse:PreDoDel := {|| PodeExcluir() }
   oBrowse:Show()
   oBrowse:Processa()
   ResTela( cScreen )
   return( nil )
endef

def FPrint( cString )
**************************
   return( DevOut( cString ) )
endef

def Seta1( Row, Col )
	LOCAL cString := "Use as Setas " + Chr( 27 ) + Chr( 24 ) + Chr( 25 ) + Chr( 26 )
	LOCAL nLen	  := Len( cString )

	Row := Iif( Row = NIL, MaxRow()-5, Row )
	Col := Iif( Col = NIL, ((MaxCol()-nLen)/2), Col )
	Write( Row, Col,	cString )
	return( nil )
endef

def FecharTemp(cDbf, cNtx)
*-------------------------*
	ms_mem_dbclosearea(cDbf)
   dbdrop(cDbf)
	return nil
endef

def FAdvance(nH)
*---------------------*
	LOCAL nSavePos
	LOCAL nNumRead
	LOCAL cBuffer
	LOCAL nEol
	LOCAL nPos
	LOCAL nMaxLine

	nMaxLine := if( nMaxLine = NIL, 512, nMaxLine)
	cBuffer  := Space(nMaxLine)
   nSavePos := FSEEK( nH, 0, FS_RELATIVE )
   nNumRead := FREAD( nH, @cBuffer, nMaxLine )
	if ( nEol := AT( EOL, substr( cBuffer, 1, nNumRead ))) == 0
      nPos := nSavePos
   else
	   nPos := nSavePos + nEol + 1
	endif
	return( FSEEK( nH, nPos, FS_SET))

def FLocate( nHandle, cStr, lFlag )
*----------------------------------------*
   LOCAL nPos    := FSeek( nHandle, 0, FS_RELATIVE )
   LOCAL nNewPos := -2   // not found return code
   LOCAL j       := FLen( nHandle ) - nPos
   LOCAL cText   := Space( j )

   FRead( nHandle , @cText , j )
   if HB_IsLogical( lFlag ) .and. lFlag
      j := hb_AtI( cStr, cText )
   else
      j := hb_At( cStr, cText )
   endif
   if j > 0
      nNewPos := nPos + j - 1
      FSeek( nHandle, nNewPos, FS_SET )
   endif
   return nNewPos

def FLen( nHandle )
*-----------------------*
   LOCAL nPos := FSeek( nHandle, 0, FS_RELATIVE )
   LOCAL nLen := FSeek( nHandle, 0, FS_END )
   FSeek( nHandle, nPos, FS_SET )
   return nLen

def FTell( nHandle )
*-----------------------*
   return FSeek(nHandle, 0, FS_RELATIVE)

def FWriteLine( nH, cBuffer)
*--------------------------------*
	LOCAL nSavePos
	LOCAL nNumRead
	#define EOL HB_OSNEWLINE()

   nSavePos := FSEEK( nH, 0, FS_RELATIVE )
   FBot(nH)
	nNumRead := FWRITE( nH, cBuffer + EOL)
	FSEEK( nH, nSavePos, FS_SET )
   return nNumRead != 0

def Untrim( cString, nTam)
*------------------------------*
	LOCAL nLenStr  := Len(cString)
	LOCAL cChar    := Space(1)
	LOCAL cRetChar

	if( nTam  = NIL, nTam := nLenStr, nTam)
	cRetChar := cString + Replicate(cChar, nTam)
	return( Left(cRetChar,nTam))

def Tecla_ESC()
********************
	LOCAL cScreen := SaveScreen()

	if Inkey() == ESC
		ErrorBeep()
		return(Conf("Pergunta: Deseja cancelar?"))
	endif
	return(FALSO)

def RJust( cString, nTam, cChar)
************************************
	LOCAL nLenStr  := Len(cString)
	LOCAL cStrTrim := AllTrim(cString)
	LOCAL nLenTrim := Len(cStrTrim)
	LOCAL cRetChar

	if( cChar = NIL, cChar := Space(1), cChar )
	if( nTam  = NIL, nTam  := (nLenStr-nLenTrim), nTam := (nTam-nLenTrim))
	cRetChar := Replicate(cChar, nTam) + cStrTrim
	return( cRetChar )

def LJust( cString, nTam, cChar)
************************************
	LOCAL nLenStr  := Len(cString)
	LOCAL cStrTrim := AllTrim(cString)
	LOCAL nLenTrim := Len(cStrTrim)
	LOCAL cRetChar

	if( cChar = NIL, cChar := Space(1), cChar )
	if( nTam  = NIL, nTam  := (nLenStr-nLenTrim), nTam := (nTam-nLenTrim))
	cRetChar := cStrTrim + Replicate(cChar, nTam)
	return( cRetChar )

def FBof( nHandle )
************************
   return FTell( nHandle) == 0

def FBot( nHandle )
************************
   LOCAL nPos := FSeek( nHandle, 0, FS_END )
   return nPos	!= -2

def FTop( nHandle )
************************
   LOCAL nPos := FSeek( nHandle, 0, FS_SET )
   return nPos	!= -2

def MS_FReadStr( nH, cB, nMaxLine )
	LOCAL cLine
	LOCAL nSavePos
	LOCAL nEol
	LOCAL nNumRead
	#define EOL HB_OSNEWLINE()

	if( nMaxLine = NIL, nMaxLine := 512, nMaxLine)
	cLine := space( nMaxLine )
	cB    := ''
	nSavePos := FSEEK( nH, 0, FS_RELATIVE )
	nNumRead := FREAD( nH, @cLine, nMaxLine )
	if ( nEol := AT( EOL, substr( cLine, 1, nNumRead ) ) ) == 0
	cB := cLine
	else
	cB := SUBSTR( cLine, 1, nEol - 1 )
	FSEEK( nH, nSavePos + nEol + 1, FS_SET )
	endif
	FSEEK( nH, nSavePos, FS_SET )
	//return nNumRead != 0
	return(cB)

def FReadLine( nH, nMaxLine )
**********************************
   LOCAL nSavePos
	LOCAL nNumRead
	LOCAL cBuffer
	LOCAL nEol
	LOCAL cB
	#define EOL HB_OSNEWLINE()

	nMaxLine := if( nMaxLine = NIL, 512, nMaxLine)
	cBuffer  := Space(nMaxLine)
   nSavePos := FSEEK( nH, 0, FS_RELATIVE )
   nNumRead := FREAD( nH, @cBuffer, nMaxLine )
	if ( nEol := AT( EOL, substr( cBuffer, 1, nNumRead ))) == 0
      cB := cBuffer
   else
      cB := SUBSTR( cBuffer, 1, nEol - 1 )
      FSEEK( nH, nSavePos + nEol + 1, FS_SET )
   endif
	FSEEK( nH, nSavePos, FS_SET )
   return cB

def FReadByte( nH )
************************
	LOCAL nSavePos, nNumRead, cBuffer := Space(1)

   nSavePos := FSEEK( nH, 0, FS_RELATIVE )
   nNumRead := FREAD( nH, @cBuffer, 1 )
	FSEEK( nH, nSavePos, FS_SET )
   return cBuffer

Proc CenturyOn()
*****************
	Set Cent On
	return

Proc CenturyOff()
****************
	Set Cent Off
	return

def GetIp()
*-----------*
	LOCAL aHosts
	LOCAL cEstacao := NETNAME(.F.)

	HB_InetInit()
	aHosts := HB_InetGetHosts( cEstacao )
	IF aHosts == NIL
		aHosts := HB_InetGetAlias( cEstacao )
	END
	IF EMPTY(aHosts)
		aHosts := HB_InetGetAlias( cEstacao )
	END
	HB_InetCleanup()
	return aHosts
endef

def FCurdir()
*-----------------*
	LOCAL cRetChar
   #ifdef __PLATFORM__WINDOWS
      cRetChar := CurDrive() + ':\' + Curdir()
   #else
      cRetChar := Curdir()   
   #endif
	return(cRetChar)

def CorAlerta( nTipo )
***************************
ifNil( nTipo, 1 )
return( oAmbiente:CorAlerta )
	
def CorBox( nTipo )
************************
ifNil( nTipo, 1 )
return( oAmbiente:CorAlerta )

def CorBoxCima( nTipo )
***************************
ifNil( nTipo, 1 )
return( oAmbiente:CorCima )

def MsBox( nCol, nRow, nCol1, nRow1, nCor, lRelevo, cTexto )
*+----------------------------------------------------------*
	LOCAL cFrame  := oAmbiente:Frame
	LOCAL nRetVal
	LOCAL PBack
	LOCAL aCor
	LOCAL aFundo
	LOCAL aCima
	LOCAL cCor
	if lRelevo // Alto Relevo
	  aCor	  := { 16,32,48,64,64,80,096,112,128,144,160,176,192,208,224 }
	  aFundo   := { 16,32,48,64,64,80,096,112,128,144,160,176,192,208,224 }
	  aCima	  := { 25,47,53,76,64,86,101,117,143,149,165,181,207,213,239 }
	else
	  aCor	  := { 25,47,53,76,64,86,101,117,143,149,165,181,207,213,239 }
	  aFundo   := { 25,47,53,76,64,86,101,117,143,149,165,181,207,213,239 }
	  aCima	  := { 16,32,48,64,64,80,096,112,128,144,160,176,192,208,224 }
	endif
	if nCor = NIL
		nCor	 := CorBox()
	endif
	cCor					:= aCor[nCor]
	oAmbiente:CorCima := aCima[ nCor ]
	nComp 				:= ( nRow1 - nRow )-1
	ColorSet( @cCor, @PBack )
	M_Frame( cFrame )
	Box( nCol, nRow, nCol1, nRow1, M_Frame() + " ", aFundo[ nCor], 1, 8 )
	cFrame1 := Left( cFrame, 1 )
	cFrame2 := SubStr( cFrame, 2, 1 )
	cFrame8 := SubStr( cFrame, 8, 1 )
	cFrame7 := SubStr( cFrame, 7, 1 )
	Print( nCol, nRow, cFrame1, aCima[nCor], 1 )
	Print( nCol, nRow+1, Repl( cFrame2, nComp), aCima[nCor] )
	For x := nCol+1 To nCol1-1
		Print( x, nRow, cFrame8, aCima[nCor], 1 )
	Next
	Print( nCol1, nRow, cFrame7,	aCima[nCor],1 )
	if cTexto != NIL
		Print( nCol+1, nRow+1, Padc( cTexto, nRow1-nRow-1), aCima[nCor] )
	endif
	cSetColor( SetColor())
	nSetColor( cCor, Roloc( cCor ))
	return NIL
	
def WriteBox( Linha, Col, xString, nCor )
******************************************
   Iif( Linha	 = Nil, Linha	 := Row(), Linha )
   Iif( Col 	 = Nil, Col 	 := Col(), Col )
   Iif( xString = Nil, xString := "",    xString )
   Iif( nCor	 = Nil, nCor	 := CorBoxCima(), nCor )
   Print( Linha, Col, xString, nCor )
   return nil
endef

def TestaCgc( Var )
************************
LOCAL Matriz[12]
LOCAL i
LOCAL Df1
LOCAL Df2
LOCAL Df3
LOCAL nTam := 0

if ValType( Var ) = "N"
	Var := CpfCgcIntToStr( Var )
	nTam := Len( Var )
	if nTam <= 14
		return( TestaCpf( Var ) )
	endif
endif

/*
	cTira := StrTran( Var,	".")
	cTira := StrTran( cTira, "/")
	cTira := StrTran( cTira, "-")
	nComp := Len( AllTrim( cTira ))
	if nComp >= 14 // Cgc
		Var := Tran( Var, "99.999.999/9999-99")
	else
		Var := Tran( Var, "999.999.999-99" )
		return( TestaCpf( Var ) )
	endif
*/

if !Empty( Var ) .AND. Len( Var ) < 18
	 ErrorBeep()
	 Alerta("CGC Incorreto... Verifique." )
	 return(.F.)
endif
Var1 := StrTran( Var,  ".")
Var1 := StrTran( Var1, "/")
Var1 := StrTran( Var1, "-")
For I = 1 To 12
	Matriz[i] := Val( SubStr( Var1, I, 1))
Next

** Teste do Primeiro digito (unidade)
Df1 := 5 * Matriz[1] + 4 * Matriz[2] + 3 * Matriz[3] + 2 * Matriz[4] + 9 * Matriz[5] + ;
		 8 * Matriz[6] + 7 * Matriz[7] + 6 * Matriz[8] + 5 * Matriz[9] + 4 * Matriz[10] + ;
		 3 * Matriz[11] + 2 * Matriz[12]
Df2 := Df1 / 11
Df3 = Int( Df2 ) * 11
Resto1 := ( Df1- df3 )
if Resto1 = 0 .OR. Resto1 = 1
  Pridig := 0
else
  Pridig := ( 11 - Resto1 )
endif

** Teste do segundo digito (dezena)
DF1 := 6 * Matriz[1] + 5 * Matriz[2] + 4 * Matriz[3] + 3 * Matriz[4] + 2 * Matriz[5] + ;
		 9 * Matriz[6] + 8 * Matriz[7] + 7 * Matriz[8] + 6 * Matriz[9] + 5 * Matriz[10] + ;
		 4 * Matriz[11] + 3 * Matriz[12] + 2 * Pridig
Df2 := ( Df1/11 )
Df3 := Int( Df2 ) * 11
Resto2 := ( Df1 - Df3)
if Resto2 = 0 .OR. Resto2 = 1
  SegDig := 0
else
  SegDig := (11 - Resto2)
endif
if Pridig <> Val( SubStr( Var1,13,1)) .OR. SegDig <> Val( SubStr( Var1,14,1))
	 ErrorBeep()
	 Alerta("CGC Incorreto... Verifique." )
	 return(.F.)
else
	return(.T.)
endif

def DataExtenso( dData )
*****************************
LOCAL cString := ""
LOCAL nMes
LOCAL aMes
LOCAL aDia
LOCAL nDia
LOCAL aDecada
LOCAL nDecada
LOCAL aAno
LOCAL nAno
LOCAL aSeculo
LOCAL nSeculo
LOCAL nMenor
LOCAL nMaior
LOCAL aDecimal
LOCAL cAno
LOCAL cDia
LOCAL cMes
LOCAL cDecada
LOCAL cSeculo

aMes		:= {"janeiro","fevereiro","marco","abril","maio","junho",;
				 "julho","agosto","setembro","outubro","novembro","dezembro" }
aDia		:= {"primeiro", "segundo", "terceiro", "quarto", "quinto", "sexto", "setimo",;
				 "oitavo", "nono", "decimo"}
aDecimal := {"decimo", "vigesimo", "trigesimo" }
aSeculo	:= {"um mil novecentos ", "dois mil " }
aDecada	:= {"dez ","vinte ","trinta ","quarenta ","cinquenta ","sescenta ","setenta ","oitenta ","noventa "}
aAno		:= {"um","dois","tres","quatro","cinco","seis","sete","oito","nove" }

nSeculo	:= Val( Left( StrZero( Year( dData ), 4),1))
nDecada	:= Val( SubStr( StrZero( Year( dData ), 4), 3,1))
nAno		:= Val( Right( StrZero( Year( dData ), 4),1))
nDia		:= Day( dData )
nMes		:= Month( dData)
cAno		:= StrZero( nAno, 4)
cDia		:= StrZero( nDia, 2 )
nMenor	:= Val( Left( cDia, 1 ))
nMaior	:= Val( Right( cDia, 1 ))
cMes		:= aMes[ nMes ]

if nMenor > 0
	cString := aDecimal[nMenor] + " "
endif
if nDecada = 0
	cDecada := ""
else
	cDecada := "e " + aDecada[nDecada]
endif
if nAno = 0
	cAno := ""
else
	cAno := "e " + aAno[nAno]
endif
cSeculo := aSeculo[nSeculo]
cString += Iif( nMaior = 0, "", aDia[nMaior] + " " )
cString += "dia do mes de "
cString += cMes
cString += " do ano "
cString += cSeculo
cString += cDecada
cString += cAno
return( cString )


def DataExt1( dData )
*************************
LOCAL Mes
LOCAL MesExt

if dData = NIL .OR. ValType( dData ) != "D"
	dData := Date()
endif
Mes	 := Month( dData)
MesExt := {"Janeiro","Fevereiro","Marco","Abril","Maio","Junho",;
			  "Julho","Agosto","Setembro","Outubro","Novembro","Dezembro" }
return( StrZero( Day( dData ), 2 ) + " de "+ MesExt[ Mes ] +" de "+ Str(Year( dData ),4 ))

def Mes( dData )
*********************
LOCAL Mes
LOCAL MesExt

if dData = NIL
	dData := Date()
	Mes	:= Month( dData)
elseif ValType( dData ) = "D"
	Mes := Month( dData)
elseif ValType( dData ) = 'N'
	Mes := dData
else
	dData := Date()
	Mes	:= Month( dData)
endif
MesExt := { "Janeiro","Fevereiro","Marco","Abril","Maio","Junho",;
				"Julho","Agosto","Setembro","Outubro","Novembro","Dezembro" }
return( MesExt[ Mes ] )

def DataExt2( dData )
**************************
LOCAL Mes, MesExt, Dia

if dData = NIL .OR. ValType( dData ) != "D"
	dData := Date()
endif
Mes	 := Month( dData)
MesExt := { { "Janeiro"  , 07 },;
				{ "Fevereiro", 05 },;
				{ "MarÃ§o"    , 09 },;
				{ "Abril"    , 09 },;
				{ "Maio"     , 10 },;
				{ "Junho"    , 09 },;
				{ "Julho"    , 09 },;
				{ "Agosto"   , 08 },;
				{ "Setembro" , 06 },;
				{ "Outubro"  , 07 },;
				{ "Novembro" , 06 },;
				{ "Dezembro" , 06 }}

Dia	 := { "Primeiro ",;
			  "Dois "    ,;
			  "TrÃªs "    ,;
			  "Quatro "  ,;
			  "Cinco "   ,;
			  "Seis "    ,;
			  "Sete "    ,;
			  "Oito "    ,;
			  "Nove "    ,;
			  "Dez "     ,;
			  "Onze "    ,;
			  "Doze "    ,;
			  "Trez "    ,;
			  "Quatorze "    ,;
			  "Quinze "    ,;
			  "Dezesseis "    ,;
			  "Dezessete "    ,;
			  "Dezoito "    ,;
			  "Dezenove "    ,;
			  "Vinte "    ,;
			  "Vinte e um "    ,;
			  "Vinte e dois "    ,;
			  "Vinte e trÃªs "    ,;
			  "Vinte e quatro "    ,;
			  "Vinte e cinco "    ,;
			  "Vinte e seis "    ,;
			  "Vinte e sete "    ,;
			  "Vinte e oito "    ,;
			  "Vinte e nove "    ,;
			  "Trinta "    ,;
			  "Trinta e um "}

return( Dia[ Day( dData ) ] + "de " + MesExt[ Mes,1 ] + " de " + Str( Year( dData ),4))	

def CpfCgcIntToStr( nCpfCgc )
**********************************
LOCAL cCgc	:= AllTrim( Str( nCpfCgc ))
LOCAL nTam	:= Len( cCgc )

if nTam <= 11
	cCpf1 := Left( cCgc, 3 )
	cCpf2 := SubStr( cCgc, 4, 3 )
	cCpf3 := SubStr( cCgc, 7, 3 )
	cCpf4 := SubStr( cCgc, 10, 2 )
	cCgc	:= cCpf1 + "." + cCpf2 + "." + cCpf3 + "-" + cCpf4
else
	cCgc1 := Left( cCgc, 2 )
	cCgc2 := SubStr( cCgc, 3, 3 )
	cCgc3 := SubStr( cCgc, 6, 3 )
	cCgc4 := SubStr( cCgc, 9, 4 )
	cCgc5 := SubStr( cCgc, 13, 2 )
	cCgc	:= cCgc1 + "." + cCgc2 + "." + cCgc3 + "/" + cCgc4 + "-" + cCgc5
endif
return( cCgc )

def TestaCpf( cCpf )
*************************
LOCAL cDig
LOCAL nNumero
LOCAL nMult
LOCAL nSoma
LOCAL nProd
LOCAL nNum
LOCAL nDig
LOCAL Digito
LOCAL Var1
LOCAL Var2
LOCAL Numero
LOCAL d1
LOCAL Dig
LOCAL Soma
LOCAL Num
LOCAL Mult
LOCAL Prod
LOCAL Conta

if !Empty( cCpf ) .AND. Len( cCpf ) < 14
	 ErrorBeep()
	 Alerta("Erro: CPF incorreto." )
	 return(.F.)
endif
cCpf	  := AllTrim( cCpf )
Digito  := Right( cCpf, 2 )
Var1	  := StrTran( cCpf, "." )
Var2	  := StrTran( Var1, "-" )
Numero  := Left( Var2, 9 )

Mult	 := 1
Soma	 := 0
Prod	 := 0
Num	 := 0
Dig	 := 0
cDig	 := ""
For Conta := Len( Numero ) To 1 Step -1
	Num := Val( SubStr( Numero, Conta, 1 ) )
	Mult++
	Soma += ( Num * Mult )
Next Conta
Dig := Mod( ( Soma * 10), 11 )
if Dig >= 10
	Dig := 0
endif
d1 := Dig
Numero = Left( Var2, 10 )
Mult	 := 1
Soma	 := 0
Dig	 := 0
Prod	 := 0
Num	 := 0
For Conta := Len( Numero ) To 1 Step -1
	Num := Val( SubStr( Numero, Conta, 1 ) )
	Mult++
	Soma += ( Num * Mult )
Next Conta
Dig := Mod( ( Soma * 10), 11 )
if Dig >= 10
	Dig := 0
endif
// cDig := Left(Str( d1 ), 1 ) + Left( Str( Dig ), 1 )
if Val( Left( Digito, 1 ) ) != d1 .OR. Val( Right( Digito, 1 ) ) != Dig
	ErrorBeep()
	Alerta( "Erro: CPF invalido.")
	return(.F.)
endif
return(.T.)
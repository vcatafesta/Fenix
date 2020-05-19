#include "fenix.ch"

STATIC static13
STATIC static14
STATIC static1 := "????"
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
	Alert(" ATEN€ÇO !!!;;SENHA INCORRETA ! ", , "W+/B")
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
***         eUNIT:=str(UNIT)
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


function caduser()
******************
					save scre to caduser
               DDA := ' '
               while DDA = ' '
                  lp := ' '
                  cls
                  CAD := '* CADASTRO DE USUµRIO *'
                  set color to w/r+
                  @ 00,25 say CAD
                  tcor()
                  @ 01,00 to 01,79
                  @ 04,02 clea to 07,77
                  @ 04,02 to 07,77
                  set color to r+
                  @ 02,03 say '* Confirme os Dados *'
                  tcor()
                  @ 05,04 say 'Usu rio:' get LOGfan pict '!!!!!!!!!!!!!!!'
                  read
                  if LOGfan = '      '
                     quit
                  endi
                  @ 05,40 say 'Senha..:'
                  set color to w+/n,X
                  @ 05,49 get SHA
                  read
                  tcor()
                  if SHA = '      '
                     save scre to msg
                     @ 09,20 clea to 12,50
                     set color to b+
                     @ 09,20 to 12,50
                     set color to G+/r+
                     F := ' '
                     @ 10,21 say '      SENHA INVµLIDA !       '
                     @ 11,21 say '        Redigite !!!         '
                     set color to w/w/w/w
                     @ 00,60 GET F
                     read
                     tcor()
                     rest scre from msg
                     DDA = ' '
                     loop
                  endi
                  SHA2 := SPAC(6)
                  @ 06,40 say 'Confirme a Senha:'
                  set color to w+/n,X
                  @ 06,58 get SHA2
                  read
                  tcor()
                  if SHA # SHA2
                     save scre to msg
                     @ 09,20 clea to 12,50
                     set color to b+
                     @ 09,20 to 12,50
                     set color to G+/r+
                     F := ' '
                     @ 10,21 say '    A SENHA NÇO CONFERE      '
                     @ 11,21 say '        Redigite !!!         '
                     set color to w/w/w/w
                     @ 00,60 GET F
                     read
                     tcor()
                     rest scre from msg
                     @ 04,02 clea to 07,77
                     @ 04,02 to 07,77
                     DDA = ' '
                     loop
                  endi
                  set color to b+
                  @ 05,40 clea to 06,75
                  set color to G+/r+
                  @ 05,42 say 'Senha Cadastrada Com Sucesso !!!'
                  tcor()
                  Area(oMenu:aDbfs[23])
                  loca for fantazia = logfan
                  if eof()
                     CD := ' '
                     do whil CD := ' '
                        CODUS := '    '
                        @ 10,03 say 'Digite o seu C¢digo do Cadastro:' get CODUS
                        read
                        if CODUS = '    '
                           exit
                        endi
								Area(oMenu:aDbfs[31])
                        loca for codfun = CODUS
                        if eof()
                           mdfunc()
                           CD = ' '
                           loop
                        endi
                        stor nfunc to NME
                        stor bairro to brro
                        stor cdde to cdad
                        stor uf to estd
                        stor endrco to ender
                        stor date() to dt
                        @ 10,03 clea to 12,76
                        @ 10,03 say 'C¢digo do Cadastro:' get Codus
                        @ 12,03 say 'Nome Completo.....:' get NME
                        @ 14,03 say 'Endere‡o..........:' get ender
                        @ 16,03 say 'Bairro............:' get brro
                        @ 18,03 say 'Cidade............:' get cdad
                        @ 18,50 say 'Estado:' get estd pict '!!'
                        @ 20,03 say 'Data do Cadastro..:' get dt
                        clea gets
                        @ 22,03 say '* Confirma os Dados acima para cadastramento? <S/N>' get R pict '!' valid (R $ 'SN')
                        read
                        BLQ = 'B'
                        if R # 'S'
                           lp := 'x'
                           exit
                        endi
                        Area(oMenu:aDbfs[23])
                        loca for codusu = CODUS
                        if eof()
                           Area(oMenu:aDbfs[23])
                           appe blan
                           repl codusu with codus, fantazia with logfan, senha with SHA, dtcad with dt
                           repl cadastro with BLQ, venda with BLQ, regv with BLQ, bxv with BLQ, edtv with BLQ, estqv with BLQ
                           repl lstv with BLQ, psqv with BLQ, nfv with BLQ, compra with BLQ
                           repl regc with BLQ, bxc with BLQ, edtc with BLQ, lstc with BLQ
                           repl estqc with BLQ, psqc with BLQ, nfc with BLQ, etqc with BLQ

                           repl estoque with BLQ, plne with BLQ, cnce with BLQ, edte with BLQ,pere with BLQ
                           repl rgpe with BLQ, cheq with BLQ, dpe with BLQ, lja with BLQ, fna with BLQ
                           repl etqed with BLQ, ftv with BLQ, nfe with BLQ, nfsa with BLQ, nfen with BLQ, dvv with BLQ

                           repl clicad with BLQ, forcad with BLQ, mercad with BLQ, procad with BLQ, cfocad with BLQ
                           repl cdbcad with BLQ, estcad with BLQ, clacad with BLQ, muncad with BLQ, repcad with BLQ
                           repl tracad with BLQ, cescad with BLQ, embcad with BLQ

                           mdsuces()
                           @ 10,03 clea to 22,78
                           @ 11,04 say 'Agora o sistema ser  fechado automaticamente.'
                           @ 12,04 say ' - Logue com os dados cadastrados !' get DDA
                           read
                           quit
                        else
                           @ 10,03 clea to 22,78
                           EXISCAD()
                           CD = ' '
                           loop
                        endi
                     endd
                  endi
                  if lp # 'x'
                     @ 10,03 clea to 22,78
                     exiscad()
                     DDA = ' '
                     loop
                  endi
               endd
	rest scre from caduser



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

function conf(cString)
**********************
	return(alert(cstring, {" Sim ", " Nao "}) == 1)	
	
function Alerta( cString, aArray )
**********************************
	aArray := IIF( aArray = NIL, { " Okay " }, aArray )
	Return( Alert( cString, aArray, 31 ))

function Nada(cString)
**********************
	LOCAL cScreen := SaveScreen()

	hb_default( @cString, "INFO: Nada consta nos parametros informados.")
	ErrorBeep()
	Alerta( cString )
	return(ResTela( cScreen ))

function Mensagem( String, Color, nLine )
*****************************************
	LOCAL cScreen := SaveScreen()
	LOCAL pstrlen := len(string) + 6
	LOCAL cFundo  := 112
	LOCAL pBack
	LOCAL Row
	LOCAL Col
	LOCAL Col2

	IF nLine = Nil
		Row    := ((  MaxRow() + 1 ) / 2 ) - 2
		Col    := ((( MaxCol() + 1 ) - PstrLen ) ) / 2
		Col2   := ((( MaxCol() + 1 ) / 2 ) - 10 )
	Else
		Row	 := nLine
		Col    := ((( MaxCol() + 1 ) - PstrLen ) ) / 2
		Col2   := ((( MaxCol() + 1 ) / 2 ) - 10 )
	EndIF

	hb_default(@Color, "w+/r")
	ms_box( Row, Col, Row+4, Col+PstrLen, B_SINGLE_DOUBLE, Color)
	setcolor(Color)
	Print( Row + 2, Col + 4, String, Color)
	setcolor("")
	Return( cScreen )

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

	
Function aMaxStrLen( xArray )
*****************************
LOCAL nTam    := Len(xArray)
LOCAL nLen    := 0
LOCAL nMaxLen := 0
LOCAL x

For x := 1 To nTam
	nLen := Len(xArray[x])
	IF nMaxLen < nLen
		nMaxLen := nLen
	EndIF	
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
	LOCAL cChar      :=  "?v?=??"

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

Function UsuarioErrado( cNome )
******************************
LOCAL aRotinaInclusao  := {{||CadUser() }}
LOCAL aRotinaAlteracao := NIL // {{||AltSenha() }}
LOCAL cScreen	        := SaveScreen()
LOCAL Arq_Ant          := Alias()
LOCAL Ind_Ant          := IndexOrd()

Area("usuario")
( Usuario->(Order( USUARIO_FANTAZIA )), Usuario->(DbGoTop()))
IF Usuario->(Eof()) .OR. Usuario->(!DbSeek("ADMIN"))
   //GravaSenhaAdmin(OK)
Else
	IF Empty(Usuario->Senha)
	   //GravaSenhaAdmin(FALSO)
	EndIF	
EndIF

IF Usuario->(!DbSeek( cNome ))
   Usuario->(Escolhe( 00, 00, MaxRow(), "Fantazia", "USUARIO", aRotinaInclusao, NIL, aRotinaAlteracao, NIL, NIL, NIL ))
	cNome := Usuario->Fantazia
EndIF

AreaAnt( Arq_Ant, Ind_Ant )
return( OK )

def SenhaErrada(cLogin, cPassWord)
	LOCAL cSenha  := Usuario->( AllTrim( Senha ))
	LOCAL Passe   := cPassword
	
	IF !Empty( Passe) .AND. cSenha == Passe
		return true
	EndIF
	cPassword := Space(6)
	ErrorBeep()
	Alert("ERRO: Senha nao confere.")
	return false
endef

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
		IF !Conf("Registro em uso em outra Esta‡ao. Tentar Novamente ? " )
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

Function CorBox( nTipo )
************************
	hb_default( @nTipo, 1 )
	return( 31 )


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
    box(nrow, ncol, nrow1, ncol1, "????", Cor[1])
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

#include "fenix.ch"

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
	
function snh_adm()
******************
   STT := ' '
   
   while Empty(STT)
      say := ' '
      save scre to tela
      @ 09,20 clea to 13,54
      @ 09,20 to 13,54
      SNA := SPAC(7)
      @ 10,21 say '* DIGITE A SENHA ADMINISTRADOR:'
      set color to w+/n,X
      @ 12,33 get SNA
      read
      tcor()
      rest scree from tela
      if SNA = '      '
         say := 'X'
         retu
      endi
   
	   Area(oMenu:aDbfs[3])
      loca for senha = SNA
      if eof()
         Unlock
         USe
         say := 'X'
         mdsha()
         STT := ' '
         loop
      end
      Unlock
      Use
      return
   end

   
function nrpd()
***************
	public codnum
	if digt = '10'
   	if reg < 10
      	stor '000000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg >= 10
      	stor '00000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99
      	stor '0000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999
      	stor '000000'+ltrim(str(reg)) to codnum
   	endi
   	if reg > 9999
      	stor '00000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99999
      	stor '0000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999999
      	stor '000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 9999999
      	stor '00'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99999999
      	stor '0'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999999999
      	stor ltrim(str(reg)) to codnum
   	endi
	endi
	if digt = '8'
	   if reg < 10
	      stor '0000000'+ltrim(str(reg)) to codnum
	   endi
	   if reg >= 10
	      stor '000000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99
	      stor '00000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999
	      stor '0000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 9999
      	stor '000'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 99999
	      stor '00'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 999999
	      stor '0'+ltrim(str(reg)) to codnum
   	endi
	   if reg > 9999999
	      stor ltrim(str(reg)) to codnum
   	endi
	endi
if digt = '6'
   if reg < 10
      stor '00000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 99999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '5'
   if reg < 10
      stor '0000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 9999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '4'
   if reg < 10
      stor '000'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor '00'+ltrim(str(reg)) to codnum
   endi
   if reg > 99
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg > 999
      stor ltrim(str(reg)) to codnum
   endi
endi
if digt = '2'
   if reg < 10
      stor '0'+ltrim(str(reg)) to codnum
   endi
   if reg >= 10
      stor ltrim(str(reg)) to codnum
   endi
endi


function lstcli()
*****************
	
   oMenu:Limpa()
   Pest := Space(2)
   Mabox(10, 10,12, 40, "LISTAGEM DE CLIENTES") 
   @ 11, 11 say 'Estado:' get Pest pict '@!' valid !Empty(Pest)
   read   
   if LastKey() = ESC
   	if conf("Pergunta: Deseja encerrar?")
      	return nil
      endif   
   endif
	ty := 0
	while ty = 0
   	OI := 0
   	l := 2
   	dct := -1
   
   	Area("cadcli")
   	index on dscnto to I5
	   set index to I5
	   while !eof()
      if Pest # '  '
         if est # Pest
            skip
            loop
         endi
      endi
      if ativo # 'A'
         skip
         loop
      endi
      if dscnto = dct
         skip
         loop
      endi
      @ l,01 say dscnto
      stor DSCNTO to dct
      l := l + 1
      skip
   endd
   Unlock
   Use

   @ 21,20 say 'Digite o Valor do Desconto:' get oi pict '9999.99'
   read
   @ 22,20 prompt 'IMPRIMIR TABELA'
   @ 23,20 prompt 'SAIR'
   MENU TO TY
   @ 20,01 clea to 21,40
   if TY # 1
      retu
   endi
   Area(oMenu:aDbfs[5])
   go top
   ln := 2
   SET DEVI TO PRINT
   SET PRINT ON
   @ 00,00 say '- Listagem de Clientes      '+'Estado de: '+Pest 
   do whil .not. eof()
      if Pest # '  '
         if est # Pest
            skip
            loop
         endi
      endi
      if dscnto # oi
         skip
         loop
      endi
      if ativo # 'A'
         skip
         loop
      endi
      @ ln,00 say chr(15)
      @ ln,02 say codc+'-'+cliente
      @ ln,36 say fone1
      @ ln,55 say contato
      @ ln,75 say dscnto
      @ ln+1,02 say email
      skip
      ln := ln+2
      if ln>60
         ejec
         ln := 0
         loop
      endi
   endd
   Unlock
   Use
   set print off
   set devi to scre
   ejec
   @ 21,02 say 'Gerando relat¢rio *.TXT  ....'
   r := ' '
   nm := dtos(date)+".txt"
   set printer to C:\hb32\clamar\Relat\&nm
   set print on
   set console off
   ??'Listagem email clientes do estado: '+Pest
   ?'Desconto desses: '+ltrim(str(oi))
   ?
   Area(oMenu:aDbfs[5])
   go top
   do whil .not. eof()
      if Pest # '  '
         if est # Pest
            skip
            loop
         endi
      endi
      if dscnto # oi
         skip
         loop
      endi
      if ativo # 'A'
         skip
         loop
      endi
      if email = '     '
         skip
         loop
      endi
      ?trim(email)+';'
      skip
   endd
   set console on
   set print off
   set printer to
   @ 23,02 say '* Dados Gerado com SUCESSO !!!' get R 
   read

   @ 02,00 clea to 23,79
   TY := 0
   loop
endd

function psqcli()
*****************
t:=0
do whil t = 0
   CCPF := spac(14)
   CNP := spac(18)
   RZ := spac(40)
   MNOME:=SPACE(15)
   Ccde:=spac(15)
   Cender:=spac(40)
   if cdtr = 'X'
      @ 09,04 prompt 'NOME FANTASIA'
      @ 10,04 prompt 'RAZAO SOCIAL'
      @ 11,04 prompt 'CNPJ'
      @ 12,04 prompt 'CPF'
      @ 13,04 prompt 'CIDADE'
      @ 14,04 prompt 'ENDERECO'
      menu to TT
   else
      TT := 1
   endi
   @ 01,50 to 23,79
   if TT = 1
      @ 02,51 say "Digite o Nome do Cliente:"
      @ 03,51 GET MNOME PICT "@!"
   elseif TT = 2
      @ 02,51 say "Digite a RazÆo Social:"
      @ 03,51 GET RZ PICT "!!!!!!!!!!!!!!!!!!!!"
   elseif TT = 3
      @ 02,51 say "Digite o CNPJ:"
      @ 03,51 GET CNP PICT "99.999.999/9999-99"
   elseif TT = 4
      @ 02,51 say "Digite o CPF:"
      @ 03,51 GET CCPF PICT "999.999.999-99"
   elseif TT = 5
      @ 02,51 say "Digite a Cidade:"
      @ 03,51 GET Ccde PICT "@!"
   elseif TT = 6
      @ 02,51 say "Digite Endereco:"
      @ 03,51 GET Cender PICT "@!"
   endi
   READ
   if TT = 0
*      rest scre from tela
      retu
   endi
   if TT = 1 .and. Mnome = '     '
*      rest scre from tela
      retu
   elseif TT = 2 .and. RZ = '    '
*      rest scre from tela
      retu
   elseif TT = 3 .and. CNP = '  '
*      rest scre from tela
      retu
   elseif TT = 4 .and. CCPF = '   '
*      rest scre from tela
      retu
   elseif TT = 5 .and. Ccde = '   '
*      rest scre from tela
      retu
   endi
   Area(oMenu:aDbfs[5])
   DBGOTOP()
   if TT = 1
      LOCATE FOR ALLTRIM(MNOME)$CLIENTE
   elseif TT = 2
      LOCATE FOR ALLTRIM(RZ)$RAZAO
   elseif TT = 3
      LOCATE FOR ALLTRIM(CNP)$CNPJ
   elseif TT = 4
      LOCATE FOR ALLTRIM(CCPF)$CPF
   elseif TT = 5
      LOCATE FOR ALLTRIM(CCDE)$CIDA
   elseif TT = 6
      LOCATE FOR ALLTRIM(Cender)$ender
   endi
   IF EOF()
       mdcli()
       if cdtr = 'X'
*          rest scre from tela
       endi   
       t:=0
       loop
   ENDIF
   CONTA:=0
   ln := 3
   @ 01,51 clea to 22,78
   bcor()
   @ 01,51 say 'C¢digo       Cliente        '
   tcor()
   DO WHIL .T.
      CONTA++ 
      if ativo # 'A'
         icor()
      endi
      @ ln,51 SAY codc
      @ ln,58 SAY subs(cliente,1,20)
      if TT # 1
         @ ln+1,51 say subs(razao,1,25)
         if sit = 'EMPRESA'
            @ ln+2,51 say cnpj
            else
            @ ln+2,51 say cpf
         endi
      endi
      tcor()
      if TT = 1
         ln := ln + 1
      else
         ln := ln + 4
      endi
      if ln > 20
         @ 22,51 say 'Tecle algo...'
         inkey(10)
*         @ 03,51 clea to 22,78
         ln := 3
      endi
      IF EOF()
         Unlock
         Use
         @ 22,51 SAY "Fim da Busca !"
         inkey(10)
*         rest scre from tela
         retu
      ENDIF
      CONTINUE
*      rest scre from tela
      retu
   ENDD
*   rest scre from tela
   retu
   cdtr := ' '
endd

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
Area(oMenu:aDbfs[23])
loca for codusu = logfan
if eof()
   Unlock
   Use
   cls
   BLQ = ' '
   clea
   @ 08,00 to 13,79
   set color to r+
   @ 10,15 say "    VOCE NÇO PODE BURLAR O SISTEMA   "
   @ 11,15 say "         SAINDO ..............       "
   inkey(5)
   tcor()
   QUIT
endi
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
Unlock
Use
retu

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
      Alert( "Nao pode criar um impressora!" )
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
            unlock
            use
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
         UNLOCK
         USE

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
         Unlock
         Use
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
         Unlock
         Use
         @ 16,53 SAY "Fim da Busca !"
         inkey(0)
         rest scre from tela
         retu
      ENDI
      CONTINUE
   endd
   Unlock
   Use
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
                           Unlock
                           Use
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
                        Unlock
                        Use
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
                           Unlock
                           Use
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

                           Unlock
                           Use
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
                           Unlock
                           Use
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

function login()
****************
	LOCAL cScreen   := SaveScreen()
	LOCAL R         := Space(1)
	LOCAL cLogin    := Space(15)
	LOCAL cPassword := Space(6)
	LOCAL SNA       := "168935"
	
	Area("Usuario")
	while true		
		MaBox(09, 21, 14, 50, "LOGIN")
		@ 11,23 say 'Usuario..:' get cLogin    pict "@!" valid UsuarioErrado( @cLogin )
		@ 12,23 say 'Senha....:' get cPassword pict "@S" valid SenhaErrada( cLogin, cPassword )
		read
		if lastkey() = ESC
			ErrorBeep()
			if conf("Pergunta: Deseja encerrar?")
				oMenu:Limpa()
				DbCloseAll()
				quit
			end
			loop
		end
      Log           := cLogin
      Sha           := Sna
		LogFan        := Usuario->CodUsu
		nMuser        := Usuario->Fantazia
		oMenu:Usuario := Usuario->Fantazia
      //Unlock
		//Use
		
		Area(oMenu:aDbfs[9])
		Descto := Desc
		//Unlock
		
		Area("cadprod") // oMenu:aDbfs[11])
		CadProd->(DbGoTop())
		
		if CadProd->(TravaArq())
			Mensagem("Aguarde, Atualizando valores")
         while Cadprod->(!Eof())
				desc_t         := 0
				des_prc        := 0
				vpreco         := 0
				desc_t         := 100-descto
				des_prc        := desc_t/100
				vpreco         := precopl/des_prc
				CadProd->Preco := vPreco
				CadProd->(DbSkip(1))
			end			
		end	
		CadProd->(Libera())
		//Unlock
		//Use
		return nil
	end

   
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

function ErrorBeep()
********************
	Tone(87.3,1)
	Tone(40,3.5)
	return nil

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
	LOCAL cTitulo    := "ESCOLHA UMA OPÇÃO" 
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

Function NetUse( cBcoDados, lModo, nSegundos, cAlias )
******************************************************
LOCAL cScreen := SaveScreen()
LOCAL nArea   := 0
LOCAL Restart := OK
LOCAL cStr1
LOCAL cStr2
LOCAL cStr3
LOCAL cStr4
LOCAL cStr5
LOCAL cStr6
LOCAL lForever
LOCAL cTela
LOCAL lAberto := FALSO
P_DEF( lModo, OK )
P_DEF( nSegundos, 2 )

cBcoDados := StrTran( cBcoDados, '.DBF')
cAlias	 := IIF( cAlias = NIL, cBcoDados, cAlias )
lForever  := ( nSegundos = 0 )
lAberto	 := (cBcoDados)->(Used())
WHILE Restart
	WHILE ( lForever .OR. nSegundos > 0 )
		IF lModo
			Use (cBcoDados) SHARED NEW Alias ( cAlias ) VIA RDDNAME
		Else
			Use (cBcoDados) EXCLUSIVE NEW Alias ( cAlias ) VIA RDDNAME
		EndIF
		IF !NetErr()
			ResTela( cScreen )
			Return( OK )
		EndIF
		cTela := Mensagem("Tentando acesso a " + Upper(Trim(cBcoDados)) + ".DBF...")
		Inkey(.5)
		nSegundos -= .5
		ResTela( cTela )
	EndDo
	nOpcao := Conf("Acesso Negado a " + Upper(Trim( cBcoDados )) + " Novamente ? ")
	IF nOpcao = OK
		ResTart := OK
	Else
		ResTart := FALSO
		DbCloseAll()
		FChDir( oAmbiente:xBase )
		SetColor("")
		Cls
		cStr1 := "#1 Se outra esta??o estiver usando o sistema, finalize-a. ;;"
		cStr2 := "#2 Se outra esta??o estiver indexando, aguarde o t?rmino. ;;"
		cStr3 := "#3 Se SHARE estiver instalado, aumente os par?metros de   ;"
		cStr4 := "   travamento de arquivos. Ex.: SHARE /F:18810 /L:510.    ;;"
		cStr5 := "#4 Em ambiente de rede NOVELL, verifique o arquivo NET.CFG;"
		cStr6 := "   e se necess rio, acrescente a linha FILE HANDLES=127.  ;"
		Alert( cStr1 + cStr2 + cStr3 + cStr4 + cStr5 + cStr6, "W+/B")
		Break
		//Quit
	EndIF
EndDo
Return( FALSO )

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


function print1( nrow, ncol, xstring)
************************************
	DispBegin()
   SetPos(nrow, ncol)
   DispOut( xstring )
   DispEnd()         
	return nil

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
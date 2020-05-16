#include "fenix.ch"

function CorNormal()
********************
	SetColor("w+/b")
	return nil

function ResTela( cScreen )
***************************
	RestScreen(,,,,  cScreen )
	return NIL

function bcor()
***************
   set color to w/b+

function icor()
	set color to r+/R

function tcor()
***************
	set color to w+/b


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
TONE(200,5)
ALERT(" ATEN€ÇO !!!;;SENHA INCORRETA ! ", , "W+/B")
set bell off

function snh_adm()
******************
   STT := ' '
   Do whil STT = ' '
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
      Area(aDbfs[3])
      loca for senha = SNA
      if eof()
         Unlock
         USe
         say := 'X'
         mdsha()
         STT := ' '
         loop
      endi
      Unlock
      Use
      retu
   Endd


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
   @ 00,00 clea to 23,79
   Pest='  '
   @ 00,01 say '- Listagem de Clientes' 
   @ 01,01 say 'Estado:' get Pest pict '!!'
   read
   if Pest = '  '
      retu
   endi
ty := 0
do whil ty = 0
   OI := 0
   l := 2
   dct := -1
   Area(aDbfs[5])
   index on dscnto to I5
   set index to I5
   do whil .not. eof()
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
   Area(aDbfs[5])
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
   Area(aDbfs[5])
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
   Area(aDbfs[5])
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
set bell on
TONE(900,2)
tone(900)
ALERT(" DADOS REGISTRADOS COM;; SUCESSO !!! ", , "W+/B")
set bell off

function mdcli()
****************
set bell on
TONE(200,5)
ALERT(" ATEN€ÇO !!!;;CLIENTE NÇO LOCALIZADO ", , "W+/B")
set bell off

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
Area(aDbfs[23])
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
   LOCAL nPrn := 1
   LOCAL cBMPFile := "C:\hb32\clamar\imagem.bmp"
   LOCAL GetList := {}
   LOCAL aPrn := win_printerList()

   IF Empty( aPrn )
      Alert( "Nao foi localizado nenhuma impressora instalada!!!" )
   ELSE
      DO WHILE nPrn != 0
         vcTela = savescreen(07, 12, 23, 69)
         @ 08,13 to 22,68
         setcolor("n/w,w+/g")
         @ 09, 14 clear to 21,67
         @ 09, 14 say " Sele‡Æo de impressora                                " color "w+/r"
         @ 21, 14 say " " +chr(24)+chr(25)+": Movimenta | Enter: Seleciona |  ESC: Cancelar    " color "w+/Gr"
         nPrn := AChoice(10,15,20,66,aPrn, .T.,, "myFuncao" )
         IF nPrn != 0
            PrnTest( aPrn[ nPrn ], cBMPFile, iif( HB_ISSTRING( cPar1 ) .AND. Lower( cPar1 ) == "ask", .T., NIL ) )
         ENDIF
         restscreen(07, 12, 23, 69,vcTela)
         exit
      ENDDO
   ENDIF
   RETURN NIL

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

         Area(aDbfs[5])
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








*         Area(aDbfs[15])
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
save scre to tela
NMC := spac(15)
do whil NMC = spac(15)
   @ 00,50 clea to 17,79
   @ 00,50 to 17,79
   @ 02,51 say 'Digite o Nome Representante:'
   @ 04,51 get NMC pict '!!!!!!!!!!!!!!!'
   read
   if NMC = '     '
      rest scre from tela
      retu
   endi
   Area(aDbfs[49])
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
         Area(aDbfs[49])
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
               do whil DDA := ' '
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
                  Area(aDbfs[23])
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
								Area(aDbfs[31])                        
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
                        Area(aDbfs[23])
                        loca for codusu = CODUS
                        if eof()
                           Unlock
                           Use
                           Area(aDbfs[23])
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
save scre to login
R := ' '
do whil .t.
   cls
*   LOG := spac(15)
   LOG := "GABRIEL"
   @ 09,21 to 14,50
   @ 10,23 say 'Usu rio:' get LOG pict '!!!!!!!!!!!!!!!'
   read
   if LOG = '      '
     quit
   endi
*   SNA := SPAC(6)
   SNA := "168935"
   @ 12,23 say 'Senha..:'
   set color to w+/n,X
   @ 12,32 get SNA
   read
   Area(aDbfs[23])
   loca for fantazia = LOG .and. senha = SNA
   if eof()
      Unlock
      Use
      @ 20,22 say '* Usu rio NÆo Cadastrado !!!' get R
      read
      Area(aDbfs[3])
      go top
      do whil .not. eof()
         if cadbloq = 'B'   
            Unlock
            Use
            R := 'X'
            exit
         else
            @ 20,22 say '* Cadastrar Usu rio? <S/N>' get R pict '!'
            read
            if R # 'S'
               Unlock
               Use
               quit
            endi
            stor SNA to SHA
            stor LOG to LOGFan
            Unlock
            Use
            caduser()
         endi
      endd
      if R = 'X'
         R = ' '
         loop
      endi
   endi
   stor SNA to SHA
   stor codusu to LOGFan
   stor fantazia to NMuser
   Unlock
   Use
   Area(aDbfs[9])
   stor desc to descto
   Unlock
   Area(aDbfs[11])
   go top
   do whil .not. eof()
      desc_t=0
      des_prc=0
      vpreco=0
      stor 100-descto to desc_t
      stor desc_t/100 to des_prc
      stor precopl/des_prc to vpreco
      repl preco with Vpreco
      skip
   endd
   Unlock
   Use
   retu

endd

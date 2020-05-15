#require "hbwin"
#define FORM_A4 9
#define RGB( nR,nG,nB ) ( nR + ( nG * 256 ) + ( nB * 256 * 256 ) ) 
#define PS_SOLID   0 
#define BLACK           RGB( 0x0 ,0x0 ,0x0 ) 
#define BLUE            RGB( 0x0 ,0x0 ,0x85 ) 
#define GREEN           RGB( 0x0 ,0x85,0x0 ) 
#define CYAN            RGB( 0x0 ,0x85,0x85 ) 
#define RED             RGB( 0x85,0x0 ,0x0 ) 
#define MAGENTA         RGB( 0x85,0x0 ,0x85 ) 
#define BROWN           RGB( 0x85,0x85,0x0 ) 
#define WHITE           RGB( 0xC6,0xC6,0xC6 ) 

PROCEDURE  imp_cadc( Cpar1 )


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

         ARQ5()
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








*         ARQ15()
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

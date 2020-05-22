#include "fenix.ch"

function caduser()
******************
	LOCAL GetList   := {}
	LOCAL Arq_Ant   := Alias()
	LOCAL Ind_Ant   := IndexOrd()
   LOCAL cScreen   := SaveScreen()
   LOCAL cCep      
   LOCAL cLogin    
   LOCAL cPassword 
   LOCAL BLQ 
	LOCAL cNome
	LOCAL cEnde
	LOCAL cBair
	LOCAL cCida
	LOCAL cEsta
	
   oMenu:Limpa()
   Area("cadfun")
   Area("usuario")
   while true
	   cLogin      := space(15)
      cPassword   := space(6)
      cCep        := Space(9)       
		cNome		   := Cadfun->(Space(FieldLen(FieldPos("nfunc"))))
		cEnde		   := Cadfun->(Space(FieldLen(FieldPos("endrco"))))
		cBair		   := Cadfun->(Space(FieldLen(FieldPos("bairro"))))
		cCida		   := Cadfun->(Space(FieldLen(FieldPos("cdde"))))
		cEsta		   := Cadfun->(Space(FieldLen(FieldPos("uf"))))
		blq         := "B"
		
		MaBox(11, 10, 18, LastCol()-1, "CADASTRO DE USUARIO")
		@ 12, 11 say 'Usuario...........:' get cLogin    Pict "@!" Valid VerificarUsuario( cLogin ) .AND. !Empty( cLogin )
		@ 13, 11 say 'Senha.............:' get cPassword pict "@S"
		@ 14, 11 say 'Nome Completo.....:' get cNome     pict "@!"
		@ 15, 11 say 'CEP...............:' get cCep      pict "99999-999" valid CepErrado( @cCep, @cCida, @cEsta, @cBair )
		@ 15, 41 say 'Cidade.:'            get cCida     pict "@!"
		@ 15, 76 say 'UF.:'                get cEsta     pict "@!"
		@ 16, 11 say 'EndereÁo..........:' get cEnde     pict "@!"
		@ 17, 11 say 'Bairro............:' get cBair     pict "@!"
		read
		if lastKey() = ESC
			errorbeep()
			if conf("Pergunta: Deseja retornar?")
			   AreaAnt( Arq_Ant, Ind_Ant )		
		      restela(cScreen)
				return nil
			endif
			loop
		endif
		ErrorBeep()
		if conf("Pergunta: Deseja gravar?")
			if CadFun->(Incluiu())
			   if Usuario->(Incluiu())
				   cCodi := StrZero(Usuario->Id, 4)
					Usuario->CodUsu   := cCodi
					Usuario->Fantazia := cLogin
					Usuario->Senha  	:= MSEncrypt(cPassword)
					Usuario->DtCad  	:= Date()
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
					
					CadFun->CodUsu := cCodi
					CadFun->CodFun := cCodi
					CadFun->Dtaadm := Date()
					CadFun->Dtadm  := Date()
					CadFun->Dtanac := Date()
					CadFun->Endrco := cEnde
					CadFun->Bairro := cBair
					CadFun->Cdde   := cCida
					CadFun->Uf     := cEsta
				endif
				CadFun->(Libera())
				Usuario->(Libera())
			endif			
      endif
	EndDo	

*--------------------------------------------------------------------------*	
def VerificarUsuario( cNome )
	LOCAL Arq_Ant := Alias()
	LOCAL Ind_Ant := IndexOrd()

	Area("Usuario")
	Usuario->(Order( USUARIO_NOME ))
	IF Usuario->(DbSeek( cNome ))
		ErrorBeep()
		Alerta("Erro: Usuario Ja Registrado.")
		Return( FALSO )
	EndIF
	Return( OK )
endef
*--------------------------------------------------------------------------*	


Proc CepInclusao( lAlteracao )
******************************
LOCAL GetList		:= {}
LOCAL cScreen		:= SaveScreen()
LOCAL lModificar	:= FALSO
LOCAL nOpcao		:= 0
LOCAL cCep
LOCAL cCida
LOCAL cBair
LOCAL cEsta
LOCAL cString
LOCAL cSwap
LOCAL lSair

if lAlteracao != NIL .AND. lAlteracao
	lModificar := OK
endif

if !lModificar
	if !PodeIncluir()
		ResTela( cSCreen )
		Return
	endif
endif

Area("Cep")
Cep->(Order( CEP_CEP ))
WHILE OK
	oMenu:Limpa()
	if lModificar
		cCep		 := Cep->Cep
		cCida 	 := Cep->Cida
		cBair 	 := Cep->Bair
		cEsta 	 := Cep->Esta
		cString	 := "ALTERACAO DE CEP"
	Else
		cCep		 := Space(09)
		cCida 	 := Space(25)
		cBair 	 := Space(25 )
		cEsta 	 := Space(02)
		cString := "INCLUSAO DE NOVO CEP"
	endif
	cSwap := cCep
	lSair := FALSO
	WHILE OK
		MaBox( 06, 02, 11, 78, cString )
		@ 07		 , 03 Say  "Novo Cep....:" Get cCep      Pict "99999-999" Valid CepCerto( @cCep, lModificar, cSwap )
		@ Row()+1 , 03 Say  "Cidade......:" Get cCida     Pict "@!"
		@ Row()+1 , 03 Say  "Bairro......:" Get cBair     Pict "@!"
		@ Row()+1 , 03 Say  "Estado......:" Get cEsta     Pict "@!"
		Read
		if LastKey() = ESC
			lSair := OK
			Exit
		endif
		if lModificar
			nOpcao := Alerta("Pergunta: Voce Deseja ? ", {" Alterar", " Cancelar ", "Sair "})
		Else
			nOpcao := Alerta("Pergunta: Voce Deseja ? ", {" Incluir", " Alterar ", "Sair "})
		endif
		if nOpcao = 1
			if lModificar
				if Cep->(TravaReg())
					Cep->Cep 	  := cCep
					Cep->Cida	  := cCida
					Cep->Bair	  := cBair
					Cep->Esta	  := cEsta
					Cep->(Libera())
					lSair := OK
					Exit
				endif
			Else
				if Cep->(Incluiu())
					Cep->Cep 	  := cCep
					Cep->Cida	  := cCida
					Cep->Bair	  := cBair
					Cep->Esta	  := cEsta
					Cep->(Libera())
					Exit
				endif
			endif

		Elseif nOpcao = 2 // Alterar
			Loop

		Elseif nOpcao = 3 // Sair
			lSair := OK
			Exit

		endif
	EndDo
	if lSair
		ResTela( cScreen )
		Exit

	endif
EndDo

Function CepCerto( cCep, lModificar, cSwap )
********************************************
FIELD Cep, Cida, Bair

if LastKey() = UP
	Return( OK )
endif

if lModificar != NIL .AND. lModificar
	if cCep == cSwap
		Return( OK )
	endif
endif

if Empty( cCep )
	ErrorBeep()
	Alerta("Erro: Entrada de Cep Invalido.")
	Return( FALSO )
endif
Cep->(Order( CEP_CEP ))
if Cep->(DbSeek( cCep ))
	ErrorBeep()
	Alerta("Erro: Cep Ja Registrado. " + Cep->( AllTrim( Cida)))
	Return( FALSO )
endif
Return( OK )

Function CepErrado( cCep, cCida, cEsta, cBair )
***********************************************
LOCAL aRotina			  := {{|| CepInclusao()}}
LOCAL aRotinaAlteracao := {{|| CepInclusao( OK )}}
LOCAL Ind_Ant			  := IndexOrd()
LOCAL Arq_Ant			  := Alias()

Area("Cep")
Cep->(Order( CEP_CEP ))
if (Lastrec() = 0 )
	ErrorBeep()
	if Conf(" Pergunta: Nenhum Cep Disponivel. Registrar ?")
		CepInclusao()
	endif
	AreaAnt( Arq_Ant, Ind_Ant )
	Return( FALSO )
endif
if Cep->(!DbSeek( cCep ))
	Cep->(Order( CEP_CIDA ))
	Cep->(Escolhe( 03, 01, 22, "Cep + '¶' + Cida + '!' + Esta + '!' + Bair ", "CEP        CIDADE                      UF BAIRRO", aRotina,, aRotinaAlteracao ))
endif
cCep	:= Cep->Cep
cCida := Cep->Cida
cEsta := Cep->Esta
if Empty( cBair )
	cBair := Cep->Bair
endif
AreaAnt( Arq_Ant, Ind_Ant )
Return( OK )

Proc CepPrint()
***************
LOCAL cScreen	  := SaveScreen()
LOCAL aMenuArray := { " Video ", " Impressora " }
LOCAL nChoice := 0

M_Title("CONSULTA/IMPRESSAO DE CEP")
nChoice := FazMenu( 10,10, aMenuArray, Cor())
Do Case
	Case nChoice = 0
		ResTela( cScreen )
		Return

	Case nChoice = 1
		CepVideo()

	Case nChoice = 2
		CepImpressora()

EndCase

Proc CepVideo()
***************
LOCAL cScreen := SaveScreen()
LOCAL aCep	  := {}
LOCAL cTela

Area("Cep")
Cep->(Order( CEP_CEP ))
Cep->(DbGoTop())
cTela := Mensagem("Aguarde ... ", Cor())

WHILE !Eof() .AND. Rep_Ok()
	 Aadd( aCep,  Cep->Cep + " " + Cep->Cida + " " + Cep->Esta + " " + Cep->Bair )
	 Cep->(DbSkip(1))
EndDo

if Len( aCep ) != ZERO
	ResTela( cTela )
	cString := " CEP       CIDADE                    UF BAIRRO"
	Print( 00, 00, cString + Space( 80 - Len(  cString )), Roloc(Cor()))
	M_Title( "ESC Retorna ")
	FazMenu( 01, 00, aCep, Cor())
endif

ResTela( cScreen )
Return

Proc CepImpressora()
********************
LOCAL cScreen := SaveScreen()
LOCAL Tam	  := 80
LOCAL Col	  := 58
LOCAL Pagina  := 0
LOCAL lSair   := FALSO

if !InsTru80() .OR. !LptOk()
	ResTela( cScreen )
	Return
endif

Area("Cep")
Cep->(Order( CEP_CEP ))
Cep->(DbGoTop())
Mensagem("Aguarde. Imprimindo.", Cor())
PrintOn()
SetPrc( 0, 0 )
WHILE Cep->(!Eof()) .AND. Rel_Ok()

  if Col >= 58
	  Write( 00, 00, Linha1( Tam, @Pagina))
	  Write( 01, 00, Linha2())
	  Write( 02, 00, Linha3(Tam))
	  Write( 03, 00, Linha4(Tam, SISTEM_NA2 ))
	  Write( 04, 00, Padc( "LISTAGEM DE CEPS",Tam ) )
	  Write( 05, 00, Linha5(Tam))
	  Write( 06, 00, "CEP       CIDADE                    UF BAIRRO")
	  Write( 07, 00, Linha5(Tam))
	  Col := 8
  endif

  Qout( Cep, Cida, Esta, Bair )
  Col := Col + 1
  
  if Col >= 58
	  Write( Col, 0,	Repl( SEP, Tam ))
	  __Eject()
  endif

  Cep->(DbSkip(1))
EndDo
__Eject()
PrintOff()
ResTela( cScreen )
Return

function cadastro()
*******************
	LOCAL nChoice := 0	
   LOCAL cScreen := SaveScreen()
	LOCAL aMenu   := {" Cadastrar ", " Pesquisar ", " Listar "}
	
   Area("desc")
   descto := Desc->desc
	Area("cadcli")
   Qcl := Cadcli->(Lastrec())
	
   while true
		oMenu:Limpa()
   	nChoice := FazMenu( 10, 10, aMenu )
		Do Case
		Case nChoice = 0
   		Restela( cScreen )
			return nil
		Case nChoice = 1
      	ClientesInclusao()
		Case nChoice = 2
      	ClientesPesquisa()
		Case nChoice = 3
   		LstCli()
	   Endcase
	enddo

Function ClientesPesquisa()
***************************
      oMenu:Limpa()
      TT := 0
      cdtr := 'X'
      psqcli()
      PEC := '    '
      do whil PEC = '    '
         say := 'X'
         digt := '4'
         @ 08,03 clea to 22,49
         @ 08,04 say '* Para Editar Cadastro Digite o CODIGO:' get PEC
         @ 09,04 say '  <ENTER> para Sair'
         read
         if PEC = '    '
            restscreen(00,00,23,79,TELA)
            return
         endi
         Z1 := ' '
         stor val(PEC) to reg
         nrpd()
         stor codnum to PEC
         Area(oMenu:aDbfs[5])
         stor SIT to SLT
         loca for codc = PEC
         if eof()
            //unlock
            ////use
            mdcli()
            Z1 := 'N'
            PEC := '    '
            loop
         endi
         store recno()  to regcad
         store cnae     to Ccnae
         store data     to cdata
         store sit      to Csit
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
         store recno() to reg5

         if Z1 = 'N'
            loop
         endi
         @ 00,00 clea to 23,79
         bcor()
         @ 00,00 clea to 00,79
         @ 00,30 say TEF
         tcor()
         @ 03,02 say 'Status:'
         @ 03,40 say 'Data Cadastro:'
         @ 04,42 say 'C¢digo do Cliente:'
         @ 04,02 say 'Fantasia:'
         @ 05,02 say 'E-mail para XML:'
         @ 06,02 say 'Razao Social:'
         if Csit = 'E'
            @ 07,02 say 'C.N.P.J.:'
            @ 07,42 say 'Inscr.Est.:'
         else
            @ 07,02 say 'CPF:'
            @ 07,42 say 'RG:'
         endi
         @ 08,02 say 'Contato:'
         @ 08,35 say 'Fone:'
         @ 08,56 say 'ou:'
         @ 09,02 say 'E-mail:'
         @ 10,02 say 'Prazo:'
         @ 10,12 say '/'
         @ 10,17 say 'Dias.'
         @ 10,60 say 'Cnae:'
         @ 11,02 say 'Obs.:'
         @ 11,54 say 'Pedido M°nimo:'
         @ 12,02 say 'Tipo de Cobranáa:'
         if Ctpdesc = 'C'
            @ 12,42 say 'Porcentagem de Desconto:'
            @ 12,73 say '%'
         endi
         @ 13,02 say 'Regime de Apuraá∆o:'
         @ 14,02 say 'Tipo Contrbte:'
         @ 13,50 say 'Pagamento:'
         @ 14,39 say 'Representante:'
         @ 14,53 say '-'
         set color to b+/w
         @ 03,25 say Csit
         @ 03,56 say Cdata
         @ 04,61 say Ccodc
         @ 05,20 say Cexml
         if Cativo = 'A'
            @ 03,10 say 'Ativo'
         endi
         If Cativo # 'A'
            @ 03,10 say 'Inativo'
         Endi
         @ 04,12 say ccliente
         @ 06,16 say crazao
         if Csit = 'EMPRESA'
            @ 07,12 say ccnpj
            @ 07,54 say cinscr
         else
            @ 07,07 say CCPF
            @ 07,46 say Cinscrp
         endi
         @ 08,11 say Ccontato
         @ 08,41 say Cfone1
         @ 08,60 say Cfone2
         @ 09,10 say Cmail
         @ 10,09 say Cprazo
         @ 10,13 say Cprazo2
         @ 10,66 say Ccnae
         @ 14,53 say Ccodrp
         @ 14,58 say Cnrepre
         @ 11,08 say Cobs
         @ 11,68 say Cvmin
         if Ctpdesc = 'C'
            @ 12,21 say 'COMUM'
         endi
         if Ctpdesc = 'E'
            @ 12,21 say 'ESPECIAL'
         endi
         if Ctpdesc = 'C'
            @ 12,67 say Cdesc
         endi
         if Creg_apur = ' '
            @ 13,22 say 'NAO CADASTRADO !'
         elseif Creg_apur = '1'
            @ 13,22 say '1-SIMPLES NACIONAL'
         elseif Creg_apur = '2'
            @ 13,22 say '2-OUTROS REGIMES'
         elseif Creg_apur = '3'
            @ 13,22 say '3-ISENTO'
         endi
         if Ctpag = 1
            @ 13,61 say '1-BOLETO'
         elseif Ctpag = 2
            @ 13,61 say '2-DINHEIRO'
         elseif Ctpag = 3
            @ 13,61 say '3-CHEQUE'
         elseif Ctpag = 4
            @ 13,61 say '4-DEP‡SITO'
         elseif Ctpag = 5
            @ 13,61 say '5-NENHUM'
         endi
         if Cindie = '1'
            @ 14,17 say '1-Contribuinte ICMS'
         elseif Cindie = '2'
            @ 14,17 say '2-Contribuinte ISENTO'
         elseif Cindie = '9'
            @ 14,17 say '9-N«O Contribuinte'
         endi
         tcor()
         @ 15,00 to 15,79
         @ 17,02 say 'Lagradouro:'
         @ 17,55 say 'N£mero:'
         @ 18,02 say 'Complemento:'
         @ 18,37 say 'Bairro:'
         @ 18,62 say 'CEP:'
         @ 19,02 say 'Pa°s:'
         @ 19,18 say 'Estado:'
         @ 19,39 say 'Cidade:'
         @ 20,02 say 'Linha:'
         @ 20,27 say 'Despacho:'
         @ 21,00 to 21,79
         @ 22,02 say 'Observacao do Pedido:'
         set color to b+/w
         @ 17,14 say Cender
         @ 17,63 say Cnroend
         @ 18,15 say Ccompl
         @ 18,45 say Cbairro
         @ 18,67 say CCEP
         @ 19,08 say Cpais
         @ 19,26 say Cest
         @ 19,47 say Ccida
         @ 20,09 say Clinha
         @ 20,37 say Cdespacho
         @ 22,25 say Cobssep
         tcor()
         if Crestric = 'X'
            save scre to R_cli
            @ 15,02 clea to 23,77
            @ 15,02 to 22,77
            set color to r+/w
            @ 16,20 say 'ATENCAO !!!'
            tcor()
            @ 18,05 say ' CLIENTE COM RESTRICAO DE PAGAMENTO !!!'
            @ 20,06 say '  Somente o Administrador pode liberar com senha.'
            sl :=0
            @ 21,06 prompt 'VOLTAR'
            @ 21,13 say '|'
            @ 21,15 prompt 'DESBLOQUEAR'
            @ 21,27 say '|'
            @ 21,29 prompt 'ALTERAR CADASTRO'
            menu to sl
            if sl = 1 .or. sl = 0
               rest scre from R_cli
               retu
            elseif sl = 2
               @ 18,05 clea to 20,76
               @ 18,05 say ' Se voce desbloquear, sera possivel a venda'
               @ 19,05 say '  para esse cliente INADIMPLENTE!'
               snh_adm()
               if say = 'X'
                  rest scre from R_cli
                  retu
               else
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl restric with ' '
                  //// unlock
                  ////use
                  rest scre from R_cli
                  mdsuces()
               endi
            elseif sl = 3
               snh_adm()
               if say = 'X'
                  rest scre from R_cli
                  retu
               endi
               rest scre from R_cli
            endi
         endi
         MN := 0
         do Whil MN = 0
            set color to w/b*+/z+
            @ 01,00 clea to 01,79
            @ 01,00 prompt '     Cliente      '
            @ 01,20 prompt '     Endereáo     '
            @ 01,37 prompt '  Outras Informacoes  '
            @ 01,61 prompt '  Imprimir Cadastro   '
            menu to MN
            tcor()
            if MN = 0
               rele all like c*
               restscreen(00,00,23,79,TELA)
               retu
            endi
            if MN = 1
               MN_cl := 0
               do whil MN_cl = 0
                  @ 03,02 prompt 'Status:'
                  @ 03,40 say 'Data Cadastro:'
                  @ 04,42 say 'C¢digo do Cliente:'
                  @ 04,02 prompt 'Fantasia:'
                  @ 05,02 prompt 'E-mail para XML:'
                  @ 06,02 prompt 'Razao Social:'
                  if Csit = 'EMPRESA'
                     @ 07,02 prompt 'C.N.P.J.:'
                     @ 07,42 prompt 'Inscr.Est.:'
                  else
                     @ 07,02 prompt 'CPF:'
                     @ 07,42 prompt 'RG:'
                  endi
                  @ 08,02 prompt 'Contato:'
                  @ 08,35 prompt 'Fone:'
                  @ 08,56 prompt 'ou:'
                  @ 09,02 prompt 'E-mail:'
                  @ 10,02 prompt 'Prazo:'
                  @ 10,17 say 'Dias.'
                  @ 10,60 prompt 'Cnae:'
                  @ 11,02 prompt 'Obs.:'
                  @ 11,54 prompt 'Pedido M°nimo:'
                  @ 12,02 prompt 'Tipo de Cobranáa:'
                  @ 13,02 prompt 'Regime de Apuraá∆o:'
                  @ 13,50 prompt 'Pagamento:'
                  @ 14,02 prompt 'Tipo Contrbte:'
                  @ 14,39 prompt 'Representante:'
                  @ 15,72 prompt 'VOLTAR'
                  menu to mn_cl
                  if MN_CL = 1
                     TY := 0
                     @ 03,10 prompt 'ATIVO'
                     @ 03,20 prompt 'INATIVO'
                     menu to TY
                     @ 03,10 clea to 03,30
                     snh_adm()
                     if say = 'X'
                        MN_cl := 0
                        loop
                     endi
                     if TY = 1
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl Ativo with 'A'
                        //// unlock
                        ////use
                        set color to b+/w
                        @ 02,10 say 'ATIVO'
                        tcor()
                        MN_cl := 0
                        loop
                     endi
                     if TY = 2
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl Ativo with ' '
                        //// unlock
                        ////use
                        set color to b+/w
                        @ 03,10 say 'INATIVO'
                        tcor()
                        MN_cl := 0
                        loop
                     endi
                  endi
                  if MN_CL = 2
                     @ 04,12 get ccliente pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl cliente with Ccliente
                     //// unlock
                     ////use
                     set color to b+/w
                     @ 04,12 say ccliente
                     tcor()
                     MN_cl := 0
                     loop
                  endi
                  if MN_CL = 3
                     @ 05,20 get Cexml
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl exml with Cexml
                     //// unlock
                     ////use
                     set color to b+/w
                     @ 05,20 say Cexml
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 4
                     @ 06,16 get Crazao pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl razao with Crazao
                     //// unlock
                     ////use
                     set color to b+/w
                     @ 06,16 say Crazao
                     tcor()
                     MN_CL := 0
                     loop
                  endi
                  if MN_CL = 5
                     if Csit = 'EMPRESA'
                        @ 07,12 get ccnpj pict '99.999.999/9999-99'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cnpj with Ccnpj
                        //// unlock
                        ////use
                        set color to b+/w
                        @ 07,12 say Ccnpj
                        tcor()
                     else
                        @ 07,07 get Ccpf pict '999.999.999-99'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cpf with Ccpf
                        // unlock
                        // //use
                        set color to b+/w
                        @ 07,07 say Ccpf
                        tcor()
                     endi
                     MN_CL := 0
                     loop
                  endi
                  if MN_CL = 6
                     if Csit = 'EMPRESA'
                        @ 07,54 get cinscr pict '9999999999999999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl inscr with Cinscr
                        // unlock
                        ////use
                        set color to b+/w
                        @ 07,54 say Cinscr
                        tcor()
                     else
                        @ 07,46 get Cinscrp pict '9999999999999999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl inscrp with Cinscrp
                        // unlock
                        ////use
                        set color to b+/w
                        @ 07,46 say Cinscrp
                        tcor()
                     endi
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 7
                     @ 08,11 get Ccontato pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl contato with Ccontato
                     // unlock
                     ////use
                     set color to b+/w
                     @ 08,11 say Ccontato
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 8
                     @ 08,41 get Cfone1 pict '(99)9999-99999'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl fone1 with Cfone1
                     // unlock
                     ////use
                     set color to b+/w
                     @ 08,41 say Cfone1
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 9
                     @ 08,60 get Cfone2 pict '(99)9999-99999'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl fone2 with Cfone2
                     // unlock
                     ////use
                     set color to b+/w
                     @ 08,60 say Cfone2
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 10
                     @ 09,10 get Cmail
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl email with Cmail
                     // unlock
                     ////use
                     set color to b+/w
                     @ 09,10 say Cmail
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 11
                     do whil MN_CL = 11
                        @ 10,09 get Cprazo pict '999'
                        @ 10,13 get Cprazo2 pict '999'
                        read
                        if Cprazo2 # 0 .and. Cprazo2 <= Cprazo
                           save scre to tl
                           @ 10,09 say '   Prazo Incorreto !  ' get z
                           read
                           rest scre from Tl
                           loop
                        endi
                        exit
                     endd
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl prazo with Cprazo, prazo2 with Cprazo2
                     // unlock
                     ////use
                     set color to b+/w
                     @ 10,09 say Cprazo
                     @ 10,13 say Cprazo2
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if mn_cl = 12
                     @ 10,66 get Ccnae pict '9999-9/99'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl cnae with Ccnae
                     // unlock
                     ////use
                     set color to b+/w
                     @ 10,66 say Ccnae
                     tcor()
                     MN_CL := 0
                     loop
                  endi
                  if MN_CL = 13
                     @ 11,08 get Cobs pict '@!'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl obs with Cobs
                     // unlock
                     ////use
                     set color to b+/w
                     @ 11,08 say Cobs
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 14
                     @ 11,69 get Cvmin pict '9,999.99'
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl Vmin with Cvmin
                     // unlock
                     ////use
                     set color to b+/w
                     @ 11,69 say Cvmin
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  if MN_CL = 15
                     DSC = 0
                     set color to w/b+
                     @ 12,20 clea to 13,29
                     @ 12,21 prompt 'COMUM'
                     @ 13,21 prompt 'ESPECIAL'
                     menu to DSC
                     tcor()
                     @ 12,20 clea to 13,29
                     if DSC = 1
                        Ctpdesc := 'C'
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl tpdesc with Ctpdesc
                        // unlock
                        ////use
                        set color to b+/w
                        @ 12,21 say 'COMUM'
                        tcor()
                        Ctpdesc := 'C'
                        TPCb := 'COMUM'
                        PD_s := ' '
                        Do whil PD_s = ' '
                           @ 12,42 say 'Porcentagem de Desconto:'
                           @ 12,78 say '%'
                           @ 12,67 get Cdesc pict '999.999999'
                           read
                           if Cdesc > descto
                              save scre to msg
                              @ 12,20 clea to 13,55
                              set color to w/r
                              n := ' '
                              @ 12,02 say 'ESSE DESCONTO EXEDE O LIMITE !!!' get n pict '!'
                              read
                              tcor()
                              rest scre from msg
                              if n # 'P'
                                 PD_s := ' '
                                 loop
                              endi
                           endi
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl dscnto with Cdesc
                           // unlock
                           ////use
                           tcor()
                           @ 12,67 say Cdesc
                           exit
                        endd
                        MN_CL := 0
                        loop
                     endi
                     if DSC = 2
                        @ 12,42 clea to 12,77
                        Ctpdesc := 'E'
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl tpdesc with Ctpdesc
                        // unlock
                        ////use
                        set color to b+/w
                        @ 12,21 say 'ESPECIAL'
                        tcor()
                        MN_CL := 0
                        loop
                     endi
                  Endi
                  if MN_CL = 16
                     if Csit = 'PESSOA FISICA'
                        TONE(200,5)
                        ALERT(" ATENÄ«O !!!;Cliente com CPF Ç; ISENTO!", , "W+/B")
                        MN_CL := 0
                        loop
                     endi
                     OP_REGAP := 0
                     Do Whil OP_REGAP = 0
                        save scre to regap
                        set color to w/b+
                        @ 13,02 clea to 16,22
                        @ 13,02 prompt '1-SIMPLES NACIONAL'
                        @ 14,02 prompt '2-OUTROS REGIMES'
                        @ 15,02 prompt '3-ISENTO'
                        menu to op_regap
                        If OP_regap = 1
                           desc_REGA := 'SIMPLES NACIONAL'
                        elseif OP_regap = 2
                           desc_REGA := 'OUTROS REGIMES'
                        elseif OP_regap = 3
                           desc_REGA := 'ISENTO'
                        elseif OP_regap = 0
                           TONE(600)
                           If ALERT("Voce deve informar o Regime!;Se opetar em Sair,;O Cadastro nao sera alterado", {"CONTINUAR", "SAIR"} , "B/GR+,r") ==2
                              TONE(200,5)
                              ALERT("DADOS N«O FORAM ALTERADOS ;; VOLTANDO....! ", , "W+/B")
                              rest scre from regap
                              tcor()
                              exit
                           Else
                              OP_REGAP := 0
                              loop
                           endi
                        Endi
                        exit
                     endd
                  endi
                  if OP_regap = 0
                     rest scre from regap
                     MN_CL := 0
                     loop
                  endi
                  stor ltrim(str(op_regap)) to Creg_apur
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl reg_apur with Creg_apur
                  // unlock
                  ////use
                  rest scre from regap
                  set color to b+/w
                  @ 13,22 CLEA TO 13,39
                  @ 13,22 say Creg_apur
                  @ 13,23 say '-'
                  @ 13,24 say desc_rega
                  tcor()
                  MN_CL := 0
                  loop
               endd
               if MN_CL = 17
                  OP_Tpg := 0
                  save scre to tpg
                  set color to w/b+
                  @ 13,61 clea to 17,71
                  @ 13,61 prompt '1-BOLETO'
                  @ 14,61 prompt '2-DINHEIRO'
                  @ 15,61 prompt '3-CHEQUE'
                  @ 16,61 prompt '4-DEP‡SITO'
                  @ 17,61 prompt '5-NENHUM'
                  menu to op_tpg
                  If OP_tpg = 1
                     desc_TPG := 'BOLETO'
                  elseif OP_tpg = 2
                     desc_tpg := 'DINHEIRO'
                  elseif OP_tpg = 3
                     desc_tpg := 'CHEQUE'
                  elseif OP_tpg = 4
                     desc_tpg := 'DEP‡SITO'
                  elseif OP_tpg = 5
                     desc_tpg := 'NENHUM'
                  elseif OP_tpg = 0
                     rest scre from tpg
                     tcor()
                     MN_CL := 0
                     loop
                  Endi
                  stor op_tpg to Ctpag
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl Tpag with Ctpag
                  // unlock
                  ////use
                  rest scre from tpg
                  set color to b+/w
                  @ 13,61 CLEA TO 13,71
                  @ 13,61 say Ctpag pict '9'
                  @ 13,62 say '-'
                  @ 13,63 say desc_tpg
                  tcor()
                  MN_CL := 0
                  loop
               endi
               if MN_CL = 18
                  if Csit = 'PESSOA FISICA'
                     TONE(200,5)
                     ALERT(" ATENÄ«O !!!;Cliente com CPF Ç;N«O CONTRIBUINTE", , "W+/B")
                     MN_CL := 0
                     loop
                  endi
                  OP_ctb := 0
                  save scre to tpg
                  set color to w/b+
                  @ 14,17 clea to 17,37
                  @ 14,17 prompt '1-Contribuinte ICMS'
                  @ 15,17 prompt '2-Contribuinte ISENTO'
                  @ 16,17 prompt '9-N«O Contribuinte'
                  menu to op_ctb
                  tcor()
                  if OP_ctb = 0
                     rest scre from tpg
                     MN_CL := 0
                     loop
                  endi
                  If OP_ctb = 1
                     desc_ctb := '1-Contribuinte ICMS'
                  elseif OP_ctb = 2
                     desc_ctb := '2-Contribuinte ISENTO'
                  elseif OP_ctb = 3
                     desc_ctb := '9-N«O Contribuinte'
                  Endi
                  stor ltrim(str(op_ctb)) to op_ctb
                  Area(oMenu:aDbfs[5])
                  go reg5
                  repl indie with subs(desc_ctb,1,1)
                  // unlock
                  ////use
                  rest scre from tpg
                  set color to b+/w
                  @ 14,17 clea to 14,37
                  @ 14,17 say desc_ctb
                  tcor()
                  MN_CL := 0
                  loop
               endi
               if mn_cl = 19
                  mn_cl11 := 0
                  Do whil mn_cl11 = 0
                     save scre to tl
                     @ 10,44 clea to 10,77
                     cdr := '    '
                     @ 14,53 get cdr pict '!999'
                     read
                     if cdt = '    '
                        exit
                     endi
                     if cdr = '*   '
                        psqrepre()
                        mn_cl11 := 0
                        cdr := '    '
                     endi
                     Area(oMenu:aDbfs[49])
                     loca for codr = cdr
                     if eof()
                        // unlock
                        ////use
                        mddad()
                        mn_cl11 := 0
                        loop
                     endi
                     stor codr to cdr
                     stor nrep to nmrep
                     // unlock
                     ////use
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl codrp with cdr, nrepre with nmrep
                     // unlock
                     ////use
                     rest scre from tl
                     set color to b+/w
                     @ 14,53 say cdr
                     @ 14,58 say nmrep
                     tcor()
                     exit
                  endd
                  MN_CL := 0
                  loop
               endi
               if MN_CL = 20 .or. MN_CL = 0
                  @ 15,72 clea to 15,78
                  MN := 0
                  exit
               endi
            Endi
            if MN = 2
               Sl_Ed :=0
               set color to w/b*+/z+
               @ 16,00 clea to 16,79
               @ 16,02 prompt 'ENDERECO DO CADASTRO '
               @ 16,26 prompt 'ENDERECO PARA ENTREGA'
               menu to Sl_Ed
               tcor()
               if Sl_Ed=1
                  MN_Ed := 0
                  do whil MN_Ed = 0
                     @ 17,02 prompt 'Lagradouro:'
                     @ 17,55 prompt 'N£mero:'
                     @ 18,02 prompt 'Complemento:'
                     @ 18,37 prompt 'Bairro:'
                     @ 18,62 prompt 'CEP:'
                     @ 19,02 prompt 'Pa°s:'
                     @ 19,18 prompt 'Estado:'
                     @ 19,39 prompt 'Cidade:'
                     @ 20,02 prompt 'Linha:'
                     @ 20,27 prompt 'Despacho:'
                     @ 22,02 prompt 'Observacao do Pedido:'
                     @ 23,70 prompt 'VOLTAR'
                     menu to MN_ED
                     if MN_Ed = 1
                        @ 17,14 get Cender pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl ender with Cender
                        // unlock
                        ////use
                        set color to b+/w
                        @ 17,14 say Cender
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 2
                        @ 17,63 get Cnroend pict '!!!!!!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl nroend with Cnroend
                        // unlock
                        ////use
                        set color to b+/w
                        @ 17,63 say Cnroend
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 3
                        @ 18,15 get Ccompl pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl compl with Ccompl
                        // unlock
                        ////use
                        set color to b+/w
                        @ 18,15 say Ccompl
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 4
                        @ 18,45 get Cbairro pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl bairro with Cbairro
                        // unlock
                        ////use
                        set color to b+/w
                        @ 18,45 say Cbairro
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 5
                        @ 18,67 get Ccep pict '99.999-999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cep with Ccep
                        // unlock
                        ////use
                        set color to b+/w
                        @ 18,67 say Ccep
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 6
                        @ 19,08 say Cpais
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl paiis with Cpais
                        // unlock
                        ////use
                        set color to b+/w
                        @ 19,08 say Cpais
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 7
                        ET := '1'
                        RE := ' '
                        do whil RE = ' '
                           @ 19,26 get Cest pict '!!'
                           read
                           if Cest = '  '
                              mdest()
                              RE := ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for estd = Cest
                           if eof()
                              // unlock
                              ////use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor est to Cest
                              // unlock
                              //use
                              RE := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl est with Cest
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,26 say Cest
                           tcor()
                           exit
                        endd
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 8
                        ET := '2'
                        RC := ' '
                        do whil RC = ' '
                           @ 19,47 get Ccida pict '@!'
                           read
                           if Ccida = '    '
                              mdest()
                              RC := ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for cidade = Ccida .and. estd = Cest
                           if eof()
                              // unlock
                              //use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor cida to Ccida
                              // unlock
                              //use
                              RC := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl cida with Ccida
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,47 say Ccida
                           tcor()
                           exit
                        endd
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 9
                        @ 20,09 get Clinha pict '99'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl linha with Clinha
                        // unlock
                        //use
                        set color to b+/w
                        @ 20,09 say Clinha
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_Ed = 10
                        @ 20,37 get Cdespacho pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl despacho with Cdespacho
                        // unlock
                        //use
                        set color to b+/w
                        @ 20,37 say Cdespacho
                        tcor()
                        MN_Ed := 0
                        loop
                     endi
                     if MN_ED = 11
                        set confirm on
                        @ 22,25 get Cobssep pict '@!S59'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl obssep with Cobssep
                        // unlock
                        //use
                        set confirm off
                        set color to b+/w
                        @ 22,25 say Cobssep
                        tcor()
                        MN_ed := 0
                        loop
                     Endi
                     if MN_Ed = 12 .or. MN_Ed = 0
                        @ 16,00 clea to 16,79
                        @ 23,70 say '      '
                        MN := 0
                        exit
                     endi
                  Endd
               elseif Sl_Ed = 2
                  save scre to MN_end2
                  @ 17,00 clea to 23,79
                  @ 17,02 say 'Lagradouro:'
                  @ 17,55 say 'N£mero:'
                  @ 18,02 say 'Complemento:'
                  @ 18,37 say 'Bairro:'
                  @ 18,62 say 'CEP:'
                  @ 19,02 say 'Pa°s:'
                  @ 19,18 say 'Estado:'
                  @ 19,39 say 'Cidade:'
                  @ 21,02 say 'Recebimento:'
                  set color to b+/w
                  @ 17,14 say Cender2
                  @ 17,63 say Cnroend2
                  @ 18,15 say Ccompl2
                  @ 18,45 say Cbairro2
                  @ 18,67 say CCEP2
                  @ 19,08 say Cpais
                  @ 19,26 say Cest2
                  @ 19,47 say Ccida2
                  @ 21,15 say Chrrec
                  tcor()
                  MN_Ed2 := 0
                  do whil MN_Ed2 = 0
                     @ 17,02 prompt 'Lagradouro:'
                     @ 17,55 prompt 'N£mero:'
                     @ 18,02 prompt 'Complemento:'
                     @ 18,37 prompt 'Bairro:'
                     @ 18,62 prompt 'CEP:'
                     @ 19,02 prompt 'Pa°s:'
                     @ 19,18 prompt 'Estado:'
                     @ 19,39 prompt 'Cidade:'
                     @ 21,02 prompt 'Recebimento:'
                     @ 23,70 prompt 'VOLTAR'
                     menu to MN_ED2
                     if MN_Ed2 = 1
                        @ 17,14 get Cender2 pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl ender2 with Cender2
                        // unlock
                        //use
                        set color to b+/w
                        @ 17,14 say Cender2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 2
                        @ 17,63 get Cnroend2 pict '!!!!!!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl nroend2 with Cnroend2
                        // unlock
                        //use
                        set color to b+/w
                        @ 17,63 say Cnroend2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 3
                        @ 18,15 get Ccompl2 pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl compl2 with Ccompl2
                        // unlock
                        //use
                        set color to b+/w
                        @ 18,15 say Ccompl2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 4
                        @ 18,45 get Cbairro2 pict '@!'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl bairro2 with Cbairro2
                        // unlock
                        //use
                        set color to b+/w
                        @ 18,45 say Cbairro2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 5
                        @ 18,67 get Ccep2 pict '99.999-999'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl cep2 with Ccep2
                        // unlock
                        //use
                        set color to b+/w
                        @ 18,67 say Ccep2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 6
                        @ 19,08 say Cpais2
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl paiis2 with Cpais2
                        // unlock
                        //use
                        set color to b+/w
                        @ 19,08 say Cpais2
                        tcor()
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 7
                        ET2 := '1'
                        RE2 := ' '
                        Do whil RE2 = ' '
                           @ 19,26 get Cest2 pict '!!'
                           read
                           if Cest2 = '  '
                              mdest()
                              RE2 = ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for estd = Cest2
                           if eof()
                              // unlock
                              //use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor est2 to Cest2
                              // unlock
                              //use
                              RE2 := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl est2 with Cest2
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,26 say Cest2
                           tcor()
                           exit
                        endd
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_Ed2 = 8
                        ET2 := '2'
                        RC2 := ' '
                        do whil RC2 = ' '
                           @ 19,47 get Ccida2 pict '@!'
                           read
                           if Ccida2 = '    '
                              mdest()
                              RC2 := ' '
                              loop
                           endi
                           Area(oMenu:aDbfs[40])
                           loca for cidade = Ccida2 .and. estd = Cest2
                           if eof()
                              // unlock
                              //use
                              mdest()
                              Area(oMenu:aDbfs[5])
                              go reg5
                              stor cida2 to Ccida2
                              // unlock
                              //use
                              RC2 := ' '
                              loop
                           endi
                           // unlock
                           //use
                           Area(oMenu:aDbfs[5])
                           go reg5
                           repl cida2 with Ccida2
                           // unlock
                           //use
                           set color to b+/w
                           @ 19,47 say Ccida2
                           tcor()
                           exit
                        endd
                        MN_Ed2 := 0
                        loop
                     endi
                     if MN_ED2 = 9
                        set confirm on
                        @ 21,15 get Chrrec pict '@!S69'
                        read
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl hrrec with Chrrec
                        // unlock
                        //use
                        set confirm off
                        set color to b+/w
                        @ 21,15 say Chrrec
                        tcor()
                        MN_ed2 := 0
                        loop
                     Endi
                     if MN_Ed2 = 10 .or. MN_Ed2 = 0
                        @ 23,70 say '      '
                        rest scre from MN_end2
                        @ 16,00 clea to 16,79
                        MN := 0
                        exit
                     endi
                  Endd
               elseif Sl_Ed=0
                  @ 23,70 say '      '
                  @ 16,00 clea to 16,79
                  MN := 0
                  loop
               endi
            Endi
            if MN = 3
               save scre to inf
               MN_inf :=0
               Do whil MN_inf = 0
                  @ 02,00 clea to 23,79
                  @ 07,00 to 19,79 doub
                  bcor()
                  @ 08,21 say 'HABILITA ISENCAO DE S.T. COM BASE LEGAL'
                  tcor()
                  if Cisest = 'S'
                     set color to b+/w
                     @ 10,50 say 'SIM'
                     tcor()
                     @ 11,01 to 11,78
                     @ 12,21 say '- Justificativa para isencao de S.T.'
                     @ 13,21 say '  (essa informacao sai na N.F.)'
                     @ 15,01 say subs(CjustST,1,78)
                     @ 16,01 say subs(CjustST,79,157)
                     @ 17,01 say subs(CjustST,158,234)
                     clea gets
                  endi
                  If Cisest # 'S'
                     set color to b+/w
                     @ 10,50 say 'NAO'
                  Endi
                  tcor()
                  @ 20,16 say CNF
                  @ 20,25 say Cprnf
                  if Cpedcli # 'S'
                     Cpedcli := 'N'
                  endi
                  @ 21,55 say Cpedcli
                  tcor()
                  @ 10,25 prompt 'Cliente Isento de S.T.?:'
                  @ 20,12 prompt 'NF:'
                  @ 20,19 prompt 'PRNF:'
                  @ 20,36 to 21,36 doub
                  @ 22,00 to 22,79 doub
                  @ 20,38 prompt 'CLIENTE EXIGE NRO.PEDIDO COMPRA NA NOTA?'
                  @ 23,00 prompt '                                     VOLTAR                                     '
                  menu to MN_inf
                  if MN_inf = 1
                     save scre to mn_inf
                     TY := 0
                     set color to w/b
                     @ 08,50 clea to 12,65
                     bcor()
                     @ 08,51 say 'ISENCAO DE S.T.'
                     set color to w/b
                     @ 10,56 prompt 'SIM'
                     @ 11,56 prompt 'NAO'
                     menu to TY
                     rest scre from mn_inf
                     snh_adm()
                     if say = 'X'
                        MN_inf := 0
                        loop
                     endi
                     if TY = 1
                        Cisest :='S'
                        set color to b+/w
                        @ 10,50 say 'SIM'
                        tcor()
                        @ 11,01 to 11,78
                        @ 12,21 say '- Justificativa para isencao de S.T.'
                        @ 13,21 say '  (essa informacao sai na N.F.)'
                        A :=spac(78)
                        B :=spac(78)
                        C :=spac(78)
                        @ 15,01 get A pict '@!'
                        @ 16,01 get B pict '@!'
                        @ 17,01 get C pict '@!'
                        read
                        stor a+b+c to CjustST
                        if CjustST = '      '
                           TONE(200,5)
                           ALERT("Atencao !!!;Justificatica nao pode ficar em branco;Operacao nao completada!! ", , "W+/B")
                           Cisest :='N'
                           MN_inf := 0
                           loop
                        endi
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl isest with 'S',justst with Cjustst
                        // unlock
                        //use
                        mdsuces()
                        MN_inf := 0
                        loop
                     endi
                     if TY = 2
                        Cisest :='N'
                        Area(oMenu:aDbfs[5])
                        go reg5
                        repl isest with ' '
                        // unlock
                        //use
                        @ 10,21 clea to 15,59
                        set color to b+/w
                        @ 10,50 say 'NAO'
                        tcor()
                        MN_inf := 0
                        loop
                     endi
                  endi
                  if MN_inf = 2
                     @ 20,16 get Cnf pict '!' valid (Cnf $ 'SN')
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl nf with Cnf
                     // unlock
                     //use
                     set color to b+/w
                     @ 20,16 say Cnf
                     tcor()
                     MN_inf := 0
                     loop
                  endi
                  if MN_inf = 3
                     @ 20,25 get Cprnf pict '!' valid (Cprnf $ 'SN')
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl prnf with Cprnf
                     // unlock
                     //use
                     set color to b+/w
                     @ 20,25 say Cprnf
                     tcor()
                     MN_inf := 0
                     loop
                  endi
                  if MN_inf = 4
                     @ 21,55 get Cpedcli pict '!' valid (Cpedcli $ 'SN')
                     read
                     Area(oMenu:aDbfs[5])
                     go reg5
                     repl pedcli with Cpedcli
                     // unlock
                     //use
                     set color to b+/w
                     @ 21,55 say Cpedcli
                     tcor()
                     MN_inf := 0
                     loop
                  endi
                  if MN_inf = 5 .OR. MN_inf = 0
                     MN := 0
                     restscreen(00,00,23,79,TELA)
                     retu
                  endi
               Endd
            endi
            if MN = 4
               IMP_CADC()
               MN := 0
               loop
            endi
         Endd
      endd
      restscreen(00,00,23,79,TELA)
      retu


Function ClientesInclusao()
***************************
      oMenu:Limpa()
      FJ := ' '
      do whil FJ = ' '
         @ 10,04 say '* <P>essoa Fisica ou <E>mpresa:' get FJ pict '!' valid (FJ $ 'PE')
         read
         if FJ = ' '
            restscreen(00,00,23,79,TELA)
            retu
         endi
         if FJ = "P"
            stor 'PESSOA FISICA' to FJ
         else
            stor 'EMPRESA' to FJ
         endi
         @ 04,32 get FJ
         clea gets
      endd
      DT := date()
      @ 05,00 clea to 23,79
      rdata:=date
      rativo:=spac(1)
      Csit:=spac(13)
      Rcliente:=spac(22)
      Rrazao:=spac(40)
      Render:=spac(40)
      Rnroend:=spac(6)
      Rcompl:=spac(20)
      Rbairro:=spac(16)
      Rcida:=spac(30)
      Rest:=spac(2)
      Rcnpj:=spac(18)
      Rinscr:=spac(15)
      Rcpf:=spac(14)
      Rinscrp:=spac(16)
      Rfone1:=spac(14)
      Rfone2:=spac(14)
      Rprazo:=0
      Rprazo2:=0
      Robs:=spac(45)
      CCEP:=spac(10)
      Rcontato:=spac(20)
      Rvmin := 0
      Rcnae:=spac(9)
      If FJ = 'E'
         Rindie := ' '
      else
         Rindie := '9'
      endi
      Rmail:=spac(60)
      Rexml:=spac(43)
      Rtpdesc:=spac(1)
      Rdesc:=0
      Rtpag:=0
      Rlinha:=spac(2)
      Rhrrec:=spac(62)
      Rnf := 'S'
      Rprnf := 'S'
      Rreg_apur:=spac(1)
      Rpais := 'BRASIL'
      Rdespacho := SPAC(40)
      Robssep:=spac(62)
      @ 00,00 clea to 23,79
      bcor()
      @ 00,00 clea to 00,79
      @ 00,30 say TEF
      tcor()
      set confirm on
      @ 02,00 to 02,79
      @ 02,02 say 'Cliente'
      @ 04,02 say 'C¢digo do Cliente:'
      @ 04,28 get FJ
      @ 05,02 say 'Data Cadastro:' get date
      clea gets
      Do whil .t.
         @ 04,42 say 'Fantasia:' get Rcliente pict '@!'
         read
         @ 05,30 say 'XML:' get Rexml
         @ 06,02 say 'Razao Social:' get Rrazao pict '@!'
         if FJ = 'E'
            @ 07,02 say 'C.N.P.J.:' get Rcnpj pict '99.999.999/9999-99'
            @ 07,42 say 'Inscr.Est.:' get Rinscr pict '9999999999999999'
         else
            @ 07,02 say 'CPF:' get RCPF pict '999.999.999-99'
            @ 07,42 say 'RG:' get Rinscrp pict '9999999999999999'
         endi
         @ 08,02 say 'Contato:' get Rcontato pict '@!'
         @ 08,35 say 'Fone:' get Rfone1 pict '(99)9999-99999'
         @ 08,56 say 'ou:' get Rfone2 pict '(99)9999-99999'
         @ 09,02 say 'E-mail:' get Rmail
         @ 10,02 say 'Prazo:' get Rprazo pict '999'
         @ 10,12 say '/'
         @ 10,13 get Rprazo2 pict '999'
         @ 10,17 say 'Dias.'
         @ 10,50 say 'Cnae:' get Rcnae pict '9999-9/99'
         @ 11,02 say 'Obs.:' get Robs pict '@!'
         @ 11,54 say 'Pedido M°nimo:' get Rvmin pict '9,999.99'
         @ 12,02 say 'Tipo de Cobranáa:'
         @ 13,02 say 'Regime de Apuraá∆o:'
         @ 13,23 say '-'
         @ 13,50 say 'Pagamento:'
         @ 14,02 say 'Tipo Contrbte:'
         @ 14,39 say 'Representante:'
         @ 14,57 say '-'
         read
         if Rprazo2 # 0 .and. Rprazo2 <= Rprazo
            save scre to Tprz
            @ 09,13 clea to 11,40
            @ 09,13 to 11,40
            @ 10,16 say ' Prazo Incorreto !' get z
            read
            rest scre from Tprz
            Rprazo:=0
            Rprazo2:=0
            loop
         endi
         if Rrazao = '   '
            TONE(200,5)
            If ALERT("Raz∆o Social em Branco !!!;Preencha!;", {"CONTINUA", "SAIR"} , "W+/B") ==1
               LOOP
            else
               set confirm off
               restscreen(00,00,23,79,TELA)
               RETU
            endi
         elseif Rcliente = '   '
            TONE(200,5)
            If ALERT("Nome Fantasia em Branco !!!;Preencha!;", {"CONTINUA", "SAIR"} , "W+/B") ==1
               LOOP
            else
               set confirm off
               restscreen(00,00,23,79,TELA)
               RETU
            endi
         endi
         DSC := 0
         set color to w/b+
         @ 12,20 clea to 13,29
         @ 12,21 prompt 'COMUM'
         @ 13,21 prompt 'ESPECIAL'
         menu to DSC
         tcor()
         @ 12,20 clea to 13,29
         if DSC = 0
            mdanul()
            set confirm off
            restscreen(00,00,23,79,TELA)
            retu
         endi
         if DSC = 1
            Rtpdesc := 'C'
            TPCb := 'COMUM'
            @ 12,21 get TPCb
            clea gets
            PD_s := ' '
            do whil PD_s = ' '
               @ 12,42 say 'Porcentagem de Desconto:' get Rdesc pict '999.9999'
               @ 12,70 say '%'
               read
               if Rdesc > descto
                  save scre to msg
                  @ 12,20 clea to 13,55
                  set color to w/r
                  n := ' '
                  @ 12,02 say 'ESSE DESCONTO EXEDE O LIMITE !!!' get n pict '!'
                  read
                  tcor()
                  if PD_S # 'P'
                     rest scre from msg
                     PD_s := ' '
                     loop
                  endi
               endi
               exit
            endd
         Endi
         if DSC = 2
            TPCb := 'ESPECIAL'
            Rtpdesc := 'E'
            @ 12,21 get TPCb
            clea gets
         endi
         if FJ = 'P'
            OP_REGAP := 3
            desc_REGA := 'ISENTO'
            Creg_apur :='3'
         else
            OP_regap := 0
            Do whil OP_REGAP = 0
               save scre to regap
               set color to w/b+
               @ 15,02 clea to 20,22
               @ 15,02 say 'Regime de Apuraá∆o'
               @ 16,02 to 16,22
               @ 17,02 prompt '1-SIMPLES NACIONAL'
               @ 18,02 prompt '2-OUTROS REGIMES'
               @ 19,02 prompt '3-ISENTO'
               menu to op_regap
               tcor()
               If OP_regap = 1
                  desc_REGA := 'SIMPLES NACIONAL'
               elseif OP_regap = 2
                  desc_REGA := 'OUTROS REGIMES'
               elseif OP_regap = 3
                  desc_REGA := 'ISENTO'
               elseif OP_regap = 0
                  TONE(600)
                  If ALERT("Voce deve informar o Regime!;Se optar em Sair,;o Cadastro sera Anulado", {"CONTINUAR", "SAIR"} , "B/GR+,r") ==2
                     mdanul()
                     restscreen(00,00,23,79,TELA)
                     retu
                  Endi
                  OP_REGAP := 0
                  loop
               Endi
               exit
            endd
            stor ltrim(str(op_regap)) to Creg_apur
            rest scre from regap
            @ 13,22 get Creg_apur
            @ 13,24 get desc_rega
            clea gets
***************************************************
            OP_Tpg := 0
            save scre to tpg
            set color to w/b+
            @ 13,61 clea to 17,81
            @ 13,61 prompt '1-BOLETO'
            @ 14,61 prompt '2-DINHEIRO'
            @ 15,61 prompt '3-CHEQUE'
            @ 16,61 prompt '4-DEP‡SITO'
            @ 17,61 prompt '5-NENHUM'
            menu to op_tpg
            tcor()
            If OP_tpg = 1
               desc_TPG := 'BOLETO'
            elseif OP_tpg = 2
               desc_tpg := 'DINHEIRO'
            elseif OP_tpg = 3
               desc_tpg := 'CHEQUE'
            elseif OP_tpg = 4
               desc_tpg := 'DEP‡SITO'
            elseif OP_tpg = 5 .or. OP_tpg = 0
               desc_tpg := 'NENHUM'
            Endi
            stor op_tpg to Rtpag
            rest scre from tpg
            @ 13,61 CLEA TO 13,81
            @ 13,61 get Rtpag pict '9'
            @ 13,62 say '-'
            @ 13,63 get desc_tpg
            clea gets
***********************************************
            if FJ = 'PESSOA FISICA'
               op_ctb := '9'
               desc_ctb := '9-N«O Contribuinte'
            else
               OP_ctb := 0
               save scre to tpg
               bcor()
               @ 15,17 clea to 19,37
               @ 15,17 say 'Tipo de Contribuinte'
               @ 16,17 to 16,37
               @ 17,17 prompt '1-Contribuinte ICMS'
               @ 18,17 prompt '2-Contribuinte ISENTO'
               @ 19,17 prompt '9-N«O Contribuinte'
               menu to op_ctb
               tcor()
               if OP_ctb = 0
                  rest scre from tpg
                  MN_CL := 0
                  loop
               endi
               If OP_ctb = 1
                  desc_ctb := '1-Contribuinte ICMS'
               elseif OP_ctb = 2
                  desc_ctb := '2-Contribuinte ISENTO'
               elseif OP_ctb = 3
                  desc_ctb := '9-N«O Contribuinte'
               Endi
               stor ltrim(str(op_ctb)) to op_ctb
            endi
            rest scre from tpg
            @ 14,17 get desc_ctb
            clea gets
********************************************************
            rps :=0
            Do whil rps =0
               save scre to tl
               @ 10,44 clea to 10,77
               cdr := '    '
               @ 14,53 get cdr pict '!999'
               @ 15,53 say '<*>Pesquisa'
               read
               if cdr = '    '
                  nmrep :=''
               else
                  if cdr = '*   '
                     psqrepre()
                     rps :=0
                     cdr := '    '
                  endi
                  Area(oMenu:aDbfs[49])
                  loca for codr = cdr
                  if eof()
                     // unlock
                     //use
                     mddad()
                     rps := 0
                     loop
                  endi
                  stor codr to cdr
                  stor nrep to nmrep
                  // unlock
                  //use
                  rest scre from tl
                  @ 14,53 get cdr
                  @ 14,58 get nmrep
                  clea gets
               endi
               exit
            endd
            if Rcliente = '       '
               @ 17,01 say ' Favor preencher o NOME FANTASIA !' get z
               read
               @ 17,01 clea to 17,40
               loop
            endi
********************************************************
            Area(oMenu:aDbfs[5])
            if FJ = 'E'
               loca for cnpj = Rcnpj
            else
               loca for cpf = Rcpf
            endi
            if eof()
            else
               // unlock
               //use
               TONE(200,5)
               If ALERT("Ja Existe Cadastro com Esse CNPJ;Voce nao pode continuar !;", {"ALTERAR", "SAIR"} , "B/GR+,r") ==2
                  restscreen(00,00,23,79,TELA)
                  retu
               else
                  loop
               endi
            endi
            // unlock
            //use
            exit
         endi
         @ 15,00 to 15,79
         @ 16,02 say 'Endereáo'
         @ 18,02 say 'Lagradouro:' get Render pict '@!'
         @ 18,55 say 'N£mero:' get Rnroend pict '!!!!!!'
         @ 19,02 say 'Complemento:' get Rcompl pict '@!'
         @ 19,37 say 'Bairro:' get Rbairro pict '@!'
         @ 19,62 say 'CEP:' get CCEP pict '99.999-999'
         @ 20,02 say 'Pa°s:'
         @ 20,18 say 'Estado:'
         @ 20,39 say 'Cidade:'
         read
         @ 20,08 get Rpais pict '@!'
         clea gets
         RE := '  '
         do whil RE = '  '
            ET := '1'
            @ 20,26 get RE pict '!!'
            read
            if RE = '  '
               mdanul()
               rele all like r*
               set confirm off
               restscreen(00,00,23,79,TELA)
               retu
            endi
            Area(oMenu:aDbfs[40])
            loca for estd = RE
            if eof()
               // unlock
               //use
               mdest()
               RE := '  '
               loop
            endi
            stor estd to Rest
            // unlock
            //use
            @ 20,47 get Rcida pict '@!'
            read
            ET := '2'
            Area(oMenu:aDbfs[40])
            loca for cidade = Rcida .and. estd = RE
            if eof()
               // unlock
               //use
               mdest()
               Rcida := spac(30)
               @ 20,47 clea to 21,77
               RE := '  '
               loop
            endi
            // unlock
            //use
            exit
         endd
         @ 21,12 say 'NF:' get RNF
         @ 21,19 say 'PRNF:' get Rprnf
         clea gets
         @ 21,02 say 'Linha:' get Rlinha
         @ 21,27 say 'Despacho:' get Rdespacho pict '@!'
         @ 22,02 say 'Recebimento:' get Rhrrec
         @ 23,02 say 'Observacao do Pedido:' get Robssep
         read
         set confirm off
         TONE(600)
         If conf("Deseja Registrar o Cadastro?")
            showtime()
            mdanul()
            restscreen(00,00,23,79,TELA)
            retu
         Endi
         Area(oMenu:aDbfs[5])
         go bott
         stor CODC to cdc
         // unlock
         //use
         do case
            case val(cdc)+1 < 10
               stor '000'+subs(str(val(cdc)+1),10,1) to cod
            case val(cdc)+1 >9 .and. val(cdc) < 100
               stor '00'+subs(str(val(cdc)+1),9,2) to cod
            case val(cdc)+1 > 99 .and. val(cdc) < 1000
               stor '0'+subs(str(val(cdc)+1),8,3) to cod
            case val(cdc)+1 > 999
               stor subs(str(val(cdc)+1),7,4) to cod
         endcase
         @ 04,20 get cod
         clea gets
         Area(oMenu:aDbfs[5])
         appe blan
         repl cliente with rcliente,razao with Rrazao,ender with Render,bairro with Rbairro,cida with Rcida,est with Rest,cnpj with Rcnpj,cpf with Rcpf,inscr with Rinscr,inscrp with Rinscrp,fone1 with Rfone1,fone2 with Rfone2,prazo with Rprazo
         repl CEP with CCEP,email with Rmail,obs with Robs, dscnto with Rdesc, tpdesc with Rtpdesc, contato with Rcontato,cliente with Rcliente, prazo2 with Rprazo2
         repl Ativo with 'A', nroend with Rnroend, compl with Rcompl, paiis with Rpais, linha with Rlinha,exml with Rexml, usuario with logfan, indie with Rindie
         repl nf with Rnf, prnf with Rprnf, hrrec with Rhrrec, data with DT, sit with FJ, codc with cod, tpag with Rtpag, Vmin with Rvmin, despacho with Rdespacho
         repl reg_apur with Creg_apur, indie with subs(desc_ctb,1,1), cnae with Rcnae, codrp with cdr, nrepre with nmrep,obssep with Robssep
         // unlock
         //use
         mdsuces()
         restscreen(00,00,23,79,TELA)
         retu
      endd


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
   	OI  := 0
   	l   := 2
   	dct := -1

   	Area("cadcli")
   	index on dscnto to I5
	   set index to I5
	   while !eof()
      if Pest # '  '
         if est # Pest
            DbSkip(1)
            loop
         endi
      endi
      if ativo # 'A' .OR. dscnto = dct
         DbSkip(1)
         loop
      endi
      @ l,01 say dscnto
      stor DSCNTO to dct
      l++
      skip
   end

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

   set print off
   set devi to scre
   ejec
   @ 21,02 say 'Gerando relat¢rio *.TXT  ....'
   r := ' '
   nm := dtos(date)+".txt"
   set printer to &nm
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
      @ 02,51 say "Digite a Raz∆o Social:"
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


function snh_adm()
******************
   STT := ' '

   while Empty(STT)
      say := ' '
      tela := SaveScreen()
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
         say := 'X'
         mdsha()
         STT := ' '
         loop
      end
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

	

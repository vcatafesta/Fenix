#include "fenix.ch"

function UfInclusao()
*********************
	LOCAL GetList   := {}
	LOCAL Arq_Ant   := Alias()
	LOCAL Ind_Ant   := IndexOrd()
   LOCAL cScreen   := SaveScreen()
   LOCAL cEsta
   LOCAL cNome
   LOCAL nIcms

   oMenu:Limpa()
   Area("uf")   
   while true
	   cEsta       := space(2)
      cNome       := space(40)
      nIcms       := 0
		
		MaBox(10, 10, 16, LastCol()-1, "CADASTRO DE UF")
		@ 12, 11 say 'Uf............:' get cEsta Pict "@!" Valid UfCerto( cEsta )
		@ 13, 11 say 'Estado........:' get cNome pict "@!" Valid IF( Empty( cNome ), ( ErrorBeep(), Alerta("Erro: Entrada Invalida"), FALSO ), OK )
		@ 14, 11 say 'Icms..........:' get nIcms pict "99.99"
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
			if Uf->(Incluiu())
			   if Uf->(Incluiu())
					Uf->Uf   := cEsta
					Uf->Nome := cNome
					Uf->Icms := nIcms
				endif
				Uf->(Libera())
			endif
      endif
	EndDo

function UfCerto( cUf )
***********************
LOCAL Arq_Ant := Alias()
LOCAL Ind_Ant := IndexOrd()

if LastKey() = UP
	return( true )
endif

if Empty( cUf )
	ErrorBeep()
	Alerta( "Erro: Entrada inválida!")
	return( false )
endif

Area("Uf")
Uf->(Order( UF_UF ))
if Uf->(DbSeek( cUf ))
	ErrorBeep()
	Alerta("Erro: Já registrado ou,; Incluido por outra Estacao...")
	AreaAnt( Arq_Ant, Ind_Ant )
	return( false )
endif
AreaAnt( Arq_Ant, Ind_Ant )
return( true )


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
	LOCAL cBloqueado

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
		cBloqueado  := "B"

		MaBox(11, 10, 18, LastCol()-1, "CADASTRO DE USUARIO")
		@ 12, 11 say 'Usuario...........:' get cLogin    Pict "@!" Valid VerificarUsuario( cLogin ) .AND. !Empty( cLogin )
		@ 13, 11 say 'Senha.............:' get cPassword pict "@S"
		@ 14, 11 say 'Nome Completo.....:' get cNome     pict "@!"
		@ 15, 11 say 'CEP...............:' get cCep      pict "99999-999" valid CepErrado( @cCep, @cCida, @cEsta, @cBair )
		@ 15, 41 say 'Cidade.:'            get cCida     pict "@!"
		@ 15, 76 say 'UF.:'                get cEsta     pict "@!"
		@ 16, 11 say 'Endere�o..........:' get cEnde     pict "@!"
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
					
					CadFun->CodUsu 	:= cCodi
					CadFun->CodFun 	:= cCodi
					CadFun->Dtaadm 	:= Date()
					CadFun->Dtadm  	:= Date()
					CadFun->Dtanac 	:= Date()
					CadFun->Endrco 	:= cEnde
					CadFun->Bairro 	:= cBair
					CadFun->Cdde   	:= cCida
					CadFun->Uf     	:= cEsta
					Cadfun->cadastro 	:= cBloqueado 
               Cadfun->venda 		:= cBloqueado 
               Cadfun->regv 		:= cBloqueado 
               Cadfun->bxv 		:= cBloqueado 
               Cadfun->edtv 		:= cBloqueado 
               Cadfun->estqv 		:= cBloqueado
					Cadfun->lstv 		:= cBloqueado 
               Cadfun->psqv 		:= cBloqueado 
               Cadfun->nfv 		:= cBloqueado 
               Cadfun->compra 	:= cBloqueado
					Cadfun->regc 		:= cBloqueado 
               Cadfun->bxc 		:= cBloqueado 
               Cadfun->edtc 		:= cBloqueado 
               Cadfun->lstc 		:= cBloqueado
					Cadfun->estqc 		:= cBloqueado 
               Cadfun->psqc 		:= cBloqueado 
               Cadfun->nfc 		:= cBloqueado 
               Cadfun->etqc 		:= cBloqueado
					Cadfun->estoque 	:= cBloqueado 
               Cadfun->plne 		:= cBloqueado 
               Cadfun->cnce 		:= cBloqueado 
               Cadfun->edte 		:= cBloqueado
               Cadfun->pere 		:= cBloqueado
					Cadfun->rgpe 		:= cBloqueado 
               Cadfun->cheq 		:= cBloqueado 
               Cadfun->dpe 		:= cBloqueado 
               Cadfun->lja 		:= cBloqueado
               Cadfun->fna 		:= cBloqueado
					Cadfun->etqed 		:= cBloqueado
               Cadfun->ftv 		:= cBloqueado
               Cadfun->nfe 		:= cBloqueado 
               Cadfun->nfsa		:= cBloqueado
               Cadfun->nfen 		:= cBloqueado 
               Cadfun->dvv 	   := cBloqueado
					Cadfun->clicad    := cBloqueado
               Cadfun->forcad    := cBloqueado 
               Cadfun->mercad    := cBloqueado 
               Cadfun->procad    := cBloqueado 
               Cadfun->cfocad    := cBloqueado
					Cadfun->cdbcad    := cBloqueado 
               Cadfun->estcad    := cBloqueado 
               Cadfun->clacad    := cBloqueado 
               Cadfun->muncad    := cBloqueado 
               Cadfun->repcad    := cBloqueado
					Cadfun->tracad    := cBloqueado
               Cadfun->cescad    := cBloqueado
               Cadfun->embcad    := cBloqueado					
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

function CepCerto( cCep, lModificar, cSwap )
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


function CepErrado( cCep, cCida, cEsta, cBair )
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
	Cep->(Escolhe( 03, 01, 22, "Cep + '�' + Cida + '!' + Esta + '!' + Bair ", "CEP        CIDADE                      UF BAIRRO", aRotina,, aRotinaAlteracao ))
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

while true
   oMenu:Limpa()
   M_Title("CONSULTA/IMPRESSAO DE CEP")
   nChoice := FazMenu( 10,10, aMenuArray, Cor())
   Do Case
      Case nChoice = 0
         return(ResTela( cScreen ))

      Case nChoice = 1
         CepVideo()

      Case nChoice = 2
         CepImpressora()

   EndCase
enddo


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
   return(ResTela( cScreen ))

Proc CepImpressora()
********************
LOCAL cScreen := SaveScreen()
LOCAL Tam	  := 80
LOCAL Col	  := 58
LOCAL Pagina  := 0
LOCAL lSair   := FALSO

if !InsTru80() .OR. !LptOk()
	return(ResTela( cScreen ))
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
return(ResTela( cScreen ))


function ClientesInclusao()
***************************
      LOCAL GetList := {}
      LOCAL cScreen := SaveScreen()

      oMenu:Limpa()
      FJ := ' '
      do whil FJ = ' '
         @ 10,04 say '* <P>essoa Fisica ou <E>mpresa:' get FJ pict '!' valid (FJ $ 'PE')
         read
         if FJ = ' '
            Restela( cScreen )
            return nil
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
      csit:=spac(13)
      rcliente:=spac(22)
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
      @ 04,02 say 'C�digo do Cliente:'
      @ 04,28 get FJ
      @ 05,02 say 'Data Cadastro:' get date
      clea gets
      Do whil .t.
         @ 04,42 say 'Fantasia:' get Rcliente pict '@!'
         read
         @ 05,30 say 'XML:' get Rexml
         @ 06,02 say 'Razao Social:' get Rrazao pict '@!' valid !Empty(rrazao)
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
         @ 11,54 say 'Pedido M�nimo:' get Rvmin pict '9,999.99'
         @ 12,02 say 'Tipo de Cobran�a:'
         @ 13,02 say 'Regime de Apura��o:'
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
            If ALERT("Raz�o Social em Branco !!!;Preencha!;", {"CONTINUA", "SAIR"} , "W+/B") ==1
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
               @ 15,02 say 'Regime de Apura��o'
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
            @ 16,61 prompt '4-DEP�SITO'
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
               desc_tpg := 'DEP�SITO'
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

            if FJ = 'PESSOA FISICA'
               op_ctb := '9'
               desc_ctb := '9-N�O Contribuinte'
            else
               OP_ctb := 0
               save scre to tpg
               bcor()
               @ 15,17 clea to 19,37
               @ 15,17 say 'Tipo de Contribuinte'
               @ 16,17 to 16,37
               @ 17,17 prompt '1-Contribuinte ICMS'
               @ 18,17 prompt '2-Contribuinte ISENTO'
               @ 19,17 prompt '9-N�O Contribuinte'
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
                  desc_ctb := '9-N�O Contribuinte'
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
         @ 16,02 say 'Endere�o'
         @ 18,02 say 'Lagradouro:' get Render pict '@!'
         @ 18,55 say 'N�mero:' get Rnroend pict '!!!!!!'
         @ 19,02 say 'Complemento:' get Rcompl pict '@!'
         @ 19,37 say 'Bairro:' get Rbairro pict '@!'
         @ 19,62 say 'CEP:' get CCEP pict '99.999-999'
         @ 20,02 say 'Pa�s:'
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


function achaEsta(cEsta)
************************
   CadCli->(Order( CADCLI_ESTA ))
   if Cadcli->(!DbSeek( cEsta ))
      Nada()
      return false
   endif
   return true


function lstcli()
*****************
   LOCAL GetList        := {}
   LOCAL cScreen        := SaveScreen()
   LOCAL cEsta          := Space(2)
	LOCAL Arq_Ant        := Alias()
	LOCAL Ind_Ant        := IndexOrd()
   LOCAL nRow           := 0 
   LOCAL nDesconto      := 0
   LOCAL nQtDocumento   := 0
   LOCAL oRelato
   LOCAL cTela

   Area("cadcli")
   Order( CADCLI_ESTA )
   
   while true
      oMenu:Limpa()
      Mabox(10, 10, 14, 40, "LISTAGEM DE CLIENTES")
      @ 12, 11 say 'Estado....:' get cEsta     pict "@!"      valid AchaEsta(cEsta)
      @ 13, 11 say 'Desconto..:' get nDesconto pict "9999.99"
      read
      if LastKey() = ESC
         if conf("Pergunta: Deseja cancelar?")
            return(Restela( cScreen ))
         endif
      endif

      if Cadcli->(DbSeek( cEsta ))
         oMenu:Limpa()	
         oRelato				:= TRelatoNew()	
         oRelato:Tamanho	:= 132
         oRelato:NomeFirma := AllTrim(oAmbiente:NomeFirma)
         oRelato:Sistema	:= oMenu:StatusSup
         oRelato:Titulo 	:= 'LISTAGEM DE CLIENTES DA UF : ' + cEsta
         oRelato:Cabecalho := "CODI CLIENTE                FONE1          CONTATO              DSCNTO EMAIL"
      
         if !Instru80()
            Sx_ClrScope( S_TOP )
            Sx_ClrScope( S_BOTTOM )
            AreaAnt( Arq_Ant, Ind_Ant )
            return(ResTela( cScreen ))
         endif
         cTela := Mensagem("Aguarde, Imprimindo Relatorio.")
         oRelato:PrintOn(Chr(ESC) + "C" + Chr(66) + PQ )
         oRelato:Inicio()       
              
         oBloco := {|| Cadcli->Est == cEsta }     
         while Eval( oBloco ) .AND. !Eof()              
            if CadCli->ativo != "A" .OR. CadCli->dscnto != nDesconto
               CadCli->(DbSkip(1))
               loop
            endif
            IF oRelato:RowPrn = 0		   
               oRelato:Cabec()         
            endif	
            
            nQtDocumento++
            CadCli->( Qout( Codc, Cliente, Fone1, Contato, dscnto, email))
            CadCli->(DbSkip(1))
            IF ++oRelato:RowPrn >= 25
               oRelato:Eject()
            endif	
         enddo   
         Qout()
         Qout(Repl("-",oRelato:Tamanho))
         oRelato:Eject()
         ORelato:PrintOff(Chr(ESC) + "C" + Chr(66))
         ResTela( cTela )
      endif
   enddo


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

*==================================================================================================*

def ClientesDbedit()
********************
   LOCAL Arq_Ant	:= Alias()
   LOCAL Ind_Ant	:= IndexOrd()
   LOCAL cScreen	:= SaveScreen()
   LOCAL oBrowse	:= MsBrowse():New()
   LOCAL nField
   Set Key -8 To

   if !UsaArquivo("cadcli")
      return( nil )
   endif

   oMenu:Limpa()
   Area("cadcli")
   Cadcli->(Order( CADCLI_FANTA ))
   Cadcli->(DbGoBottom())

   /*
   for nField := 1 To Cadcli->(FCount())
      cName := Cadcli->(FieldName( nField ))
      oBrowse:Add( cName, cName, NIL, "CADCLI")
   next
   */
   
   oBrowse:Add( "ID",         "id")
   oBrowse:Add( "FANTASIA",   "cliente", "@!")
   oBrowse:Add( "RAZAO",      "razao",   "@!")
   oBrowse:Add( "CNPJ",       "cnpj",   '99.999.999/9999-99')
   oBrowse:Add( "CPF",        "cpf",    '999.999.999-99')
   oBrowse:Add( "CIDADE",     "cida",   '@!')
   oBrowse:Add( "ENDERECO",   "ender",  '@!')
   oBrowse:Add( "UF",         "est",    '@!')
   oBrowse:Titulo   := "CONSULTA/ALTERACAO DE CLIENTES"
   oBrowse:PreDoGet := {|| PodeAlterar() }
   oBrowse:PreDoDel := {|| PodeExcluir() }
   oBrowse:Show()
   oBrowse:Processa()
   ResTela( cScreen )
   return( nil )
endef

*==================================================================================================*

def UfDbedit()
********************
   LOCAL Arq_Ant	:= Alias()
   LOCAL Ind_Ant	:= IndexOrd()
   LOCAL cScreen	:= SaveScreen()
   LOCAL oBrowse	:= MsBrowse():New()
   LOCAL nField
   Set Key -8 To

   if !UsaArquivo("uf")
      return( nil )
   endif

   oMenu:Limpa()
   Area("uf")
   uf->(Order( UF_UF ))
   uF->(DbGoBottom())

   /*
   for nField := 1 To Cadcli->(FCount())
      cName := Cadcli->(FieldName( nField ))
      oBrowse:Add( cName, cName, NIL, "CADCLI")
   next
   */
   
   oBrowse:Add( "ID",         "id")
   oBrowse:Add( "UF",         "uf",   '@!')
   oBrowse:Add( "NOME",       "nome", '@!')
   oBrowse:Add( "ICMS",       "icms", '99.99')
   oBrowse:Titulo   := "CONSULTA/ALTERACAO DE UF"
   oBrowse:PreDoGet := {|| PodeAlterar() }
   oBrowse:PreDoDel := {|| PodeExcluir() }
   oBrowse:Show()
   oBrowse:Processa()
   ResTela( cScreen )
   return( nil )
endef

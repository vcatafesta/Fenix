#include "fenix.ch"

*--------------------------------------------------------------------------*

def UfInclusao()
*****************
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
			if ufCerto(cEsta)
				if Uf->(Incluiu())
					Uf->Uf   := cEsta
					Uf->Nome := cNome
					Uf->Icms := nIcms
				endif
				Uf->(Libera())
			endif
		endif
	enddo
endef

*--------------------------------------------------------------------------*

def UfCerto( cUf )
******************
	LOCAL Arq_Ant := Alias()
	LOCAL Ind_Ant := IndexOrd()

	if LastKey() = UP
		return( true )
	endif

	if Empty( cUf )
		ErrorBeep()
		Alerta( "Erro: Entrada invalida!")
		return( false )
	endif

	Area("uf")
	Uf->(Order( UF_UF ))
	if Uf->(DbSeek( cUf ))
		ErrorBeep()
		Alerta("ERRO: Ja registrado ou,; incluido por outra estacao...")
		AreaAnt( Arq_Ant, Ind_Ant )
		return( false )
	endif
	AreaAnt( Arq_Ant, Ind_Ant )
	return( true )
endef

*--------------------------------------------------------------------------*

def ufErrado( cEsta, cNome, nRow, nCol)
***************************************
	LOCAL aRotina			  := {{|| UfInclusao()}}
	LOCAL aRotinaAlteracao := {{|| UfDbedit( OK )}}
	LOCAL Ind_Ant			  := IndexOrd()
	LOCAL Arq_Ant			  := Alias()

	Area("uf")
	uf->(Order( UF_UF ))
	if (Lastrec() = 0 )
		ErrorBeep()
		if Conf(" INFO: Nenhuma UF Disponivel. Registrar ?")
			UfInclusao()
		endif
		AreaAnt( Arq_Ant, Ind_Ant )
		Return( FALSO )
	endif
	if Uf->(!DbSeek( cEsta ))
		Uf->(Order( UF_NOME ))
		Uf->(Escolhe( 03, 01, 22, "uf + chr(186) + Nome  ", "UF ESTADO", aRotina,, aRotinaAlteracao ))
	endif
	cEsta := Uf->Uf
	cNome := Uf->Nome
	if nRow != nil
		write( nRow, nCol, strtrim(cNome))
	endif
	AreaAnt( Arq_Ant, Ind_Ant )
	Return( OK )
endef

*--------------------------------------------------------------------------*

def RepresentanteErrado( cRepre, cNome, nRow, nCol)
********************************************************
	LOCAL aRotina			  := {{|| RepresentanteInclusao()}}
	LOCAL aRotinaAlteracao := {{|| RepresentanteInclusao(true)}}
	LOCAL Ind_Ant			  := IndexOrd()
	LOCAL Arq_Ant			  := Alias()

	Area("represen")
	Represen->(Order( REPRESEN_CODI ))
	if (Lastrec() = 0 )
		ErrorBeep()
		if Conf(" Pergunta: Nenhum REPRESENTANTE disponivel. Registrar ?")
			RepresentanteInclusao()
		endif
		AreaAnt( Arq_Ant, Ind_Ant )
		Return( FALSO )
	endif
	if Represen->(!DbSeek( cRepre ))
		Represen->(Order( REPRESEN_NOME ))
		Represen->(Escolhe( 03, 01, 22, "codr + chr(186) + nrep + chr(186) + Completo", "CODI REPRESENTANTE   NOME COMPLETO", aRotina,, aRotinaAlteracao ))
	endif
	cRepre := Represen->Codr
	cNome  := Represen->nRep
	if !isnil(nRow)
		write( nRow, nCol, cNome)
	endif
	AreaAnt( Arq_Ant, Ind_Ant )
	Return( OK )
endef

*--------------------------------------------------------------------------*

def caduser()
*************
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
		@ 12, 11 say 'Usuario...........:' get cLogin    Pict "@!" 			valid VerificarUsuario(cLogin) .AND. !Empty(cLogin)
		@ 13, 11 say 'Senha.............:' get cPassword pict "@S"
		@ 14, 11 say 'Nome Completo.....:' get cNome     pict "@!"
		@ 15, 11 say 'CEP...............:' get cCep      pict "99999-999" valid CepErrado( @cCep, @cCida, @cEsta, @cBair )
		@ 15, 41 say 'Cidade.:'            get cCida     pict "@!"
		@ 15, 76 say 'UF.:'                get cEsta     pict "@!"  		valid UfErrado(@cEsta)
		@ 16, 11 say 'Endereco..........:' get cEnde     pict "@!"
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
		if VerificarUsuario(cLogin)
			if CadFun->(Incluiu())
			   if Usuario->(Incluiu())
				   cCodi 				:= StrZero(Usuario->Id, 4)
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
      endif
	enddo
endef

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

def CepInclusao( lAlteracao )
*****************************
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
			MaBox( 06, 02, 13, 78, cString )
			@ 08		 , 03 Say  "Novo Cep....:" Get cCep      Pict "99999-999" valid CepCerto( @cCep, lModificar, cSwap )
			@ Row()+1 , 03 Say  "Cidade......:" Get cCida     Pict "@!"
			@ Row()+1 , 03 Say  "Bairro......:" Get cBair     Pict "@!"
			@ Row()+1 , 03 Say  "Estado......:" Get cEsta     Pict "@!"        valid UfErrado(@cEsta, nil, Row(), Col()+1)
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
	enddo
endef

*--------------------------------------------------------------------------*

def RepresentanteInclusao( lAlteracao )
****************************************
	LOCAL GetList		:= {}
	LOCAL cScreen		:= SaveScreen()
	LOCAL lModificar	:= FALSO
	LOCAL nOpcao		:= 0
	LOCAL dData
	LOCAL cCodi
	LOCAL cRepre
	LOCAL cCompleto
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

	Area("represen")
	Represen->(Order( REPRESEN_CODI ))
	WHILE OK
		oMenu:Limpa()
		if lModificar
			cCodi	 		:= Represen->Codr
			cRepre		:= Represen->nRep
			cCompleto 	:= Represen->Completo
			cString	 	:= "ALTERACAO DE REPRESENTANTE"
		Else
			Represen->(DbGoBottom())
			cCodi 		:= Strzero(Represen->Id + 1, 4)
			cRepre		:= Represen->(Space(FieldLen(FieldPos("nrep"))))
			cCompleto 	:= Represen->(Space(FieldLen(FieldPos("completo"))))
			cString 		:= "INCLUSAO DE NOVO REPRESENTANTE"
		endif
		cSwap := cCodi
		lSair := FALSO
		WHILE OK
			MaBox( 06, 02, 12, 78, cString )
			@ 08		 , 03 Say  "Novo Codi...,,:" Get cCodi     Pict "9999" valid RepresentanteCerto( @cCodi, lModificar, cSwap )
			@ Row()+1 , 03 Say  "Representante.:" Get cRepre    Pict "@!"
			@ Row()+1 , 03 Say  "Nome Completo.:" Get cCompleto Pict "@!"
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
					if Represen->(TravaReg())
						Represen->Codr	  		:= cCodi
						Represen->nrep	  		:= cRepre
						Represen->Completo	:= cCompleto
						Represen->(Libera())
						lSair := OK
						Exit
					endif
				Else
					if Represen->(Incluiu())
						Represen->Codr	  		:= cCodi
						Represen->nrep	  		:= cRepre
						Represen->Completo	:= cCompleto				
						Represen->(Libera())
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
endef

*--------------------------------------------------------------------------*

def CepCerto( cCep, lModificar, cSwap )
***************************************
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
endef

*--------------------------------------------------------------------------*

def RepresentanteCerto( cCodi, lModificar, cSwap )
**************************************************
	FIELD Codr, nRep, Completo

	if LastKey() = UP
		Return( OK )
	endif

	if lModificar != NIL .AND. lModificar
		if cCodi == cSwap
			Return( OK )
		endif
	endif

	if Empty( cCodi )
		ErrorBeep()
		Alerta("Erro: Entrada invalida.")
		Return( FALSO )
	endif
	Represen->(Order( REPRESEN_CODI ))
	if Represen->(DbSeek( cCodi ))
		ErrorBeep()
		Alerta("Erro: Representante ja Registrado. " + Represen->( AllTrim( nRep)))
		Return( FALSO )
	endif
	Return( OK )
endef

*--------------------------------------------------------------------------*

def CepErrado( cCep, cCida, cEsta, cBair )
******************************************
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
		Cep->(Escolhe( 03, 01, 22, "Cep + chr(186) + Cida + chr(186) + Esta + chr(186) + Bair ", "CEP        CIDADE                      UF BAIRRO", aRotina,, aRotinaAlteracao ))
	endif
	cCep	:= Cep->Cep
	cCida := Cep->Cida
	cEsta := Cep->Esta
	cBair := Cep->Bair
	AreaAnt( Arq_Ant, Ind_Ant )
	return true
endef

*--------------------------------------------------------------------------*

def CepPrint()
**************
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
endef

*--------------------------------------------------------------------------*

def CepVideo()
**************
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
endef

*--------------------------------------------------------------------------*

def CepImpressora()
*******************
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
endef

*--------------------------------------------------------------------------*

def PickTipoRegime( cPick, cList, nRow, nCol )
	LOCAL aList 	 := { "SIMPLES NACIONAL", "OUTROS REGIMES", "ISENTO"}
	LOCAL aSituacao := { 1, 2, 3 }
	LOCAL cScreen	 := SaveScreen()
	LOCAL nChoice

	if (nchoice := Ascan( aSituacao, cPick )) == 0
		MaBox( 11, 01, 14, 44, NIL, NIL, Roloc( Cor()) )
		if (nChoice := AChoice( 12, 02, 13, 43, aList )) != 0
			cPick := aSituacao[ nChoice ]
		else
			return false
		endif
	endif		
	cPick := aSituacao[ nChoice ]
	cList := aList[ nChoice ]
	resTela( cScreen )
	if !isnil(nRow) .and. !isnil(nCol)
		write( nRow, nCol, cList)
	endif	
	return true
endef

*--------------------------------------------------------------------------*

def PickTipoCobranca( cPick, cList, nRow, nCol )
	LOCAL aList 	 := { "COMUM", "ESPECIAL"}
	LOCAL aSituacao := { 1, 2 }
	LOCAL cScreen	 := SaveScreen()
	LOCAL nChoice

	if (nChoice := Ascan( aSituacao, cPick )) == 0
		MaBox( 11, 01, 14, 44, NIL, NIL, Roloc( Cor()) )
		if (nChoice := AChoice( 12, 02, 13, 43, aList )) != 0
			cPick := aSituacao[ nChoice ]
		else
			return false
		endif
	endif
	cPick := aSituacao[ nChoice ]
	cList := aList[ nChoice ]
	resTela( cScreen )
	if !isnil(nRow) .and. !isnil(nCol)
		write( nRow, nCol, cList)
	endif	
	return true
endef

*--------------------------------------------------------------------------*

def PickTipoContribuinte( cPick, cList, nRow, nCol )
	LOCAL aList 	 := { "CONTRIBUINTE ICMS", "CONTRIBUENTE ISENTO","NAO CONTRIBUINTE"}
	LOCAL aSituacao := { 1, 2, 9 }
	LOCAL cScreen	 := SaveScreen()
	LOCAL nChoice

	if (nChoice := Ascan( aSituacao, cPick )) == 0
		MaBox( 11, 01, 15, 44, NIL, NIL, Roloc( Cor()) )
		if (nChoice := AChoice( 12, 02, 14, 43, aList )) != 0
			cPick := aSituacao[ nChoice ]
		else
			return false
		endif
	endif
	cPick := aSituacao[ nChoice ]
	cList := aList[ nChoice ]
	resTela( cScreen )
	if !isnil(nRow) .and. !isnil(nCol)
		write( nRow, nCol, cList)
	endif	
	return true
endef

*--------------------------------------------------------------------------*

def PickTipoPagamento( cPick, cList, nRow, nCol )
	LOCAL aList 	 := { "BOLETO","DINHEIRO","CHEQUE","DEPOSITO","NENHUM"}
	LOCAL aSituacao := { 1, 2, 3 , 4, 5 }
	LOCAL cScreen	 := SaveScreen()
	LOCAL nChoice

	if (nChoice := Ascan( aSituacao, cPick )) == 0
		MaBox( 11, 01, 17, 44, NIL, NIL, Roloc( Cor()) )
		if (nChoice := AChoice( 12, 02, 16, 43, aList )) != 0
			cPick := aSituacao[ nChoice ]
		else
			return false
		endif
	endif
	cPick := aSituacao[ nChoice ]
	cList := aList[ nChoice ]
	resTela( cScreen )
	if !isnil(nRow) .and. !isnil(nCol)
		write( nRow, nCol, cList)
	endif	
	return true
endef

*--------------------------------------------------------------------------*

def PickTipoCliente( cPick, cList, nRow, nCol )
	LOCAL aList 	 := { "PESSOA FISICA","EMPRESA"}
	LOCAL aSituacao := { "P", "E" }
	LOCAL cScreen	 := SaveScreen()
	LOCAL nChoice

	if (nChoice := Ascan( aSituacao, cPick )) == 0
		MaBox( 11, 01, 14, 44, NIL, NIL, Roloc( Cor()) )
		if (nChoice := AChoice( 12, 02, 13, 43, aList )) != 0
			cPick := aSituacao[ nChoice ]
		else
			return false
		endif
	endif
	cPick := aSituacao[ nChoice ]
	cList := aList[ nChoice ]
	resTela( cScreen )
	if !isnil(nRow) .and. !isnil(nCol)
		write( nRow, nCol, space(13))
		write( nRow, nCol, cList)
	endif	
	return true
endef

*--------------------------------------------------------------------------*

def ClientesInclusao()
***************************
	LOCAL GetList := {}
	LOCAL cScreen := SaveScreen()
	
	while true
		oMenu:Limpa()
		Area("cadcli")
		Cadcli->(DbGoBottom())
		cCodi 		:= Strzero(Cadcli->Id + 1, 4)
		fj 			:= space(1)
		DT				:=	date()
		rdata			:=	date
		rativo		:=	spac(1)
		cSit			:=	spac(13)
		rcliente		:=	spac(22)
		Rrazao		:=	spac(40)
		cEnde			:=	spac(40)
		cLogra		:=	spac(40)
		Rnroend		:=	spac(6)
		Rcompl		:=	spac(20)
		cCida			:=	spac(30)
		cEsta			:=	spac(2)
		Rcnpj			:=	spac(18)
		Rinscr		:=	spac(15)
		Rcpf			:=	spac(14)
		Rinscrp		:=	spac(16)
		Rfone1		:=	spac(14)
		Rfone2		:=	spac(14)
		Rprazo		:=	0
		Rprazo2		:=	0
		Robs			:=	spac(45)
		CCEP			:=	spac(10)
		Rcontato		:=	spac(20)
		Rvmin 		:=	0
		Rcnae			:=	spac(9)
		Rmail			:=	spac(60)
		Rexml			:=	spac(43)
		Rtpdesc		:=	spac(1)
		Rdesc			:=	0
		Rtpag			:=	0
		Rlinha		:=	spac(2)
		Rhrrec		:=	spac(62)
		Rnf 			:=	'S'
		Rprnf 		:=	'S'
		Rreg_apur	:=	spac(1)
		cPais 		:=	"BRASIL"
		Rdespacho 	:=	spac(40)
		Robssep		:=	spac(62)
		dsc         := 0
		op_regap    := 0
		desc_rega   :=	Space(0)
		op_ctb      := 0
		cRepre      := space(4)
		cNomeRepre  := Space(0)
		cBair 		:= space(16)
		
		Mabox(10,01, 37, maxcol(), "INCLUSAO DE CLIENTES")
		@ Row()+1,02 say "<P>Fisica <E>mpresa.:"  get fj pict "!" valid PickTipoCliente(@fj, @cSit, Row(), Col()+1)
		@ Row()+1,02 say "Codigo do Cliente...:" 	get cCodi pict "9999"
		@ Row()+1,02 say "Data Cadastro:......." 	get date
		@ Row()+1,02 say "Fantasia............:" 	get Rcliente pict '@!' valid lastkey() = UP .or. eval({|p1|
		if empty(p1)
			errorbeep()
			Alerta("ERRO: Nome fantasia invalido")
			return false
		endif
		return true
		}, rCliente)
		@ Row()+1,02 say "Razao Social........:" 	get Rrazao   pict '@!' valid lastkey() = UP .or. eval({|p1|
		if empty(p1)
			errorbeep()
			Alerta("ERRO: Razao social invalida")
			return false
		endif
		return true
		}, rRazao)

		if FJ = 'E'
			@ Row()+1,02 say "C.N.P.J.............:" 	get Rcnpj   pict '99.999.999/9999-99' valid lastkey() = UP .or. eval({|p1|
			Cadcli->(Order(CADCLI_CNPJ))
			if CadCli->(DbSeek(p1))
				errorbeep()
				Alerta("INFO: Cliente ja registrado")
				return false
			endif
			return true
			}, Rcnpj) 			
			@ Row(),  50 say "'Inscr.Est :" 	get Rinscr  pict '9999999999999999'
		else
			@ Row()+1,02 say "CPF.................:" 	get RCPF    pict '999.999.999-99' valid lastKey() = UP .or. eval({|p1|
			Cadcli->(Order(CADCLI_CPF))
			if CadCli->(DbSeek(p1))
				errorbeep()
				Alerta("INFO: Cliente ja registrado")
				return false
			endif
			return true
			}, Rcpf) 			
			@ Row(),  50 say "RG....:" 	get Rinscrp pict '9999999999999999'
		endif
		@ Row()+1,02 say "Cep.................:"  get cCep 	 pict '99999-999' valid CepErrado( @cCep, @cCida, @cEsta, @cBair )
		@ Row(),  50 say "Cidade:"		            get cCida    pict "@!"  
		@ Row(),  90 say "Estado:"                get cEsta    pict "@" valid UfErrado(@cEsta, nil, Row(), Col()+1)
		@ Row()+1,02 say "Pais................:"  get cPais    pict "@!"	
		@ Row()+1,02 say "Endereco............:" 	get cEnde 	 pict "@!"
		@ Row()+1,02 say "Logradouro..........:" 	get cLogra 	 pict '@!'
		@ Row(),  72 say "Numero:" 					get Rnroend  pict '@!'
		@ Row()+1,02 say "Complemento.........:" 	get Rcompl 	 pict '@!'
		@ Row(),  50 say "Bairro:" 					get cBair	 pict '@!'
		@ Row()+1,02 say "Contato.............:"	get Rcontato pict '@!'
		@ Row(),  50 say "Fone :"  					get Rfone1   pict '(99)9999-99999'
		@ Row(),  72 say "Fone1:"   					get Rfone2   pict '(99)9999-99999'
		@ Row()+1,02 say "E-mail..............:"  get Rmail
		@ Row()+1,02 say "Prazo...............:"  get Rprazo   pict '999'
		@ Row(),  27 say "/"
		@ Row(),  32 say "Dias."
		@ Row(),  28                					get Rprazo2  pict '999' valid lastkey() = UP .or. eval({|p1, p2|
		if p1 <> 0 
			if p1 > p2
				return true
			else
				errorbeep()
				Alerta("ERRO: Prazo invalido")
				return false
			endif
		endif
		return true
		}, rPrazo2, rPrazo)
		@ Row(),  50 say "Cnae :" 					  get Rcnae 	pict "9999-9/99"
		@ Row()+1,02 say "Pedido Minimo.......:" get Rvmin 	pict "9,999.99"
		@ Row()+1,02 say "Obs.................:" get Robs 		pict "@!"
		@ Row()+1,02 say "Tipo de Cobranca....:" get dsc   	pict "9"    		valid PickTipoCobranca(@dsc, nil, Row(), Col()+1)
		@ Row()+1,02 say "Regime de Apuracaoo.:" get op_regap pict "9" 			valid PickTipoRegime(@op_regap, nil, Row(), Col()+1)
		@ Row(),  50 say "Tipo Pagamento......:" get rtpag    pict "9" 			valid PickTipoPagamento(@rtpag, nil, Row(), Col()+1)
		@ Row()+1,02 say "Percentagem Desconto:" get Rdesc 	pict '999.9999'	valid lastkey() = UP .or. eval({|p1, p2, p3|
		if p1 = 1
			if p2 > p3
				errorbeep()
				Alerta("ERRO: Percentual excede limite!")
				return false
			endif
		endif
		return true
		}, dsc, rDesc, desc->desc)
		@ Row(),  70 say "%"						                                        
		@ Row()+1,02 say "Tipo Contribuinte...:" get op_ctb pict "9"    valid PickTipoContribuinte(@op_ctb, @desc_rega, Row(), Col()+1)
		@ Row()+1,02 say "Representante.......:" get cRepre pict "9999" valid RepresentanteErrado(@cRepre, @cNomeRepre, Row(), Col()+1)
		@ Row()+1,02 say "XML.................:" get Rexml
		@ Row()+1,02 say "NF..................:" get RNF
		@ Row(),	 50 say "PRNF....:"   	   	  get Rprnf
		@ Row()+1,02 say "Linha...............:" get Rlinha
		@ Row(),  50 say "Despacho:" 			 	  get Rdespacho pict '@!'
		@ Row()+1,02 say "Recebimento.........:" get Rhrrec
		@ Row()+1,02 say "Observacao do Pedido:" get Robssep
		read
		if lastkey() = ESC
			errorbeep()
			if conf("INFO: Deseja encerrar cadastro?")
				return(restela(cScreen))
			endif
			loop
		endif
	
		rTpdesc   := iif(dsc == 1, "C", "E")
		
		if conf("INFO: Deseja Registrar o Cadastro?")
			Area("cadcli")
			if cadcli->(incluiu())
				Cadcli->cliente	:= rcliente
				Cadcli->razao 		:= Rrazao
				Cadcli->ender 		:= cEnde
				Cadcli->ender2 	:= cLogra
				Cadcli->bairro 	:= cBair
				Cadcli->cida 		:= cCida
				Cadcli->est 		:= cEsta
				Cadcli->cnpj 		:= Rcnpj
				Cadcli->cpf 		:= Rcpf
				Cadcli->inscr 		:= Rinscr
				Cadcli->inscrp 	:= Rinscrp
				Cadcli->fone1 		:= Rfone1
				Cadcli->fone2 		:= Rfone2
				Cadcli->prazo 		:= Rprazo
				Cadcli->CEP 		:= CCEP
				Cadcli->email 		:= Rmail
				Cadcli->obs 		:= Robs
				Cadcli->dscnto 	:= Rdesc
				Cadcli->tpdesc 	:= Rtpdesc
				Cadcli->contato 	:= Rcontato
				Cadcli->cliente 	:= Rcliente
				Cadcli->prazo2 	:= Rprazo2
				Cadcli->Ativo 		:= "A"
				Cadcli->nroend 	:= Rnroend
				Cadcli->compl 		:= Rcompl
				Cadcli->paiis 		:= cPais
				Cadcli->linha 		:= Rlinha
				Cadcli->exml 		:= Rexml
				Cadcli->usuario 	:= logfan
				Cadcli->nf 			:= Rnf
				Cadcli->prnf 		:= Rprnf
				Cadcli->hrrec 		:= Rhrrec
				Cadcli->data 		:= DT
				Cadcli->sit 		:= cSit
				Cadcli->codc 		:= cCodi
				Cadcli->tpag 		:= Rtpag
				Cadcli->Vmin 		:= Rvmin
				Cadcli->despacho 	:= Rdespacho
				Cadcli->reg_apur 	:= strzero(op_regap,1)
				Cadcli->indie 		:= strzero(op_ctb,1)
				Cadcli->cnae 		:= Rcnae
				Cadcli->codrp 		:= cRepre
				Cadcli->nrepre 	:= cNomeRepre
				Cadcli->obssep 	:= Robssep			
			endif
			Cadcli->(Libera())
		endif
		loop
	enddo
endef

*--------------------------------------------------------------------------*
	
def achaEsta(cEsta)
************************
   CadCli->(Order( CADCLI_ESTA ))
   if Cadcli->(!DbSeek( cEsta ))
      Nada()
      return false
   endif
   return true
endef

*--------------------------------------------------------------------------*

def lstcli()
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
   CadCli->(Order( CADCLI_ESTA ))
   
   while true
      oMenu:Limpa()
      Mabox(10, 10, 15, 70, "LISTAGEM DE CLIENTES")
      @ 12, 11 say 'Estado....:' get cEsta     pict "@!" valid UfErrado(@cEsta, nil, Row(), Col()+1)
      @ 13, 11 say 'Desconto..:' get nDesconto pict "9999.99"
      read
      if LastKey() = ESC
         if conf("Pergunta: Deseja cancelar?")
            return(Restela( cScreen ))
         endif
      endif

		if Cadcli->(!DbSeek( cEsta ))
			ErrorBeep()
		   if !conf("INFO: Nada consta nos parametros informados. Deseja imprimir assim mesmo?")			
				loop
			endif	
		endif	

		oMenu:Limpa()	
      oRelato				:= TRelatoNew()	
      oRelato:Tamanho	:= 132
      oRelato:Coluna	   := 66
      oRelato:NomeFirma := AllTrim(oAmbiente:NomeFirma)
      oRelato:Sistema	:= oMenu:StatusSup
      oRelato:Titulo 	:= 'LISTAGEM DE CLIENTES DA UF : ' + cEsta
      oRelato:Cabecalho := "CODI CLIENTE                FONE1          CONTATO              DSCNTO EMAIL"
      
      if !Instru80()
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
         IF ++oRelato:RowPrn >= oRelato:Coluna
            oRelato:Eject()
         endif	
      enddo   
      Qout()
      Qout(Repl("-",oRelato:Tamanho))
      oRelato:Eject()
      ORelato:PrintOff(Chr(ESC) + "C" + Chr(66))
      ResTela( cTela )
   enddo

*--------------------------------------------------------------------------*

def UfImpressao()
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
	LOCAL oUf            := TDbf():Open("uf")
	
   oMenu:Limpa() 
   oUf:Order( UF_NOME )
	oUf:DbGoTop()
	if oUf:Eof()
		ErrorBeep()
	   if !conf("INFO: Nada consta nos parametros informados. Deseja imprimir assim mesmo?")			
			return(restela(cSCreen))
		endif	
	endif	

	oMenu:Limpa()	
   oRelato				:= TRelatoNew()	
   oRelato:Tamanho	:= 80
   oRelato:Coluna	   := 66
   oRelato:NomeFirma := AllTrim(oAmbiente:NomeFirma)
   oRelato:Sistema	:= oMenu:StatusSup
   oRelato:Titulo 	:= 'LISTAGEM DE UF'
   oRelato:Cabecalho := "UF NOME ESTADO                               ICMS"
   
   if !Instru80()
      AreaAnt( Arq_Ant, Ind_Ant )
      return(ResTela( cScreen ))
   endif
   cTela := Mensagem("Aguarde, Imprimindo Relatorio.")
   oRelato:PrintOn(Chr(ESC) + "C" + Chr(66))
   oRelato:Inicio()       

	oBloco := {|| !oUf:Eof() }     
   while Eval( oBloco ) .AND. Rel_Ok()
      IF oRelato:RowPrn = 0		   
         oRelato:Cabec()         
      endif	
      
      nQtDocumento++
		Qout(oUf:Uf, oUf:Nome, oUf:Icms)
		oUf:DbSkip(1)
      IF ++oRelato:RowPrn >= oRelato:Coluna
         oRelato:Eject()
      endif	
   enddo   
   Qout(Repl("-",oRelato:Tamanho))
   oRelato:Eject()
   ORelato:PrintOff(Chr(ESC) + "C" + Chr(66))
	AreaAnt( Arq_Ant, Ind_Ant )
	return(ResTela( cScreen ))

*--------------------------------------------------------------------------*

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

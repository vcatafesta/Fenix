#include "fenix.ch"

function VerArquivo()
*********************
	LOCAL nTam := Len(oMenu:aDbfs)
	LOCAL nX
	LOCAL cDbf

   Mensagem("Aguarde, verificando arquivos")
	rddsetdefault("SIXCDX")
	for nX := 1 to nTam
		cDatabase := oMenu:aDbfs[nX]
		cDbf      := oMenu:aDbfs[nX] + ".dbf"
		if !file( cDbf )
			ErrorBeep()
			mensagem("Erro: Arquivo " + upper(cDbf) + " nao existe")
			//quit
		end
	
		if cDatabase = "usuario"
			Ferase("usuario.cdx")
			use usuario exclusive new
			if !Neterr()
				index on Usuario->Fantazia Tag Fantazia to Usuario
				Usuario->(DbCloseArea())
				return true
			else
				alert("erro")
				return false
			endif
		end
	next
	oMenu:Limpa()	
	return true

function UsaArquivo(cDbf)
*************************
	LOCAL nTam := Len(oMenu:aDbfs)
	LOCAL nX
	
	rddsetdefault("SIXCDX")
	if cDbf = nil
		for nX := 1 to nTam
			cDatabase := oMenu:aDbfs[nX]
			if cDatabase = "usuario"
				use usuario shared new
				if !Neterr()
					DbSetIndex("Usuario")
					return true
				else
					alert("erro")
					return false
				endif
			end
			use &cDatabase shared new
			if Neterr()
				Alerta("Erro de abertura do arquivo: " + cDatabase )
				return false
			endif	
			//DBSetIndex( &cDatabase )
		next	
		oMenu:Limpa()	
		return true
	else
		use &cDatabase shared new
		if Neterr()
			Alerta("Erro de abertura do arquivo: " + cDatabase )
			return false
		endif	
		//DBSetIndex( &cDatabase )
	endif
	return true

*==================================================================================================*	
	
def Area( cArea)
****************
	DbSelectArea( cArea )
	return NIl
	
*==================================================================================================*		

def AbreArquivo( cArquivo )
	LOCAL cTela  := Mensagem("Aguarde... Verificando Arquivos.")
	LOCAL nQt
	LOCAL nPos
	LOCAL nQtArquivos
	LOCAL aArquivos

	// FechaTudo()
	aArquivos := ArrayArquivos()
	if cArquivo != NIL
      cArquivo := lower(cArquivo)
	   CriaArquivo(cArquivo)		
		//CriaIndice(cArquivo)		
		nPos := Ascan( aArquivos,{ |oBloco|oBloco[1] = cArquivo })
		if nPos != 0
			cArquivo := aArquivos[nPos,1]
			cTela := mensagem("Aguarde... Verificando Arquivo ;-;;#" + AllTrim(Str(nPos)) + ' ' + cArquivo )					
			if !NetUse( cArquivo, MONO )			
				ResTela( cTela )
				return(FALSO)
			endif
			return( OK )
		endif
		return( FALSO )
	endif

	nQtArquivos := Len( aArquivos )
	For nQt := 1 To nQtArquivos
		cArquivo := aArquivos[nQt,1]
		cTela := mensagem("Aguarde... Verificando Arquivo ;-;;#" + AllTrim(Str(nQt)) + ' ' + cArquivo)
		if !NetUse( cArquivo, MONO )
			ResTela( cTela )
			return(FALSO)
		endif
	Next
	ResTela( cTela )
	return( OK )

*==================================================================================================*	

def ArrayArquivos()
	LOCAL aArquivos := {}
	Aadd( aArquivos, { "usuario.dbf",;
	   	{{'CODUSU', 'C', 4, 0 },;
          {'FANTAZIA', 'C', 15, 0 },;
          {'SENHA', 'C', 6, 0 },;
          {'DTCAD', 'D', 8, 0 },;
          {'CADASTRO', 'C', 1, 0 },;
          {'CLICAD', 'C', 1, 0 },;
          {'FORCAD', 'C', 1, 0 },;
          {'MERCAD', 'C', 1, 0 },;
          {'PROCAD', 'C', 1, 0 },;
          {'CFOCAD', 'C', 1, 0 },;
          {'CDBCAD', 'C', 1, 0 },;
          {'ESTCAD', 'C', 1, 0 },;
          {'CLACAD', 'C', 1, 0 },;
          {'EMBCAD', 'C', 1, 0 },;
          {'MUNCAD', 'C', 1, 0 },;
          {'REPCAD', 'C', 1, 0 },;
          {'TRACAD', 'C', 1, 0 },;
          {'CESCAD', 'C', 1, 0 },;
          {'VENDA', 'C', 1, 0 },;
          {'REGV', 'C', 1, 0 },;
          {'BXV', 'C', 1, 0 },;
          {'EDTV', 'C', 1, 0 },;
          {'ESTQV', 'C', 1, 0 },;
          {'ETQED', 'C', 1, 0 },;
          {'LSTV', 'C', 1, 0 },;
          {'PSQV', 'C', 1, 0 },;
          {'FTV', 'C', 1, 0 },;
          {'DVV', 'C', 1, 0 },;
          {'NFV', 'C', 1, 0 },;
          {'COMPRA', 'C', 1, 0 },;
          {'REGC', 'C', 1, 0 },;
          {'BXC', 'C', 1, 0 },;
          {'EDTC', 'C', 1, 0 },;
          {'LSTC', 'C', 1, 0 },;
          {'ESTQC', 'C', 1, 0 },;
          {'PSQC', 'C', 1, 0 },;
          {'NFE', 'C', 1, 0 },;
          {'NFSA', 'C', 1, 0 },;
          {'NFEN', 'C', 1, 0 },;
          {'NFC', 'C', 1, 0 },;
          {'ETQC', 'C', 1, 0 },;
          {'ESTOQUE', 'C', 1, 0 },;
          {'PLNE', 'C', 1, 0 },;
          {'CNCE', 'C', 1, 0 },;
          {'EDTE', 'C', 1, 0 },;
          {'RGPE', 'C', 1, 0 },;
          {'PERE', 'C', 1, 0 },;
          {'CHEQ', 'C', 1, 0 },;
          {'DPE', 'C', 1, 0 },;
          {'LJA', 'C', 1, 0 },;
          {'FNA', 'C', 1, 0 }}})

Return( aArquivos )

*==================================================================================================*		

def CriaArquivo( cArquivo )
	LOCAL cScreen   := SaveScreen()
	LOCAL aArquivos := {}
	LOCAL cTela
	LOCAL nQtArquivos
	LOCAL nQt
	LOCAL nTam
	LOCAL nX
	LOCAL nPos
	LOCAL cHost
	
	aArquivos := ArrayArquivos()
	if cArquivo != nil
		nPos := Ascan( aArquivos,{ |oBloco|oBloco[1] = cArquivo })
		if nPos != 0
			cArquivo := aArquivos[nPos,1]

			if !ms_swap_file(cArquivo)
				Mensagem( "Aguarde, Gerando Arquivo " + cArquivo)
				ms_swap_DbCreate( cArquivo, aArquivos[ nPos, 2] )
				return true
			endif
		endif
		return false
	endif
	
	nQtArquivos := Len( aArquivos )
	for nQt := 1 To nQtArquivos
		cArquivo := aArquivos[nQt,1]
		
		if !ms_swap_file(cArquivo)			
			Mensagem("Aguarde, Gerando Arquivo " + cArquivo)
			ms_swap_DbCreate(cArquivo, aArquivos[nQt,2] )
		else			
			if NetUse( cArquivo, MULTI )
				Integridade(cArquivo, aArquivos[nQt, 2])
			else
				SetMode(oAmbiente:AlturaFonteDefaultWindows, oAmbiente:LarguraFonteDefaultWindows)
				Cls
				Quit
			endif
		endif
	Next
	resTela( cScreen )
	cTela := Mensagem("Aguarde, Fechando Base de Dados.", Cor())
	FechaTudo()
	resTela( cTela )
	Return
endef

*==================================================================================================*		

def Integridade(cArquivo, aStru )
	LOCAL aStruct	 := DbStruct()
	LOCAL lCriarDbf := OK
	LOCAL cTela
	LOCAL nConta
	LOCAL nX
	
	nConta := Len(aStru)
	cTela  := Mensagem(" Verificando Integridade do database #: ;-;" + cArquivo)
	For nX := 1 To nConta
		cCampo := aStru[nX,1] // NOME DO CAMPO
		IF !AchaCampo( aStruct, aStru, nX, cCampo )
			NovoDbf(cArquivo, aStru, cCampo, lCriarDbf )
			IF lCriarDbf = OK
				lCriarDbf := FALSO
			EndIF
		EndIF
	Next
	DbCloseArea()
	ResTela( cTela )
	return NIL
endef	

*==================================================================================================*		
	
def NovoDbf(cArquivo, aStru, cCampo, lCriarDbf )
	LOCAL cLocalNtx := cArquivo + '.' + CEXT
	LOCAL cTela     := SaveScreen()
	LOCAL cAlias    := lower(Alias())
   LOCAL cOld      := '.old'

	IF lCriarDbf
		(cAlias)->(DbCloseArea())
		Mensagem("Aguarde, renomeando Arquivo: ;-;" + cArquivo)
		ms_swap_ferase(cAlias + cOld)
		ms_swap_ferase(cAlias + ".nsx")
		ms_swap_ferase(cAlias + ".cdx")		
		ms_swap_rename(cArquivo, cAlias + cOld)
		
		Mensagem("Aguarde, Criando Arquivo Novo: ;-;" + cArquivo)		
		CriaArquivo(cArquivo)
		(cAlias)->(DbCloseArea())
				
		if NetUse(cArquivo, MONO, 2, "XTEMP")
			Mensagem("Aguarde, Incluindo Registros no arquivo Novo: ;-;" + cArquivo)
			Appe From (cAlias + cOld)
		endif			
	EndIF
	ResTela( cTela )

   cArquivo := upper(cArquivo)
   cCampo   := upper(cCampo)
	IF cArquivo = "LISTA" .AND. cCampo = "CLASSE"
		cTela := msgconverte(cCampo, cArquivo)
		Lista->(DbGoTop())
		WHILE Lista->(!Eof())
			Lista->Classe := AllTrim( Lista->Classe ) + '0'
			Lista->(DbSkip(1))
		EndDo
	EndIF
	return( ResTela( cTela ))
endef

*==================================================================================================*		

def msgconverte(cCampo, cArquivo)
		return(Mensagem("Aguarde, Convertendo campo " + cCampo + " do Arquivo :" + cArquivo))
endef

*==================================================================================================*		

def AchaCampo( aStruct, Dbf1, nX, cCampo )
	LOCAL cTipo
   LOCAL nTam
   LOCAL nDec
	LOCAL nPos := Ascan2( aStruct, cCampo, 1 )

	if nPos > 0
		cTipo := Dbf1[nX,2]
		nTam	:= Dbf1[nX,3]
		nDec	:= Dbf1[nX,4]
		// if cCampo == "ID"
		if cTipo == "+"
			return true
		endif
		return(( aStruct[ nPos, 2 ] == cTipo .AND. ;
					aStruct[ nPos, 3 ] == nTam  .AND. ;
					aStruct[ nPos, 4 ] == nDec ))
	EndIf
	return false
endef

*==================================================================================================*		

def AchaIndice(cAlias)	
   LOCAL aIndice := ArrayIndices()
   LOCAL cTela   := SaveScreen()
   LOCAL nX
	LOCAL nY

   if !ISNIL(cAlias)
      if !Used()
         WA_USE((cAlias))
			WA_LOCK((cAlias))            			
		endif		
	endif
   Sele (cAlias)
	FOR EACH nX IN aIndice		
		FOR EACH nY IN nX
         if nY:__enumindex() == 1 .and. alltrim(lower(cAlias)) != alltrim(lower(nY))
            exit
         endif
         if nY:__enumindex() == 1
            loop
         endif
         mensagem("Aguarde, Verificando Tags de indices: ;-;;#" + cAlias + "=>" + lower(nY))
			//? lower(nY), nY:__enumindex()-1, lower(OrdName(nY:__enumindex()-1))
         //? lower(nY) == lower(OrdName(nY:__enumindex()-1))			
         if !(lower(nY) == lower(OrdName(nY:__enumindex()-1)))
            (cAlias)->(DbCloseArea())
            return false
         endif
		NEXT
	NEXT
   (cAlias)->(DbCloseArea())
   return true
endef

*==================================================================================================*		

def ArrayIndices()
*----------------*
	LOCAL aArquivos := {}
//	Aadd( aArquivos, { "chepre",    "chepre1","chepre2","chepre3","chepre4", "chepre5"})
	Aadd( aArquivos, { "usuario",   "usuario1"})
	return( aArquivos )
endef

*==================================================================================================*		

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
cBcoDados := StrTran( cBcoDados, '.dbf')

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

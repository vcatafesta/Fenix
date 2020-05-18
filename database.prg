#include "fenix.ch"

function Arq1()
***************
	LOCAL cScreen := SaveScreen()

	while true
	   use comp exclusive
	   drt := 'C:'
	   if neterr()
	      Unlock
	      Use
			mensagem("Aguarde, Acesso compartilhado!")
	   else
	      exit
	   end
	end
	CorNormal()
	return(Restela(cScreen))
	return


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
	
def Area( cArea)
****************
	DbSelectArea( cArea )
	return NIl

	
function AbreArquivo(cDatabase)
*******************************
	LOCAL cScreen := SaveScreen()

	rddsetdefault("SIXCDX")
	while true
	   //arq1()
	   if oMenu:Comp = "SERVIDOR"
		  drt  	:= "C:"
		  access := cDatabase
	   else
		  drt 	:= "T:"
		  access := "T:\" + cDatabase
	   endi
	   //Unlock
		//use &access exclusive
		
		if cDatabase == oMenu:aDbfs[23] // usuario
			Ferase("usuario.cdx")
			use usuario exclusive new
			if !Neterr()
				index on Usuario->Fantazia Tag Fantazia to Usuario
				Usuario->(DbCloseArea())
				return
			else
				alert("erro")
			endif
		end
		Use &access shared new
		if neterr()
			mensagem("Aguarde, Acesso compartilhado!")
			tcor()
		else
			//Browse()
			exit
		end
	end
	return(Restela(cScreen))
	


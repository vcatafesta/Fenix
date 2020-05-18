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


function verarquivo()
**********************
LOCAL nTam := Len(oMenu:aDbfs)
LOCAL nX
LOCAL cDbf

for nX := 1 to nTam
	cDbf := oMenu:aDbfs[nX] + ".dbf"
	if !file(cDbf)
		//ErrorBeep()
		mensagem("Erro: Arquivo " + upper(cDbf) + " nao existe")
	end
next
oMenu:Limpa()	
return	

function area(cDatabase)
************************
LOCAL cScreen := SaveScreen()

	rddsetdefault("SIXCDX")
	while true
	   arq1()
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
			index on Usuario->Fantazia Tag Fantazia to Usuario
			Usuario->(DbCloseArea())
		end
		Use &access shared new
		if neterr()
			mensagem("Aguarde, Acesso compartilhado!")
			tcor()
		else
			exit
		end
	end
	return(Restela(cScreen))
	


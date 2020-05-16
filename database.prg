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

function area(cDatabase)
************************
LOCAL cTela := SaveScreen()

	while true
	   arq1()
	   if comp = "SERVIDOR"
		  drt  	:= "C:"
		  access := cDatabase
	   else
		  drt 	:= "T:"
		  access := "T:\" + cDatabase
	   endi
	   Unlock
		use &access exclusive
		if neterr()
			mensagem("Aguarde, Acesso compartilhado!")
			tcor()
		else
			exit
		end
	end
	return(Restela(cScreen))
	
	
function MaBox(nRow, nCol, nRow1, nCol1, cColor)
************************************************
	hb_default( @cColor, "G+/r+")
	DispBox( nRow, nCol, nRow1, nCol1,, cColor)
	DispBox( nRow+1, nCol+1, nRow1-1, nCol1-1,, cColor)
	return nil

function mensagem(cString)
**************************
	MaBox(09, 21, 14, 49)
	@ 11,23 say cString
	return
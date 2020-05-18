#include "fenix.ch"

CLASS TMenu
	 Export:
		  VAR Row
		  VAR Col
		  VAR aDbfs
		  VAR Unidade
		  VAR Terminal
		  VAR Comp
        VAR nMUser
        VAR Usuario
	 Export:
		  METHOD New CONSTRUCTOR
		  METHOD Limpa
ENDCLASS

METHOD New( cAlias )
	Self:Row			:= 09
	Self:Col			:= 15
	Self:aDbfs		:= {}
	Self:Unidade	:= "C"
	Self:Terminal	:= ""
   Self:nMUser    := ""
   Self:Usuario   := ""
	Self:Comp		:= "SERVIDOR"
	
	return( Self )

METHOD Limpa()
	setcolor("")
	Scroll(01,00, MaxRow()-1, MaxCol()-1)
	return( Self )

function TMenuNew()
	return( TMenu():New())

#include "fenix.ch"

CLASS TMenu
	 Export:
		  VAR Row
		  VAR Col
		  VAR aDbfs
		  VAR Unidade
		  VAR Terminal
		  VAR Comp
	 Export:
		  METHOD New CONSTRUCTOR
		  METHOD Limpa
ENDCLASS

METHOD New( cAlias )
	Self:Row 			:= 09
	Self:Col 			:= 15
	Self:aDbfs        := {}
	Self:Unidade      := "C"
	Self:Terminal     := nil
	Self:Comp			:= "SERVIDOR"
	
	return( Self )

METHOD Limpa()
	setcolor("")
	cls
	return( Self )

function TMenuNew()
	return( TMenu():New())

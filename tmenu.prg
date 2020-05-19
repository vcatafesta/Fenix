#include "fenix.ch"

class TMenu from TAmbiente
	exported:
		  VAR Col
		  
	public:
		  METHOD New 

	public Menu1
ENDCLASS

method New( oOwner ) class TMenu

   ::New( oOwner )
	//with Self
	    *
		 ::setvar()	
       ::StatusSup      := "Fenix for Windows"
       ::StatusInf      := ""
		 ::Panos          := ::SetPano()
		 ::Menu           := ::xMenu()
       ::Disp           := ::xDisp()
       ::Alterando      := FALSO
       ::Ativo          := 1
       ::nPos           := 1
       ::NomeFirma      := "CLAMAR CONSERVAS"
       ::CodiFirma      := '0001'
       ::StSupArray     := { ::StatusSup }
       ::StInfArray     := { ::StatusInf }
       ::MenuArray      := { ::Menu }
       ::DispArray      := { ::Disp }
		 ::aDbfs				:= {}
		 
	//endwith
	
return(self)

Function TMenuNew()
	return( TMenu():New())

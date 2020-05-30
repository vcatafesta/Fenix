#include <box.ch>
#include <fileio.ch>
#include <directry.ch>

#define def	   function
#define endef
#define true	.t.
#define false  .f.
#define null   nil
#define NULL   nil
REQUEST HB_MEMIO

*-----------------*
def Main(argc)
*-----------------*
	LOCAL xCoringa   := "*.dbf"
	LOCAL aFileList  := {}
	LOCAL aFiles[ Adir(xCoringa)]
	LOCAL aSelect[Adir(xCoringa)]
	LOCAL nChoice
   LOCAL nLen       := Adir(xCoringa)

	Set Dele ON
	Afill(aselect, true)
	Adir(xCoringa , aFiles)
	Aeval(aFiles, { |element| Qout(element) })
	Aeval( Directory(xCoringa), {|aDirectory|;
									Aadd( aFileList,;
									dtoc(       aDirectory[F_DATE])        + "  " + ;
									substr(     aDirectory[F_TIME], 1 , 5) + "  " + ;
									if( substr( aDirectory[F_ATTR], 1 , 1) == "D", "   <DIR>", ;
									tran(       aDirectory[F_SIZE], "99,999,999 Bytes"))  + "  " + ;									
									padr(       aDirectory[F_NAME], 15 ))})
									//Upper(PADR( aDirectory[F_NAME], 15 )))})
   cls
	? "Macrosoft STRU, Copyright (c), Vilmar Catafesta"
	? "[ESC] sair, [ENTER] selecionar"
	SetColor("W+/B")
   if argc = nil 	
      if nLen > 0
         for xFile := 1 to nLen            
            cDbf := aFiles[xFile]
            GravaStru(cDbf)
         next
      endif
	else
      if !file(argc)
         SetColor("W+/B")
         nRow1 := 05 + Len( aFileList)
         if nRow1 > 24
            nRow1 = 24
         endif			
         @ 5 , 10 , nRow1 + 1 , 70 BOX B_SINGLE_DOUBLE + space(1)
         nChoice := aChoice(06 , 11 , nRow1, 69 , aFileList)
         if nchoice = 0
            QuitTBDemo()
         endif	
         cDbf := AllTrim(right(aFileList[nChoice],15))
         alert(cdbf)
      else
         cDbf := argc
      endif
      GravaStru(cDbf)
	endif
   SetColor("W+/B")
   QuitTBDemo()
endef
	
function GravaStru(dbffile)
      dbffile := StrTran(dbffile, ".DBF")
      dbffile := StrTran(dbffile, ".dbf")
      
      Use (dbffile) New
      oldprintf   := Set(_SET_PRINTFILE)
      oldprint    := Set(_SET_PRINTER)
      oldcons     := Set(_SET_CONSOLE)
      
      
      //Set Printer To (dbffile + ".txt")
      Set Printer To "dbf.txt" additive
      Set Console Off
      Set Printer On
      
      vtc   := FCount()
      vlc   := Len(alltrim(Str(vtc)))
      If (vlc < 3)
         vd:= 2
      Else
         vd:= vlc
      EndIf
      
      /*
      ? "+" + padc(" " + dbf() + ".DBF ", 26 + vd, "-") + "+"
      ? "| " + padr("#", vd) + " Nome        Tipo Tam Dec|"
      ? "+" + Replicate("-", 26 + vd) + "+"
      a  := 0
      aeval((alias())->(dbstruct()), { |_1| QOut("| "+padr(strzero(++a,vlc,0),vd)+" "+pad(_1[1],10),"   "+_1[2],Str(_1[3], 3),Str(_1[4], 3)+" |") })
      ? "+" + PADC(" N§ Registros "+ALLTRIM(STR(LASTREC()))+" ",26+vd,"-") + "+"
      
      */
      Qout(' Aadd( aArquivos, {"'  + dbffile + '.dbf",; ')
      Qout(Space(10) + "{;") 
         
      aeval((alias())->(dbstruct()), { |xdb| Qout( ;
                                      Space(10) + ;
                                      "{'" + Alltrim(xdb[1]) + "',", + ;
                                      "'" + Alltrim(xdb[2]) + "',", + ;
                                      Alltrim(Str(xdb[3], 3)) + ",", + ;
                                      Alltrim(Str(xdb[4], 3)) + " },;");
                                      })
      
      Qout(Space(10) + "}})") 
         
      Set Printer (oldprint)
      Set Printer To
      Set Console (oldcons)

      Qout("SAIDA GRAVADA PARA : " + dbffile + ".txt")
      DbCloseAll()
      Return Nil


def QuitTBDemo()
	setcolor("")
	SetPos(maxrow(), 0)
	? "Macrosoft STRU terminate!"
	quit
endef

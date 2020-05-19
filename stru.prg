/*
        Incluir na compilacao:   WAPI.LIB + CT.LIB
      O WAPI.EXE dever  estar no diretorio corrente.
*/

function main(dbffile)
   
   dbffile := StrTran(dbffile, ".DBF")
   dbffile := StrTran(dbffile, ".dbf")
   
   Use (dbffile) New
   oldprintf   := Set(_SET_PRINTFILE)
   oldprint    := Set(_SET_PRINTER)
   oldcons     := Set(_SET_CONSOLE)
   
   
   Set Printer To (dbffile + ".txt")
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
   Qout("a" + dbffile + " := {;") 
      
   aeval((alias())->(dbstruct()), { |xdb| Qout( ;
                                   Space(10) + ;
                                   "{'" + Alltrim(xdb[1]) + "',", + ;
                                   "'" + Alltrim(xdb[2]) + "',", + ;
                                   Alltrim(Str(xdb[3], 3)) + ",", + ;
                                   Alltrim(Str(xdb[4], 3)) + " },;");
                                   })
   
   Qout(Space(10) + "}") 
      
   Set Printer (oldprint)
   Set Printer To (oldprintf)
   Set Console (oldcons)

   Qout("SAIDA GRAVADA PARA : " + dbffile + ".txt")
   Return Nil

         oPrinter:TextOut( oPrinter:PrinterName + ": MaxRow() = " + hb_ntos( oPrinter:MaxRow() ) + "   MaxCol() = " + hb_ntos( oPrinter:MaxCol() ) )
         oPrinter:SetColor( RED )
         oPrinter:SetPrc(oPrinter:Prow()+3, Pcol()+25 )
         oPrinter:SetFont('monotype corsiva',30,{-1,14}, 0, .T., .F.)
         oPrinter:TextOut( "CLAMAR CONSERVAS NATURAIS" )
         oPrinter:NewLine()


         oPrinter:UnderLine( .F. )
         oPrinter:Italic( .F. )
         oPrinter:SetFont( "Lucida Console", 8, { 3, -50 } )

         oPrinter:NewLine()
         oPrinter:TextOut("Impressao: "+dtoc(date()))
         oPrinter:SetPrc(oPrinter:PROW(), Pcol()+30 )
         oPrinter:TextOut("Pedido: ")
         oPrinter:TextOut(NP)
         oPrinter:NewLine()

         nColFixed   := 2 * oPrinter:CharWidth
         nColTTF     := 40 * oPrinter:CharWidth
         nColCharSet := 60 * oPrinter:CharWidth
         oPrinter:NewLine()

LOCAL aName, aSize, aDate, aTime, aAttr, tmp
LOCAL nLen := ADir( "*.dbf" )  // Number of JPG files in this directory

altd()
IF nLen > 0
   aName := Array( nLen )  // make room to store the information
   aSize := Array( nLen )
   aDate := Array( nLen )
   aTime := Array( nLen )
   aAttr := Array( nLen )

   ADir( "*.dbf", aName, aSize, aDate, aTime, aAttr )
   FOR tmp := 1 TO nLen
      ? ;
         aName[ tmp ], ;
         aSize[ tmp ], ;
         aDate[ tmp ], ;
         aTime[ tmp ], ;
         aAttr[ tmp ]
   NEXT
ELSE
   ? "This directory is clean from smut"
ENDIF

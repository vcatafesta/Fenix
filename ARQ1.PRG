save scre to A1
do whil .t.
   use comp exclusive
   drt := 'C:'
   if neterr()
      Unlock
      Use
      set color to G+/r+
      @ 09,21 to 14,49
      @ 10,22 to 13,48
      @ 11,23 say '  * Acesso compartilhado!'
      @ 12,23 say '         Aguarde...      '
   else
      exit
   endi
endd
tcor()
rest scre from A1


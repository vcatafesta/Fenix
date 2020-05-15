save scre to A29
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='bancnota'
   else
      drt='T:'
      acess='T:\bancnota'
   endi
   Unlock
   use &acess exclusive
   if neterr()
      set color to G+/r+
      @ 09,21 to 14,49
      @ 10,22 to 13,48
      @ 11,23 say '  * Acesso compartilhado!'
      @ 12,23 say '         Aguarde...      '
      tcor()
   else
      exit
   endi
endd
rest scre from A29


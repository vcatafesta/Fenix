save scre to A22
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='chec'
   else
      drt='T:'
      acess='T:\chec'
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
rest scre from A22


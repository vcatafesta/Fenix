#include "fenix.ch"

function Arq1()
***************
	Local cScreen := SaveScreen()

	while true
	   use comp exclusive
	   drt := 'C:'
	   if neterr()
	      Unlock
	      Use
	      SetColor("G+/r+")
	      @ 09,21 to 14,49
	      @ 10,22 to 13,48
	      @ 11,23 say '  * Acesso compartilhado!'
	      @ 12,23 say '         Aguarde...      '
	   else
	      exit
	   end
	end
	CorNormal()
	Restela(cScreen)
	return

function arq2()
***************
save scre to A2
do whil .t.
   arq1()
   if comp = 'SERVIDOR'
      drt := 'C:'
      acess := 'cadmerc'
   else
      drt := 'T:'
      acess := 'T:\cadmerc'
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
rest scre from A2


function arq3()
***************
save scre to A3
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt := 'C:'
      acess='cadadm'
   else
      drt := 'T:'
      acess := 'T:\cadadm'
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
rest scre from A3

function arq4()
***************
save scre to A4
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='cadfor'
   else
      drt='T:'
      acess='T:\cadfor'
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
rest scre from A4

function arq5()
***************
save scre to A5
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
*      drt := 'C:'
      acess := 'cadcli'
   else
*      drt := 'T:'
      acess := 'T:\cadcli'
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
rest scre from A5

function arq6()
***************
save scre to A6
do whil .t.
   arq1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='compras'
   else
      drt='T:'
      acess='T:\compras'
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
rest scre from A6

function arq7()
***************
save scre to A7
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='baixacom'
   else
      drt='T:'
      acess='T:\baixacom'
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
rest scre from A7


function arq8()
***************
save scre to A8
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='gastos'
   else
      drt='T:'
      acess='T:\gastos'
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
rest scre from A8

function arq9()
***************
save scre to A9
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='desc'
   else
      drt='T:'
      acess='T:\desc'
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
rest scre from A9

function arq10()
****************
save scre to A10
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='arq_emb'
   else
      drt='T:'
      acess='T:\arq_emb'
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
rest scre from A10

function arq11()
****************
save scre to A11
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='cadprod'
   else
      drt='T:'
      acess='T:\cadprod'
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
rest scre from A11

function arq12()
****************
save scre to A12
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='embals'
   else
      drt='T:'
      acess='T:\embals'
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
rest scre from A12

function arq13()
*****************
save scre to A13
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='entrada'
   else
      drt='T:'
      acess='T:\entrada'
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
rest scre from A13

function arq14()
****************
save scre to A14
do whil .t.
   ARQ1()
   if comp = 'SERVIDOR'
      drt='C:'
      acess='estoque'
   else
      drt='T:'
      acess='T:\estoque'
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
rest scre from A14



#include "fenix.ch"

Static aDbfs := {	"comp",;
					"cadmerc",;
					"cadadm",;
					"cadfor",;
					"cadcli",;
					"compras",;
					"baixacom",;
					"gastos",;
					"desc",;
					"arq_emb",;
					"cadprod",;
					"embals",;
					"entrada",;
					"estoque",;
					"vendas",;
					"baixaven",;
					"dad_nfen",;
					"clmntdet",;
					"imposto",;
					"bcdesc",;
					"clafisc",;
					"chec",;
					"usuario",;
					"frete",;
					"ftmto",;
					"bcntacom",;
					"cadicms",;
					"cfop",;
					"bancnota",;
					"cadclas",;
					"cadfun",;
					"cheq",;
					"percmer",;
					"pgfun",;
					"hora",;
					"demovi",;
					"dpcarg",;
					"cadlin",;
					"crealin",;
					"cdade",;
					"sit_trib",;
					"cadcons",;
					"data_sem",;
					"dialet",;
					"justific",;
					"controld",;
					"opflh",;
					"despesa",;
					"represen",;
					"venrepre",;
					"cadesp",;
					"cadhis",;
					"lembre",;
					"orcmto",;
					"ctr_ent",;
					"nfat",;
					"vazil",;
					"sldvaz",;
					"ctrvaz",;
					"comcx",;
					"comvz",;
					"regiao",;
					"cmda",;
					"estq_c",;
					"pgfat",;
					"bco",;
					"abcprod",;
					"ocor",;
					"rgvaz",;
					"ven_m",;
					"abc_cli",;
					"relcom",;
					"devoluc",;
					"etq_dv",;
					"estorno",;
					"frota",;
					"ivt",;
					"nfcomp",;
					"cpom",;
					"tblp",;
					"cadfrete",;
					"status",;
					"",;
					"",;
					"",;
					"cbo",;
					"cest",;
					"log",;
					"reajuste",;
					"agplote",;
					"imprped",;
					"etiqueta",;
					"etqenv",;
					"etqpre"}

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

function area()
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

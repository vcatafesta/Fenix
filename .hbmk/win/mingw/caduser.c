/* C source generated by Harbour */

#include "hbvmpub.h"
#include "hbinit.h"

HB_FUNC( CADUSER );
HB_FUNC_EXTERN( SAVESCREEN );
HB_FUNC_EXTERN( MAXROW );
HB_FUNC_EXTERN( MAXCOL );
HB_FUNC_EXTERN( SCROLL );
HB_FUNC_EXTERN( SETPOS );
HB_FUNC_EXTERN( SETCOLOR );
HB_FUNC_EXTERN( DEVPOS );
HB_FUNC_EXTERN( DEVOUT );
HB_FUNC_EXTERN( TCOR );
HB_FUNC_EXTERN( DISPBOX );
HB_FUNC_EXTERN( ROW );
HB_FUNC_EXTERN( COL );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( __GET );
HB_FUNC_EXTERN( ATAIL );
HB_FUNC_EXTERN( READMODAL );
HB_FUNC_EXTERN( __QUIT );
HB_FUNC_EXTERN( RESTSCREEN );
HB_FUNC_EXTERN( SPACE );
HB_FUNC_EXTERN( ARQ23 );
HB_FUNC_EXTERN( __DBLOCATE );
HB_FUNC_EXTERN( EOF );
HB_FUNC_EXTERN( ARQ31 );
HB_FUNC_EXTERN( DBUNLOCK );
HB_FUNC_EXTERN( DBCLOSEAREA );
HB_FUNC_EXTERN( MDFUNC );
HB_FUNC_EXTERN( DATE );
HB_FUNC_EXTERN( READKILL );
HB_FUNC_EXTERN( DBAPPEND );
HB_FUNC_EXTERN( MDSUCES );
HB_FUNC_EXTERN( EXISCAD );

HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_CADUSER )
{ "CADUSER", { HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL }, { HB_FUNCNAME( CADUSER ) }, NULL },
{ "SAVESCREEN", { HB_FS_PUBLIC }, { HB_FUNCNAME( SAVESCREEN ) }, NULL },
{ "MAXROW", { HB_FS_PUBLIC }, { HB_FUNCNAME( MAXROW ) }, NULL },
{ "MAXCOL", { HB_FS_PUBLIC }, { HB_FUNCNAME( MAXCOL ) }, NULL },
{ "CADUSER", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "DDA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "LP", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "SCROLL", { HB_FS_PUBLIC }, { HB_FUNCNAME( SCROLL ) }, NULL },
{ "SETPOS", { HB_FS_PUBLIC }, { HB_FUNCNAME( SETPOS ) }, NULL },
{ "CAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "SETCOLOR", { HB_FS_PUBLIC }, { HB_FUNCNAME( SETCOLOR ) }, NULL },
{ "DEVPOS", { HB_FS_PUBLIC }, { HB_FUNCNAME( DEVPOS ) }, NULL },
{ "DEVOUT", { HB_FS_PUBLIC }, { HB_FUNCNAME( DEVOUT ) }, NULL },
{ "TCOR", { HB_FS_PUBLIC }, { HB_FUNCNAME( TCOR ) }, NULL },
{ "DISPBOX", { HB_FS_PUBLIC }, { HB_FUNCNAME( DISPBOX ) }, NULL },
{ "ROW", { HB_FS_PUBLIC }, { HB_FUNCNAME( ROW ) }, NULL },
{ "COL", { HB_FS_PUBLIC }, { HB_FUNCNAME( COL ) }, NULL },
{ "AADD", { HB_FS_PUBLIC }, { HB_FUNCNAME( AADD ) }, NULL },
{ "GETLIST", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "__GET", { HB_FS_PUBLIC }, { HB_FUNCNAME( __GET ) }, NULL },
{ "DISPLAY", { HB_FS_PUBLIC | HB_FS_MESSAGE }, { NULL }, NULL },
{ "ATAIL", { HB_FS_PUBLIC }, { HB_FUNCNAME( ATAIL ) }, NULL },
{ "READMODAL", { HB_FS_PUBLIC }, { HB_FUNCNAME( READMODAL ) }, NULL },
{ "LOGFAN", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "__QUIT", { HB_FS_PUBLIC }, { HB_FUNCNAME( __QUIT ) }, NULL },
{ "SHA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "MSG", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "F", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "RESTSCREEN", { HB_FS_PUBLIC }, { HB_FUNCNAME( RESTSCREEN ) }, NULL },
{ "SPACE", { HB_FS_PUBLIC }, { HB_FUNCNAME( SPACE ) }, NULL },
{ "SHA2", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ARQ23", { HB_FS_PUBLIC }, { HB_FUNCNAME( ARQ23 ) }, NULL },
{ "__DBLOCATE", { HB_FS_PUBLIC }, { HB_FUNCNAME( __DBLOCATE ) }, NULL },
{ "FANTAZIA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "EOF", { HB_FS_PUBLIC }, { HB_FUNCNAME( EOF ) }, NULL },
{ "CD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CODUS", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ARQ31", { HB_FS_PUBLIC }, { HB_FUNCNAME( ARQ31 ) }, NULL },
{ "CODFUN", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "DBUNLOCK", { HB_FS_PUBLIC }, { HB_FUNCNAME( DBUNLOCK ) }, NULL },
{ "DBCLOSEAREA", { HB_FS_PUBLIC }, { HB_FUNCNAME( DBCLOSEAREA ) }, NULL },
{ "MDFUNC", { HB_FS_PUBLIC }, { HB_FUNCNAME( MDFUNC ) }, NULL },
{ "NFUNC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "NME", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "BAIRRO", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "BRRO", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CDDE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CDAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "UF", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ESTD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ENDRCO", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ENDER", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "DATE", { HB_FS_PUBLIC }, { HB_FUNCNAME( DATE ) }, NULL },
{ "DT", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "READKILL", { HB_FS_PUBLIC }, { HB_FUNCNAME( READKILL ) }, NULL },
{ "R", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "BLQ", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CODUSU", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "DBAPPEND", { HB_FS_PUBLIC }, { HB_FUNCNAME( DBAPPEND ) }, NULL },
{ "SENHA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "DTCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CADASTRO", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "VENDA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "REGV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "BXV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "EDTV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ESTQV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "LSTV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "PSQV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "NFV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "COMPRA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "REGC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "BXC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "EDTC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "LSTC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ESTQC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "PSQC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "NFC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ETQC", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ESTOQUE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "PLNE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CNCE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "EDTE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "PERE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "RGPE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CHEQ", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "DPE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "LJA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "FNA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ETQED", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "FTV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "NFE", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "NFSA", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "NFEN", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "DVV", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CLICAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "FORCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "MERCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "PROCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CFOCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CDBCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "ESTCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CLACAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "MUNCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "REPCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "TRACAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "CESCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "EMBCAD", { HB_FS_PUBLIC | HB_FS_MEMVAR }, { NULL }, NULL },
{ "MDSUCES", { HB_FS_PUBLIC }, { HB_FUNCNAME( MDSUCES ) }, NULL },
{ "EXISCAD", { HB_FS_PUBLIC }, { HB_FUNCNAME( EXISCAD ) }, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_CADUSER, "", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_CADUSER
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_CADUSER )
   #include "hbiniseg.h"
#endif

HB_FUNC( CADUSER )
{
	static const HB_BYTE pcode[] =
	{
		36,1,0,176,1,0,121,121,176,2,0,12,0,176,3,0,12,0,12,
		4,83,4,0,36,2,0,106,2,32,0,83,5,0,36,3,0,106,2,
		32,0,165,83,5,0,29,241,13,36,4,0,106,2,32,0,83,6,0,
		36,5,0,176,7,0,20,0,176,8,0,121,121,20,2,36,6,0,106,
		24,42,32,67,65,68,65,83,84,82,79,32,68,69,32,85,83,85,181,
		82,73,79,32,42,0,83,9,0,36,7,0,176,10,0,106,5,119,47,
		114,43,0,20,1,36,8,0,176,11,0,121,92,25,20,2,176,12,0,
		109,9,0,20,1,36,9,0,176,13,0,20,0,36,10,0,176,14,0,
		122,121,122,92,79,122,20,5,36,11,0,176,7,0,92,4,92,2,92,
		7,92,77,20,4,176,8,0,92,4,92,2,20,2,36,12,0,176,14,
		0,92,4,92,2,92,7,92,77,122,20,5,36,13,0,176,10,0,106,
		3,114,43,0,20,1,36,14,0,176,11,0,92,2,92,3,20,2,176,
		12,0,106,22,42,32,67,111,110,102,105,114,109,101,32,111,115,32,68,
		97,100,111,115,32,42,0,20,1,36,15,0,176,13,0,20,0,36,16,
		0,176,11,0,92,5,92,4,20,2,176,12,0,106,9,85,115,117,160,
		114,105,111,58,0,20,1,176,8,0,176,15,0,12,0,176,16,0,12,
		0,122,72,20,2,176,17,0,109,18,0,176,19,0,100,106,7,76,79,
		71,102,97,110,0,106,16,33,33,33,33,33,33,33,33,33,33,33,33,
		33,33,33,0,100,100,12,5,20,2,48,20,0,176,21,0,109,18,0,
		12,1,112,0,73,36,17,0,176,22,0,109,18,0,100,100,100,100,100,
		100,20,7,4,0,0,83,18,0,109,18,0,73,36,18,0,109,23,0,
		106,7,32,32,32,32,32,32,0,5,28,10,36,19,0,176,24,0,20,
		0,36,21,0,176,11,0,92,5,92,40,20,2,176,12,0,106,9,83,
		101,110,104,97,46,46,58,0,20,1,36,22,0,176,10,0,106,7,119,
		43,47,110,44,88,0,20,1,36,23,0,176,8,0,92,5,92,49,20,
		2,176,17,0,109,18,0,176,19,0,100,106,4,83,72,65,0,100,100,
		100,12,5,20,2,48,20,0,176,21,0,109,18,0,12,1,112,0,73,
		36,24,0,176,22,0,109,18,0,100,100,100,100,100,100,20,7,4,0,
		0,83,18,0,109,18,0,73,36,25,0,176,13,0,20,0,36,26,0,
		109,25,0,106,7,32,32,32,32,32,32,0,5,29,84,1,36,27,0,
		176,1,0,121,121,176,2,0,12,0,176,3,0,12,0,12,4,83,26,
		0,36,28,0,176,7,0,92,9,92,20,92,12,92,50,20,4,176,8,
		0,92,9,92,20,20,2,36,29,0,176,10,0,106,3,98,43,0,20,
		1,36,30,0,176,14,0,92,9,92,20,92,12,92,50,122,20,5,36,
		31,0,176,10,0,106,6,71,43,47,114,43,0,20,1,36,32,0,106,
		2,32,0,83,27,0,36,33,0,176,11,0,92,10,92,21,20,2,176,
		12,0,106,30,32,32,32,32,32,32,83,69,78,72,65,32,73,78,86,
		181,76,73,68,65,32,33,32,32,32,32,32,32,32,0,20,1,36,34,
		0,176,11,0,92,11,92,21,20,2,176,12,0,106,30,32,32,32,32,
		32,32,32,32,82,101,100,105,103,105,116,101,32,33,33,33,32,32,32,
		32,32,32,32,32,32,0,20,1,36,35,0,176,10,0,106,8,119,47,
		119,47,119,47,119,0,20,1,36,36,0,176,8,0,121,92,60,20,2,
		176,17,0,109,18,0,176,19,0,100,106,2,70,0,100,100,100,12,5,
		20,2,48,20,0,176,21,0,109,18,0,12,1,112,0,73,36,37,0,
		176,22,0,109,18,0,100,100,100,100,100,100,20,7,4,0,0,83,18,
		0,109,18,0,73,36,38,0,176,13,0,20,0,36,39,0,176,28,0,
		121,121,176,2,0,12,0,176,3,0,12,0,109,26,0,20,5,36,40,
		0,106,2,32,0,83,5,0,26,156,252,36,43,0,176,29,0,92,6,
		12,1,83,30,0,36,44,0,176,11,0,92,6,92,40,20,2,176,12,
		0,106,18,67,111,110,102,105,114,109,101,32,97,32,83,101,110,104,97,
		58,0,20,1,36,45,0,176,10,0,106,7,119,43,47,110,44,88,0,
		20,1,36,46,0,176,8,0,92,6,92,58,20,2,176,17,0,109,18,
		0,176,19,0,100,106,5,83,72,65,50,0,100,100,100,12,5,20,2,
		48,20,0,176,21,0,109,18,0,12,1,112,0,73,36,47,0,176,22,
		0,109,18,0,100,100,100,100,100,100,20,7,4,0,0,83,18,0,109,
		18,0,73,36,48,0,176,13,0,20,0,36,49,0,109,25,0,109,30,
		0,69,29,126,1,36,50,0,176,1,0,121,121,176,2,0,12,0,176,
		3,0,12,0,12,4,83,26,0,36,51,0,176,7,0,92,9,92,20,
		92,12,92,50,20,4,176,8,0,92,9,92,20,20,2,36,52,0,176,
		10,0,106,3,98,43,0,20,1,36,53,0,176,14,0,92,9,92,20,
		92,12,92,50,122,20,5,36,54,0,176,10,0,106,6,71,43,47,114,
		43,0,20,1,36,55,0,106,2,32,0,83,27,0,36,56,0,176,11,
		0,92,10,92,21,20,2,176,12,0,106,30,32,32,32,32,65,32,83,
		69,78,72,65,32,78,199,79,32,67,79,78,70,69,82,69,32,32,32,
		32,32,32,0,20,1,36,57,0,176,11,0,92,11,92,21,20,2,176,
		12,0,106,30,32,32,32,32,32,32,32,32,82,101,100,105,103,105,116,
		101,32,33,33,33,32,32,32,32,32,32,32,32,32,0,20,1,36,58,
		0,176,10,0,106,8,119,47,119,47,119,47,119,0,20,1,36,59,0,
		176,8,0,121,92,60,20,2,176,17,0,109,18,0,176,19,0,100,106,
		2,70,0,100,100,100,12,5,20,2,48,20,0,176,21,0,109,18,0,
		12,1,112,0,73,36,60,0,176,22,0,109,18,0,100,100,100,100,100,
		100,20,7,4,0,0,83,18,0,109,18,0,73,36,61,0,176,13,0,
		20,0,36,62,0,176,28,0,121,121,176,2,0,12,0,176,3,0,12,
		0,109,26,0,20,5,36,63,0,176,7,0,92,4,92,2,92,7,92,
		77,20,4,176,8,0,92,4,92,2,20,2,36,64,0,176,14,0,92,
		4,92,2,92,7,92,77,122,20,5,36,65,0,106,2,32,0,83,5,
		0,26,124,250,36,68,0,176,10,0,106,3,98,43,0,20,1,36,69,
		0,176,7,0,92,5,92,40,92,6,92,75,20,4,176,8,0,92,5,
		92,40,20,2,36,70,0,176,10,0,106,6,71,43,47,114,43,0,20,
		1,36,71,0,176,11,0,92,5,92,42,20,2,176,12,0,106,33,83,
		101,110,104,97,32,67,97,100,97,115,116,114,97,100,97,32,67,111,109,
		32,83,117,99,101,115,115,111,32,33,33,33,0,20,1,36,72,0,176,
		13,0,20,0,36,73,0,176,31,0,20,0,36,74,0,176,32,0,90,
		10,109,33,0,109,23,0,5,6,100,100,100,9,20,5,36,75,0,176,
		34,0,12,0,29,161,7,36,76,0,106,2,32,0,83,35,0,36,77,
		0,106,2,32,0,165,83,35,0,29,137,7,36,78,0,106,5,32,32,
		32,32,0,83,36,0,36,79,0,176,11,0,92,10,92,3,20,2,176,
		12,0,106,33,68,105,103,105,116,101,32,111,32,115,101,117,32,67,162,
		100,105,103,111,32,100,111,32,67,97,100,97,115,116,114,111,58,0,20,
		1,176,8,0,176,15,0,12,0,176,16,0,12,0,122,72,20,2,176,
		17,0,109,18,0,176,19,0,100,106,6,67,79,68,85,83,0,100,100,
		100,12,5,20,2,48,20,0,176,21,0,109,18,0,12,1,112,0,73,
		36,80,0,176,22,0,109,18,0,100,100,100,100,100,100,20,7,4,0,
		0,83,18,0,109,18,0,73,36,81,0,109,36,0,106,5,32,32,32,
		32,0,5,32,228,6,36,84,0,176,37,0,20,0,36,85,0,176,32,
		0,90,10,109,38,0,109,36,0,5,6,100,100,100,9,20,5,36,86,
		0,176,34,0,12,0,28,39,36,87,0,176,39,0,20,0,36,88,0,
		176,40,0,20,0,36,89,0,176,41,0,20,0,36,90,0,106,2,32,
		0,83,35,0,26,3,255,36,93,0,109,42,0,83,43,0,36,94,0,
		109,44,0,83,45,0,36,95,0,109,46,0,83,47,0,36,96,0,109,
		48,0,83,49,0,36,97,0,109,50,0,83,51,0,36,98,0,176,52,
		0,12,0,83,53,0,36,99,0,176,39,0,20,0,36,100,0,176,40,
		0,20,0,36,101,0,176,7,0,92,10,92,3,92,12,92,76,20,4,
		176,8,0,92,10,92,3,20,2,36,102,0,176,11,0,92,10,92,3,
		20,2,176,12,0,106,20,67,162,100,105,103,111,32,100,111,32,67,97,
		100,97,115,116,114,111,58,0,20,1,176,8,0,176,15,0,12,0,176,
		16,0,12,0,122,72,20,2,176,17,0,109,18,0,176,19,0,100,106,
		6,67,111,100,117,115,0,100,100,100,12,5,20,2,48,20,0,176,21,
		0,109,18,0,12,1,112,0,73,36,103,0,176,11,0,92,12,92,3,
		20,2,176,12,0,106,20,78,111,109,101,32,67,111,109,112,108,101,116,
		111,46,46,46,46,46,58,0,20,1,176,8,0,176,15,0,12,0,176,
		16,0,12,0,122,72,20,2,176,17,0,109,18,0,176,19,0,100,106,
		4,78,77,69,0,100,100,100,12,5,20,2,48,20,0,176,21,0,109,
		18,0,12,1,112,0,73,36,104,0,176,11,0,92,14,92,3,20,2,
		176,12,0,106,20,69,110,100,101,114,101,135,111,46,46,46,46,46,46,
		46,46,46,46,58,0,20,1,176,8,0,176,15,0,12,0,176,16,0,
		12,0,122,72,20,2,176,17,0,109,18,0,176,19,0,100,106,6,101,
		110,100,101,114,0,100,100,100,12,5,20,2,48,20,0,176,21,0,109,
		18,0,12,1,112,0,73,36,105,0,176,11,0,92,16,92,3,20,2,
		176,12,0,106,20,66,97,105,114,114,111,46,46,46,46,46,46,46,46,
		46,46,46,46,58,0,20,1,176,8,0,176,15,0,12,0,176,16,0,
		12,0,122,72,20,2,176,17,0,109,18,0,176,19,0,100,106,5,98,
		114,114,111,0,100,100,100,12,5,20,2,48,20,0,176,21,0,109,18,
		0,12,1,112,0,73,36,106,0,176,11,0,92,18,92,3,20,2,176,
		12,0,106,20,67,105,100,97,100,101,46,46,46,46,46,46,46,46,46,
		46,46,46,58,0,20,1,176,8,0,176,15,0,12,0,176,16,0,12,
		0,122,72,20,2,176,17,0,109,18,0,176,19,0,100,106,5,99,100,
		97,100,0,100,100,100,12,5,20,2,48,20,0,176,21,0,109,18,0,
		12,1,112,0,73,36,107,0,176,11,0,92,18,92,50,20,2,176,12,
		0,106,8,69,115,116,97,100,111,58,0,20,1,176,8,0,176,15,0,
		12,0,176,16,0,12,0,122,72,20,2,176,17,0,109,18,0,176,19,
		0,100,106,5,101,115,116,100,0,106,3,33,33,0,100,100,12,5,20,
		2,48,20,0,176,21,0,109,18,0,12,1,112,0,73,36,108,0,176,
		11,0,92,20,92,3,20,2,176,12,0,106,20,68,97,116,97,32,100,
		111,32,67,97,100,97,115,116,114,111,46,46,58,0,20,1,176,8,0,
		176,15,0,12,0,176,16,0,12,0,122,72,20,2,176,17,0,109,18,
		0,176,19,0,100,106,3,100,116,0,100,100,100,12,5,20,2,48,20,
		0,176,21,0,109,18,0,12,1,112,0,73,36,109,0,176,54,0,120,
		20,1,4,0,0,83,18,0,109,18,0,73,36,110,0,176,11,0,92,
		22,92,3,20,2,176,12,0,106,52,42,32,67,111,110,102,105,114,109,
		97,32,111,115,32,68,97,100,111,115,32,97,99,105,109,97,32,112,97,
		114,97,32,99,97,100,97,115,116,114,97,109,101,110,116,111,63,32,60,
		83,47,78,62,0,20,1,176,8,0,176,15,0,12,0,176,16,0,12,
		0,122,72,20,2,176,17,0,109,18,0,176,19,0,100,106,2,82,0,
		106,2,33,0,90,12,109,55,0,106,3,83,78,0,24,6,100,12,5,
		20,2,48,20,0,176,21,0,109,18,0,12,1,112,0,73,36,111,0,
		176,22,0,109,18,0,100,100,100,100,100,100,20,7,4,0,0,83,18,
		0,109,18,0,73,36,112,0,106,2,66,0,83,56,0,36,113,0,109,
		55,0,106,2,83,0,69,28,15,36,114,0,106,2,120,0,83,6,0,
		26,210,2,36,117,0,176,31,0,20,0,36,118,0,176,32,0,90,10,
		109,57,0,109,36,0,5,6,100,100,100,9,20,5,36,119,0,176,34,
		0,12,0,29,123,2,36,120,0,176,39,0,20,0,36,121,0,176,40,
		0,20,0,36,122,0,176,31,0,20,0,36,123,0,176,58,0,20,0,
		36,124,0,109,36,0,78,57,0,109,23,0,78,33,0,109,25,0,78,
		59,0,109,53,0,78,60,0,36,125,0,109,56,0,78,61,0,109,56,
		0,78,62,0,109,56,0,78,63,0,109,56,0,78,64,0,109,56,0,
		78,65,0,109,56,0,78,66,0,36,126,0,109,56,0,78,67,0,109,
		56,0,78,68,0,109,56,0,78,69,0,109,56,0,78,70,0,36,127,
		0,109,56,0,78,71,0,109,56,0,78,72,0,109,56,0,78,73,0,
		109,56,0,78,74,0,36,128,0,109,56,0,78,75,0,109,56,0,78,
		76,0,109,56,0,78,77,0,109,56,0,78,78,0,36,130,0,109,56,
		0,78,79,0,109,56,0,78,80,0,109,56,0,78,81,0,109,56,0,
		78,82,0,109,56,0,78,83,0,36,131,0,109,56,0,78,84,0,109,
		56,0,78,85,0,109,56,0,78,86,0,109,56,0,78,87,0,109,56,
		0,78,88,0,36,132,0,109,56,0,78,89,0,109,56,0,78,90,0,
		109,56,0,78,91,0,109,56,0,78,92,0,109,56,0,78,93,0,109,
		56,0,78,94,0,36,134,0,109,56,0,78,95,0,109,56,0,78,96,
		0,109,56,0,78,97,0,109,56,0,78,98,0,109,56,0,78,99,0,
		36,135,0,109,56,0,78,100,0,109,56,0,78,101,0,109,56,0,78,
		102,0,109,56,0,78,103,0,109,56,0,78,104,0,36,136,0,109,56,
		0,78,105,0,109,56,0,78,106,0,109,56,0,78,107,0,36,138,0,
		176,39,0,20,0,36,139,0,176,40,0,20,0,36,140,0,176,108,0,
		20,0,36,141,0,176,7,0,92,10,92,3,92,22,92,78,20,4,176,
		8,0,92,10,92,3,20,2,36,142,0,176,11,0,92,11,92,4,20,
		2,176,12,0,106,46,65,103,111,114,97,32,111,32,115,105,115,116,101,
		109,97,32,115,101,114,160,32,102,101,99,104,97,100,111,32,97,117,116,
		111,109,97,116,105,99,97,109,101,110,116,101,46,0,20,1,36,143,0,
		176,11,0,92,12,92,4,20,2,176,12,0,106,36,32,45,32,76,111,
		103,117,101,32,99,111,109,32,111,115,32,100,97,100,111,115,32,99,97,
		100,97,115,116,114,97,100,111,115,32,33,0,20,1,176,8,0,176,15,
		0,12,0,176,16,0,12,0,122,72,20,2,176,17,0,109,18,0,176,
		19,0,100,106,4,68,68,65,0,100,100,100,12,5,20,2,48,20,0,
		176,21,0,109,18,0,12,1,112,0,73,36,144,0,176,22,0,109,18,
		0,100,100,100,100,100,100,20,7,4,0,0,83,18,0,109,18,0,73,
		36,145,0,176,24,0,20,0,26,157,248,36,147,0,176,7,0,92,10,
		92,3,92,22,92,78,20,4,176,8,0,92,10,92,3,20,2,36,148,
		0,176,109,0,20,0,36,149,0,106,2,32,0,83,35,0,26,111,248,
		36,156,0,109,6,0,106,2,120,0,69,29,53,242,36,157,0,176,7,
		0,92,10,92,3,92,22,92,78,20,4,176,8,0,92,10,92,3,20,
		2,36,158,0,176,109,0,20,0,36,159,0,106,2,32,0,83,5,0,
		26,7,242,36,163,0,176,28,0,121,121,176,2,0,12,0,176,3,0,
		12,0,109,4,0,20,5,7
	};

	hb_vmExecute( pcode, symbols );
}
/* C source generated by Harbour */

#include "hbvmpub.h"
#include "hbinit.h"

HB_FUNC( ADIR );
HB_FUNC_EXTERN( ALTD );
HB_FUNC_EXTERN( ARRAY );
HB_FUNC_EXTERN( QOUT );

HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_ADIR )
{ "ADIR", { HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL }, { HB_FUNCNAME( ADIR ) }, NULL },
{ "ALTD", { HB_FS_PUBLIC }, { HB_FUNCNAME( ALTD ) }, NULL },
{ "ARRAY", { HB_FS_PUBLIC }, { HB_FUNCNAME( ARRAY ) }, NULL },
{ "QOUT", { HB_FS_PUBLIC }, { HB_FUNCNAME( QOUT ) }, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_ADIR, "", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_ADIR
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_ADIR )
   #include "hbiniseg.h"
#endif

HB_FUNC( ADIR )
{
	static const HB_BYTE pcode[] =
	{
		13,7,0,36,2,0,176,0,0,106,6,42,46,100,98,102,0,12,1,
		80,7,36,4,0,176,1,0,20,0,36,5,0,95,7,121,15,29,144,
		0,36,6,0,176,2,0,95,7,12,1,80,1,36,7,0,176,2,0,
		95,7,12,1,80,2,36,8,0,176,2,0,95,7,12,1,80,3,36,
		9,0,176,2,0,95,7,12,1,80,4,36,10,0,176,2,0,95,7,
		12,1,80,5,36,12,0,176,0,0,106,6,42,46,100,98,102,0,95,
		1,95,2,95,3,95,4,95,5,20,6,36,13,0,122,165,80,6,25,
		41,36,19,0,176,3,0,95,1,95,6,1,95,2,95,6,1,95,3,
		95,6,1,95,4,95,6,1,95,5,95,6,1,20,5,36,13,0,175,
		6,0,95,7,15,28,214,25,46,36,22,0,176,3,0,106,34,84,104,
		105,115,32,100,105,114,101,99,116,111,114,121,32,105,115,32,99,108,101,
		97,110,32,102,114,111,109,32,115,109,117,116,0,20,1,36,23,0,7
	};

	hb_vmExecute( pcode, symbols );
}
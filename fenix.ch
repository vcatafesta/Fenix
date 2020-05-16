#include "button.ch"
#include "inkey.ch"
//#require "hbwin"
#define FORM_A4 9
#define RGB( nR,nG,nB ) ( nR + ( nG * 256 ) + ( nB * 256 * 256 ) ) 
#define PS_SOLID   	0
#define BLACK           RGB( 0x0 ,0x0 ,0x0 ) 
#define BLUE            RGB( 0x0 ,0x0 ,0x85 ) 
#define GREEN           RGB( 0x0 ,0x85,0x0 ) 
#define CYAN            RGB( 0x0 ,0x85,0x85 ) 
#define RED             RGB( 0x85,0x0 ,0x0 ) 
#define MAGENTA         RGB( 0x85,0x0 ,0x85 ) 
#define BROWN           RGB( 0x85,0x85,0x0 ) 
#define WHITE           RGB( 0xC6,0xC6,0xC6 ) 
#define TRUE 		.t.
#define true 		.t.
#define OK   		.t.
#define FALSE		.f.
#define NOK   		.f.
#define FORM_A4 	9

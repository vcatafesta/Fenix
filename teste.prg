cls


   #define B_SINGLE   1
   #define B_DOUBLE   2
   //
   DispBox(1, 1, 10, 10, B_DOUBLE, "BG+/B")

   #include "Box.ch"
   //
   DispBox(1, 1, 10, 10, B_SINGLE_DOUBLE, "BG+/B")

   // Display a box with a 3D look of constant width 16x16x16x16
   DispBox( nTop, nLeft, nBottom, nRight, LLG_BOX_GRAY_SQUARE )

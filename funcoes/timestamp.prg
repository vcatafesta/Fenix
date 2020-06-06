REQUEST HB_LANG_PT

// { ^ [ YYYY-MM-DD [,] ] [ HH[:MM[:SS][.FFF]] [AM|PM] ] }
// t"YYYY-MM-DD [H[H][:M[M][:S[S][.f[f[f[f]]]]]]] [PM|AM]"
// t"YYYY-MM-DDT[H[H][:M[M][:S[S][.f[f[f[f]]]]]]] [PM|AM]"
proc main()
   Local t1 := {^ 2012-11-28 10:22:30 }   // или {^ 2012/11/28 10:22:30 }
   Local t2 := t"2009-03-21 17:31:45.437" // или t"2009-03-21T17:31:45.437"
 
   ? t1 + 1      // 11/29/12 10:22:30.000
   ? t1 - t2     // 1347.701905
? YOU

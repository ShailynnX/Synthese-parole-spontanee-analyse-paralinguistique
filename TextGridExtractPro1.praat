#script praat pour extraction les features besoins pour synthèse de la précrit par ma camarade yuyan, merci
 
directory$ = "/Users/shailynnxie/Documents/M2/SynthèseDeParole/ Projet Final/"
baseName$ = "T5"
 w a v N a m e $   =   b a s e N a m e $   +   " . w a v " 
 t e x t g r i d N a m e $   =   b a s e N a m e $   +   " . T e x t G r i d " 
 
 #   C h a r g e m e n t   d e s   f i c h i e r s   . w a v   e t   . T e x t G r i d 
 R e a d   f r o m   f i l e . . .   ' d i r e c t o r y $ ' ' w a v N a m e $ ' 
 R e a d   f r o m   f i l e . . .   ' d i r e c t o r y $ ' ' t e x t g r i d N a m e $ ' 
 
 #   S � l e c t i o n   d u   T e x t G r i d 
 s e l e c t O b j e c t :   " T e x t G r i d   ' b a s e N a m e $ ' " 
 
 #   O b t e n t i o n   d u   n o m b r e   d ' i n t e r v a l l e s   d a n s   l e   t r o i s i � m e   t i e r 
 n u m b e r O f I n t e r v a l s   =   G e t   n u m b e r   o f   i n t e r v a l s :   3 
 
 a p p e n d I n f o L i n e :   " ; P h o       " ,   " D u r � e ( m s )     " ,   "   P i t c h / F 0   ( H z ) " 
 
 #   S � l e c t i o n   d u   S o u n d   c o r r e s p o n d a n t   p o u r   e x t r a i r e   l a   F 0   e t   l ' i n t e n s i t � 
 s e l e c t O b j e c t :   " S o u n d   ' b a s e N a m e $ ' " 
 
 #   C r � a t i o n   d e   l ' o b j e t   P i t c h 
 T o   P i t c h :   0 . 0 ,   7 5 ,   6 0 0   
 
 
 #   B o u c l e   s u r   c h a q u e   i n t e r v a l l e 
 f o r   i   f r o m   1   t o   n u m b e r O f I n t e r v a l s 
         #   S � l e c t i o n   d u   T e x t G r i d 
         s e l e c t O b j e c t :   " T e x t G r i d   ' b a s e N a m e $ ' " 
         
         #   O b t e n t i o n   d e   l ' � t i q u e t t e   ( l a b e l )   e t   d e s   p o i n t s   d e   t e m p s   d e   l ' i n t e r v a l l e 
         l a b e l $   =   G e t   l a b e l   o f   i n t e r v a l :   3 ,   i 
         s t a r t T i m e   =   G e t   s t a r t i n g   p o i n t :   3 ,   i 
         e n d T i m e   =   G e t   e n d   p o i n t :   3 ,   i 
 	 
 	 
 	 #   t r a n s f o r m e r   e n   M i l l e s e c o n d e 
 	 d u r a t i o n   =   r o u n d ( ( e n d T i m e   -   s t a r t T i m e )   *   1 0 0 0 ) 
         
         #   S � l e c t i o n   d e   l ' o b j e t   P i t c h   p o u r   o b t e n i r   l a   v a l e u r   d e   F 0 
         s e l e c t O b j e c t :   " P i t c h   ' b a s e N a m e $ ' " 
         f 0   =   G e t   v a l u e   a t   t i m e :   s t a r t T i m e ,   " H e r t z " ,   " L i n e a r " 
 	 
 
         
         #   A f f i c h a g e   d e s   r � s u l t a t s   e t   � l i m i e r   l e s   s � q u e n c e s   s a n s   f 0 
 	   i f   l a b e l $   = =   " " 
 	 	 a p p e n d I n f o L i n e :   " -   "   , d u r a t i o n 
 	 e l s e   
 	 	 i f   f 0   >   1 
 	 	 	 r o u n d F 0   =   r o u n d ( f 0 ) 
 	 	 	 a p p e n d I n f o L i n e :   l a b e l $ ,   "   "   , d u r a t i o n ,   "   5 0   "   , r o u n d F 0   
         	 e l s e 
 	 	 	 a p p e n d I n f o L i n e :   l a b e l $ ,   "   "   , d u r a t i o n 
 	 	 e n d i f 
 	 e n d i f 
 e n d f o r 
 

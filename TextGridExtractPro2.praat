�� c l e a r i n f o 
#script praat pour extraction les features besoins pour synthèse de la précrit par ma camarade yuyan, merci

 d i r e c t o r y $   =   " / U s e r s / y u y a n q / D e s k t o p / M 2 - 1 / U E 2 P a r o l e / M o d u l e 3 _ s y n t h e s e _ d e _ l a _ p a r o l e / p r o j e t / r e s s o u r c e s / " 
 b a s e N a m e $   =   " T 1 1 " 
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
 a p p e n d I n f o L i n e :   " P h o " ,   "   D u r � e ( m s )   " ,   " F 0   i n i t i a l e ( H z )     " ,     " F 0   c e n t r a l e   ( H z ) " 
 
 #   S � l e c t i o n   d u   S o u n d   c o r r e s p o n d a n t   p o u r   e x t r a i r e   l a   F 0   e t   l ' i n t e n s i t � 
 s e l e c t O b j e c t :   " S o u n d   ' b a s e N a m e $ ' " 
 
 #   C r � a t i o n   d e   l ' o b j e t   P i t c h 
 T o   P i t c h :   0 . 0 ,   7 5 ,   6 0 0   
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
 
 	 #   C a l c u l   d u   p o i n t   m i l i e u 
         m i d P o i n t   =   ( s t a r t T i m e   +   e n d T i m e )   /   2     
         
         #   T r a n s f o r m e r   e n   M i l l i s e c o n d e s   p o u r   l a   d u r � e 
         d u r a t i o n   =   r o u n d ( ( e n d T i m e   -   s t a r t T i m e )   *   1 0 0 0 ) 
         
         #   S � l e c t i o n   d e   l ' o b j e t   P i t c h   p o u r   o b t e n i r   l a   v a l e u r   d e   F 0   a u   d � b u t   e t   a u   m i l i e u 
         s e l e c t O b j e c t :   " P i t c h   ' b a s e N a m e $ ' " 
         f 0 S t a r t   =   G e t   v a l u e   a t   t i m e :   s t a r t T i m e ,   " H e r t z " ,   " L i n e a r " 
         f 0 M i d   =   G e t   v a l u e   a t   t i m e :   m i d P o i n t ,   " H e r t z " ,   " L i n e a r " 
         
         #   A r r o n d i r   l e s   v a l e u r s   d e   F 0   s i   e l l e s   s o n t   v a l i d e s 
 
         i f   f 0 M i d   >   1   
 	 	 f 0 M i d   =   r o u n d ( f 0 M i d )   
 	 e n d i f 
         
         #   A f f i c h a g e   d e s   r � s u l t a t s 
         i f   l a b e l $   = =   " " 
 	 	 a p p e n d I n f o L i n e :   " _   "   , d u r a t i o n 
 	 e l s e   
 	 	 i f   f 0 S t a r t   >   1   a n d   f 0 M i d   >   1   
 	 	 	 f 0 S t a r t   =   r o u n d ( f 0 S t a r t ) 
 	 	 	 f 0 M i d   =   r o u n d ( f 0 M i d )   
 	 	 	 a p p e n d I n f o L i n e :   l a b e l $ ,   "         " ,   d u r a t i o n ,   "           0     " ,   f 0 S t a r t ,   "       5 0   " ,   f 0 M i d 
 	 	 e l s e 
                     a p p e n d I n f o L i n e :   l a b e l $ ,   "         " ,   d u r a t i o n 
 	 	 e n d i f 
         e n d i f 
 e n d f o r 

FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ; 5 prompt the user to enter a timer duration in minutes     � 	 	 j   p r o m p t   t h e   u s e r   t o   e n t e r   a   t i m e r   d u r a t i o n   i n   m i n u t e s   
  
 l     ��������  ��  ��        l     ����  r         I    ��  
�� .sysodlogaskr        TEXT  m        �   4 T i m e r   d u r a t i o n   i n   m i n u t e s :  ��  
�� 
dtxt  m       �      ��  
�� 
btns  J           m       �    C a n c e l    ��   m     ! ! � " " 
 S t a r t��    �� # $
�� 
dflt # m   	 
 % % � & & 
 S t a r t $ �� '��
�� 
disp ' I   �� ( )
�� .sysorpthalis        TEXT ( m     * * � + +  R e m i n d e r s . i c n s ) �� ,��
�� 
in B , l    -���� - 4    �� .
�� 
alis . m     / / � 0 0 P M a c i n t o s h   H D : A p p l i c a t i o n s : R e m i n d e r s . a p p :��  ��  ��  ��    o      ���� 0 
timerpopup 
timerPopup��  ��     1 2 1 l     ��������  ��  ��   2  3�� 3 l   g 4���� 4 Z    g 5 6���� 5 =   ) 7 8 7 n    % 9 : 9 1   ! %��
�� 
bhit : o    !���� 0 
timerpopup 
timerPopup 8 m   % ( ; ; � < < 
 S t a r t 6 k   , c = =  > ? > I  , 3�� @��
�� .sysodelanull��� ��� nmbr @ m   , / A A ?��Q���   ?  B C B r   4 C D E D l  4 ? F���� F c   4 ? G H G n   4 ; I J I 1   7 ;��
�� 
ttxt J o   4 7���� 0 
timerpopup 
timerPopup H m   ; >��
�� 
nmbr��  ��   E o      ���� &0 durationinminutes durationInMinutes C  K L K r   D S M N M I  D O�� O��
�� .sysorondlong        doub O l  D K P���� P ]   D K Q R Q o   D G���� &0 durationinminutes durationInMinutes R m   G J���� <��  ��  ��   N o      ���� &0 durationinseconds durationInSeconds L  S�� S I  T c�� T��
�� .sysoexecTEXT���     TEXT T b   T _ U V U m   T W W W � X X � b t t _ u s r _ r o o t = $ { B T T _ U S R _ R O O T : - ~ / b e t t e r t o u c h t o o l } ;   " $ { b t t _ u s r _ r o o t } / t i m e r - a p p / t i m e r - a p p - r u n n e r . s h "   V l  W ^ Y���� Y c   W ^ Z [ Z o   W Z���� &0 durationinseconds durationInSeconds [ m   Z ]��
�� 
TEXT��  ��  ��  ��  ��  ��  ��  ��  ��       �� \ ] ^������   \ ��������
�� .aevtoappnull  �   � ****�� 0 
timerpopup 
timerPopup�� &0 durationinminutes durationInMinutes�� &0 durationinseconds durationInSeconds ] �� _���� ` a��
�� .aevtoappnull  �   � **** _ k     g b b   c c  3����  ��  ��   `   a  �� ��  !�� %�� *���� /���������� ; A�������������� W����
�� 
dtxt
�� 
btns
�� 
dflt
�� 
disp
�� 
in B
�� 
alis
�� .sysorpthalis        TEXT�� 
�� .sysodlogaskr        TEXT�� 0 
timerpopup 
timerPopup
�� 
bhit
�� .sysodelanull��� ��� nmbr
�� 
ttxt
�� 
nmbr�� &0 durationinminutes durationInMinutes�� <
�� .sysorondlong        doub�� &0 durationinseconds durationInSeconds
�� 
TEXT
�� .sysoexecTEXT���     TEXT�� h������lv�����)��/l � E` O_ a ,a   <a j O_ a ,a &E` O_ a  j E` Oa _ a &%j Y h ^ �� d e
�� 
bhit d � f f 
 S t a r t e �� g��
�� 
ttxt g � h h  3��  �� �� �ascr  ��ޭ
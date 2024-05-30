#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYK�  m��t����/�߮����    Py�*��p�ɋ��	0D�h�yh�� 4�h@  )�����L�i���4  � �I�4��M=&F�P4 cQ��A�B=  p4d4ѡ�����&� �1 ��"2�&��M��4�zA�����P�aYH��E %[b��Ӣ���Y��U��*����g$�t�(�Q�o����~�$�Im�(@%�7��ٮ�E$�lA�_����3P*x�~�� �-fuI�(�s��J��J���$��dcD/�c�U>5�n����
.�i�(c�D#�_�qV���V	��t,���[!��g��\�u�ff4eSF��JpJ�,l@>PZ8Y���ڄ��ق�W��Jp�M�Y�o屁�F�d��wO�Ԏ�ul�܅�a@u2ˋ�P�D�R]�#�\Vu��:w'��P*x2:�23�n,,"��.�ޝ�Hiy����e�
r,<�K�E��|��e��!LjQ� 
B�V�aR��Mk�y����*�7�8 �T^�P�)V�	U���K��M;4 A�,�F���qRB�Ck�D���$d(�)���m��gߞ��8��&3."�� e����Ki���i#|r�i+����}��#I�⢖Ԋ���S��'�9AwW	�xp�2�����1�2C8�����@"�/8ɻ�=@S�LZI-�������p"( �ؘ��l4[(CU�QH�&R�9P�	@����ڄ
	�V���Z��1�t�0���a$u��]�#߾X��5O	�QF�H#�d��F/puRu��Ƭ���ۙ�2±0!3 {�Wy6(���)"+�UY{L��d��..f,ň��<=��/�P���N�.ll�a������$����&HG��_�d�!{3���i͘�,KTY.�Z/D\uӼ_�j���P)΢7/\*1�������h�ud:���J�[�*t,HRz�"ұ��BX3�*��V�2�vx�q=ĉ�UL0�) <	��Rj<�F�b*�Nءު�)	�2�����n�z�O��Tt����dLr4���H(�	&EXRT��MAd�F-0/,#�ʭ�:�B1[����!�WC\��[�P^��`}���-7i�7��r��yP�6W
!�eJ'�A����Pf�rL	�KJ"�)qo��� B��P�+��rE8P�K� 
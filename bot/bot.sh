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
BZh91AY&SY�ܴj  ���;�}����ޮ����       P,����v�;	$F�CT��#�i�&	�A�h�4̠�OS�h jhORoU6S�)��M�   �  P D�&�50H�)�4j2d�40j0#&�M���F�2i�i��1 h��  	*4&)�zi�����   4 � 4�^|�ص$�xͣZ�~f듎FRM�������d�!Z�+��H��[Q�dT#�^�ײ{t�FV�I�z��DlTׁ^�'M/�DS#�r,��P�g7x�ނ��!6,jf���_��?x��7�l,"����D���5�SW8߂���En��1�g`���Oc��e�x��8��H�m�ۻe�[����9��C�R�����{�H�k�Ǡ�G����$g}uŃ��n1ZG!�>����t��~0�/@���G?`����+��b���&4�"�Ne2׃���z2Ʃ_�$~>7y�um�A��_��M��x��d���d}t<$c���X����	Wf������J�
?�0pO�!��;(1X�|/h�S�:�!�'k���N-n��Y�Ϡ����e�dfd�J�Ιc�8��0ZN��S�X�r�!����j!�; �A��V�L-v�ċtϼ�L�RD�d(	`u�F�%�A����%�bU*�Ȕ�� ��L[ �6�PP�B)�h6>p �u3��`��؂w�O�(רV���6�3��ݧ���&����W���pKXvT\�5���PI��Bk"k�O��-�EB�����9E��Rf���,Q�7%�T�3"����a���[�|��)��Ă�I�Bc���p�zzd}A��w܊j�<YCm
p��(v!_g5"Ũx%��Y@�a��T�ƺڴ�*�y�ܰ��ĕ��7�k���T�)�E�IA	�����x����0L��P!ܡBi�&\�YH)qK!!�p��7�2���ե�6J�+z�M��i�EMV���<���d�IHxFU)B�$�c6#'31�!!��Hː��p�n�f([�ʲ�;T֤�C��))�	��T�Rp����i��C�q�/H�C[��VH5��61��"Y��mdj TS�sdXɫ�BH.I�%��h9�R����]��BB�rѨ
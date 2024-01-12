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
BZh91AY&SY���;  ��� }�����������      P�Qv̅4%��L�OM&(o� di0�d445F�sLFFM2hCFC&@  ��#@�R��'�$�OH  #A�� @sLFFM2hCFC&@  ��#@�IL�Bh�SL�M �A�hA�hѤrd+�T�IdDǂ�	���΋0��k�1a�ر�����w՜�"��z�p����V��,�����UBa�Y�=�J|A2���{�mO�d�IW{>���ZߤcՉ?Y���0���d<��I��NI��Z�9��1�+P�|��ޟ`����+��֤1!�`5�0b
8��m��׸�� gܻ,rF� �B��xh����t�X��A�d�h@�D/r%���Ҵ:�y��-+�T��*\IP�. �[V�����2�0x7P?bVA�m��x����)5~j���g*?	�f`�r_�Jv���H�`f�>�&���
�= ~JCEv\�, 4�:�z�����a��j����5�=���^�ay��3,��XpݗqP�JK��+Iv�~�9�*�9F���Z$�P�+�\2�</+J�W�op/�L�B��×i�e��͒4��q���Bx�:tA��>DP�����>�E���q���U��>���38����z�Bv�C^aD0����J́[����YVG�c��Ave�����E�^s$��b�]d&`�ê�*���R�g@�C��#h����N{�c��Z�#�A������6��9�����O<�S���!��8��ӈ(��a�I ̈���}�� ��l�\ۭ?f��*��Ƶ:���c���4�-�I
��hJ6��{0�1c�BdT��6U
DN�E��kn[E�x�4A����:a_�GO�"9��My�Ӫ���ږ	
{��F"���F����1@BM�� P'F�a��.E�xnw�PYT�����.��
N� L�ܑN$(���
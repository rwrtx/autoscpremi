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
BZh91AY&SYv��s i��t����/�߮����    Py�j��Ӌ�n�22Sce3M�ڑ�@� ��i�� $�F�SɵS��'���yOP2h�4 h �����a�ڍ�4ѐF�4hh�M4�d�hh4��F��� �4��2�#!OB����oR=OP� h�f��A�� �z˩��M�I;�^�<�9\<��{��nU����7{X����vE�Y׿����θ�4Ǣ�S�����w�I
����T�3��N(���NP@ ��:��
�Uߨ�m�mׁ6�R.!(����\j$#��R�3�h�)Ɵ��S8�eQw��\��ꯧ^��<��`��G�@Eh����Y��M�-�0�XrRep��;Vo*�Y9�*�C]XS���-�v�W)w�e)\���p|����X�-�\�:[u���d���@p�\���A"�#D0cR��S�n�Y���,_�X���r������t8�0����wE�CK�x�cL��I/<�����q�f����k���C���1�T-��(�1�~Jjf�F�jX���Į$�59��u�db�7�	-K+4���Z�el{9�ϥQ������-$�
d�C
�B��Ϟ�Z=x�@J!��%����QO7��a�!�^:c����g�3��U<z�>�
?#���sk���A���m�C8�D�s,Z����Bt���.�vM�ڶ�,i���$�HR�-pH�CQ	��BhThc�8"�1�)%� �lX��p��_���=F�V��*���L�231i�a�Cہ8M�5�X��#M�P�­,8,����\CY�7e����`�9�)�\	����b.�1cH�# *���Ak�����lcM豘Eġ�f��ܭD����UU}m"{���\�n��	.�O�LĐ{cIW�� �i.��p uQ����k-�d�V*��xL���\��z�3���vG�5��I<1��CYxѴ!���f�E�+dY��@�S96'p������.��XʝV�il��+RW�7�'�P���~!saP�g0d����_wi�Dn��
x�����mR+���ʒ�șn06x��W��ޠUݒ)�,�A�i��g�%�*�b4~�i�E.%ք���V��k�a1�蚱N���}����V���[	��m�fܼ	�4BR͖�P��a.��J��(�+qd74����������.$$
���rE8P�v��s
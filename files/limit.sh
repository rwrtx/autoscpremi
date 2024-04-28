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
BZh91AY&SY����  �߀ }��?7ߎ?���P~r^���s ɀ�`�C F 9�d�a0L!�# 	5(���M�2�l�i0ɐ���I4
�e=	=OS	���Bf��1���4&����G��h��i������^�;/��;(�5�t���-�#���)nܲ95�.�1�-�"���
]ׇ]�\�'b�S�����e���h���t���+���oh�TUQUEU� �V媪�Ѷ�˙7`~s��CXZ�c1
��%H�oi����̄Ai�y�"1m����X`(���<�ie��vܟ�,�يU�h@���<xۛ�d��R��ou����[��l���3k)|�i���D?z��!Q@���48���t?Ej�gu<�
�;��>չݨz6�Si��J,�ھ��c�y�!6�hO�G8U�YzM�.�.B�����K��tkx�$@��V�0��^�t�UUUt$�8��L�b����c�C=�n�ۓ����xU��������",K,�^U����u���>aa%�@d���Z�+b�V��3��'t5B�HD���(4�3��2��tm{���������I��{��!�yP�B�K�Z��C.�P&�N�E���k�9��!e^�ϰQEQA��1�S��$�ӔaSJ�p��DDD����0��&��Stm�)�3'#�0���ld G+W��S&l$])6��	���_N����T�"�t�%�-���w!s}�BΆ�>N U�e�;��C�.�p�!Gash
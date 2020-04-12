CHECK=
OPTION=""

if [ "$CHECK" == "" ]; then
   echo hi
else
   echo you
   OPTION=" -n 11st"
fi

kubectl get po $OPTION

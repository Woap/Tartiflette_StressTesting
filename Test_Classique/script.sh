#!/bin/bash
# Usage : ./script.sh 90 30 90
# $1 le nombre de traceroute pour la phase d'apprentissage
# $2 le nombre de traceroute pour l'evenement
# $3 le nombre de traceroute après l'evenement
 
nb=`wc -l < sed.txt`
dates=1498638670
for (( i=1; i<=$nb; i++ ))
do

   rtt1=`awk '{print $2}' sed.txt | sed -n "$i p"`
	 rtt2=`awk '{print $4}' sed.txt | sed -n "$i p"`
	 rtt3=`awk '{print $6}' sed.txt | sed -n "$i p"`
	 i=$((i + 1))


	 rtt4=`awk '{print $2}' sed.txt | sed -n "$i p"`
	 rtt5=`awk '{print $4}' sed.txt | sed -n "$i p"`
	 rtt6=`awk '{print $6}' sed.txt | sed -n "$i p"`

	 first=$(($1*2))
	 second=$(($2*2+$first))
	 

	 # Délai pour la phase d'apprentissage et la phase retour à la normale
	 if [ $i -le $first ] || [ $i -gt $second ]
	 then
      if [ $rtt4 -le 28 ]
      then
         rtt4=`shuf -i 28-32 -n 1`
      fi

      if [ $rtt4 -gt 32 ]
      then
         rtt4=`shuf -i 28-32 -n 1`
      fi

      if [ $rtt5 -le 28 ]
      then
         rtt5=`shuf -i 28-32 -n 1`
      fi

      if [ $rtt5 -gt 32 ]
      then
         rtt5=`shuf -i 28-32 -n 1`
      fi

      if [ $rtt6 -le 28 ]
      then
         rtt6=`shuf -i 28-32 -n 1`
      fi

      if [ $rtt6 -gt 32 ]
      then
         rtt6=`shuf -i 28-32 -n 1`
      fi
   fi

	 # Délai pour la phase de changemenet de délai 
   if [ $i -le $second ] && [ $i -gt $first ]
	 then
      if [ $rtt4 -le 114 ]
      then
         rtt4=`shuf -i 33-35 -n 1`
      fi

      if [ $rtt4 -gt 114 ]
      then
         rtt4=`shuf -i 33-35  -n 1`
      fi

      if [ $rtt5 -le 114 ]
      then
         rtt5=`shuf -i 33-35  -n 1`
      fi

      if [ $rtt5 -gt 114 ]
      then
         rtt5=`shuf -i 33-35 -n 1`
      fi

      if [ $rtt6 -le 114 ]
      then
         rtt6=`shuf -i 33-35 -n 1`
      fi

      if [ $rtt6 -gt 114 ]
      then
         rtt6=`shuf -i 33-35 -n 1`
      fi
   fi
   
   rtt1=`shuf -i 14-18 -n 1`
   rtt2=`shuf -i 14-18 -n 1`
	 rtt3=`shuf -i 14-18 -n 1`


	 pv=$((i / 2))
	 dates=$((dates + 1))

	 echo $pv
	 sed -e "s/TIME/`echo $dates`/g" \
	 -e "s/ID/`echo $pv`/g" \
	 -e "s/RTT1/`echo $rtt1`/g" \
	 -e "s/RTT2/`echo $rtt2`/g" \
	 -e "s/RTT3/`echo $rtt3`/g" \
	 -e "s/RTT4/`echo $rtt4`/g" \
	 -e "s/RTT5/`echo $rtt5`/g" \
	 -e "s/RTT6/`echo $rtt6`/g" < mongo.json > json/new_mongo$pv.json
	 
	
	 echo $(((($rtt4+$rtt5+$rtt6) / 3)- (($rtt1+$rtt2+$rtt3) / 3) )) >> test.txt


done




exit 0

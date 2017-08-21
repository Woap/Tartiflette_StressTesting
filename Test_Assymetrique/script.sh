#!/bin/bash
# Usage : ./script.sh 90 30 90
# $1 le nombre de traceroute pour la phase d'apprentissage
# $2 le nombre de traceroute pour l'evenement
# $3 le nombre de traceroute après l'evenement

nb=`wc -l < sed.txt`

# Chemin retour numéro 1
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

   borne=$(($second+120))
	 borne2=$(($first+120))


	 if [ $i -le $first ] || [ $i -gt $second ]
	 then
      rtt4=`shuf -i 27-33 -n 1`
      rtt5=`shuf -i 27-33 -n 1`
      rtt6=`shuf -i 27-33 -n 1`
   fi
   

   if [ $i -le $borne ] && [ $i -gt $borne2 ]
	 then
      rtt4=`shuf -i 37-43 -n 1`
      rtt5=`shuf -i 37-43 -n 1`
      rtt6=`shuf -i 37-43 -n 1`
   fi

   if [ $i -le $second ] && [ $i -gt $first ]
	 then
      
      rtt4=`shuf -i 27-33 -n 1`
      rtt5=`shuf -i 27-33 -n 1`
      rtt6=`shuf -i 27-33 -n 1`
   fi

	 pv=$((i / 2))
	 dates=$((dates + 1))
   
   
   rtt1=`shuf -i 14-18 -n 1`
   rtt2=`shuf -i 14-18 -n 1`
	 rtt3=`shuf -i 14-18 -n 1`

	 sed -e "s/TIME/`echo $dates`/g" \
	 -e "s/ID/`echo $pv`/g" \
	 -e "s/RTT1/`echo $rtt1`/g" \
	 -e "s/RTT2/`echo $rtt2`/g" \
	 -e "s/RTT3/`echo $rtt3`/g" \
	 -e "s/RTT4/`echo $rtt4`/g" \
	 -e "s/RTT5/`echo $rtt5`/g" \
	 -e "s/RTT6/`echo $rtt6`/g" < mongo.json > json/new_mongo$pv.json
	 
	 echo $(((($rtt4+$rtt5+$rtt6) / 3)- (($rtt1+$rtt2+$rtt3) / 3) )) >> chemin1.txt


done

# Chemin retour numéro 2
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



	 if [ $i -le $first ] || [ $i -gt $second ]
	 then
      rtt4=`shuf -i 37-43 -n 1`
      rtt5=`shuf -i 37-43 -n 1`
      rtt6=`shuf -i 37-43 -n 1`
   fi

	 borne=$(($second+120))
	 borne2=$(($first+120))

   if [ $i -le $second ] && [ $i -gt $first ]
	 then
      rtt4=`shuf -i 47-53 -n 1`
      rtt5=`shuf -i 47-53 -n 1`
      rtt6=`shuf -i 47-53 -n 1`
   fi
   
   if [ $i -le $borne ] && [ $i -gt $borne2 ]
	 then
      rtt4=`shuf -i 37-43 -n 1`
      rtt5=`shuf -i 37-43 -n 1`
      rtt6=`shuf -i 37-43 -n 1`
   fi
   
   

	 pv=$((i / 2 +(nb / 2 )))
	 dates=$((dates + 1))
	 
	 
	 rtt1=`shuf -i 14-18 -n 1`
   rtt2=`shuf -i 14-18 -n 1`
	 rtt3=`shuf -i 14-18 -n 1`
	 
	 

	 sed -e "s/TIME/`echo $dates`/g" \
	 -e "s/ID/`echo $pv`/g" \
	 -e "s/RTT1/`echo $rtt1`/g" \
	 -e "s/RTT2/`echo $rtt2`/g" \
	 -e "s/RTT3/`echo $rtt3`/g" \
	 -e "s/RTT4/`echo $rtt4`/g" \
	 -e "s/RTT5/`echo $rtt5`/g" \
	 -e "s/RTT6/`echo $rtt6`/g" < mongo.json > json/new_mongo$pv.json
	 
	 echo $(((($rtt4+$rtt5+$rtt6) / 3)- (($rtt1+$rtt2+$rtt3) / 3) )) >> chemin2.txt


done

# Chemin retour numéro 3
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
	 
	 borne=$(($second+120))
	 borne2=$(($first+120))


	 

	 if [ $i -le $first ] || [ $i -gt $second ]
	 then
      rtt4=`shuf -i 27-33 -n 1`
      rtt5=`shuf -i 27-33 -n 1`
      rtt6=`shuf -i 27-33 -n 1`
   fi
   
   if [ $i -le $borne ] && [ $i -gt $borne2 ]
	 then
      rtt4=`shuf -i 37-43 -n 1`
      rtt5=`shuf -i 37-43 -n 1`
      rtt6=`shuf -i 37-43 -n 1`
   fi

   if [ $i -le $second ] && [ $i -gt $first ]
	 then
      rtt4=`shuf -i 37-43 -n 1`
      rtt5=`shuf -i 37-43 -n 1`
      rtt6=`shuf -i 37-43 -n 1`
   fi
   
  

	 pv=$((i / 2 +(nb / 2 ) +(nb / 2 )))
	 dates=$((dates + 1))
	 
	 
	 rtt1=`shuf -i 14-18 -n 1`
   rtt2=`shuf -i 14-18 -n 1`
	 rtt3=`shuf -i 14-18 -n 1`

	 sed -e "s/TIME/`echo $dates`/g" \
	 -e "s/ID/`echo $pv`/g" \
	 -e "s/RTT1/`echo $rtt1`/g" \
	 -e "s/RTT2/`echo $rtt2`/g" \
	 -e "s/RTT3/`echo $rtt3`/g" \
	 -e "s/RTT4/`echo $rtt4`/g" \
	 -e "s/RTT5/`echo $rtt5`/g" \
	 -e "s/RTT6/`echo $rtt6`/g" < mongo.json > json/new_mongo$pv.json
	 
	 echo $(((($rtt4+$rtt5+$rtt6) / 3)- (($rtt1+$rtt2+$rtt3) / 3) )) >> chemin3.txt


done




exit 0

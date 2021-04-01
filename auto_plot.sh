#!/bin/sh

rm -f temp_fig/*.eps


file="work210330"
condition="170_020"
data_num="170"
data=$(printf "%05d" $data_num)
main="../${file}/${condition}/output_main/${data}"
density="../${file}/${condition}/output_density/${data}"
reaction="../${file}/${condition}/output_reaction/${data}"
#main="../${file}/output_main/${data}"
#density="../${file}/output_density/${data}"
#reaction="../${file}/output_reaction/${data}"

focus="225"


ion_front=`bash ion_detect.sh ../${file}/${condition}/output_main/ $data_num`
ion_front=225


sed -i -e "s/hogehoge/${file}_${condition}_${data}/g" plot.tex
# plot graphes and move to temp_fig
gnuplot -e "file='${main}';ion_front='${ion_front}'" pro_tetg.gp
mv temp_fig/image1.eps  temp_fig/${file}_${condition}_${data}_main_tetg.eps 
mv temp_fig/image2.eps  temp_fig/${file}_${condition}_${data}_main_tetg_detail.eps 

gnuplot -e "file='${density}';ion_front='${ion_front}'" pro_den_main_n2.gp
mv temp_fig/image1.eps  temp_fig/${file}_${condition}_${data}_den_main_n2.eps 
mv temp_fig/image2.eps  temp_fig/${file}_${condition}_${data}_den_main_n2_detail.eps 

gnuplot -e "file='${density}';ion_front='${ion_front}'" pro_den_main_o2.gp
mv temp_fig/image1.eps  temp_fig/${file}_${condition}_${data}_den_main_o2.eps 
mv temp_fig/image2.eps  temp_fig/${file}_${condition}_${data}_den_main_o2_detail.eps 

gnuplot -e "file='${density}';ion_front='${ion_front}'" pro_den_ion.gp
mv temp_fig/image1.eps  temp_fig/${file}_${condition}_${data}_den_ion.eps 
mv temp_fig/image2.eps  temp_fig/${file}_${condition}_${data}_den_ion_detail.eps 

gnuplot -e "file='${reaction}';ion_front='${ion_front}'" pro_reac_ion.gp
mv temp_fig/image1.eps  temp_fig/${file}_${condition}_${data}_reac_ion.eps 
mv temp_fig/image2.eps  temp_fig/${file}_${condition}_${data}_reac_ion_detail.eps 

gnuplot -e "file='${main}';ion_front='${ion_front}'" pro_energy.gp
mv temp_fig/image1.eps  temp_fig/${file}_${condition}_${data}_main_energy.eps 
mv temp_fig/image2.eps  temp_fig/${file}_${condition}_${data}_main_energy_detail.eps 

gnuplot -e "file='${main}';ion_front='${ion_front}'" electron_rate_xx.gp
mv temp_fig/image1.eps  temp_fig/${file}_${condition}_${data}_main_electronrate.eps 
mv temp_fig/image2.eps  temp_fig/${file}_${condition}_${data}_main_electronrate_detail.eps 

platex plot
dvipdfmx plot
#write pdf file u

#sed -i -e "s/Datafile.*/Datafile $file $condition $data_num /" plot.tex

sed -i -e "s/${file}_${condition}_${data}/hogehoge/g" plot.tex
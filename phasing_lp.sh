#!/bin/bash
#SBATCH -t 4-00:00:00
#SBATCH -c 1
#SBATCH --mem=60GB

##PHASING DATA: use whatshap for blocking and shapeit for haplotype phasing (with per species vcf)
#whatshap phase --tag=PS -o ${i}_prephased_cat_ref.vcf --reference=reference.fasta ${i}_goodsamples_cat_ref.filter8.vcf input.bam

module load cesga/2020
module load whatshap/1.1

#tryal with lp
  whatshap phase \
    -o $LUSTRE/lp_prephased_cat_ref.vcf \
    --tag=PS \
    --reference=$STORE2/reference_genomes/Felis_catus_Ref/Felis_catus.Felis_catus_9.0.dna.toplevel.fa \
    $LUSTRE/lp_goodsamples_cat_ref.filter8.vcf \
    $(ls $STORE2/lynx_genome/lynx_data/CatRef_bams/*lp*_cat_ref_sorted_rg_rmdup_sorted_indelrealigner.bam)

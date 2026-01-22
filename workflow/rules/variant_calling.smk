rule haplotypecaller:
    input:
        bam="results/alignment/{sample}.bam",
        ref=config["reference"]["genome"]
    output:
        vcf="results/variants/{sample}.vcf.gz"
    conda:
        "workflow/envs/gatk.yaml"
    shell:
        """
        gatk HaplotypeCaller \
          -R {input.ref} \
          -I {input.bam} \
          -O {output.vcf}
        """

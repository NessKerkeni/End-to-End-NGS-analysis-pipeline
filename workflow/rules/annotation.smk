rule snpeff:
    input:
        vcf="results/variants/{sample}.vcf.gz"
    output:
        vcf="results/annotation/{sample}.annotated.vcf.gz"
    conda:
        "workflow/envs/snpeff.yaml"
    shell:
        """
        snpEff {config[reference][snpeff_db]} {input.vcf} |
        bgzip > {output.vcf}
        """

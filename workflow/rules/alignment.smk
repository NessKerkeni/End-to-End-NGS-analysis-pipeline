rule bwa_mem:
    input:
        r1="results/trimmed/{sample}_R1.fastq.gz",
        r2="results/trimmed/{sample}_R2.fastq.gz",
        ref=config["reference"]["genome"]
    output:
        bam="results/alignment/{sample}.bam"
    conda:
        "workflow/envs/bwa.yaml"
    shell:
        """
        bwa mem {input.ref} {input.r1} {input.r2} |
        samtools sort -o {output.bam}
        """

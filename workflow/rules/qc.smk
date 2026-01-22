rule fastqc:
    input:
        r1="data/{sample}_R1.fastq.gz",
        r2="data/{sample}_R2.fastq.gz"
    output:
        html1="results/qc/{sample}_R1_fastqc.html",
        html2="results/qc/{sample}_R2_fastqc.html"
    conda:
        "workflow/envs/fastqc.yaml"
    shell:
        "fastqc {input.r1} {input.r2} --outdir results/qc"

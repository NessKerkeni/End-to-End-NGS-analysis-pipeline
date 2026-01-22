rule multiqc:
    input:
        expand("results/qc/{sample}_R1_fastqc.html", sample=SAMPLES)
    output:
        "results/multiqc/multiqc_report.html"
    conda:
        "workflow/envs/multiqc.yaml"
    shell:
        "multiqc results -o results/multiqc"

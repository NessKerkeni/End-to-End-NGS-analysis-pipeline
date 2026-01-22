configfile: "config/config.yaml"

SAMPLES = config["samples"] if "samples" in config else \
          [row["sample"] for row in
           snakemake.utils.read_job_properties("config/samples.tsv")]

include: "workflow/rules/qc.smk"
include: "workflow/rules/trimming.smk"
include: "workflow/rules/alignment.smk"
include: "workflow/rules/variant_calling.smk"
include: "workflow/rules/annotation.smk"
include: "workflow/rules/multiqc.smk"

rule all:
    input:
        expand("results/annotation/{sample}.annotated.vcf.gz", sample=SAMPLES),
        "results/multiqc/multiqc_report.html"

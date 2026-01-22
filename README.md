# End-to-End-NGS-analysis-pipeline
NGS-snakemake-pipeline

A reproducible, modular Snakemake pipeline for analyzing short-read DNA sequencing data (WGS/WES).  
The pipeline performs **quality control, trimming, alignment, variant calling, annotation**, and generates a **comprehensive MultiQC report**.  

This project is designed to be **reproducible, scalable, and beginner-friendly**, following best practices in bioinformatics workflows.

---

## Features

- Quality control with **FastQC**
- Adapter trimming and filtering using **Fastp**
- Read alignment with **BWA-MEM**
- Sorting and indexing with **Samtools**
- Variant calling using **GATK HaplotypeCaller**
- Variant annotation using **SnpEff**
- Aggregated reports via **MultiQC**
- Modular, reusable rules for easy extension

---

## Repository Structure
├── config/ # Pipeline configuration and sample metadata
├── workflow/ # Snakemake workflow, rules, environments, scripts
├── data/ # Input FASTQ files (not versioned)
├── results/ # Pipeline outputs (ignored in git)
├── tests/ # Minimal test dataset for CI
├── LICENSE
├── README.md
└── CHANGELOG.md

---

## Input Requirements

- Paired-end FASTQ files (`sample_R1.fastq.gz` and `sample_R2.fastq.gz`)
- Reference genome FASTA
- Sample metadata TSV (see `config/samples.tsv`)
- Required tools installed via Conda or Docker

Example `samples.tsv`:

| sample  | fastq_1                  | fastq_2                  |
|---------|-------------------------|-------------------------|
| NA12878 | data/NA12878_R1.fastq.gz | data/NA12878_R2.fastq.gz |

---

## Installation
### 1. Install [Conda](https://docs.conda.io/en/latest/miniconda.html)

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

### 2. Install Snakemake
conda create -c conda-forge -c bioconda -n snakemake snakemake
conda activate snakemake

## Running the Pipeline
snakemake --use-conda --cores 8

## Expected Outputs
results/
├── qc/                     # FastQC HTML reports
├── trimmed/                # Trimmed FASTQ files
├── alignment/              # Sorted BAM files
├── variants/               # Raw VCF files
├── annotation/             # Annotated VCF files
└── multiqc/                # MultiQC report (HTML)


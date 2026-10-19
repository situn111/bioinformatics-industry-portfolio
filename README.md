# Computational Biology Industry Portfolio

**Maintainer: Soumya Ranjan Sahoo**  
Seven code-first research workflow starters spanning drug discovery, molecular simulation and sequencing analysis.

> Status: implemented portfolio toolkit, not a validated production or clinical platform. The supplied examples are synthetic or input templates. No real-data performance or completed-study claims are made.

## Seven projects

| # | Project | Focus |
|---|---|---|
| 01 | [Structure-based virtual screening](projects/01_virtual_screening/README.md) | Drug discovery / computational chemistry |
| 02 | [Scaffold-aware potency prediction](projects/02_scaffold_qsar/README.md) | Drug discovery / machine learning |
| 03 | [Protein–ligand molecular dynamics](projects/03_complex_md/README.md) | Drug discovery / molecular simulation |
| 04 | [Germline short-variant WGS](projects/04_germline_wgs/README.md) | NGS / DNA sequencing |
| 05 | [Tumour–normal somatic variants](projects/05_somatic_variants/README.md) | Cancer genomics / paired DNA |
| 06 | [Bulk RNA-seq differential expression](projects/06_bulk_rnaseq/README.md) | Transcriptomics / target discovery |
| 07 | [Single-cell RNA-seq exploration](projects/07_single_cell/README.md) | Single-cell genomics / cell-state discovery |

## Start here

1. Read [GitHub upload instructions](docs/GITHUB_UPLOAD.md).
2. Choose one project and read its README.
3. Create the project's conda environment on Linux / Ubuntu WSL2.
4. Copy and edit its JSON config, using paths relative to the repository root.
5. Run a command plan, then execute on curated data in a new output directory.
6. Inspect outputs, QC and logs; complete [validation](docs/VALIDATION.md) before making scientific or industry-readiness claims.

```bash
# Example: show a WGS plan without installing bioinformatics tools.
python projects/04_germline_wgs/pipeline.py --config projects/04_germline_wgs/config.example.json

# Scientific execution requires the project environment and real inputs.
conda env create -f projects/04_germline_wgs/environment.yml
conda activate 04_germline_wgs
python projects/04_germline_wgs/pipeline.py --config my_wgs_config.json --execute
```

## Repository layout

```text
projects/
  01_virtual_screening/   RDKit, Meeko, AutoDock Vina
  02_scaffold_qsar/       RDKit, scikit-learn
  03_complex_md/          GROMACS, MDP files, trajectory analysis
  04_germline_wgs/        fastp, BWA, SAMtools, GATK, bcftools
  05_somatic_variants/    Mutect2, contamination and orientation filtering
  06_bulk_rnaseq/         STAR, featureCounts, DESeq2
  07_single_cell/         Scanpy, Scrublet, Leiden
common/                  Shared shell-free sequential runner
tools/                   Input checksums, environment capture, optional VEP
hpc/                     Example SLURM submission script
tests/                   Runner and workflow contract tests
docs/                    Upload guide, data sources, validation and test report
.github/                 CI and contribution templates
```

Each project contains executable source, `config.example.json`, `environment.yml` and its own README. Selected projects include small example data, R code, MDP settings or analysis scripts as appropriate. Large reference databases and real sequencing data are not bundled.

## Engineering choices

- Explicit execution: preview is the default; `--execute` starts computation.
- Argument-list subprocess calls avoid shell interpolation of input paths.
- Fail-fast processing and new output directories protect prior runs.
- Command workflows emit logs and a machine-readable run manifest.
- Scientific assumptions and scope limits are documented project by project.
- CI checks Python compilation, runner safety, scientific command contracts and plans. It is not an end-to-end scientific validation suite.

## Tests

```bash
python -m pip install numpy==1.26.4 scikit-learn==1.5.2
python -m unittest discover -s tests -v
```

See [TEST_REPORT.md](docs/TEST_REPORT.md) for the checks actually run during delivery. Environment specifications are version-constrained baselines, not resolved lockfiles. Export exact builds after installation and benchmark against documented reference datasets.

## Portfolio use

Use these projects to demonstrate implementation, extend them with legitimate public datasets and publish reproducible validation reports. State your exact contribution and distinguish this starter toolkit from analyses you have personally executed. Do not present synthetic demo metrics as drug-discovery results or patient findings.

License: MIT for original repository code. Third-party software, references and datasets retain their own licenses.

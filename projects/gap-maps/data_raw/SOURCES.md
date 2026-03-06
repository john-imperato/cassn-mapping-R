# Data Sources

## USGS PAD-US 4.1 — California State Subset

**Source:** USGS Gap Analysis Project
**URL:** <https://www.usgs.gov/programs/gap-analysis-project/science/pad-us-data-overview>
**Direct download:** <https://www.sciencebase.gov/catalog/item/652ee257d34e44db0e9fb4ce>
**Version:** PAD-US 4.1 (released 2024)
**Format:** File Geodatabase (.gdb) — California state subset (GDB + KMZ)

**Layer used:** `PADUS4_1Comb_DOD_Trib_NGP_Fee_Desig_Ease_State_CA`
**Key fields:** `GAP_Sts` (protection status 1–4), `d_GAP_Sts` (description)

**Local path (not committed — too large for git):**

```
~/Downloads/PADUS4_1_State_CA_GDB_KMZ/PADUS4_1_StateCA.gdb
```

This path is configured at the top of `scripts/01_extract_gap_status.R` as `PADUS_GDB`.
Move the GDB to a permanent location outside the git repo and update that variable accordingly.

---

## CA-SSN Reference Sites

**Source:** `projects/_reference/data_raw/CASSN_all_sites.csv`
109 sentinel sites maintained by the CASSN project.
Consumed automatically by `scripts/01_extract_gap_status.R` — no manual download needed.

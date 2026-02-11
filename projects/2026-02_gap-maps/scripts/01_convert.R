#!/usr/bin/env Rscript

# Convert shapefile to GeoPackage for consistent downstream use.

suppressPackageStartupMessages({
  library(sf)
})

project_root <- normalizePath(file.path(getwd(), "projects", "2026-02_gap-maps"), mustWork = FALSE)
raw_dir <- file.path(project_root, "data_raw")
out_dir <- file.path(project_root, "data")

shp_base <- "new_SSN_GAP"
shp_path <- file.path(raw_dir, paste0(shp_base, ".shp"))
gpkg_path <- file.path(out_dir, paste0(shp_base, ".gpkg"))
layer_name <- shp_base

if (!dir.exists(raw_dir)) {
  stop("Missing raw data folder: ", raw_dir)
}
if (!dir.exists(out_dir)) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
}
if (!file.exists(shp_path)) {
  stop("Missing shapefile: ", shp_path)
}

message("Reading: ", shp_path)
sf_obj <- st_read(shp_path, quiet = TRUE)

if (any(!st_is_valid(sf_obj))) {
  message("Fixing invalid geometries...")
  sf_obj <- st_make_valid(sf_obj)
}

message("Writing: ", gpkg_path)
st_write(sf_obj, gpkg_path, layer = layer_name, delete_layer = TRUE, quiet = TRUE)

message("Done.")

library(metacell)

mc_to_txt <- function(mc_id,mc2d_id, gset_id, outdir){
  dir.create(outdir)
  mc = scdb_mc(mc_id)
  mc2d = scdb_mc2d(mc2d_id)
  write.table(mc@mc_fp,file=paste0(outdir,"/mc_fp.txt"),sep="\t")
  df_2d = data.frame(sc_x = mc2d@sc_x, sc_y = mc2d@sc_y,well_id = names(mc2d@sc_x), mc_num = as.integer(mc@mc[names(mc2d@sc_x)]))
  df_mc_2d = data.frame(mc_x = mc2d@mc_x,mc_y = mc2d@mc_y, mc_num = 1:length(mc2d@mc_x))
  write.table(df_2d,file=paste0(outdir,"/df_2d.txt"),sep="\t")
  write.table(df_mc_2d,file=paste0(outdir,"/df_mc_2d.txt"),sep="\t")
  write.table(mc@mc,file=paste0(outdir,"/mc_mc.txt"),sep="\t")
  mcell_gset_from_mc_markers(gset_id = gset_id ,mc_id = mc_id)
  gset = scdb_gset(gset_id)
  write.table(names(gset@gene_set),file=paste0(outdir,"/marks_genes.txt"),sep="\t")
  dir.create(paste0(outdir, "/color_schemes"))
  write.table(mc@colors,file=paste0(outdir,"/mc_colors.txt"),row.names = FALSE,sep="\t")
  write.table(mc@color_key,file=paste0(outdir,"/color_schemes/mc_colorized.txt"),row.names =FALSE,sep="\t")
}

# Here you need to update the variables 
metaview_dir = "/home/labs/amit/eyald/metaview_csv/"
setwd(metaview_dir) 
mc_db = "/home/labs/amit/eyald/metaview_csv/saved_work/"
scdb_init(mc_db, force_reinit=T)
outdir = "db"
gset_id = "lung_kinetics_sorted_markers"
mc_id = "lung_kinetics_sorted"
mc2d_id = "lung_kinetics_sorted"

# Run the function
mc_to_txt(mc_id = mc_id ,mc2d_id = mc2d_id, gset_id = gset_id, outdir = outdir)


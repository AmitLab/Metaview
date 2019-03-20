db_dir = "db"
default_mc_col = read.delim(paste0(db_dir, "/color_schemes/mc_colorized.txt"))

df_2d = read.delim(paste0(db_dir, "/df_2d.txt"))
df_mc_2d =read.delim(paste0(db_dir, "/df_mc_2d.txt"))

mc_mc = read.delim(paste0(db_dir, "/mc_mc.txt"))[[1]]
names(mc_mc) = rownames(read.delim(paste0(db_dir, "/mc_mc.txt")))
marks_genes = read.delim(paste0(db_dir, "/marks_genes.txt"),stringsAsFactors = FALSE)[[1]]
mc_fp = as.matrix(read.delim(paste0(db_dir, "/mc_fp.txt")))
colnames(mc_fp) = 1:ncol(mc_fp)
mc_genes = sort(rownames(mc_fp))
mc_colors = setNames(read.delim(paste0(db_dir, "/mc_colors.txt"),stringsAsFactors = FALSE)[[1]],colnames(mc_fp)) 





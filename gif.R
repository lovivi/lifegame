CA_dir <- dir('CA1')


CA_dir_1 <- sapply(strsplit(CA_dir,'\\.',), function(x) {
  paste0(sprintf("%04d", as.numeric(x[1])),'.',x[2])
})

dir.create('CA2') 


for (i in 1:length(CA_dir)) {
  command <- paste0('cp ./CA1/',CA_dir[i],' ./CA2/',CA_dir_1[i])
  system(command)
  # do something
} 

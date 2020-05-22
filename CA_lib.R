slide <- 200
CA <- matrix(0,slide,slide)
set.seed(1234)
n=3000
init_life <- cbind(sample(1:slide,n,replace = T),sample(1:slide,n,replace = T))
#init_life <- matrix(c(2,3,2,3,3,3,2,2),ncol = 2)
#apply(init_life, 1, function(x) {CA[x[1],x[2]] <<- 1}) 
live_id <- (init_life)
for (k in 1:5000) {
  print(k)
  live_id<- t(live_id)
  test_id <- cbind(live_id+c(0,0),
                   live_id+c(1,0),
                   live_id+c(1,1),
                   live_id+c(1,-1),
                   live_id+c(0,1),
                   live_id+c(0,-1),
                   live_id+c(-1,0),
                   live_id+c(-1,1),
                   live_id+c(-1,-1))
  test_id <- test_id[,test_id[1,]>0]
  test_id <- test_id[,test_id[2,]>0]
  test_id <- test_id[,test_id[1,]<=slide]
  test_id <- test_id[,test_id[2,]<=slide]
  test_id <- (unique(t(test_id)))
  live_id<- t(live_id)
  #x <- test_id[1,]
  live_partner <- apply(test_id,1, function(x){
    length(which( (abs(live_id[,1]-x[1])==0 & abs(live_id[,2]-x[2])==1) |
                    (abs(live_id[,1]-x[1])==1 & abs(live_id[,2]-x[2])==0) |
                    (abs(live_id[,1]-x[1])==1 & abs(live_id[,2]-x[2])==1) ))
  } 
  )
  
  part1 <- test_id[which(live_partner ==3),]
  part2 <- test_id[which(live_partner[1:nrow(live_id)] ==2),]
  live_id <- unique(rbind(part1,
                          part2))
  png(paste0('./CA/',k,'.png'))
  plot(live_id,pch=16,cex=0.5,xlim=c(1,slide),ylim=c(1,slide),main=k)
  dev.off()
  Sys.sleep(0.5)
  # 
  # dim(live_id)
  # library(Matrix)
  # A <- sparseMatrix(i = live_id[,1],j =  live_id[,2], x = rep(1,nrow(live_id)))   
  # heatmap(as.matrix(A), Rowv = NA, Colv = NA,main=k)
}
<<<<<<< HEAD
##
=======
>>>>>>> a6f2f4de03c81679f49375ebf8c72ddc9790c10b

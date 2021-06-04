to_string_of_bytes = function(x) {
  paste(as.character(serialize(x, connection = NULL)), collapse = " ")
}

project_folder <-  "C:/PredictiveModelling/"

mymodel <- readRDS(paste0(project_folder, "billmodel.rds"))

mymodel.str <- to_string_of_bytes(mymodel)

model_df <- data.frame(model_id = 1, model_str = mymodel.str,
                       stringsAsFactors = FALSE)

dataset<-model_df



from_byte_string = function(x) {
  xcharvec = strsplit(x, " ")[[1]]
  xhex = as.hexmode(xcharvec)
  xraw = as.raw(xhex)
  unserialize(xraw)
}


mymodel.str <- as.character( dataset[dataset$model_id == 1, "model_str"] )
mymodel <- from_byte_string(mymodel.str)

v <- c( wt=dataset$weight, qsec=dataset$qsec, am=as.factor(dataset$am) )

pred <- round( predict(mymodel, newdata = as.data.frame(t(v))), digits = 2 )

plot.new()
text(0.5, 0.5,
     labels = as.character(pred[[1]])
     ,cex = 3.5
)
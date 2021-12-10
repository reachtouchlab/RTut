#cwd
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Delete current content
CurrentHtmlFiles <- grep(".html", dir(), value = T)
CurrentDirectories <- list.dirs('.', recursive=FALSE)
CurrentDirectories <- grep(".Rproj|.git", CurrentDirectories, value = T, invert = T) #do not remove .git and .Rproj!

#now delete...
unlink(CurrentDirectories, recursive=T)
unlink(CurrentHtmlFiles)

# XX UPDATE
#directory of the bookdown files
BookPath <- "../Rtut_Bookdown/_book"

#now copy everything from the boodown directory here
#BookFiles <- dir(BookPath, full.names = T, recursive = T)
#NewBookFiles <- gsub(BookPath, replacement = ".", BookFiles)

#update the content
#file.copy(from = BookFiles, to = NewBookFiles, overwrite = T, recursive = T)

file.copy(from = list.files(BookPath, full.names = TRUE), to = "./", 
          recursive = TRUE, overwrite = T)


#also copy the RMD File
file.copy(from = paste(dirname(BookPath), "Reach & Touch Lab Auswerteschablone.Rmd", sep = "/"), to = "./", overwrite = T)


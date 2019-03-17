if exists("current_compiler")
  finish
endif
let current_compiler = "polli"

setlocal makeprg=make\ -C/scratch/polli/

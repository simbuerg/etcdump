if exists("current_compiler")
  finish
endif
let current_compiler = "clang-modernize"

setlocal makeprg=clang-modernize\ -p\ .\ %

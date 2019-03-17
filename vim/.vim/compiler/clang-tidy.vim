if exists("current_compiler")
  finish
endif
let current_compiler = "clang-tidy"

setlocal makeprg=clang-tidy\ -checks='-*,llvm-*,clang-analyzer-*'\ %

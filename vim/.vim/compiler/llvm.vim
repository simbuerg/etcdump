if exists("current_compiler")
  finish
endif
let current_compiler = "llvm"

setlocal makeprg=make\ -j4\ -C/home/simbuerg/src/polyjit/llvm/build-release/

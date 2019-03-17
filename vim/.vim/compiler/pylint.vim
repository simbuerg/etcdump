
if exists("current_compiler")
  finish
endif
let current_compiler = "pylint"

setlocal makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
setlocal errorformat=%f:%l:\ %m

; control_select.ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

define void @foo(i32 %x) {
    %result = icmp sgt i32 %x, 0
    %y = select i1 %result, i32 1, i32 2

    ; do something with %y
    ret void
}

define i32 @main() {
    ret i32 0
}

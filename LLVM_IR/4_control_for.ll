; control_for.ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

; for (int i = 0; i < 10; i++) {}

define i32 @main() {
    %i = alloca i32
    store i32 0, i32* %i ; i = 0
    br label %init

init:
    %i_value = load i32, i32* %i
    %cmp_ret = icmp slt i32 %i_value, 10 ; test if i < 10
    br i1 %cmp_ret, label %loop, label %end

loop:
    ; loop body

    %inc_i = add i32 %i_value, 1
    store i32 %inc_i, i32* %i ; i = i + 1
    br label %init

end:
    ; do other thing

    %ret = load i32, i32* %i
    ret i32 %ret
}

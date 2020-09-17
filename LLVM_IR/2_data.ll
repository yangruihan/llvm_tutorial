; data.ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

@global_variable = global i32 5
@global_constant = constant i32 0

define i32 @main() {
    %gv = load i32, i32* @global_variable
    %local_variable = add i32 1, %gv
    ret i32 %local_variable
}
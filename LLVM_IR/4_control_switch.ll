; control_switch.ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

; int i;
; switch (i) {
;     case 0:
;         // ...
;         break;
; 
;     case 1:
;         // ...
;         break;
; 
;     default:
;         // ...
;         break;
; }

define i32 @main() {
    %i = alloca i32
    %i_value = load i32, i32* %i

    switch i32 %i_value, label %default [
        i32 0, label %case_0
        i32 1, label %case_1
    ]

case_0:
    ; ...
    br label %end

case_1:
    ; ...
    br label %end

default:
    ; ...
    br label %end

end:
    ret i32 0
}

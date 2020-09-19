; control_phil.ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

define void @foo(i32 %x) {
    %result = icmp sgt i32 %x, 0
    br i1 %result, label %btrue, label %bfalse

btrue:
    br label %end

bfalse:
    br label %end

end:
    %y = phi i32 [1, %btrue], [2, %bfalse]

    ; do something with %y

    ret void
}

define i32 @main() {
    ret i32 0
}

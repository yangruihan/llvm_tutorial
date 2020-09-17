; type.ll
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

@int_1_or_bool = global i1 true
@global_array = global [4 x i32] [i32 0, i32 1, i32 2, i32 3]
@global_string = global [12 x i8] c"Hello World\00"

; struct MyStruct {
;     int x;
;     char y;
;}
%MyStruct = type {
    i32,
    i8
}

@global_struct = global %MyStruct { i32 50, i8 5 }
; or @global_struct = global { i32, i8 } { i32 1, i8 0 }

define i32 @main() {
    %my_structs = alloca [4 x %MyStruct]

    %1 = getelementptr [4 x %MyStruct], [4 x %MyStruct]* %my_structs, i32 0, i32 2, i32 1  ; %1 is pointer to my_structs[2].y
    %2 = load i8, i8* %1 ; %2 is value of my_structs[2].y

    %3 = load %MyStruct, %MyStruct* @global_struct ; %3 = global_struct
    %4 = extractvalue %MyStruct %3, 0 ; %4 = %3.x
    %5 = insertvalue %MyStruct %3, i32 100, 0; %3.x = 100

    %6 = getelementptr %MyStruct, %MyStruct* @global_struct, i32 0, i32 1  ; %6 is pointer to global_struct.x
    %7 = load i8, i8* %6
    %8 = sext i8 %7 to i32 ; signed convert i8 to i32

    ret i32 %8
}
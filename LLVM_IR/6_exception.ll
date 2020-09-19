; ModuleID = 'exception.cpp'
source_filename = "exception.cpp"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.SomeOtherStruct = type { i8 }
%struct.MyError = type { i8 }
%struct.AnotherError = type { i8 }

@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS7MyError = linkonce_odr constant [9 x i8] c"7MyError\00"
@_ZTI7MyError = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @_ZTS7MyError, i32 0, i32 0) }
@_ZTS12AnotherError = linkonce_odr constant [15 x i8] c"12AnotherError\00"
@_ZTI12AnotherError = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @_ZTS12AnotherError, i32 0, i32 0) }

; Function Attrs: noinline optnone ssp uwtable
define void @_Z3foov() #0 {
  %1 = alloca %struct.SomeOtherStruct, align 1
  %2 = call i8* @__cxa_allocate_exception(i64 1) #3
  %3 = bitcast i8* %2 to %struct.MyError*
  call void @__cxa_throw(i8* %2, i8* bitcast ({ i8*, i8* }* @_ZTI7MyError to i8*), i8* null) #4
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i8* @__cxa_allocate_exception(i64)

declare void @__cxa_throw(i8*, i8*, i8*)

; Function Attrs: noinline optnone ssp uwtable
define void @_Z3barv() #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca i8*
  %2 = alloca i32
  %3 = alloca %struct.AnotherError, align 1
  %4 = alloca %struct.MyError, align 1
  invoke void @_Z3foov()
          to label %5 unwind label %6

; <label>:5:                                      ; preds = %0
  br label %18

; <label>:6:                                      ; preds = %0
  %7 = landingpad { i8*, i32 }
          catch i8* bitcast ({ i8*, i8* }* @_ZTI7MyError to i8*)
          catch i8* bitcast ({ i8*, i8* }* @_ZTI12AnotherError to i8*)
          catch i8* null
  %8 = extractvalue { i8*, i32 } %7, 0
  store i8* %8, i8** %1, align 8
  %9 = extractvalue { i8*, i32 } %7, 1
  store i32 %9, i32* %2, align 4
  br label %10

; <label>:10:                                     ; preds = %6
  %11 = load i32, i32* %2, align 4
  %12 = call i32 @llvm.eh.typeid.for(i8* bitcast ({ i8*, i8* }* @_ZTI7MyError to i8*)) #3
  %13 = icmp eq i32 %11, %12
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %10
  %15 = load i8*, i8** %1, align 8
  %16 = call i8* @__cxa_begin_catch(i8* %15) #3
  %17 = bitcast i8* %16 to %struct.MyError*
  call void @__cxa_end_catch()
  br label %18

; <label>:18:                                     ; preds = %14, %22, %26, %5
  ret void

; <label>:19:                                     ; preds = %10
  %20 = call i32 @llvm.eh.typeid.for(i8* bitcast ({ i8*, i8* }* @_ZTI12AnotherError to i8*)) #3
  %21 = icmp eq i32 %11, %20
  br i1 %21, label %22, label %26

; <label>:22:                                     ; preds = %19
  %23 = load i8*, i8** %1, align 8
  %24 = call i8* @__cxa_begin_catch(i8* %23) #3
  %25 = bitcast i8* %24 to %struct.AnotherError*
  call void @__cxa_end_catch()
  br label %18

; <label>:26:                                     ; preds = %19
  %27 = load i8*, i8** %1, align 8
  %28 = call i8* @__cxa_begin_catch(i8* %27) #3
  call void @__cxa_end_catch()
  br label %18
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind readnone
declare i32 @llvm.eh.typeid.for(i8*) #1

declare i8* @__cxa_begin_catch(i8*)

declare void @__cxa_end_catch()

; Function Attrs: noinline norecurse nounwind optnone ssp uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  ret i32 0
}

attributes #0 = { noinline optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { noinline norecurse nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 14]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Apple LLVM version 10.0.1 (clang-1001.0.46.4)"}

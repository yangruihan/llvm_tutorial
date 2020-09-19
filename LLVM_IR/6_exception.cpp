struct SomeOtherStruct {};
struct AnotherError {};

struct MyError {};

void foo() {
    SomeOtherStruct other_struct;
    throw MyError();
    return;
}

void bar() {
    try {
        foo();
    } catch (MyError err) {

    } catch (AnotherError err) {

    } catch (...) {

    }
}

int main() {
    return 0;
}
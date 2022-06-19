import 'package:bloc_test/bloc_test.dart';
import 'package:doctor/src/presentation/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("App login test", () {
    PhoneAuthBloc? phoneAuthBloc;
    setUp(() {
      phoneAuthBloc = PhoneAuthBloc(phoneAuthRepository: PhoneAuthRepository());
    });
    tearDown((){
      phoneAuthBloc?.close();
    });

    // test("login test", () {
    //   expect(phoneAuthBloc?.state, "123456");
    // });

    // blocTest("test login number", build: ()=>phoneAuthBloc,
    // act: (login)=>login.,
    //   expect:[]
    // );
  });



}

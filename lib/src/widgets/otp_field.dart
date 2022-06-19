import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/phone_auth/phone_auth_bloc.dart';
import '../utils/common_widgets.dart';
import '../utils/extension.dart';

class OtpWidget extends StatefulWidget {
  OtpWidget(
      {Key? key,
      required this.codeController,
      required this.verificationId,
      this.number})
      : super(key: key);
  final String? number;
  final TextEditingController codeController;
  final String verificationId;

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey();
  bool isLogin = false;
  bool clearFileds = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _otpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   controller: codeController,
          //   style: TextStyle(color: Colors.orangeAccent, fontSize: 25),
          //   cursorColor: Colors.orangeAccent,
          //   decoration: const InputDecoration(
          //     border: InputBorder.none,
          //     hintText: 'Enter OTP',
          //
          //   ),
          //   validator: (value) {
          //     if (value!.length != 6) {
          //       return 'Please enter valid OTP';
          //     }
          //     return null;
          //   },
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _box(context),
              _box(context),
              _box(context),
              _box(context),
              _box(context),
              _box(context),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          textCustom(
            'Please enter the verification code that was sent to ${widget.number}',
           fontSize: 18, color: Colors.white

          ),
          const SizedBox(
            height: 100,
          ),
          if (isLogin)
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              height: 40,
              child: Center(
                child: textCustom('Login',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ).onTap(() {
              if (_otpFormKey.currentState!.validate() && isLogin) {
                _verifyOtp(context: context);
              }
            }),

          Row(
            children: [
              Checkbox(
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeColor: Colors.green,
                  value: isLogin,
                  onChanged: (bool? v) {
                    setState(() {
                      isLogin = v!;
                    });
                  }),
              Text.rich(
                TextSpan(
                  children: [
                    textSpanCustom(
                      'I agree to the',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textSpanCustom(
                      ' Terms Of Use',
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textSpanCustom(
                      ' and',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textSpanCustom(
                      ' Privacy Policy',
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _verifyOtp({required BuildContext context}) {
    context.read<PhoneAuthBloc>().add(VerifySentOtpEvent(
        otpCode: widget.codeController.text,
        verificationId: widget.verificationId));
    widget.codeController.clear();
  }

  Widget _box(context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 7,
      child: TextField(
        textAlign: TextAlign.center,
       keyboardType: TextInputType.number,
        maxLength: 1,
        onTap: () {
          widget.codeController.clear();
        },
        // controller: codeController,
        cursorColor: Colors.orangeAccent,
        onChanged: (value) {
          widget.codeController.text = widget.codeController.text + value;
          print(value);
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0) {
            FocusScope.of(context).previousFocus();
          }
          print(widget.codeController.text);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
            contentPadding: const EdgeInsets.all(20)),
        style: GoogleFonts.roboto(color: Colors.orangeAccent, fontSize: 20),
      ),
      decoration: BoxDecoration(
        color: Colors.indigo.shade900,
        //  border: Border.all(color: Colors.tr,width: 2)
      ),
    );
  }
}

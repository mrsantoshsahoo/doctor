import 'package:country_code_picker/country_code_picker.dart';
import 'package:doctor/src/utils/extension.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/phone_auth/phone_auth_bloc.dart';
import '../utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({Key? key, required this.phoneNumberController})
      : super(key: key);
  final TextEditingController phoneNumberController;

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  CountryCode _countryCode = CountryCode(code: 'IN', dialCode: '+91');
  final GlobalKey<FormState> _phoneNumberFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _phoneNumberFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            keyboardType: TextInputType.phone,
            style: GoogleFonts.roboto(color: Colors.orangeAccent, fontSize: 25),
            cursorColor: Colors.orangeAccent,
            controller: widget.phoneNumberController,
            decoration: InputDecoration(
              hintStyle:  GoogleFonts.roboto(color: Colors.orangeAccent, fontSize: 25),
              //   border: const OutlineInputBorder(),
              hintText: 'Enter your phone number',
              suffixIcon: Icon(
                Icons.cancel_outlined,
                color: Colors.orangeAccent,
              ).onTap(() {
                widget.phoneNumberController.clear();
              }),
              prefixIcon: CountryCodePicker(
                onChanged: (CountryCode countryCode) {
                  setState(() {
                    _countryCode = countryCode;
                  });
                },
                initialSelection: 'IN',
                textStyle:  GoogleFonts.roboto(color: Colors.green, fontSize: 22),
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
            ),
            validator: (value) {
              if (value!.length != 10) {
                return 'Please enter valid phone number';
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: 5,
          ),
           textCustom(
            'We will send you an SMS with the verification code to this number',
         fontSize: 16, color: Colors.white,

            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 50,
          ),
     SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: FlatButton(
              clipBehavior: Clip.antiAlias,
              color: Colors.green,
              onPressed: () {
                if (_phoneNumberFormKey.currentState!.validate()) {
                  _sendOtp(
                      phoneNumber: widget.phoneNumberController.text,
                      context: context);
                }
              },
              child:  textCustom(
                'Continue',
               fontSize: 24, color: Colors.white,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendOtp({required String phoneNumber, required BuildContext context}) {
    final phoneNumberWithCode = "${_countryCode.dialCode}$phoneNumber";
    context.read<PhoneAuthBloc>().add(
          SendOtpToPhoneEvent(
            phoneNumber: phoneNumberWithCode,
          ),
        );
    setState(() {
      widget.phoneNumberController.clear();
    });
  }
}

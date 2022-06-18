import '../phone_auth.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _codeController;

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          // Phone Otp Verified. Send User to Home Screen
          if (state is PhoneAuthVerified) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          }

          //Show error message if any error occurs while verifying phone number and otp code
          if (state is PhoneAuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        child: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
          builder: (context, state) {
            if (state is PhoneAuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is! PhoneAuthCodeSentSuccess)
                    Text(
                      "ENTER YOUR MOBILE NUMBER",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  else
                    Text(
                      "ENTER VERIFICATION CODE",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  // if (state is! PhoneAuthCodeSentSuccess)
                  //   PhoneNumberWidget(
                  //     phoneNumberController: _phoneNumberController,
                  //   )
                  // else
                    OtpWidget(
                      number: _phoneNumberController.text,
                      codeController: _codeController,
                      verificationId: "state.verificationId",
                    ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}

import '../../../data/repository/home/home_repository.dart';
import '../../../bloc/phone_auth/phone_auth_repository.dart';
import '../../../utils/common_widgets.dart';
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
      backgroundColor: Colors.indigo,
      body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
        listener: (context, state) {
          // Phone Otp Verified. Send User to Home Screen
          if (state is PhoneAuthVerified) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) =>
                    RepositoryProvider(
                      create: (context) => PhoneAuthRepository(),
                      child: BlocProvider(
                        create: (context) => PhoneAuthBloc(
                          phoneAuthRepository:
                          RepositoryProvider.of<PhoneAuthRepository>(context),
                        ),
                        child:RepositoryProvider(
                          create: (context) => HomeRepository(),
                          child:  HomePage(),
                        ),
                      ),
                    )
                    ,
              ),
            );
          }

          //Show error message if any error occurs while verifying phone number and otp code
          if (state is PhoneAuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: textCustom(state.error,color:
                Colors.white),
              ),
            );
          }
        },
        child: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
          builder: (context, state) {
            if (state is PhoneAuthLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is! PhoneAuthCodeSentSuccess)
                    textCustom(
                      "ENTER YOUR MOBILE NUMBER",
                  fontSize: 24, color: Colors.white,
                      textAlign: TextAlign.center,
                    )
                  else
                    textCustom(
                      "ENTER VERIFICATION CODE",
                    fontSize: 24, color: Colors.white

                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (state is! PhoneAuthCodeSentSuccess)
                    PhoneNumberWidget(
                      phoneNumberController: _phoneNumberController,
                    )
                  else
                    OtpWidget(
                      number: _phoneNumberController.text,
                      codeController: _codeController,
                      verificationId: state.verificationId,
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

import '../../../utils/extension.dart';
import '../app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Phone Auth Demo',
      theme: ThemeData(
        accentColor: HexColor.fromHex('#fab206') ,
        primaryColor:HexColor.fromHex('#015ecb')  ,
        primaryColorDark: HexColor.fromHex('#2F579F') ,
        primarySwatch: Colors.indigo,
      ),
      home: RepositoryProvider(
        create: (context) => PhoneAuthRepository(),
        child: BlocProvider(
          create: (context) => PhoneAuthBloc(
            phoneAuthRepository:
                RepositoryProvider.of<PhoneAuthRepository>(context),
          ),
          child: const PhoneAuthPage(),
        ),
      ),
    );
  }
}

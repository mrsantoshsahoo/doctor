import '../../home/view/home_page.dart';
import '../app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Phone Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => PhoneAuthRepository(),
        child: BlocProvider(
          create: (context) => PhoneAuthBloc(
            phoneAuthRepository:
                RepositoryProvider.of<PhoneAuthRepository>(context),
          ),
          child: const HomePage(),
        ),
      ),
    );
  }
}

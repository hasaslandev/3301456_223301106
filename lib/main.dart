
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevu/Screens/Welcome/welcome_screen.dart';
import 'package:randevu/constants.dart';
import 'package:randevu/pages/adsensesView.dart';
import 'package:randevu/pages/dailydatasView.dart';
import 'package:randevu/pages/domainFirmsView.dart';
import 'package:randevu/pages/domainsView.dart';
import 'package:randevu/pages/hostingsView.dart';
import 'package:randevu/pages/settingsView.dart';
import 'package:randevu/providers/domainfirms_provider.dart';
import 'package:randevu/screens/adminlogin/adminlogin_screen.dart';
import 'package:randevu/screens/login/login_screen.dart';
import 'package:randevu/screens/seotalep/seotalep_screen.dart';
import 'package:randevu/screens/signup/signup_screen.dart';
import 'package:randevu/services/auth/auth_methods.dart';
import 'package:randevu/services/domainfirms/firestore_domainfirms_service.dart';
import 'package:randevu/translations/codegen_loader.g.dart';
import 'package:randevu/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'notifiers/menu_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        path: 'assets/translations',
        fallbackLocale: Locale('en', 'US'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FlutterFireAuthService>(
            create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
            context.read<FlutterFireAuthService>().authStateChanges,
            initialData: null,
          ),
          Provider<FirestoreDomainFirmsService>(
            create: (_) => FirestoreDomainFirmsService(),
          ),
          ChangeNotifierProvider(create: (context) => DomainFirmsProvider()),
          StreamProvider(
            create: (context) =>
                context.read<FirestoreDomainFirmsService>().getDomainFirms(),
            initialData: null,
          ),
          ChangeNotifierProvider(create: (context) => MenuDrawerNotifier()),
        ],
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: LocaleKeys.appname.tr(),
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: WelcomeScreen(),
          routes: {
            "home": (_) => WelcomeScreen(),
            "signup": (_) => SignUpScreen(),
            "login": (_) => LoginScreen(),
            "seotalep": (_) => SeoTalepScreen(),
            "adminlogin": (_) => AdminLoginScreen(),
            "domainfirms": (_) => DomainFirmsView(),
            "domains": (_) => DomainsView(),
            "hostings": (_) => HostingsView(),
            "adsenses": (_) => AdsensesView(),
            "dailydatas": (_) => DailyDatasView(),
            "settings": (_) => SettingsView(),
          },
        ));
  }
}











































/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randevu/pages/anaSayfa.dart';
import 'package:randevu/pages/kaydol.dart';
import 'package:randevu/pages/login.dart';
import 'package:randevu/widgets/Guncelleme.dart';
import 'package:randevu/pages/teklif.dart';
import 'package:randevu/pages/doktorDetay.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        colorSchemeSeed: const Color(0xff5a73d8),
        textTheme:
            GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
      useMaterial3: true,
      ),


    initialRoute: '/', routes: { '/login': (context) => const Login(), '/home_page': (context) => const HomePage(),'/kaydol': (context) =>  Kaydol(),
      '/teklif': (context) =>  const Teklif(),'/Guncelleme': (context) =>  Guncelleme(),'/doctorpage': (context) =>  DoktorDetay(),},
      home: Login(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }
}

*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevu/api/eczaneApi.dart';
import 'package:randevu/constants.dart';
import 'package:randevu/pages/anaSayfa.dart';
import 'package:randevu/pages/dailydatasView.dart';
import 'package:randevu/pages/doktorModelsView.dart';
import 'package:randevu/pages/tasarim.dart';
import 'package:randevu/providers/doktormodel_provider.dart';
import 'package:randevu/providers/hastamodel_provider.dart';
import 'package:randevu/screens/hastaLogin/hasta_login_screen.dart';
import 'package:randevu/screens/seotalep/seotalep_screen.dart';
import 'package:randevu/screens/signup/signup_screen.dart';
import 'package:randevu/services/auth/auth_methods.dart';
import 'package:randevu/services/doctormodel/firestore_doctormodel_service.dart';
import 'package:randevu/services/hastamodel/firestore_hastamodel_services.dart';
import 'package:randevu/translations/codegen_loader.g.dart';
import 'package:randevu/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/doktorLogin/login_screen.dart';


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
          Provider<FirestoreDoctormodelService>(
            create: (_) => FirestoreDoctormodelService(),
          ),
          ChangeNotifierProvider(create: (context) => DoktorModelProvider()),
          StreamProvider(
            create: (context) =>
                context.read<FirestoreDoctormodelService>().getDoktorModel(),
            initialData: null,
          ),

         // ChangeNotifierProvider(create: (context) => MenuDrawerNotifier()),



          Provider<FirestoreHastamodelService>(
            create: (_) => FirestoreHastamodelService(),
          ),
          ChangeNotifierProvider(create: (context) => HastaModelProvider()),
          StreamProvider(
            create: (context) =>
                context.read<FirestoreHastamodelService>().getHastaModel(),
            initialData: null,
          ),
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
          home: DoctorLoginScreen(),
          routes: {
            "home": (_) => const HomePage(),
            "signup": (_) => SignUpScreen(),
            "login": (_) => DoktorLoginScreen(),
            "seotalep": (_) => SeoTalepScreen(),
            "dailydatas": (_) => DailyDatasView(),
            "doktormodels": (_) => DoktorModelsView(),
          },
        ));
  }
}
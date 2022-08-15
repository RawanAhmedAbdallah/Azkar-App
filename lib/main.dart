import 'package:azkar_app/database/db_controller.dart';
import 'package:azkar_app/preferences/shared_pref_controller.dart';
import 'package:azkar_app/provider/category_provider.dart';
import 'package:azkar_app/provider/counter_provider.dart';
import 'package:azkar_app/provider/note_provider.dart';
import 'package:azkar_app/provider/zekr_provider.dart';
import 'package:azkar_app/screens/app/categories_screen.dart';
import 'package:azkar_app/screens/app/home_screen.dart';
import 'package:azkar_app/screens/app/note_screen.dart';
import 'package:azkar_app/screens/auth/login_screen.dart';
import 'package:azkar_app/screens/auth/register_screen.dart';
import 'package:azkar_app/screens/azkar_screen.dart';
import 'package:azkar_app/screens/launch_screen.dart';
import 'package:azkar_app/screens/masaa_screen.dart';
import 'package:azkar_app/screens/app/tasbih_screen.dart';
import 'package:azkar_app/screens/post_prayer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<ZekrProvider>(
            create: (context) => ZekrProvider()),
        ChangeNotifierProvider<CounterProvider>(
            create: (context) => CounterProvider()),
        ChangeNotifierProvider<NoteProvider>(
              create: (context) => NoteProvider()),
        ],

      builder: (context, widget) {
      return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        locale: Locale('ar'),

        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen' : (context) => const LaunchScreen(),
          '/login_screen' : (context) => const LoginScreen(),
          '/register_screen' : (context) => const RegisterScreen(),
          '/categories_screen' : (context) => const CategoriesScreen(),
          '/azkar_screen': (context) =>  /*Const*/ AzkarScreen(),
          '/masaa_screen' : (context) => const MasaaScreen(),
          '/tasbih_screen' : (context) => const TasbihScreen(),
          '/note_screen' : (context) => const NoteScreen(),
          '/home_screen' : (context) => const HomeScreen(),
          '/post_prayer_screen' : (context) => const PostPrayerScreen(),
        },
      );
    },
    );
  }
}


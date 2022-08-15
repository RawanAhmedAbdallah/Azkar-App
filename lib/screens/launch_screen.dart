import 'package:azkar_app/preferences/shared_pref_controller.dart';
import 'package:azkar_app/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/zekr_provider.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState(){
    //TODO: implement initState
    super.initState();
    Provider.of<CategoryProvider>(context, listen:false).createCategories();
    Provider.of<ZekrProvider>(context, listen:false).createAzkar();

    Future.delayed(const Duration(seconds: 3),(){
      String route = SharedPrefController().getValueFor(key: PrefKeys.loggedIn.name) ??
          false
          ? '/home_screen'
          : '/login_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFBF6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 350,
              //child: Image.network('https://img.freepik.com/premium-vector/hand-drawn-tasbih-illustration_23-2149302501.jpg?w=740'),
              child: Image.asset('images/hand.png'),
            ),
            const SizedBox(height: 10),
            Text(
              'فاذكروني أذكركم',
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: const Color(0xFF61481C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

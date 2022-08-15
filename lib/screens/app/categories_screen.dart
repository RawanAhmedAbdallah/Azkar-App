import 'package:azkar_app/provider/category_provider.dart';
import 'package:azkar_app/screens/app/home_screen.dart';
import 'package:azkar_app/screens/app/note_screen.dart';
import 'package:azkar_app/screens/app/tasbih_screen.dart';
import 'package:azkar_app/screens/auth/login_screen.dart';
import 'package:azkar_app/screens/azkar_screen.dart';
import 'package:azkar_app/screens/post_prayer_screen.dart';
import 'package:azkar_app/utils/helpers.dart';
import 'package:azkar_app/widgets/azkar_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:azkar_app/screens/masaa_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with Helpers {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFEFBF6),
      appBar: AppBar(
        //iconTheme: const IconThemeData(color: Colors.transparent),
        backgroundColor: const Color(0xFF876445),
        elevation: 0,
        centerTitle: false,
        title: Text('فاذكروني أذكركم',
          style: GoogleFonts.tajawal(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: const Color(0xFFFEFBF6),
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: ListView(
              padding: const EdgeInsets.all(4.0),
              children: [
                DrawerHeader(
                  child: Image.asset('images/hand.png'),
                ),
         //      ListTile(
         //        title: Text('أذكار الصباح', style: GoogleFonts.tajawal(
         //          fontWeight: FontWeight.bold, color: const Color(0xFF876445),
         //        ),),
         //        onTap: () async {
         //          Navigator.pop(context);
         //          Navigator.push(
         //            context,
         //            MaterialPageRoute(
         //              builder: (context) => AzkarScreen(index: null!,),
         //            ),
         //          );
         //        },
         //      ),
         //      ListTile(
         //        title: Text('أذكار المساء',
         //          style: GoogleFonts.tajawal(
         //            fontWeight: FontWeight.bold,
         //            color: const Color(0xFF876445),
         //          ),
         //        ),
         //        onTap: () async {
         //          Navigator.pop(context);
         //          Navigator.push(
         //            context,
         //            MaterialPageRoute(
         //              builder: (context) => MasaaScreen(),
         //            ),
         //          );
         //        },
         //      ),
         //      ListTile(
         //        title: Text('أذكار بعد الصلاة',
         //          style: GoogleFonts.tajawal(
         //            fontWeight: FontWeight.bold,
         //            color: const Color(0xFF876445),
         //          ),
         //        ),
         //        onTap: () async {
         //          Navigator.pop(context);
         //          Navigator.push(
         //            context,
         //            MaterialPageRoute(
         //              builder: (context) => PostPrayerScreen(),
         //            ),
         //          );
         //        },
         //      ),
              ListTile(
                  title: Text('المسبحة',
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF876445),
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TasbihScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('إضافة ذكر',
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF876445),
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('أذكاري',
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF876445),
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('خروج',
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF876445),
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      body: Consumer<CategoryProvider>(
        builder: (context, CategoryProvider categoryProvider, child) {
          if (categoryProvider.categories.isNotEmpty) {
            return ListView.builder(
              itemCount: categoryProvider.categories.length,
              itemBuilder: (context, index) =>
                  AzkarCard(
                      title: categoryProvider.categories[index].title,
                      press: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              AzkarScreen(
                                  index: categoryProvider.categories[index].id,
                            title:categoryProvider.categories[index].title),

                        ),
                        );
                      }),

            );
           } else {
            return Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            );
          }
        },
      ),
    );
  }

}

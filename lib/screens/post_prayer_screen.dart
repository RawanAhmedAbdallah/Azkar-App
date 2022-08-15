import 'package:azkar_app/provider/zekr_provider.dart';
import 'package:azkar_app/utils/helpers.dart';
import 'package:azkar_app/widgets/zekr_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class PostPrayerScreen extends StatefulWidget {
  const PostPrayerScreen({Key? key}) : super(key: key);

  @override
  State<PostPrayerScreen> createState() => _PostPrayerScreenState();
}

class _PostPrayerScreenState extends State<PostPrayerScreen> with Helpers {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ZekrProvider>(context, listen: false).read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFEFBF6),
      appBar: AppBar(
        //iconTheme: const IconThemeData(color: Color(0xFF876445),),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF876445),
        //actions: [
        //  IconButton(onPressed: (){}, icon: Icons.favorite),
//
        //],
        elevation: 0,
        centerTitle: false,
        title: Text('أذكار بعد الصلاة',style: GoogleFonts.tajawal(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Consumer<ZekrProvider>(
          builder: (context,ZekrProvider zekrProvider,child) {
           if (zekrProvider.azkar.isNotEmpty) {
            return ListView.builder(
                itemCount: zekrProvider.azkar.length,
                itemBuilder: (context, index) =>
                Card(
                child: Column(
                children: [
                Text(zekrProvider.azkar[index].content),
            ],
                ),
                ),
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



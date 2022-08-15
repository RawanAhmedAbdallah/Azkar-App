import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzkarCard extends StatelessWidget {
const AzkarCard({
Key? key,required this.title, required this.press,
}) : super(key: key);

final String title;
final Function() press;

//void selectCategory(BuildContext context){
//  Navigator.of(context).pushNamed('/azkari_screen',
//    arguments: {
//    'index':index,
//    'category':Category,
//    }
//  );
//}


@override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
    height:180,
    child: InkWell(
      onTap: press,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFEFBF6),
              boxShadow: const[BoxShadow(
                offset: Offset(1,0),
                blurRadius: 20,
                color: Colors.black26,
              )],
            ),
          ),
          Positioned(
            top: 10,
            left: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              width: 150,
              child: Image.asset('images/hand.png', fit: BoxFit.cover,
              ),
            ),
          ),
      Positioned(
        top: 18,
        right: 18,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 60),
              child: Text(
                title,style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: const Color(0xFF876445),
              ),),
            ),
          ],
        ),
      ),
        ],
      ),
    ),
  );
}
}

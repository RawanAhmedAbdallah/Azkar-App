import 'package:azkar_app/provider/counter_provider.dart';
import 'package:azkar_app/provider/zekr_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




class ZekrCard extends StatelessWidget {
  const ZekrCard({Key? key, required this.zekrId, required this.content, required this.count}) : super(key: key);

  final int zekrId;
  final String content;
  final int count;
  

  @override
  Widget build(BuildContext context) {
    Provider.of<CounterProvider>(context,listen: false);
    Provider.of<ZekrProvider>(context,listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        height: 190,
        decoration: BoxDecoration(
          color: const Color(0xFFFEFBF6),
          boxShadow: const[BoxShadow(
            offset: Offset(1, 0),
            blurRadius: 10,
            color: Colors.black26,
          )
          ],
          borderRadius: BorderRadius.circular(10),
        ),


        child: Column(
          children: [
          // Expanded(
          //   child: Container(
          //     child:
          //     Text(zekrId.toString(), style: GoogleFonts.tajawal(
          //       color: const Color(0xFF876445),
          //       fontWeight: FontWeight.bold,
          //     ),),
          //   ),
          // ),
            const Spacer(),
            Container(
              child: Text(
                content,
                style: GoogleFonts.tajawal(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           Spacer(),
          // InkWell(
          // onTap: () {
          //   context.read<CounterProvider>().increment();

          // },
           Container(
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: const Color(0xFFFEFBF6),
           boxShadow: const[BoxShadow(
           blurRadius: 2,
           color: Colors.black26,
           ),
           ]),
           child: Container(
              height: 40,

              width: 40,
              alignment: Alignment.center,
              child: Text(
                //'${context.watch<CounterProvider>().counter}'
                count.toString(),
                style: GoogleFonts.tajawal(
              color: const Color(0xFF876445),
              fontWeight: FontWeight.bold,
             ),),
             ),
           ),
      ])
           )
           );
  }
}




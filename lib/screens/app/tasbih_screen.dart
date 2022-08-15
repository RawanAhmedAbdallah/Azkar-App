import 'package:azkar_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class TasbihScreen extends StatefulWidget {
  const TasbihScreen({Key? key}) : super(key: key);

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int counter = 0;
  String content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
 CounterProvider counterProvider = Provider.of<CounterProvider>(context,listen:true);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF876445),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: Color(0xFF876445),),
        title: Text(
          'المسبحة',
          style: GoogleFonts.tajawal(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF876445),
          ),
        ),
        actions: [
         // IconButton(
          //  onPressed: () {
            //  Navigator.pushNamed(context, '/info_screen',
              //    arguments: {'message': 'مسبحة الأذكار'});
           // },
            //icon: const Icon(Icons.info,
            //),
         // ),

      //  IconButton(
      //    onPressed: () {
      //      //Navigator.push(
      //       // context,
      //        //MaterialPageRoute(
      //        //  builder: (context) => AboutScreen(message: 'About Message'),
      //        //),
      //     // );
      //    },
      //    icon: Icon(Icons.question_answer),
      //  ),
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected: (String value) {
              if (value != content) {
                setState(() {
                  content =value;
                  counter = 0;
                });
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'أستغفر الله',
                  height: 30,
                  child: Text(
                    'أستغفر الله',
                    style: GoogleFonts.tajawal(fontSize: 14),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: 'الحمد لله',
                  height: 30,
                  child: Text(
                    'الحمد لله',
                    style: GoogleFonts.tajawal(fontSize: 14),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: 'سبحان الله',
                  height: 30,
                  child: Text(
                    'سبحان الله',
                    style: GoogleFonts.tajawal(fontSize: 14),
                  ),
                ),
              ];
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment();
          //setState(() => _counter += 1);
        },
        backgroundColor: const Color(0xFF876445),
        child: const Icon(Icons.add),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFFF7E9D7),
              Color(0xFFEBD8C3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const CircleAvatar(
              //   radius: 40,
              //   backgroundImage: AssetImage('images/image_1.jpeg'),
              // ),

                // child: Image.asset(
                //   'images/image_1.jpeg',
                //   fit: BoxFit.cover,
                // ),

              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.only(bottom: 20),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lateef(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: Color(0xFFCA955C)),
                      child: Text(
                        '${context.watch<CounterProvider>().counter}',
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CounterProvider>().increment();
                        //setState(() {
                        //  ++_counter;
                        //});
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF876445),
                        minimumSize: const Size(0, 45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(15),
                            bottomStart: Radius.circular(5),
                          ),
                        ),
                      ),
                      child: Text(
                        'تسبيح',
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CounterProvider>().decrement();
                       // setState(() =>
                       // _counter = 0
                       // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF66BFBF),
                        minimumSize: const Size(0, 45),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(15),
                            topEnd: Radius.circular(5),
                          ),
                        ),
                      ),
                      child: Text(
                        'إعادة',
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ]),
      ),
      ),
    );
  }
}

import 'package:azkar_app/provider/counter_provider.dart';
import 'package:azkar_app/provider/zekr_provider.dart';
import 'package:azkar_app/utils/helpers.dart';
import 'package:azkar_app/widgets/zekr_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AzkarScreen extends StatefulWidget{
  const AzkarScreen({Key? key, this.index,this.title}) : super(key: key);

  final int? index;
  final String? title;

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> with Helpers {

  int counter =0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ZekrProvider>(context, listen: false).showZekr(widget.index!);
    Provider.of<CounterProvider>(context,listen: false);

  }
  @override
  Widget build(BuildContext context) {
 //final routeArgument = ModalRoute.of(context)!.settings.
 //Arguments as Map<String,dynamic>?;
 //final categoryId = routeArgument!['index'];
 //final categoryTitle = routeArgument['category'];
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
        title: Text(widget.title!,style: GoogleFonts.tajawal(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Consumer<ZekrProvider>(
          builder: (context,ZekrProvider zekrProvider,child) {
      if (zekrProvider.azkar.isNotEmpty) {
            return ListView.builder(
                itemCount: zekrProvider.azkar.length,
                itemBuilder: (context, index)=>
            ZekrCard(
                zekrId: zekrProvider.azkar[index].zekrId,
                content: zekrProvider.azkar[index].content,
                count: zekrProvider.azkar[index].count,

            ),
             //  Card(
             //    child: Column(
             //      children: [
             //        Text(zekrProvider.azkar[index].content)
             //      ],
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



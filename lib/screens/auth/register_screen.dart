import 'package:azkar_app/database/controller/user_db_controller.dart';
import 'package:azkar_app/models/process_response.dart';
import 'package:azkar_app/models/user.dart';
import 'package:azkar_app/utils/helpers.dart';
import 'package:azkar_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
 late TextEditingController _passwordTextController;

  @override
  void initState(){
    super.initState();
    _nameTextController=TextEditingController();
    _emailTextController =TextEditingController();
    _passwordTextController =TextEditingController();
  }

  @override
  void dispose(){
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:const Color(0xFFFEFBF6),
      appBar: AppBar(
        title: Text(
          'إنشاء حساب',
        style: GoogleFonts.tajawal(
          fontSize: 22,
          color:   Colors.white,
          fontWeight: FontWeight.bold,
         ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF876445),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إنشىء حساب جديد ...',
              style: GoogleFonts.tajawal(
              fontWeight: FontWeight.bold,
              fontSize:22,
              color: const Color(0xFFC0A080),
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              'أدخل البيانات التالية',
              style: GoogleFonts.tajawal(
                height: 0.8,
                fontWeight: FontWeight.w400,
                fontSize:16,
                color: const Color(0xFFC0A080),
              ),
            ),

            const SizedBox(height: 20,),
            AppTextField(
              textController: _nameTextController,
              hint: 'اسم المستخدم',
              prefixIcon: Icons.person,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20,),
            AppTextField(
              textController: _emailTextController,
                hint:'البريد الإلكتروني',
                prefixIcon: Icons.email,
                textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20,),
            AppTextField(
              textController: _passwordTextController,
              hint: 'كلمةالمرور',
              prefixIcon: Icons.lock,
              obscureText: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (String value){
                //TODO Call Login Function
              },
            ),
            const SizedBox(height: 20,),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                ),
              child: ElevatedButton(
                  onPressed:() async => await _performRegister(),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF876445),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )
                  ),
                child: Text('إنشاء حساب',style: GoogleFonts.tajawal(),),
                ),
              ),

          ],
        ),
      ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: (){
    //     Provider.of<LanguageProvider>(context,listen: false).changelanguage();
    //   },
    //   backgroundColor: const Color(0xFFFFDEDE),
    //   child: const Icon(Icons.language,
    //   color: Color(0xFFABC9FF),
    //   ),
    // ),
    );
  }

  Future<void> _performRegister() async{
    if(_checkData()){
      await _register();
    }
  }

  bool _checkData() {
   if(_nameTextController.text.isNotEmpty
     &&_emailTextController.text.isNotEmpty
       && _passwordTextController.text.isNotEmpty){
     return true;
   }

   showSnackBar(context, message:'Enter required data!', error: true);
   return false;
 }


 Future<void> _register() async {
    ProcessResponse processResponse = await UserDbController().register(user: user);
    if(processResponse.success){
      Navigator.pop(context);
    }

    showSnackBar(context, message:processResponse.message, error: !processResponse.success );
 }

 User get user{
    User user= User();
    user.name = _nameTextController.text;
    user.email = _emailTextController.text;
    user.password = _passwordTextController.text;
    return user;
 }
}




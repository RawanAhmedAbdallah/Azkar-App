import 'package:azkar_app/database/controller/user_db_controller.dart';
import 'package:azkar_app/models/process_response.dart';
import 'package:azkar_app/utils/helpers.dart';
import 'package:azkar_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
 late TextEditingController _emailTextController;
 late TextEditingController _passwordTextController;

  @override
  void initState(){
    super.initState();
    _emailTextController =TextEditingController();
    _passwordTextController =TextEditingController();
  }

  @override
  void dispose(){
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFEFBF6),
      appBar: AppBar(
        title: Text(
            'تسجيل الدخول',
        style: GoogleFonts.tajawal(
          fontSize: 22,
          color:  const Color(0xFFFEFBF6),
          fontWeight: FontWeight.bold,
         ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF876445),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مرحبا بعودتك ..',
                style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize:22,
                color: const Color(0xFFC0A080),
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                'أدخل البريد وكلمة المرور',
                style: GoogleFonts.tajawal(
                  height: 0.8,
                  fontWeight: FontWeight.w400,
                  fontSize:16,
                  color: const Color(0xFFC0A080),
                ),
              ),
              const SizedBox(height: 20,),
              AppTextField(
                textController: _emailTextController,
                  hint: 'البريد الإلكتروني',
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
                    onPressed:() async => await _performLogin(),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF876445),
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    ),
                  
                  child:  Text('تسجيل الدخول', style:GoogleFonts.tajawal(),),
                  ),
                ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text('لا أملك حساب ،' ,
                    style: GoogleFonts.tajawal(
                      color: Color(0xFFC0A080),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register_screen'),
                    child: Text('تسجيل ! ',
                      style: GoogleFonts.tajawal(
                        color: Color(0xFFC0A080),
                          fontWeight: FontWeight.bold,
                          decoration:TextDecoration.underline,
                          decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
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

  Future<void> _performLogin() async{
    if(_checkData()){
      await _login();
    }
  }

  bool _checkData() {
   if(_emailTextController.text.isNotEmpty &&
       _passwordTextController.text.isNotEmpty){
     return true;
   }
    
   showSnackBar(context, message:'Enter required data!', error: true);
   return false;
 }


 Future<void> _login() async {
   ProcessResponse processResponse = await UserDbController().login(
       email: _emailTextController.text, password: _passwordTextController.text);
     if (processResponse.success) {
       Navigator.pushReplacementNamed(context, '/categories_screen');
     }
   showSnackBar(context, message:processResponse.message, error: !processResponse.success );

   }
}




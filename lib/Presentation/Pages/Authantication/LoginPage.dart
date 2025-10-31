import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_shopping/Presentation/CustomWidgets/CustomTextField.dart';

import '../../../Navigation_manu.dart';
import '../../CustomWidgets/CustomButton.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _loading = false;

  void _snack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _login() async {
    if (_email.text
        .trim()
        .isEmpty || _password.text
        .trim()
        .isEmpty) {
      _snack("Fill up all Field", Colors.red);
      return;
    }
    setState(() => _loading = true);
     try {
       final userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: _email.text.trim(), password: _password.text.trim());

       Future.delayed(const Duration(seconds: 1), () {
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) =>  NavigationMenu()),
         );
       });
     }on FirebaseAuthException catch (e) {
       String msg = 'Login failed';
       if (e.code == 'user-not-found') msg = 'No user found for that email';
       else if (e.code == 'wrong-password') msg = 'Incorrect password';
       else if (e.code == 'invalid-email') msg = 'Invalid email format';
       else if (e.code == 'user-disabled') msg = 'Account disabled';
       _snack(msg, Colors.red);
     } catch (e) {
       _snack('Unexpected error: $e', Colors.red);
     } finally {
       setState(() => _loading = false);
     }
  }
  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


        SizedBox(height: 30,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Text("LOGIN",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)
            ),
            Text("E-Mail",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your E-mail",controller: _email,),
            SizedBox(height: 20,),
            Text("Password",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your Password",suffixIcon: Icon(Icons.remove_red_eye),controller:_password ,),
            SizedBox(height: 10,),
            TextButton(onPressed: (){}, child: Text("Forgot Password ?",style: TextStyle(color: Colors.blue),)),
            SizedBox(height: 20,),
            CustomButton(
              onTap: _loading ? null : _login,
              text:_loading ? 'Logging in...' : 'Login',
              fontsize: 18,
              textcolor: Colors.black,
              bgcolor: Colors.blueGrey,
              btnheight: 50,
              btnwidth: double.infinity,

            ),


          ],
        ),
              //SizedBox(height: 50,),
              Column(
                children: [
                  Text('or login with ',style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  CustomButton(
                    onTap: () {},
                    text: "Login With Google",
                    fontsize: 18,
                    textcolor: Colors.black,
                    bgcolor: Colors.white,
                    btnheight: 50,
                    btnwidth: double.infinity,
                    imagePath: "assets/images/google1.png",
                    imageHeight: 24,   // ✅ good size
                    imageWidth: 24,
                  ),
                ],
              )
            ],
        ),
      ),
    );
  }
}

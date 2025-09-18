import 'package:flutter/material.dart';
import 'package:quick_shopping/Presentation/CustomWidgets/CustomTextField.dart';

import '../../CustomWidgets/CustomButton.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

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
            CustomTextField( hintText: "Enter Your E-mail",),
            SizedBox(height: 20,),
            Text("Password",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your Password",suffixIcon: Icon(Icons.remove_red_eye)),
            SizedBox(height: 10,),
            TextButton(onPressed: (){}, child: Text("Forgot Password ?",style: TextStyle(color: Colors.blue),)),
            SizedBox(height: 20,),
            CustomButton(
              onTap: () {},
              text: "Login",
              fontsize: 18,
              textcolor: Colors.black,
              bgcolor: Colors.green,
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

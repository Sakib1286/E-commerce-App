import 'package:flutter/material.dart';

import '../../CustomWidgets/CustomButton.dart';
import '../../CustomWidgets/CustomTextField.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)
            ),
            Text("First Name",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your First Name",),
            SizedBox(height: 20,),
            Text("Last Name",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your Last Name",),
            SizedBox(height: 10,),
            Text("E-Mail",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your E-mail",),
            SizedBox(height: 20,),
            Text("Password",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Enter Your Password",suffixIcon: Icon(Icons.remove_red_eye)),
            SizedBox(height: 10,),
            Text("Confirm Password",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            SizedBox(height: 10,),
            CustomTextField( hintText: "Confirm Password",suffixIcon: Icon(Icons.remove_red_eye)),
            SizedBox(height: 25,),
            CustomButton(
              onTap: () {},
              text: "Create Account",
              fontsize: 18,
              textcolor: Colors.black,
              bgcolor: Colors.green,
              btnheight: 50,
              btnwidth: double.infinity,

            ),
            SizedBox(height: 20,),
            Center(child: Text('By Counting you agree to out terms of service ',style: TextStyle(color: Colors.black38,fontSize: 15,fontWeight: FontWeight.w500),)),
          ],
        ),
      ),
    );
  }
}

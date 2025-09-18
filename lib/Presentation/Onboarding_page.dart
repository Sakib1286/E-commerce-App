import 'package:flutter/material.dart';
import 'package:quick_shopping/Presentation/CustomWidgets/CustomButton.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Image.asset(
                "assets/images/qs.jpg",
                height: ScreenHeight * 0.3,
                width: ScreenWidth * 0.4,
              ),
            ),

        //CustomButton(onTap: (){}, text: "Login", fontsize: 15, textcolor: Colors.black, bgcolor: Colors.green, btnheight: 10, btnwidth: 10)
         Container(
           height:ScreenHeight * .3,
           width: ScreenWidth* double.infinity,
           color: Colors.transparent,
           child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(onTap: (){}, text: "Register", fontsize: 18, textcolor: Colors.black, bgcolor: Colors.grey, btnheight: 50, btnwidth: 180),
                    SizedBox(width: 15,),
                    CustomButton(onTap: (){}, text: "Login", fontsize: 18, textcolor: Colors.black, bgcolor: Colors.green, btnheight: 50, btnwidth: 180),
                  ],
                ),
                SizedBox(height: 30,),
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
            ),
           ),
         )
          ],
        ),
      ),
    );
  }
}

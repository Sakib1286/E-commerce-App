import 'package:flutter/material.dart';

import '../../CustomWidgets/CustomButton.dart';
import '../../CustomWidgets/CustomTextField.dart';

class VarificationPage extends StatelessWidget {
  const VarificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Text("Varification ",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)
                ),
                Text("Enter  Code",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
                SizedBox(height: 10,),
                CustomTextField( hintText: "Digit Code", controller: null,),
                SizedBox(height: 20,),

               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("Didn't get the code ?",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
                   TextButton(onPressed: (){}, child: Text('Resend Code',style: TextStyle(color: Colors.blue,fontSize: 12),)),
                 ],
               ),
                SizedBox(height: 20,),



              ],
            ),
            CustomButton(
              onTap: () {},
              text: "Varify Account",
              fontsize: 18,
              textcolor: Colors.black,
              bgcolor: Colors.green,
              btnheight: 50,
              btnwidth: double.infinity,

            ),
            //SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}

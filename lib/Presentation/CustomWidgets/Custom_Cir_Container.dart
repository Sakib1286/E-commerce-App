import 'package:flutter/material.dart';

class CustomCirContainer extends StatelessWidget {
  final String? imagePath;
  final double size;
  final String text;
  final VoidCallback onTap;// 👈 make it circular by single size

  const CustomCirContainer({
    super.key,
    this.imagePath,
    this.size = 30, required this.text, required this.onTap, // default mini size
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Column(

        children: [

          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle, // 👈 perfect circle
              color: Colors.indigo,     // background if no image
              image: imagePath != null
                  ? DecorationImage(
                image: AssetImage(imagePath!),
                fit: BoxFit.cover,
              )
                  : null,
            ),

          ),
          SizedBox(height: 5,),
          Text(text,style: TextStyle(color: Colors.black,fontSize: 12),)
        ],

      ),
    );
  }
}
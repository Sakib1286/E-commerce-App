import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color textcolor;
  final double fontsize;
  final Color bgcolor;
  final double? btnheight;
  final double? btnwidth;
  final String? imagePath;
  final double? imageHeight;   // ✅ custom height
  final double? imageWidth;


  const CustomButton(
      {super.key,
        required this.onTap,
        required this.text,
        required this.fontsize,
        required this.textcolor,
        required this.bgcolor,
        required this.btnheight,
        required this.btnwidth,
        this.imagePath, this.imageHeight, this.imageWidth,

      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(
            btnwidth ?? MediaQuery.of(context).size.width,
            btnheight ?? MediaQuery.of(context).size.height * 0.06,

          ),
          backgroundColor: bgcolor,

          elevation: 1.0,
          shadowColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          if (imagePath != null) ...[
            Image.asset(
              imagePath!,
              height: imageHeight ?? 24,  // default 24 if not provided
              width: imageWidth ?? 24,
            ),
            const SizedBox(width: 10),
          ],
          Text(
            text,
            style: TextStyle(color: textcolor, fontSize: fontsize),
          ),
        ],
      ),

    );
  }
}
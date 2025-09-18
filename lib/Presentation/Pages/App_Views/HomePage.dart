import 'package:flutter/material.dart';

import '../../CustomWidgets/CustomTextField.dart';
import '../../CustomWidgets/Custom_Cir_Container.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          title: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/naruto.png"),
              ),
              const SizedBox(width: 10),
              const Text(
                "Naruto Uzumaki",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.blueGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_active_outlined, color: Colors.white)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.nights_stay, color: Colors.white)),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20), // height of search bar
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
          ),
        )

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [

          Row(
            children: [
              CustomCirContainer(imagePath: 'assets/images/mac.jpg',size: 50, text: 'Accessories',onTap: (){print("Sucessssssssssssssssssssssssssssssssssss");},)
            ],
          )
          ],
        ),
      ),
    );
  }
}

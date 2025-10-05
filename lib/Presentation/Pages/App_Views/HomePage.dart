import 'package:flutter/material.dart';
import 'package:quick_shopping/Presentation/Pages/App_Views/DetailsPage.dart';
import 'package:quick_shopping/Presentation/Pages/App_Views/ProfilePage.dart';

import '../../../data/dart/product_list.dart';
import '../../CustomWidgets/CustomTextField.dart';
import '../../CustomWidgets/Custom_Cir_Container.dart';
import '../../CustomWidgets/Product_card.dart';

class Homepage extends StatelessWidget {

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          title: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/images/naruto.png"),
                ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                        CustomCirContainer(imagePath: 'assets/images/mac.jpg',size: 60, text: 'Tech',onTap: (){},),
                  SizedBox(width: ScreenWidth*.025,),
                  CustomCirContainer(imagePath: 'assets/images/coffee.jpg',size: 60, text: 'Grocery',onTap: (){},),
                  SizedBox(width: ScreenWidth*.025,),
                  CustomCirContainer(imagePath: 'assets/images/fasion.jpg',size: 60, text: 'Fasion',onTap: (){},),
                  SizedBox(width: ScreenWidth*.025,),
                  CustomCirContainer(imagePath: 'assets/images/furniture.jpg',size: 60, text: 'Furniture',onTap: (){},),
                  SizedBox(width: ScreenWidth*.025,),
                  CustomCirContainer(imagePath: 'assets/images/cos.jpg',size: 60, text: 'Cosmetics',onTap: (){},),
                  SizedBox(width: ScreenWidth*.025,),
                  CustomCirContainer(imagePath: 'assets/images/fruits.jpg',size: 60, text: 'Fruits',onTap: (){},),
                  SizedBox(width: ScreenWidth*.025,),
                  CustomCirContainer(imagePath: 'assets/images/travel.jpg',size: 60, text: 'Travel',onTap: (){},),
              
                ],
              ),
            ),
              SizedBox(height: ScreenHeight*.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Populer Item",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){}, child: Text("View All",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold))),
                ],
              ),
              Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // disable GridView scrolling
                    shrinkWrap: true, // let GridView size itself based on content
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(product_: products[index], onTab:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detailspage(product: products[index]),
                          ),
                        );
                      },);
                    },
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

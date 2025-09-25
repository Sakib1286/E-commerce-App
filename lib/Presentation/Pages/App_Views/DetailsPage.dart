import 'package:flutter/material.dart';
import '../../../data/dart/Model.dart';
import '../../../data/dart/product_list.dart';
import '../../CustomWidgets/CustomButton.dart';
import '../../CustomWidgets/Product_card.dart';


class Detailspage extends StatefulWidget {
  final Product product;
  const Detailspage({super.key, required this.product});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 0) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Product Image
            Stack(
              children:[ Image.asset(
                widget.product.image,
                height: screenHeight * 0.4,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
                Positioned(
                  top: 40,  // adjust for status bar
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

        ]
            ),

            SizedBox(height: screenHeight*0.01),

            // Product Info
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star,size: 20,color: Colors.green,),
                      Icon(Icons.star,size: 20,color: Colors.green,),
                      Icon(Icons.star,size: 20,color: Colors.green,),
                      Icon(Icons.star,size: 20,color: Colors.green,),

                    ],
                  ),
                  SizedBox(height: screenHeight*0.009),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: screenHeight*0.01),
                  Text(
                    widget.product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                   SizedBox(height: screenHeight*0.01),

                  // Full Details (Now scrollable)
                  Text(
                    widget.product.details,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: screenHeight*0.01),

                  // Price
                  Text(
                    "\$${widget.product.price}",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: screenHeight*0.01),
                  Card(
                    elevation: 4,
                    shadowColor: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Product Quantity", style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),),
                          SizedBox(height: screenHeight*0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: decrement,
                                icon: const Icon(Icons.remove),
                                color: Colors.redAccent,
                              ),
                              SizedBox(width: screenWidth*0.01),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: screenWidth*0.01),
                              // Increment button
                              IconButton(
                                onPressed: increment,
                                icon: const Icon(Icons.add),
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight *.01),

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
              ),
            ),



          ],

        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.all(10),
      child: CustomButton(onTap: (){}, text: "Add to Card", fontsize: 18, textcolor: Colors.black, bgcolor: Colors.green, btnheight: 50,
      btnwidth: double.infinity,),
      ),
    );
  }
}

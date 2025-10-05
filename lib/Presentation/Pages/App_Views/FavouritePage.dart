import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_shopping/Presentation/Pages/App_Views/HomePage.dart';
import '../../../Bloc/FavouriteCubit.dart';
import '../../../data/dart/Model.dart';
import '../../../data/dart/product_list.dart';
import '../../CustomWidgets/Product_card.dart';
import 'DetailsPage.dart';


class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Favourites",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
        centerTitle: true,
      leading: IconButton(onPressed: (){

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      }, icon: Icon(Icons.arrow_back)),),


      body: BlocBuilder<FavouriteCubit, List<Product>>(
        builder: (context, favourites) {
          if (favourites.isEmpty) {
            return const Center(child: Text("No favourites yet"));
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final product = favourites[index];
                return ProductCard(
                  product_: product,
                  onTab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailspage(product: products[index]),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

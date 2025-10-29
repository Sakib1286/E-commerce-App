import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_shopping/Bloc/FavouriteCubit.dart';

import '../../data/dart/Model.dart';

class ProductCard extends StatelessWidget {

  final Product product_;   // ✅ accept whole product model
  final VoidCallback onTab;
  const ProductCard({super.key, required this.product_, required this.onTab});
  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(

      onTap: onTab,
      child: Card(

        elevation: 4,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                product_.image,
                height: ScreenHeight*0.09,
                width: ScreenWidth*double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  // Category
                  Text(
                    product_.category,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: ScreenHeight * 0.001,),

                  // Name
                  Text(
                    product_.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: ScreenHeight*0.001,),

                  // Description
                  Text(
                    product_.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  SizedBox(height: ScreenHeight*0.0009,),

                  // Price + Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${product_.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),




                      BlocBuilder<FavouriteCubit, List<Product>>(

                          builder: (context,favourite){
                            final isFav= favourite.contains(product_);
                            
                            return IconButton( icon: Icon(
                            isFav
                            ? Icons.favorite
                                : Icons.favorite_border_outlined,
                              color: isFav ? Colors.red : Colors.grey,
                            ),
                              onPressed: () {
                                context
                                    .read<FavouriteCubit>()
                                    .toggleFavourite(product_);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(isFav
                                        ? "Removed from favourites"
                                        : "Added to favourites successfully"),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                            );

                          }
                      )
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

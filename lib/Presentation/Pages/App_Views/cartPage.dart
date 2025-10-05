import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc/Add_to_cardBloc.dart';
import '../../../Navigation_manu.dart';
import '../../../data/dart/Model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<CartCubit, List<Product>>(
        builder: (context, cart) {
          if (cart.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          return ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final product = cart[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Image.asset(product.image, width: 60, fit: BoxFit.cover),
                  title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("\$${product.price} x ${product.quantity} = \$${(product.price * product.quantity).toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<CartCubit>().removeFromCart(product);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartCubit, List<Product>>(
        builder: (context, cart) {
          double total = cart.fold(0, (sum, item) => sum + item.price * item.quantity);

          return Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: \$${total.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Proceed to checkout logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Checkout is not implemented yet.")),
                    );
                  },
                  child: const Text("Checkout"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

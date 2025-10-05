import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_shopping/data/dart/Model.dart';

class CartCubit extends Cubit<List<Product>>{
  CartCubit():super([]);


  void addToCart (Product product){
    final cart = List<Product>.from(state);
    final index = cart.indexWhere((item) => item.name == product.name);

    if (index != -1) {
      cart[index].quantity += product.quantity;
    } else {
      cart.add(product);
    }

    emit(cart);
  }

  void removeFromCart (Product product){
    final currentCart=List<Product>.from(state);
    if (currentCart.contains(product)){
      currentCart.remove(product);
      emit(currentCart);
    }
  }


  void clearCart() {
    emit([]);
  }
}
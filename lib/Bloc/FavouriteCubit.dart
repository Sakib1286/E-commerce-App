import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/dart/Model.dart';

class FavouriteCubit extends Cubit<List<Product>> {
  FavouriteCubit() : super([]);

  void toggleFavourite(Product product) {
    final currentFavourites = List<Product>.from(state);

    if (currentFavourites.contains(product)) {
      currentFavourites.remove(product);
    } else {
      currentFavourites.add(product);
    }

    emit(currentFavourites);
  }

  bool isFavourite(Product product) {
    return state.contains(product);
  }
}

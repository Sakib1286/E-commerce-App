import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_shopping/Presentation/Pages/App_Views/FavouritePage.dart';
import 'package:quick_shopping/Presentation/Pages/App_Views/HomePage.dart';
import 'package:quick_shopping/Presentation/Pages/App_Views/cartPage.dart';

import 'Presentation/Pages/App_Views/ProfilePage.dart';



class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final List<Widget> screens = const [
    Homepage(),
    FavouritePage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            body: screens[selectedIndex],
            bottomNavigationBar: NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) =>
                  context.read<NavigationCubit>().updateIndex(index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_border_outlined), label: 'Favourite'),
                NavigationDestination(
                    icon: Icon(Icons.list_alt_outlined), label: 'Carts'),
                NavigationDestination(
                    icon: Icon(Icons.person_2_outlined), label: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}



class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void updateIndex(int index) => emit(index);
}

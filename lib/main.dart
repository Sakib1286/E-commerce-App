import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_shopping/Bloc/FavouriteCubit.dart';
import 'package:quick_shopping/Navigation_manu.dart';


import 'Bloc/Add_to_cardBloc.dart';
import 'Presentation/Pages/App_Views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FavouriteCubit()),
        BlocProvider(create: (_) => CartCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationMenu(), // your main page
      ),
    );
  }
}


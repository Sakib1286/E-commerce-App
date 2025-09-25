import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_shopping/Bloc/FavouriteCubit.dart';
import 'package:quick_shopping/Navigation_manu.dart';
import 'package:quick_shopping/Presentation/Onboarding_page.dart';
import 'package:quick_shopping/Presentation/Pages/App_Views/DetailsPage.dart';
import 'package:quick_shopping/Presentation/Pages/Authantication/LoginPage.dart';
import 'package:quick_shopping/Presentation/Pages/Authantication/RegisterPage.dart';
import 'package:quick_shopping/Presentation/Pages/Authantication/Varification_page.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationMenu(), // your main page
      ),
    );
  }
}


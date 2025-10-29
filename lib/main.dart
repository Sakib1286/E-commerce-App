import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quick_shopping/Bloc/FavouriteCubit.dart';
import 'package:quick_shopping/Navigation_manu.dart';
import 'package:quick_shopping/Presentation/Onboarding_page.dart';


import 'Bloc/Add_to_cardBloc.dart';

import 'Presentation/Pages/App_Views/HomePage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,); // or with DefaultFirebaseOptions
  runApp(MyApp());
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
        //BlocProvider(create: (_) => PaymentBloc(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(), // your main page
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/nav_bloc/nav_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/product_bloc/product_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/screens/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductBloc()),
        BlocProvider(create: (_) => CartBloc()),
        BlocProvider(create: (_) => FavoriteBloc()),
        BlocProvider(create: (_) => NavBarBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: HomePage(),
      ),
    );
  }
}

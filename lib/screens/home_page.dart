import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/nav_bloc/nav_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/nav_bloc/nav_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/product_bloc/product_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/product_bloc/product_event.dart';
import 'package:product_cart_app_bloc_task_23j/screens/cart_screen.dart';
import 'package:product_cart_app_bloc_task_23j/screens/main_home_screen.dart';
import 'package:product_cart_app_bloc_task_23j/screens/popular_screen.dart';
import 'package:product_cart_app_bloc_task_23j/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    MainHomeScreen(),
    PopularScreen(),
    CartScreen(),
    ProfilePage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final bloc = context.read<ProductBloc>();
    bloc.add(LoadProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, int>(
      builder: (context, NavIndex) {
        return Scaffold(
          body: _pages[NavIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NavIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: Colors.blue.shade300,
            onTap: (index) {
              context.read<NavBarBloc>().add(ChangeIndex(index));
            },
            items:  [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded),
                label: 'Popular',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}

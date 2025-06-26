import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc/product_bloc.dart';
import '../bloc/product_bloc/product_state.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/product_cart.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}
class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(),
          SizedBox(height: 25),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              children: [

                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoadedState) {
                      final product = state.products;

                      return ProductList(products: product);
                    } else if (state is ProductSearchState) {
                      final product = state.filterList;
                      if (product.isNotEmpty) {
                        return ProductList(products: product);
                      } else {
                        return Center(child: Text('Product not found'));
                      }
                    } else if (state is ProductErrorState) {
                      return Center(
                        child: Text(
                          'Data not found',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

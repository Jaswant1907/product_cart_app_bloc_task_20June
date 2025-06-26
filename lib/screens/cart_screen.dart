import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/widgets/ord_prod_list_view.dart';
import '../bloc/cart_bloc/cart_bloc.dart';
import '../bloc/cart_bloc/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF2196F3),
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue.shade100,
            ),
            child: const Icon(Icons.shopping_cart, color: Colors.blue),
          ),
        ),
        title: const Text(
          'Your Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),

      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdatedState) {
            final cartItems = state.items;
            if (cartItems.isEmpty) {
              return _buildEmptyCart();
            }

            final products = cartItems.keys.toList();

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: OrderProductView(products: products,)
            );
          }

          return const Center(
            child: Text(
              'No Cart products found.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.remove_shopping_cart, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 20),
          const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

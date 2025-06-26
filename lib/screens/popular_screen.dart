
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_state.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            child: const Icon(Icons.favorite, color: Colors.blue),
          ),
        ),
        title: const Text(
          'Favorite Cart',
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
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is LoadState) {
            final favorites = state.favorite;

            if (favorites.isEmpty) {
              return const Center(
                child: Text(
                  'No favorite products found.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];

                return Dismissible(
                  key: Key('order_item$index'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.delete,color: Colors.white,) ,
                  ),
                  onDismissed: (direction){
                    context.read<FavoriteBloc>().add(RemoveFavEvent(product: product));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Remove from Favorite',style: TextStyle(color: Colors.black87),),duration: Duration(seconds: 1),backgroundColor: Colors.white,));
                  },
                  child: Card(
                    elevation: 4,
                    margin:  EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey[200],
                              child: product.images != null && product.images!.isNotEmpty
                                  ? Image.network(product.images![0], fit: BoxFit.cover)
                                  : const Icon(Icons.image_not_supported),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title ?? 'Untitled',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedButton.icon(
                                      onPressed: () {
                                        context.read<CartBloc>().add(AddItemToCart(product: product));
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            content: Row(
                                              children: [
                                                Icon(Icons.check_circle_outline, color: Colors.green),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    'Added to Cart Successfully!',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            backgroundColor: Colors.white,
                                            duration: Duration(seconds: 1),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.shopping_cart_outlined),
                                      label: const Text("Add to Cart"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/favourite_bloc/favourite_state.dart';
import 'package:product_cart_app_bloc_task_23j/responsive/responsive.dart';
import 'package:product_cart_app_bloc_task_23j/responsive/text_responsive.dart';
import '../model/product_model.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final responsive = getResponsiveOnWidth(context);
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;

    if (screenWidth >= 1200) {
      crossAxisCount = 5;
    } else if (screenWidth >= 900) {
      crossAxisCount = 4;
    } else if (screenWidth >= 550) {
      crossAxisCount = 3;
    } else if (screenWidth >= 300) {
      crossAxisCount = 2;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 10 * responsive,
        vertical: 12 * responsive,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.62,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return Card(
          elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10 * responsive),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0 * responsive),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      product.images?.isNotEmpty == true
                          ? Image.network(
                        product.images![0],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                          : Icon(
                        Icons.image_not_supported,
                        size: 60 * responsive,
                      ),
                      Positioned(
                        right: 5 * responsive,
                        top: 3 * responsive,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 30 * responsive,
                                offset: Offset(0, 2 * responsive),
                              ),
                            ],
                          ),
                          child: BlocBuilder<FavoriteBloc, FavoriteState>(
                            builder: (context, state) {
                              bool isFavorite = false;
                              if (state is LoadState) {
                                isFavorite = state.favorite.contains(product);
                              }
                              return IconButton(
                                icon: FittedBox(
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border_rounded,
                                    color: isFavorite ? Colors.red : Colors.blue,
                                  ),
                                ),

                                onPressed: () {
                                  if (isFavorite) {
                                    context.read<FavoriteBloc>().add(
                                      RemoveFavEvent(product: product),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Removed from favorites',
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  } else {
                                    context.read<FavoriteBloc>().add(
                                      AddToFavorite(product: product),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Wow!! Added to favorites',
                                          style: TextStyle(
                                            color: Colors.black87,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2 * responsive),

                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: TextResponsive(
                      text: product.title ?? "",
                      baseFontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),


                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      TextResponsive(
                        text: '\$${product.price?.toStringAsFixed(2) ?? ""}',
                        baseFontSize: 32,
                        color: Colors.green,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(width: 8 * responsive),
                      if (product.price != null)
                        TextResponsive(
                          text: '\$6.69',
                          baseFontSize: 28,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w800,
                        ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20 * responsive,
                        vertical: 10 * responsive,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(10 * responsive),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: FittedBox(
                        child: Row(
                          children: [
                            Icon(Icons.star_rounded, color: Colors.orangeAccent),
                            Text(
                              product.rating.toString(),
                              style: TextStyle(color: Colors.blueGrey[900]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10 * responsive),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5 * responsive,
                          vertical: 5 * responsive,
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.red,
                      ),
                      onPressed: () {
                        context.read<CartBloc>().add(
                          AddItemToCart(product: product),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            content: Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                ),
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
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 45 * responsive,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
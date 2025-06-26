import 'package:flutter/material.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_state.dart';

import '../bloc/cart_bloc/cart_bloc.dart';
import '../model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderProductView extends StatefulWidget {
  final List<Product> products;

  const OrderProductView({super.key, required this.products});

  @override
  State<OrderProductView> createState() => _OrderProductViewState();
}

class _OrderProductViewState extends State<OrderProductView> {
  late List<int> quantities;

  @override
  void initState() {
    super.initState();
    quantities = List.generate(widget.products.length, (index) => 1);
  }

  double getTotalAmount() {
    double total = 0.0;
    for (int i = 0; i < widget.products.length; i++) {
      total += (widget.products[i].price ?? 0) * quantities[i];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc,CartState>(
      builder:(context, state) {
        if(state is CartUpdatedState) {
          final items = state.items;
          final product = items.keys.toList();

           return Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue.shade200
                  ),
                  child: Card(
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: TextStyle(fontSize: 20)),
                          Spacer(),
                          Chip(label: Text(
                              '\$${getTotalAmount().toStringAsFixed(
                                  2)}')),
                          TextButton(
                            child: Text('Checkout'),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Checkout not implemented')),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: widget.products.length,
                  itemBuilder: (context, index) {
                    final product = widget.products[index];
                    final quntity = items[product] ?? 1;


                    return Dismissible(
                      key: Key('order_item_${product.id}'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        context.read<CartBloc>().add(
                            RemoveItem(product: product));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Item removed',
                            style: TextStyle(color: Colors.black87),),
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 1),),
                        );
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.grey[200],
                            child: product.images != null &&
                                product.images!.isNotEmpty
                                ? Image.network(
                                product.images![0], fit: BoxFit.cover)
                                : Icon(Icons.image_not_supported),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(product.title.toString(), style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                            Text('Stock: ${product.stock} Pieces',
                              style: TextStyle(fontSize: 14),),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {

                                    context.read<CartBloc>().add(CountDecEvent(
                                      product: product,
                                    ));

                                },
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('$quntity',
                                style: TextStyle(fontSize: 16)),
                            SizedBox(width: 5),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  context.read<CartBloc>().add(CountIncEvent(
                                    product: product,
                                  ));
                                },
                              ),
                            ),
                            Spacer(),
                            Text('\$${product.price?.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
       return Container();
      }
    );
  }
}


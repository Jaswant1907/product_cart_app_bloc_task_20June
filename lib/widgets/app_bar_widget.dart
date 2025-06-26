
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/cart_bloc/cart_state.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/product_bloc/product_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/product_bloc/product_event.dart';
import 'package:product_cart_app_bloc_task_23j/screens/cart_screen.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    )
    .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFFBBDEFB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 12, right: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/man2.jpg'),
                      radius: 24,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Address',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Flat no.27, Heal Street, Los Angeles',
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    BlocBuilder<CartBloc,CartState>(
                      builder: (context, state) {

                        int totalItems = 0;
                        if(state is CartUpdatedState){
                          totalItems += state.items.values.fold(0, (sum,quntity) => sum + quntity);
                        }
                       return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => CartScreen(),));
                              },
                              icon: Hero(
                                tag: 'cart_icon',
                                child: Icon(Icons.shopping_cart, size: 28,
                                    color: Colors.white),
                              ),
                            ),

                            Positioned(
                              right: 4,
                              top: 4,
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor: Colors.redAccent,
                                child: Text('$totalItems', style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                              ),
                            ),
                          ],
                        );

                      }
                    ),

                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (text) {
                      context.read<ProductBloc>().add(SearchProductEvent(text));
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
                      prefixIcon: Icon(Icons.search, color: Colors.blue[800]),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt, color: Colors.grey[600]),
                          SizedBox(width: 10),
                          Icon(Icons.mic, color: Colors.grey[600]),
                          SizedBox(width: 6),
                        ],
                      ),
                      hintText: 'Search your favorite product...',
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

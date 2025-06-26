import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/product_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Map<Product, int> _cartItems = {};

  CartBloc() : super(CartLoadState()) {
    on<AddItemToCart>(onAddItemToCart);
    on<RemoveItem>(onRemoveItem);
    on<UpdateItem>(onUpdateItem);
    on<CountIncEvent>(onIncreamentItem);
    on<CountDecEvent>(onDecreamentItem);

  }


  void onAddItemToCart(AddItemToCart event, Emitter<CartState> emit) {
    _cartItems.update(
      event.product,
          (qnt) => qnt + event.quantity,
         ifAbsent: () => event.quantity,
    );
    emit(CartUpdatedState(Map.from(_cartItems)));
  }


  void onRemoveItem(RemoveItem event, Emitter<CartState> emit) {
    _cartItems.remove(event.product);
    emit(CartUpdatedState(Map.from(_cartItems)));
  }


  void onUpdateItem(UpdateItem event, Emitter<CartState> emit) {
    if (event.quantity <= 0) {
      _cartItems.remove(event.product);
    } else {
      _cartItems[event.product] = event.quantity;
    }
    emit(CartUpdatedState(Map.from(_cartItems)));
  }

  void onIncreamentItem(CountIncEvent event, Emitter<CartState> emit){
    
    if(_cartItems.containsKey(event.product)){
      _cartItems[event.product] = _cartItems[event.product]! + 1;
       emit(CartUpdatedState(Map.from(_cartItems)));
    }
    
    
  }

  void onDecreamentItem(CountDecEvent event, Emitter<CartState> emit){
    if(_cartItems.containsKey(event.product)){
      final currentQnty = _cartItems[event.product]!;
      if(currentQnty > 1){

        _cartItems[event.product] = currentQnty - 1;

      }else
        {
          _cartItems.remove(event.product);
        }


    }
   emit(CartUpdatedState(Map.from(_cartItems)));
  }

    


}

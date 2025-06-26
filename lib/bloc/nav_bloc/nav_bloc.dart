import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/nav_bloc/nav_event.dart';
import 'package:product_cart_app_bloc_task_23j/bloc/nav_bloc/nav_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, int> {
  NavBarBloc() : super(0) {
    on<ChangeIndex>((event, emit) {
      emit(event.navIndex);
    });
  }
}

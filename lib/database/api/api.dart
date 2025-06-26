import 'dart:convert';

import 'package:product_cart_app_bloc_task_23j/database/injection/injection.dart';

class Api {
  getAllItem() async {
    final response = await restClient.getAllProduct();
    return jsonDecode(response);
  }

  serachData(String query) async {
    final search = await restClient.searchProduct(query);
    return jsonDecode(search);
  }
}

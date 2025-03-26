import 'package:final_projects/core/fixedstrings/end_points.dart';
import 'package:final_projects/core/helper/api_helper.dart';
import 'package:final_projects/core/network/api_response.dart';
import 'package:final_projects/features/product/manager/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  final APIHelper _apiHelper = APIHelper();
  List<Map<String, dynamic>> _activeOrders = [];
  List<Map<String, dynamic>> _completedOrders = [];
  List<Map<String, dynamic>> _cancelledOrders = [];

  // Add a new order to active
  void addOrder(String productName, double price, int quantity, String image) {
    final newOrder = {
      'productName': productName,
      'price': price,
      'quantity': quantity,
      'image': image,
      'date': DateTime.now().toString(),
      'status': 'active',
    };

    _activeOrders.add(newOrder);
    emit(
      OrderLoadedState([..._activeOrders], [..._completedOrders], [
        ..._cancelledOrders,
      ]),
    );
  }

  // Move order to cancelled
  void cancelOrder(int index) {
    if (index < _activeOrders.length) {
      final order = _activeOrders.removeAt(index);
      order['status'] = 'cancelled';
      _cancelledOrders.add(order);
      emit(
        OrderLoadedState([..._activeOrders], [..._completedOrders], [
          ..._cancelledOrders,
        ]),
      );
    }
  }

  // Move order to completed
  void completeOrder(int index) {
    if (index < _activeOrders.length) {
      final order = _activeOrders.removeAt(index);
      order['status'] = 'completed';
      _completedOrders.add(order);
      emit(
        OrderLoadedState([..._activeOrders], [..._completedOrders], [
          ..._cancelledOrders,
        ]),
      );
    }
  }

  Future<void> fetchOrder() async {
    emit(OrderLoadingState());
    try {
      ApiResponse response = await _apiHelper.getRequest(
        endPoint: EndPoints.get_order,
        data: {},
      );

      if (response.status && response.data != null) {
        List<dynamic> orders = response.data['items'];
        if (orders.isEmpty) {
          emit(OrderEmptyState());
        } else {
          // Process orders from API with proper type casting
          _activeOrders =
              orders
                  .where((o) => o['status'] == 'active')
                  .map<Map<String, dynamic>>((o) => o as Map<String, dynamic>)
                  .toList();

          _completedOrders =
              orders
                  .where((o) => o['status'] == 'completed')
                  .map<Map<String, dynamic>>((o) => o as Map<String, dynamic>)
                  .toList();

          _cancelledOrders =
              orders
                  .where((o) => o['status'] == 'cancelled')
                  .map<Map<String, dynamic>>((o) => o as Map<String, dynamic>)
                  .toList();

          emit(
            OrderLoadedState(_activeOrders, _completedOrders, _cancelledOrders),
          );
        }
      } else {
        emit(OrderErrorState(response.message));
      }
    } catch (e) {
      emit(OrderErrorState(e.toString()));
    }
  }
}

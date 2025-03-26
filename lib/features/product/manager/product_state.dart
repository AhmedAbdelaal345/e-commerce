abstract class OrderState {}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  final List<Map<String, dynamic>> activeOrders;
  final List<Map<String, dynamic>> completedOrders;
  final List<Map<String, dynamic>> cancelledOrders;

  OrderLoadedState(this.activeOrders, this.completedOrders, this.cancelledOrders);
}

class OrderEmptyState extends OrderState {}

class OrderErrorState extends OrderState {
  final String error;
  OrderErrorState(this.error);
}
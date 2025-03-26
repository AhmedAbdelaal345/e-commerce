// ignore_for_file: constant_identifier_names

abstract class EndPoints {
  static const String baseURL =
      'https://nti-ecommerce-api-production.up.railway.app/api/';

  // end points
  static const String register = 'register';
  static const String login = 'login';
  static const String update = 'update_profile';
  static const String new_slider = 'new_slider';
  static const String edit_slider = 'slider/1';
  static const String get_slider = 'sliders';
  static const String new_category = 'new_category';
  static const String edit_category = 'category/2';
  static const String newcategory = 'category/2';
  static const String get_category = 'categories';
  static const String place_order = "place_order";
  static const String cancelOrder = "orders/cancel/1";
  static const String get_order = "orders";
  static const String complete = "orders/complete/3";
  static String? onchange;
}

abstract class ApiKeys {
  static const String accessToken = "access_token";
  static const String refreshToken = "refresh_token";
}

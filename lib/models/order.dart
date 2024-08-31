
import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order({
    required this.restaurant, // Mark as required
    required this.food,       // Mark as required
    required this.date,       // Mark as required
    required this.quantity,   // Mark as required
  });
}

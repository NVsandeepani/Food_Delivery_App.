
import 'package:flutter_food_delivery_ui/models/food.dart';

class Restaurant {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final List<Food> menu;

  Restaurant({
    required this.imageUrl,  // Mark as required
    required this.name,      // Mark as required
    required this.address,   // Mark as required
    required this.rating,    // Mark as required
    required this.menu,      // Mark as required
  });
}

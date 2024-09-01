import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/screens/restaurent_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_order.dart';


class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();

}


class _HomeSreenState extends State<HomeSreen> {
    _buildResturents(){
    List<Widget> restaurantList =[];
    restaurants.forEach( (Restaurant restaurant){
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context, 
          MaterialPageRoute(
            builder: (_)=> RestaurantScreen(restaurant: restaurant),
          ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.0,
                color: Color.fromARGB(255, 235, 235, 235)),
                   ),
                   child: Row(
                    children: <Widget> [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Hero(
                          tag: restaurant.imageUrl, // add animetion

                          child: Image(
                            height: 150.0,
                            width: 150.0,
                            image: AssetImage(restaurant.imageUrl),
                            fit: BoxFit.cover,),
                        ),
                      ),
                      Container(
                            margin: EdgeInsets.all(10.0),
                              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
        
                    children: <Widget> [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0,),
                        RatingStars(restaurant.rating),//calling rating start function
                      SizedBox(height: 4.0,),
                      Text(
                        restaurant.address,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          ),
                           SizedBox(height: 4.0,),
                      Text('0.2 miles away',
                      style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,),
                    ],
                              ),
                            ),
                    ],
                   ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.account_circle),
        iconSize: 30.0,
        onPressed: () {      
        },),        
        title: 
        Text('Food Delivery',) ,
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          TextButton(
            onPressed: ()=> Navigator.push(
            context, 
          MaterialPageRoute(
            builder: (_)=> CartScreen(),
          ),
          ),
            child: Text(
              'Cart(${currentUser.cart.length})',
               style: TextStyle(color: Colors.white,
               fontSize: 20.0),
            ),
          ),],
          ),
        
        body: ListView(
          children: <Widget> [
           
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 0.8, color:Colors.deepOrangeAccent)
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0) ,
                  borderSide: BorderSide(width: 0.8, color:Colors.deepOrangeAccent)
                  ),
                 
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25.0,
                  ),
                   hintText: 'Search Food or Resturent',
                
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      
                    },
                  )
                ),
              ),
            ),


            RecentOrders(),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Nearby Resturents',
                  style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  ),
                        ),
                ),
                _buildResturents(),
              ],
            )
          ],
        ),
    );
  }
}
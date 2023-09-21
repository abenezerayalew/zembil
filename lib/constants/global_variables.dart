import 'package:flutter/material.dart';

String uri = 'http://*localIP*:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [Color(0xFF199BC7), Color(0xFF5E60A9)],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color(0xFF199BC7);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'assets/images/ad1.jpg',
    'assets/images/ad2.jpg',
    'assets/images/ad3.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.png',
    },
    {
      'title': 'appliances',
      'image': 'assets/images/appliances.png',
    },
    {
      'title': 'Furniture',
      'image': 'assets/images/furniture.png',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.png',
    },
    {
      'title': 'Gaming accessories',
      'image': 'assets/images/gaming.png',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.png',
    }
  ];
}

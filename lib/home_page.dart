import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_list.dart';

// if u have a const error change your main.dart file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CardPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 0 ? const ProductList() : const CardPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

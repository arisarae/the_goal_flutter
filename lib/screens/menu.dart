import 'package:flutter/material.dart';
import 'package:the_goal_mobile/screens/login.dart';
import 'package:the_goal_mobile/screens/product_entry_list.dart';
import 'package:the_goal_mobile/screens/productlist_form.dart';
import 'package:the_goal_mobile/widgets/left_drawer.dart';
import 'package:the_goal_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("All Product", Icons.all_inbox, Colors.blue, ProductEntryListPage()),
    //ItemHomepage("My Product", Icons.my_library_books, Colors.green, null),
    ItemHomepage("Create Product", Icons.add, Colors.green, const ProductFormPage()),
    ItemHomepage("Logout", Icons.logout, Colors.red, const LoginPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth < 600 ? 16.0 : 100.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The GOAL',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to The GOAL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth < 600 ? 24.0 : 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth < 600 ? 14 : 20),

                  GridView.count(
                    primary: false,
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20.0),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: screenWidth < 600 ? 1 : 3,
                    shrinkWrap: true,
                    childAspectRatio: screenWidth < 600 ? 2.5 : 1,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final Widget? link;

  ItemHomepage(this.name, this.icon, this.color, this.link);
}

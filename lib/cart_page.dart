import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CART PAGE'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imagesurl'] as String),
              backgroundColor: Colors.white,
              radius: 30,
            ),
            trailing: GestureDetector(
              onTap: () {
                Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                );
              },
              child: const Icon(Icons.delete_outline),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('SIZE: ${cartItem['sizes']}'),
          );
        },
      ),
    );
  }
}

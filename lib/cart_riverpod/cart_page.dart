import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:managing_state_example/cart_riverpod/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(cartProvider);
      var cart = state.cart;
      return Scaffold(
        appBar: AppBar(
          title: Text("Your cart (${cart.length})"),
        ),
        body: ListView(
          children: cart
              .map(
                (e) => ListTile(
              title: Text(e.name ?? ''),
              subtitle: Text("Version number(s) " + (e.numbers ?? '')),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  ref.read(cartProvider.notifier).removeFromCart(e);
                },
              ),
            ),
          )
              .toList(),
        ),
      );
    });
  }
}
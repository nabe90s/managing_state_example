import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:managing_state_example/cart_riverpod/cart_model.dart';
import 'package:managing_state_example/cart_riverpod/cart_page.dart';

void main() {
  runApp(ProviderScope(child: CartApp()));
}

class CartApp extends StatelessWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Cart - Riverpod'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(cartProvider);
      var items = state.items;
      var cart = state.cart;
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: items
              .map(
                (e) => ListTile(
              title: Text(e.name ?? ''),
              subtitle: Text("Version number(s) " + (e.numbers ?? '')),
              trailing: IconButton(
                icon: Icon(
                  cart.contains(e) ? Icons.remove_circle : Icons.add_circle,
                ),
                onPressed: () {
                  if (!cart.contains(e))
                    ref.read(cartProvider.notifier).addToCart(e);
                  else
                    ref.read(cartProvider.notifier).removeFromCart(e);
                },
              ),
            ),
          )
              .toList(),
        ),
        floatingActionButton: cart.isEmpty
            ? null
            : FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
          label: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(cart.length.toString()),
              ),
              SizedBox(width: 8),
              Text('Cart'),
            ],
          ),
        ),
      );
    });
  }
}

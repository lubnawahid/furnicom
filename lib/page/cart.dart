
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> _cartItems = [];
  List<Product> _products = [
    Product("Product 1", 10.99),
    Product("Product 2", 19.99),
    Product("Product 3", 5.99),
    Product("Product 4", 15.99),
  ];

  double _getTotalPrice() {
    double total = 0;
    for (Product item in _cartItems) {
      total += item.price;
    }
    return total;
  }

  void _placeOrder() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => PaymentPage(cartItems: _cartItems,)),
   // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                final isInCart = _cartItems.contains(product);

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: isInCart
                      ? IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      setState(() {
                        _cartItems.remove(product);
                      });
                    },
                  )
                      : IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      setState(() {
                        _cartItems.add(product);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${_getTotalPrice().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _placeOrder,
              child: Text('Place Order'),
            ),
          ),
        ],
      ),
    );
  }
}
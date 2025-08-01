import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class FiSubscriptionPage extends StatelessWidget {
  final List<ProductDetails> products;

  FiSubscriptionPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subscriptions')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text(product.description),
            trailing: TextButton(
              onPressed: () {
                // Purchase the subscription
                InAppPurchase.instance.buyNonConsumable(
                  purchaseParam: PurchaseParam(productDetails: product),
                );
              },
              child: Text(product.price),
            ),
          );
        },
      ),
    );
  }
}

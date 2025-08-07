import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:affirmation_forest/utils/subscription.dart';

class FiSubscriptionPage extends StatefulWidget {
	  const FiSubscriptionPage({Key? key}) : super(key: key);
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<FiSubscriptionPage> {
  final SubscriptionService _subscriptionService = SubscriptionService();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _subscriptionService.initialize();
    await _subscriptionService.fetchProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final products = _subscriptionService.products;

    return Scaffold(
      appBar: AppBar(title: Text('Subscription')),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.description),
                  trailing: TextButton(
                    onPressed: () => _subscriptionService.buySubscription(product),
                    child: Text(product.price),
                  ),
                );
              },
            ),
    );
  }
}

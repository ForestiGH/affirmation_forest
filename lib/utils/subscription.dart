import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionService {
  final InAppPurchase _iap = InAppPurchase.instance;
  List<ProductDetails> _products = [];

  Future<void> fetchProducts() async {
    const Set<String> _productIds = {'monthly_subscription', 'yearly_subscription'};
    final ProductDetailsResponse response = await _iap.queryProductDetails(_productIds);

    if (response.error == null) {
      _products = response.productDetails;
    } else {
      // Handle error
      print('Error fetching products: ${response.error}');
    }
  }

  List<ProductDetails> get products => _products;
}

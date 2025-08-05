import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionService {
  final InAppPurchase _iap = InAppPurchase.instance;
  List<ProductDetails> _products = [];
  bool _isAvailable = false;
  bool _isSubscribed = false;

  Future<void> initialize() async {
    // Check if in-app purchases are available on the device
    _isAvailable = await _iap.isAvailable();
    if (!_isAvailable) {
      print('In-app purchases are not available on this device.\nApp-ostot eivät ole käytettävissä tällä laitteella.');
      return;
    }

    // Listen to purchase updates
    _iap.purchaseStream.listen((List<PurchaseDetails> purchaseDetailsList) {
      _handlePurchaseUpdates(purchaseDetailsList);
    });
  }

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

  Future<void> buySubscription(ProductDetails product) async {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    await _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.purchased) {
        // Verify the purchase (e.g., using your server or receipt validation)
        _verifyPurchase(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        // Handle error
        print('Purchase error: ${purchaseDetails.error}');
      }

      if (purchaseDetails.pendingCompletePurchase) {
        _iap.completePurchase(purchaseDetails);
      }
    }
  }

  void _verifyPurchase(PurchaseDetails purchaseDetails) {
    // Add your server-side or local receipt validation logic here
    if (purchaseDetails.productID == 'monthly_subscription') {
      _isSubscribed = true;
      print('User subscribed to monthly subscription.');
    }
  }

  bool get isSubscribed => _isSubscribed;
}

To implement a monthly subscription feature in your Flutter app using the `in_app_purchase` package, you need to follow these steps:

### 1. **Set Up Your App in the App Store/Play Console**
   - **Google Play Console**: Create a subscription product (e.g., `monthly_subscription`) in the Play Console under your app's In-App Products section.
   - **Apple App Store Connect**: Create a subscription product in App Store Connect under your app's In-App Purchases section.

   Ensure the product IDs match the ones you use in your code (e.g., `monthly_subscription`).

---

### 2. **Update Your `SubscriptionService` Class**
   Your `SubscriptionService` class is a good starting point. Here's how you can extend it to handle purchases and subscriptions:

```dart
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
      print('In-app purchases are not available on this device.');
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
```

---

### 3. **Integrate the Service in Your App**
   Use the `SubscriptionService` in your app to fetch products, display them to the user, and handle purchases.

#### Example UI Code:
```dart
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'subscription_service.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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
```

---

### 4. **Handle Subscription Validation**
   - **Server-Side Validation**: For better security, validate purchases on your server using Google Play or App Store APIs.
   - **Local Validation**: If you don't have a server, you can validate receipts locally, but this is less secure.

---

### 5. **Test Your Implementation**
   - Use the **Google Play Console** or **App Store Connect** sandbox environment to test your subscriptions.
   - Ensure you handle edge cases like failed purchases, canceled subscriptions, and expired subscriptions.

---

### 6. **Add Permissions**
   Update your `AndroidManifest.xml` and `Info.plist` files to include the necessary permissions for in-app purchases.

#### Android (`AndroidManifest.xml`):
```xml
<uses-permission android:name="com.android.vending.BILLING" />
```

#### iOS (`Info.plist`):
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

---

### 7. **Publish Your App**
   Once you've tested everything, publish your app to the Google Play Store and Apple App Store.

By following these steps, you can successfully implement a monthly subscription feature in your Flutter app using the `in_app_purchase` package.

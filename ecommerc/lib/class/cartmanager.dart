import 'package:ecommerce/class/model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartManager {
  // Singleton pattern to have a single cart manager throughout the app
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;

  CartManager._internal();

  final List<CartItem> _cartItems = [];

  // Read-only cart items
  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  // Add product with optional quantity (default 1)
  void addToCart(Product product, {int quantity = 1}) {
    final index = _cartItems.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      _cartItems[index].quantity += quantity;
    } else {
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }
  }

  // Remove a product entirely from cart
  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.name == product.name);
  }

  // Decrease quantity of a product
  void decreaseQuantity(Product product) {
    final index = _cartItems.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      } else {
        removeFromCart(product);
      }
    }
  }

  // Calculate total price
  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);
  }

  // Empty the cart
  void clearCart() {
    _cartItems.clear();
  }
}

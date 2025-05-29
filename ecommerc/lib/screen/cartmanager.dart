import 'package:ecommerce/class/model.dart';
import 'package:ecommerce/screen/home.dart';



class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;

  CartManager._internal();

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(Product product) {
    final index = _cartItems.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.name == product.name);
  }

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

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);
  }

  void clearCart() {
    _cartItems.clear();
  }
}
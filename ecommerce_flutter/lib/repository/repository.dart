import 'package:ecommerce_client/ecommerce_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

class EcommerceRepository {
  Future<void> createProduct(Product p) async {
    await client.ecommerceEndPoint.createProduct(p);
  }

  Future<Product> getProduct(int id) async {
    final product = await client.ecommerceEndPoint.getProduct(id);
    return product;
  }

  Future<List<Product>> getProducts() async {
    final product = await client.ecommerceEndPoint.getProducts();
    return product;
  }

  Future<void> updateProduct(Product p) async {
    await client.ecommerceEndPoint.updateProduct(p);
  }

  Future<void> deleteProduct(int id) async {
    await client.ecommerceEndPoint.deleteProduct(id);
  }

  Future<void> createOrder(Order p) async {
    await client.ecommerceEndPoint.createOrder(p);
  }

  Future<Order> getOrder(int id) async {
    final order = await client.ecommerceEndPoint.getOrder(id);
    return order;
  }

  Future<List<Order>> getOrders() async {
    final order = await client.ecommerceEndPoint.getOrders();
    return order;
  }

  Future<void> updateOrder(Order p) async {
    await client.ecommerceEndPoint.updateOrder(p);
  }

  Future<void> deleteOrder(int id) async {
    await client.ecommerceEndPoint.deleteOrder(id);
  }
}

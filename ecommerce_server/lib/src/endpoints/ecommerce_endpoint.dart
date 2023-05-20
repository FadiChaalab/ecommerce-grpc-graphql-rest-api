import 'package:ecommerce_server/src/proto/generated/product.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/product.dart' as product;
import '../generated/order.dart' as table;
import '../proto/generated/order.pbgrpc.dart' as order;

class EcommerceEndPoint extends Endpoint {
  // Create gRPC clients for your services
  var productService = ProductServiceClient(
    ClientChannel(
      '127.0.0.1',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );

  // Create gRPC clients for your services
  var orderService = order.OrderServiceClient(
    ClientChannel(
      '127.0.0.1',
      port: 50052,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );

  Future<void> createProduct(Session session, product.Product p) async {
    // Create a gRPC request using the input data
    var request = CreateProductRequest()
      ..name = p.name
      ..description = p.description
      ..price = p.price
      ..image = p.image;

    // Call the gRPC method to create a product
    await productService.createProduct(request);
  }

  Future<product.Product> getProduct(Session session, int id) async {
    // Implement the logic to fetch a product by ID using the gRPC client
    var request = GetProductRequest()..productId = id;
    var response = await productService.getProduct(request);

    // Convert from gRPC product to table row product
    var productTR = product.Product(
      id: response.product.id,
      name: response.product.name,
      description: response.product.description,
      price: response.product.price,
      image: response.product.image,
    );

    return productTR;
  }

  Future<List<product.Product>> getProducts(Session session) async {
    List<product.Product> products = [];

    // Implement the logic to fetch products using the gRPC client
    var request = Empty();
    var response = await productService.getProducts(request);

    // Map the gRPC response to your GraphQL model
    products = response.products
        .map((p) => product.Product(
              id: p.id,
              name: p.name,
              description: p.description,
              price: p.price,
              image: p.image,
            ))
        .toList();

    return products;
  }

  Future<void> updateProduct(Session session, product.Product p) async {
    // Check if the ID is null before calling the service
    if (p.id == null) return;
    // Create a gRPC request using the input data
    var request = UpdateProductRequest()
      ..productId = p.id!
      ..name = p.name
      ..description = p.description
      ..price = p.price
      ..image = p.image;

    // Call the gRPC method to update the product
    await productService.updateProduct(request);
  }

  Future<void> deleteProduct(Session session, int id) async {
    // Create a gRPC request using the input data
    var request = DeleteProductRequest()..productId = id;

    // Call the gRPC method to delete the product
    await productService.deleteProduct(request);
  }

  Future<void> createOrder(Session session, table.Order o) async {
    // Create a gRPC request using the input data
    var request = order.CreateOrderRequest()
      ..customerId = o.customer_id
      ..productId = o.product_id
      ..quantity = o.quantity
      ..totalAmount = o.total_amount;

    // Call the gRPC method to create a order
    await orderService.createOrder(request);
  }

  Future<table.Order> getOrder(Session session, int id) async {
    // Implement the logic to fetch a order by ID using the gRPC client
    var request = order.GetOrderRequest()..orderId = id;
    var response = await orderService.getOrder(request);

    // Convert from gRPC order to table row order
    var orderTR = table.Order(
      id: response.order.id,
      customer_id: response.order.customerId,
      product_id: response.order.productId,
      quantity: response.order.quantity,
      total_amount: response.order.totalAmount,
    );

    return orderTR;
  }

  Future<List<table.Order>> getOrders(Session session) async {
    List<table.Order> orders = [];

    // Implement the logic to fetch orders using the gRPC client
    var request = order.Empty();
    var response = await orderService.getOrders(request);

    // Map the gRPC response to your GraphQL model
    orders = response.orders
        .map((p) => table.Order(
              id: p.id,
              customer_id: p.customerId,
              product_id: p.productId,
              quantity: p.quantity,
              total_amount: p.totalAmount,
            ))
        .toList();

    return orders;
  }

  Future<void> updateOrder(Session session, table.Order p) async {
    // Check if the ID is null before calling the service
    if (p.id == null) return;
    // Create a gRPC request using the input data
    var request = order.UpdateOrderRequest()
      ..orderId = p.id!
      ..customerId = p.customer_id
      ..productId = p.product_id
      ..quantity = p.quantity
      ..totalAmount = p.total_amount;

    // Call the gRPC method to update the product
    await orderService.updateOrder(request);
  }

  Future<void> deleteOrder(Session session, int id) async {
    // Create a gRPC request using the input data
    var request = order.DeleteOrderRequest()..orderId = id;

    // Call the gRPC method to delete the product
    await orderService.deleteOrder(request);
  }
}

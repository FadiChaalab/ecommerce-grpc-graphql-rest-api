import 'package:ecommerce_server/src/microservices/postgres_helper.dart';
import 'package:ecommerce_server/src/proto/generated/order.pbgrpc.dart'
    as pbgrpc;
import 'package:grpc/grpc.dart' as grpc;

import '../proto/generated/order.pb.dart';

class OrderService extends pbgrpc.OrderServiceBase {
  @override
  Future<pbgrpc.CreateOrderResponse> createOrder(
      grpc.ServiceCall call, pbgrpc.CreateOrderRequest request) async {
    final pool = PostgresHelper().getPool();
    final customerId = request.customerId;
    final productId = request.productId;
    final quantity = request.quantity;
    final totalAmount = request.totalAmount;

    await pool.query(
      'INSERT INTO orders (customer_id, product_id, quantity, total_amount) VALUES (@customerId, @productId, @quantity, @totalAmount)',
      substitutionValues: {
        'customerId': customerId,
        'productId': productId,
        'quantity': quantity,
        'totalAmount': totalAmount,
      },
    );

    return pbgrpc.CreateOrderResponse();
  }

  @override
  Future<pbgrpc.GetOrderResponse> getOrder(
      grpc.ServiceCall call, pbgrpc.GetOrderRequest request) async {
    final pool = PostgresHelper().getPool();
    final orderId = request.orderId;

    final result = await pool.query(
      'SELECT * FROM orders WHERE id = @orderId',
      substitutionValues: {'orderId': orderId},
    );

    final rows = result.toList();
    final response = pbgrpc.GetOrderResponse();

    if (rows.isNotEmpty) {
      final row = rows[0];
      response.order = pbgrpc.Order()
        ..id = row[0] as int
        ..customerId = row[1] as int
        ..productId = row[2] as int
        ..quantity = row[3] as int
        ..totalAmount = row[4] as double;
    }

    return response;
  }

  @override
  Future<pbgrpc.UpdateOrderResponse> updateOrder(
      grpc.ServiceCall call, pbgrpc.UpdateOrderRequest request) async {
    final pool = PostgresHelper().getPool();
    final orderId = request.orderId;
    final customerId = request.customerId;
    final productId = request.productId;
    final quantity = request.quantity;
    final totalAmount = request.totalAmount;

    await pool.query(
      'UPDATE orders SET customer_id = @customerId, product_id = @productId, quantity = @quantity, total_amount = @totalAmount WHERE id = @orderId',
      substitutionValues: {
        'orderId': orderId,
        'customerId': customerId,
        'productId': productId,
        'quantity': quantity,
        'totalAmount': totalAmount,
      },
    );

    // Fetch the updated order from the database
    final updatedOrder = await pool.query(
      'SELECT * FROM orders WHERE id = @id',
      substitutionValues: {'id': orderId},
    );

    // Map the database result to your GraphQL model
    final order = Order(
      id: updatedOrder[0][0] as int,
      customerId: updatedOrder[0][1] as int,
      productId: updatedOrder[0][2] as int,
      quantity: updatedOrder[0][3] as int,
      totalAmount: updatedOrder[0][4] as double,
    );

    return pbgrpc.UpdateOrderResponse()..order = order;
  }

  @override
  Future<pbgrpc.DeleteOrderResponse> deleteOrder(
      grpc.ServiceCall call, pbgrpc.DeleteOrderRequest request) async {
    final pool = PostgresHelper().getPool();
    final orderId = request.orderId;

    await pool.query(
      'DELETE FROM orders WHERE id = @orderId',
      substitutionValues: {'orderId': orderId},
    );

    return pbgrpc.DeleteOrderResponse();
  }

  @override
  Future<pbgrpc.GetOrdersResponse> getOrders(
      grpc.ServiceCall call, pbgrpc.Empty request) async {
    final pool = PostgresHelper().getPool();

    final result = await pool.query('SELECT * FROM orders');
    final rows = result.toList();
    final response = pbgrpc.GetOrdersResponse();

    for (final row in rows) {
      final order = pbgrpc.Order()
        ..id = row[0] as int
        ..customerId = row[1] as int
        ..productId = row[2] as int
        ..quantity = row[3] as int
        ..totalAmount = row[4] as double;

      response.orders.add(order);
    }

    return response;
  }
}

Future<void> main(List<String> args) async {
  final server = grpc.Server(
    [OrderService()],
  );
  await server.serve(port: 50052);
  print('Server listening on port ${server.port}...');
}

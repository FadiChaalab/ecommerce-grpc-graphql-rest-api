// ignore_for_file: deprecated_member_use
import 'package:angel3_container/mirrors.dart';
import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_framework/http.dart';
import 'package:angel3_graphql/angel3_graphql.dart';
import 'package:ecommerce_server/src/graphql/models/order_ql.dart';
import 'package:ecommerce_server/src/graphql/models/product_ql.dart';
import 'package:graphql_schema2/graphql_schema2.dart';
import 'package:graphql_server2/graphql_server2.dart';
import 'package:graphql_server2/mirrors.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';

import '../proto/generated/order.pbgrpc.dart' as order;
import '../proto/generated/product.pbgrpc.dart';

void main() async {
  var logger = Logger('angel_graphql');
  var app = Angel(
    logger: logger
      ..onRecord.listen((rec) {
        print(rec);
        if (rec.error != null) print(rec.error);
        if (rec.stackTrace != null) print(rec.stackTrace);
      }),
    reflector: MirrorsReflector(),
  );
  var http = AngelHttp(app);

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

  var queryType = objectType(
    'Query',
    description: 'A simple API that manages your product list and orders.',
    fields: [
      field(
        'products',
        listOf(convertDartType(ProductQL)!.nonNullable()),
        resolve: (_, resolveParams) async {
          // Implement the logic to fetch products using the gRPC client
          var request = Empty();
          var response = await productService.getProducts(request);

          // Map the gRPC response to your GraphQL model
          var products = response.products
              .map((p) => ProductQL(
                    id: p.id,
                    name: p.name,
                    description: p.description,
                    price: p.price,
                    image: p.image,
                  ))
              .toList();

          return products.map((e) => e.toMap()).toList();
        },
      ),
      field(
        'product',
        convertDartType(ProductQL)!,
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var productId = resolveParams['id'] as int;

          // Implement the logic to fetch a product by ID using the gRPC client
          var request = GetProductRequest()..productId = productId;
          var response = await productService.getProduct(request);

          // Map the gRPC response to your GraphQL model
          var product = ProductQL(
            id: response.product.id,
            name: response.product.name,
            description: response.product.description,
            price: response.product.price,
            image: response.product.image,
          );

          return product.toMap();
        },
        inputs: [
          GraphQLFieldInput('id', graphQLInt.nonNullable()),
        ],
      ),
      field(
        'orders',
        listOf(convertDartType(OrderQL)!.nonNullable()),
        resolve: (_, resolveParams) async {
          // Implement the logic to fetch products using the gRPC client
          var request = order.Empty();
          var response = await orderService.getOrders(request);

          // Map the gRPC response to your GraphQL model
          var orders = response.orders
              .map((p) => OrderQL(
                    id: p.id,
                    customerId: p.customerId,
                    productId: p.productId,
                    quantity: p.quantity,
                    totalAmount: p.totalAmount,
                  ))
              .toList();

          return orders.map((e) => e.toMap()).toList();
        },
      ),
      field(
        'order',
        convertDartType(OrderQL)!,
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var orderId = resolveParams['id'] as int;

          // Implement the logic to fetch a order by ID using the gRPC client
          var request = order.GetOrderRequest()..orderId = orderId;
          var response = await orderService.getOrder(request);

          // Map the gRPC response to your GraphQL model
          var orderql = OrderQL(
            id: response.order.id,
            customerId: response.order.customerId,
            productId: response.order.productId,
            quantity: response.order.quantity,
            totalAmount: response.order.totalAmount,
          );

          return orderql.toMap();
        },
        inputs: [
          GraphQLFieldInput('id', graphQLInt.nonNullable()),
        ],
      ),
    ],
  );

  var mutationType = objectType(
    'Mutation',
    description: 'Modify the product list and orders.',
    fields: [
      field(
        'createProduct',
        convertDartType(ProductQL)!,
        inputs: [
          GraphQLFieldInput(
            'data',
            convertDartType(ProductQL)!.coerceToInputObject(),
          ),
        ],
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var data = resolveParams['data'] as Map<String, dynamic>;

          // Create a gRPC request using the input data
          var request = CreateProductRequest()
            ..name = data['name']
            ..description = data['description']
            ..price = data['price']
            ..image = data['image'];

          // Call the gRPC method to create a product
          await productService.createProduct(request);

          // Map the gRPC response to your GraphQL model
          var product = ProductQL(
            name: data['name'],
            description: data['description'],
            price: data['price'],
            image: data['image'],
          );

          return product.toMap();
        },
      ),
      field(
        'updateProduct',
        convertDartType(ProductQL)!,
        inputs: [
          GraphQLFieldInput(
            'id',
            graphQLInt.nonNullable(),
          ),
          GraphQLFieldInput(
            'data',
            convertDartType(ProductQL)!.coerceToInputObject(),
          ),
        ],
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var id = resolveParams['id'] as int;
          var data = resolveParams['data'] as Map<String, dynamic>;

          // Create a gRPC request using the input data
          var request = UpdateProductRequest()
            ..productId = id
            ..name = data['name']
            ..description = data['description']
            ..price = data['price']
            ..image = data['image'];

          // Call the gRPC method to update the product
          var response = await productService.updateProduct(request);

          // Map the gRPC response to your GraphQL model
          var product = ProductQL(
            id: response.product.id,
            name: response.product.name,
            description: response.product.description,
            price: response.product.price,
            image: response.product.image,
          );

          return product.toMap();
        },
      ),
      field(
        'deleteProduct',
        graphQLBoolean.nonNullable(),
        inputs: [
          GraphQLFieldInput(
            'id',
            graphQLInt.nonNullable(),
          ),
        ],
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var id = resolveParams['id'] as int;

          // Create a gRPC request using the input data
          var request = DeleteProductRequest()..productId = id;

          // Call the gRPC method to delete the product
          await productService.deleteProduct(request);

          // Return true to indicate successful deletion
          return true;
        },
      ),
      field(
        'createOrder',
        convertDartType(OrderQL)!,
        inputs: [
          GraphQLFieldInput(
            'data',
            convertDartType(OrderQL)!.coerceToInputObject(),
          ),
        ],
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var data = resolveParams['data'] as Map<String, dynamic>;

          // Create a gRPC request using the input data
          var request = order.CreateOrderRequest()
            ..customerId = data['customerId']
            ..productId = data['productId']
            ..quantity = data['quantity']
            ..totalAmount = data['totalAmount'];

          // Call the gRPC method to create a order
          await orderService.createOrder(request);

          // Map the gRPC response to your GraphQL model
          var orderql = OrderQL(
            customerId: data['customerId'],
            productId: data['productId'],
            quantity: data['quantity'],
            totalAmount: data['totalAmount'],
          );

          return orderql.toMap();
        },
      ),
      field(
        'updateOrder',
        convertDartType(OrderQL)!,
        inputs: [
          GraphQLFieldInput(
            'id',
            graphQLInt.nonNullable(),
          ),
          GraphQLFieldInput(
            'data',
            convertDartType(OrderQL)!.coerceToInputObject(),
          ),
        ],
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var id = resolveParams['id'] as int;
          var data = resolveParams['data'] as Map<String, dynamic>;

          // Create a gRPC request using the input data
          var request = order.UpdateOrderRequest()
            ..orderId = id
            ..customerId = data['customerId']
            ..productId = data['productId']
            ..quantity = data['quantity']
            ..totalAmount = data['totalAmount'];

          // Call the gRPC method to update the order
          var response = await orderService.updateOrder(request);

          // Map the gRPC response to your GraphQL model
          var orderql = OrderQL(
            id: response.order.id,
            customerId: response.order.customerId,
            productId: response.order.productId,
            quantity: response.order.quantity,
            totalAmount: response.order.totalAmount,
          );

          return orderql.toMap();
        },
      ),
      field(
        'deleteOrder',
        graphQLBoolean.nonNullable(),
        inputs: [
          GraphQLFieldInput(
            'id',
            graphQLInt.nonNullable(),
          ),
        ],
        resolve: (_, resolveParams) async {
          // Retrieve the input arguments
          var id = resolveParams['id'] as int;

          // Create a gRPC request using the input data
          var request = order.DeleteOrderRequest()..orderId = id;

          // Call the gRPC method to delete the product
          await orderService.deleteOrder(request);

          // Return true to indicate successful deletion
          return true;
        },
      ),
    ],
  );

  var schema = graphQLSchema(
    queryType: queryType,
    mutationType: mutationType,
  );

  // Graphql requests
  app.all('/graphql', graphQLHttp(GraphQL(schema)));
  // Graphiql interface
  app.get('/graphiql', graphiQL());
  // Apollo subscriptions
  app.get('/subscriptions', graphQLWS(GraphQL(schema)));

  var server = await http.startServer('127.0.0.1', 3000);
  var uri =
      Uri(scheme: 'http', host: server.address.address, port: server.port);
  var graphiqlUri = uri.replace(path: 'graphiql');

  print('Listening at $uri');
  print('Access graphiql at $graphiqlUri');
}

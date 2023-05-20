import 'package:ecommerce_server/src/proto/generated/product.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'postgres_helper.dart';

class ProductService extends ProductServiceBase {
  @override
  Future<CreateProductResponse> createProduct(
      grpc.ServiceCall call, CreateProductRequest request) async {
    final pool = PostgresHelper().getPool();
    final name = request.name;
    final description = request.description;
    final price = request.price;
    final image = request.image;

    await pool.query(
      'INSERT INTO products (name, description, price, image) VALUES (@name, @description, @price, @image)',
      substitutionValues: {
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      },
    );

    return CreateProductResponse();
  }

  @override
  Future<DeleteProductResponse> deleteProduct(
      grpc.ServiceCall call, DeleteProductRequest request) async {
    final pool = PostgresHelper().getPool();
    final productId = request.productId;

    await pool.query(
      'DELETE FROM products WHERE id = @id',
      substitutionValues: {'id': productId},
    );

    return DeleteProductResponse();
  }

  @override
  Future<GetProductResponse> getProduct(
      grpc.ServiceCall call, GetProductRequest request) async {
    final pool = PostgresHelper().getPool();
    final productId = request.productId;

    final result = await pool.query(
      'SELECT * FROM products WHERE id = @id',
      substitutionValues: {'id': productId},
    );

    final rows = result.toList();
    final response = GetProductResponse();

    if (rows.isNotEmpty) {
      final row = rows[0];
      response.product = Product()
        ..id = row[0] as int
        ..name = row[1] as String
        ..description = row[2] as String
        ..price = row[3] as double
        ..image = row[4] as String;
    }

    return response;
  }

  @override
  Future<UpdateProductResponse> updateProduct(
      grpc.ServiceCall call, UpdateProductRequest request) async {
    final pool = PostgresHelper().getPool();
    final productId = request.productId;
    final name = request.name;
    final description = request.description;
    final price = request.price;
    final image = request.image;

    await pool.query(
      'UPDATE products SET name = @name, description = @description, price = @price, image= @image WHERE id = @id',
      substitutionValues: {
        'id': productId,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      },
    );

    // Fetch the updated product from the database
    final updatedProduct = await pool.query(
      'SELECT * FROM products WHERE id = @id',
      substitutionValues: {'id': productId},
    );

    // Map the database result to your GraphQL model
    final product = Product(
      id: updatedProduct[0][0] as int,
      name: updatedProduct[0][1] as String,
      description: updatedProduct[0][2] as String,
      price: updatedProduct[0][3] as double,
      image: updatedProduct[0][4] as String,
    );

    // Return the updated product in the response
    return UpdateProductResponse()..product = product;
  }

  @override
  Future<GetProductsResponse> getProducts(
      grpc.ServiceCall call, Empty request) async {
    final pool = PostgresHelper().getPool();

    final result = await pool.query('SELECT * FROM products');
    final rows = result.toList();
    final response = GetProductsResponse();

    for (final row in rows) {
      final product = Product()
        ..id = row[0] as int
        ..name = row[1] as String
        ..description = row[2] as String
        ..price = row[3] as double
        ..image = row[4] as String;

      response.products.add(product);
    }

    return response;
  }
}

Future<void> main(List<String> args) async {
  final server = grpc.Server(
    [ProductService()],
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}

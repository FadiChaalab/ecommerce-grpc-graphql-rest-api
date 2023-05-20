/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:ecommerce_client/src/protocol/product.dart' as _i3;
import 'package:ecommerce_client/src/protocol/order.dart' as _i4;
import 'dart:io' as _i5;
import 'protocol.dart' as _i6;

class _EndpointEcommerceEndPoint extends _i1.EndpointRef {
  _EndpointEcommerceEndPoint(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ecommerceEndPoint';

  _i2.Future<void> createProduct(_i3.Product p) =>
      caller.callServerEndpoint<void>(
        'ecommerceEndPoint',
        'createProduct',
        {'p': p},
      );

  _i2.Future<_i3.Product> getProduct(int id) =>
      caller.callServerEndpoint<_i3.Product>(
        'ecommerceEndPoint',
        'getProduct',
        {'id': id},
      );

  _i2.Future<List<_i3.Product>> getProducts() =>
      caller.callServerEndpoint<List<_i3.Product>>(
        'ecommerceEndPoint',
        'getProducts',
        {},
      );

  _i2.Future<void> updateProduct(_i3.Product p) =>
      caller.callServerEndpoint<void>(
        'ecommerceEndPoint',
        'updateProduct',
        {'p': p},
      );

  _i2.Future<void> deleteProduct(int id) => caller.callServerEndpoint<void>(
        'ecommerceEndPoint',
        'deleteProduct',
        {'id': id},
      );

  _i2.Future<void> createOrder(_i4.Order o) => caller.callServerEndpoint<void>(
        'ecommerceEndPoint',
        'createOrder',
        {'o': o},
      );

  _i2.Future<_i4.Order> getOrder(int id) =>
      caller.callServerEndpoint<_i4.Order>(
        'ecommerceEndPoint',
        'getOrder',
        {'id': id},
      );

  _i2.Future<List<_i4.Order>> getOrders() =>
      caller.callServerEndpoint<List<_i4.Order>>(
        'ecommerceEndPoint',
        'getOrders',
        {},
      );

  _i2.Future<void> updateOrder(_i4.Order p) => caller.callServerEndpoint<void>(
        'ecommerceEndPoint',
        'updateOrder',
        {'p': p},
      );

  _i2.Future<void> deleteOrder(int id) => caller.callServerEndpoint<void>(
        'ecommerceEndPoint',
        'deleteOrder',
        {'id': id},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i5.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i6.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    ecommerceEndPoint = _EndpointEcommerceEndPoint(this);
    example = _EndpointExample(this);
  }

  late final _EndpointEcommerceEndPoint ecommerceEndPoint;

  late final _EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'ecommerceEndPoint': ecommerceEndPoint,
        'example': example,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

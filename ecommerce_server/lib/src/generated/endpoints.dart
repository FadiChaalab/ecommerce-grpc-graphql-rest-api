/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/ecommerce_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import 'package:ecommerce_server/src/generated/product.dart' as _i4;
import 'package:ecommerce_server/src/generated/order.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'ecommerceEndPoint': _i2.EcommerceEndPoint()
        ..initialize(
          server,
          'ecommerceEndPoint',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['ecommerceEndPoint'] = _i1.EndpointConnector(
      name: 'ecommerceEndPoint',
      endpoint: endpoints['ecommerceEndPoint']!,
      methodConnectors: {
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'p': _i1.ParameterDescription(
              name: 'p',
              type: _i1.getType<_i4.Product>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .createProduct(
            session,
            params['p'],
          ),
        ),
        'getProduct': _i1.MethodConnector(
          name: 'getProduct',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .getProduct(
            session,
            params['id'],
          ),
        ),
        'getProducts': _i1.MethodConnector(
          name: 'getProducts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .getProducts(session),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'p': _i1.ParameterDescription(
              name: 'p',
              type: _i1.getType<_i4.Product>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .updateProduct(
            session,
            params['p'],
          ),
        ),
        'deleteProduct': _i1.MethodConnector(
          name: 'deleteProduct',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .deleteProduct(
            session,
            params['id'],
          ),
        ),
        'createOrder': _i1.MethodConnector(
          name: 'createOrder',
          params: {
            'o': _i1.ParameterDescription(
              name: 'o',
              type: _i1.getType<_i5.Order>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .createOrder(
            session,
            params['o'],
          ),
        ),
        'getOrder': _i1.MethodConnector(
          name: 'getOrder',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .getOrder(
            session,
            params['id'],
          ),
        ),
        'getOrders': _i1.MethodConnector(
          name: 'getOrders',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .getOrders(session),
        ),
        'updateOrder': _i1.MethodConnector(
          name: 'updateOrder',
          params: {
            'p': _i1.ParameterDescription(
              name: 'p',
              type: _i1.getType<_i5.Order>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .updateOrder(
            session,
            params['p'],
          ),
        ),
        'deleteOrder': _i1.MethodConnector(
          name: 'deleteOrder',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ecommerceEndPoint'] as _i2.EcommerceEndPoint)
                  .deleteOrder(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}

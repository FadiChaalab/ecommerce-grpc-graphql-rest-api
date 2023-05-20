/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'order.dart' as _i3;
import 'product.dart' as _i4;
import 'package:ecommerce_client/src/protocol/product.dart' as _i5;
import 'package:ecommerce_client/src/protocol/order.dart' as _i6;
export 'example.dart';
export 'order.dart';
export 'product.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data, this) as T;
    }
    if (t == _i3.Order) {
      return _i3.Order.fromJson(data, this) as T;
    }
    if (t == _i4.Product) {
      return _i4.Product.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Order?>()) {
      return (data != null ? _i3.Order.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Product?>()) {
      return (data != null ? _i4.Product.fromJson(data, this) : null) as T;
    }
    if (t == List<_i5.Product>) {
      return (data as List).map((e) => deserialize<_i5.Product>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.Order>) {
      return (data as List).map((e) => deserialize<_i6.Order>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.Order) {
      return 'Order';
    }
    if (data is _i4.Product) {
      return 'Product';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'Order') {
      return deserialize<_i3.Order>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i4.Product>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

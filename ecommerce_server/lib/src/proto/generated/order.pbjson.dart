///
//  Generated code. Do not modify.
//  source: order.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use orderDescriptor instead')
const Order$json = const {
  '1': 'Order',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'customer_id', '3': 2, '4': 1, '5': 5, '10': 'customerId'},
    const {'1': 'product_id', '3': 3, '4': 1, '5': 5, '10': 'productId'},
    const {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    const {'1': 'total_amount', '3': 5, '4': 1, '5': 2, '10': 'totalAmount'},
  ],
};

/// Descriptor for `Order`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderDescriptor = $convert.base64Decode('CgVPcmRlchIOCgJpZBgBIAEoBVICaWQSHwoLY3VzdG9tZXJfaWQYAiABKAVSCmN1c3RvbWVySWQSHQoKcHJvZHVjdF9pZBgDIAEoBVIJcHJvZHVjdElkEhoKCHF1YW50aXR5GAQgASgFUghxdWFudGl0eRIhCgx0b3RhbF9hbW91bnQYBSABKAJSC3RvdGFsQW1vdW50');
@$core.Deprecated('Use getOrderRequestDescriptor instead')
const GetOrderRequest$json = const {
  '1': 'GetOrderRequest',
  '2': const [
    const {'1': 'order_id', '3': 1, '4': 1, '5': 5, '10': 'orderId'},
  ],
};

/// Descriptor for `GetOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderRequestDescriptor = $convert.base64Decode('Cg9HZXRPcmRlclJlcXVlc3QSGQoIb3JkZXJfaWQYASABKAVSB29yZGVySWQ=');
@$core.Deprecated('Use getOrderResponseDescriptor instead')
const GetOrderResponse$json = const {
  '1': 'GetOrderResponse',
  '2': const [
    const {'1': 'order', '3': 1, '4': 1, '5': 11, '6': '.order.Order', '10': 'order'},
  ],
};

/// Descriptor for `GetOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderResponseDescriptor = $convert.base64Decode('ChBHZXRPcmRlclJlc3BvbnNlEiIKBW9yZGVyGAEgASgLMgwub3JkZXIuT3JkZXJSBW9yZGVy');
@$core.Deprecated('Use getOrdersResponseDescriptor instead')
const GetOrdersResponse$json = const {
  '1': 'GetOrdersResponse',
  '2': const [
    const {'1': 'orders', '3': 1, '4': 3, '5': 11, '6': '.order.Order', '10': 'orders'},
  ],
};

/// Descriptor for `GetOrdersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrdersResponseDescriptor = $convert.base64Decode('ChFHZXRPcmRlcnNSZXNwb25zZRIkCgZvcmRlcnMYASADKAsyDC5vcmRlci5PcmRlclIGb3JkZXJz');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use createOrderRequestDescriptor instead')
const CreateOrderRequest$json = const {
  '1': 'CreateOrderRequest',
  '2': const [
    const {'1': 'customer_id', '3': 1, '4': 1, '5': 5, '10': 'customerId'},
    const {'1': 'product_id', '3': 2, '4': 1, '5': 5, '10': 'productId'},
    const {'1': 'quantity', '3': 3, '4': 1, '5': 5, '10': 'quantity'},
    const {'1': 'total_amount', '3': 4, '4': 1, '5': 2, '10': 'totalAmount'},
  ],
};

/// Descriptor for `CreateOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderRequestDescriptor = $convert.base64Decode('ChJDcmVhdGVPcmRlclJlcXVlc3QSHwoLY3VzdG9tZXJfaWQYASABKAVSCmN1c3RvbWVySWQSHQoKcHJvZHVjdF9pZBgCIAEoBVIJcHJvZHVjdElkEhoKCHF1YW50aXR5GAMgASgFUghxdWFudGl0eRIhCgx0b3RhbF9hbW91bnQYBCABKAJSC3RvdGFsQW1vdW50');
@$core.Deprecated('Use createOrderResponseDescriptor instead')
const CreateOrderResponse$json = const {
  '1': 'CreateOrderResponse',
  '2': const [
    const {'1': 'order', '3': 1, '4': 1, '5': 11, '6': '.order.Order', '10': 'order'},
  ],
};

/// Descriptor for `CreateOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderResponseDescriptor = $convert.base64Decode('ChNDcmVhdGVPcmRlclJlc3BvbnNlEiIKBW9yZGVyGAEgASgLMgwub3JkZXIuT3JkZXJSBW9yZGVy');
@$core.Deprecated('Use updateOrderRequestDescriptor instead')
const UpdateOrderRequest$json = const {
  '1': 'UpdateOrderRequest',
  '2': const [
    const {'1': 'order_id', '3': 1, '4': 1, '5': 5, '10': 'orderId'},
    const {'1': 'customer_id', '3': 2, '4': 1, '5': 5, '10': 'customerId'},
    const {'1': 'product_id', '3': 3, '4': 1, '5': 5, '10': 'productId'},
    const {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    const {'1': 'total_amount', '3': 5, '4': 1, '5': 2, '10': 'totalAmount'},
  ],
};

/// Descriptor for `UpdateOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOrderRequestDescriptor = $convert.base64Decode('ChJVcGRhdGVPcmRlclJlcXVlc3QSGQoIb3JkZXJfaWQYASABKAVSB29yZGVySWQSHwoLY3VzdG9tZXJfaWQYAiABKAVSCmN1c3RvbWVySWQSHQoKcHJvZHVjdF9pZBgDIAEoBVIJcHJvZHVjdElkEhoKCHF1YW50aXR5GAQgASgFUghxdWFudGl0eRIhCgx0b3RhbF9hbW91bnQYBSABKAJSC3RvdGFsQW1vdW50');
@$core.Deprecated('Use updateOrderResponseDescriptor instead')
const UpdateOrderResponse$json = const {
  '1': 'UpdateOrderResponse',
  '2': const [
    const {'1': 'order', '3': 1, '4': 1, '5': 11, '6': '.order.Order', '10': 'order'},
  ],
};

/// Descriptor for `UpdateOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOrderResponseDescriptor = $convert.base64Decode('ChNVcGRhdGVPcmRlclJlc3BvbnNlEiIKBW9yZGVyGAEgASgLMgwub3JkZXIuT3JkZXJSBW9yZGVy');
@$core.Deprecated('Use deleteOrderRequestDescriptor instead')
const DeleteOrderRequest$json = const {
  '1': 'DeleteOrderRequest',
  '2': const [
    const {'1': 'order_id', '3': 1, '4': 1, '5': 5, '10': 'orderId'},
  ],
};

/// Descriptor for `DeleteOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOrderRequestDescriptor = $convert.base64Decode('ChJEZWxldGVPcmRlclJlcXVlc3QSGQoIb3JkZXJfaWQYASABKAVSB29yZGVySWQ=');
@$core.Deprecated('Use deleteOrderResponseDescriptor instead')
const DeleteOrderResponse$json = const {
  '1': 'DeleteOrderResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DeleteOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOrderResponseDescriptor = $convert.base64Decode('ChNEZWxldGVPcmRlclJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

///
//  Generated code. Do not modify.
//  source: product.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use productDescriptor instead')
const Product$json = const {
  '1': 'Product',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'price', '3': 4, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'image', '3': 5, '4': 1, '5': 9, '10': 'image'},
  ],
};

/// Descriptor for `Product`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productDescriptor = $convert.base64Decode('CgdQcm9kdWN0Eg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAMgASgJUgtkZXNjcmlwdGlvbhIUCgVwcmljZRgEIAEoAlIFcHJpY2USFAoFaW1hZ2UYBSABKAlSBWltYWdl');
@$core.Deprecated('Use getProductRequestDescriptor instead')
const GetProductRequest$json = const {
  '1': 'GetProductRequest',
  '2': const [
    const {'1': 'product_id', '3': 1, '4': 1, '5': 5, '10': 'productId'},
  ],
};

/// Descriptor for `GetProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductRequestDescriptor = $convert.base64Decode('ChFHZXRQcm9kdWN0UmVxdWVzdBIdCgpwcm9kdWN0X2lkGAEgASgFUglwcm9kdWN0SWQ=');
@$core.Deprecated('Use getProductResponseDescriptor instead')
const GetProductResponse$json = const {
  '1': 'GetProductResponse',
  '2': const [
    const {'1': 'product', '3': 1, '4': 1, '5': 11, '6': '.product.Product', '10': 'product'},
  ],
};

/// Descriptor for `GetProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductResponseDescriptor = $convert.base64Decode('ChJHZXRQcm9kdWN0UmVzcG9uc2USKgoHcHJvZHVjdBgBIAEoCzIQLnByb2R1Y3QuUHJvZHVjdFIHcHJvZHVjdA==');
@$core.Deprecated('Use getProductsResponseDescriptor instead')
const GetProductsResponse$json = const {
  '1': 'GetProductsResponse',
  '2': const [
    const {'1': 'products', '3': 1, '4': 3, '5': 11, '6': '.product.Product', '10': 'products'},
  ],
};

/// Descriptor for `GetProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductsResponseDescriptor = $convert.base64Decode('ChNHZXRQcm9kdWN0c1Jlc3BvbnNlEiwKCHByb2R1Y3RzGAEgAygLMhAucHJvZHVjdC5Qcm9kdWN0Ughwcm9kdWN0cw==');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use createProductRequestDescriptor instead')
const CreateProductRequest$json = const {
  '1': 'CreateProductRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'price', '3': 3, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'image', '3': 4, '4': 1, '5': 9, '10': 'image'},
  ],
};

/// Descriptor for `CreateProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProductRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVQcm9kdWN0UmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhIUCgVwcmljZRgDIAEoAlIFcHJpY2USFAoFaW1hZ2UYBCABKAlSBWltYWdl');
@$core.Deprecated('Use createProductResponseDescriptor instead')
const CreateProductResponse$json = const {
  '1': 'CreateProductResponse',
  '2': const [
    const {'1': 'product', '3': 1, '4': 1, '5': 11, '6': '.product.Product', '10': 'product'},
  ],
};

/// Descriptor for `CreateProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProductResponseDescriptor = $convert.base64Decode('ChVDcmVhdGVQcm9kdWN0UmVzcG9uc2USKgoHcHJvZHVjdBgBIAEoCzIQLnByb2R1Y3QuUHJvZHVjdFIHcHJvZHVjdA==');
@$core.Deprecated('Use updateProductRequestDescriptor instead')
const UpdateProductRequest$json = const {
  '1': 'UpdateProductRequest',
  '2': const [
    const {'1': 'product_id', '3': 1, '4': 1, '5': 5, '10': 'productId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'price', '3': 4, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'image', '3': 5, '4': 1, '5': 9, '10': 'image'},
  ],
};

/// Descriptor for `UpdateProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProductRequestDescriptor = $convert.base64Decode('ChRVcGRhdGVQcm9kdWN0UmVxdWVzdBIdCgpwcm9kdWN0X2lkGAEgASgFUglwcm9kdWN0SWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SFAoFcHJpY2UYBCABKAJSBXByaWNlEhQKBWltYWdlGAUgASgJUgVpbWFnZQ==');
@$core.Deprecated('Use updateProductResponseDescriptor instead')
const UpdateProductResponse$json = const {
  '1': 'UpdateProductResponse',
  '2': const [
    const {'1': 'product', '3': 1, '4': 1, '5': 11, '6': '.product.Product', '10': 'product'},
  ],
};

/// Descriptor for `UpdateProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProductResponseDescriptor = $convert.base64Decode('ChVVcGRhdGVQcm9kdWN0UmVzcG9uc2USKgoHcHJvZHVjdBgBIAEoCzIQLnByb2R1Y3QuUHJvZHVjdFIHcHJvZHVjdA==');
@$core.Deprecated('Use deleteProductRequestDescriptor instead')
const DeleteProductRequest$json = const {
  '1': 'DeleteProductRequest',
  '2': const [
    const {'1': 'product_id', '3': 1, '4': 1, '5': 5, '10': 'productId'},
  ],
};

/// Descriptor for `DeleteProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProductRequestDescriptor = $convert.base64Decode('ChREZWxldGVQcm9kdWN0UmVxdWVzdBIdCgpwcm9kdWN0X2lkGAEgASgFUglwcm9kdWN0SWQ=');
@$core.Deprecated('Use deleteProductResponseDescriptor instead')
const DeleteProductResponse$json = const {
  '1': 'DeleteProductResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DeleteProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProductResponseDescriptor = $convert.base64Decode('ChVEZWxldGVQcm9kdWN0UmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

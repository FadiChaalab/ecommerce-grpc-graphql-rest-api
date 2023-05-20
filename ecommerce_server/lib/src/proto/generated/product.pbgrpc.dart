///
//  Generated code. Do not modify.
//  source: product.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'product.pb.dart' as $0;
export 'product.pb.dart';

class ProductServiceClient extends $grpc.Client {
  static final _$getProduct =
      $grpc.ClientMethod<$0.GetProductRequest, $0.GetProductResponse>(
          '/product.ProductService/GetProduct',
          ($0.GetProductRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetProductResponse.fromBuffer(value));
  static final _$getProducts =
      $grpc.ClientMethod<$0.Empty, $0.GetProductsResponse>(
          '/product.ProductService/GetProducts',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetProductsResponse.fromBuffer(value));
  static final _$createProduct =
      $grpc.ClientMethod<$0.CreateProductRequest, $0.CreateProductResponse>(
          '/product.ProductService/CreateProduct',
          ($0.CreateProductRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateProductResponse.fromBuffer(value));
  static final _$updateProduct =
      $grpc.ClientMethod<$0.UpdateProductRequest, $0.UpdateProductResponse>(
          '/product.ProductService/UpdateProduct',
          ($0.UpdateProductRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateProductResponse.fromBuffer(value));
  static final _$deleteProduct =
      $grpc.ClientMethod<$0.DeleteProductRequest, $0.DeleteProductResponse>(
          '/product.ProductService/DeleteProduct',
          ($0.DeleteProductRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteProductResponse.fromBuffer(value));

  ProductServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetProductResponse> getProduct(
      $0.GetProductRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetProductsResponse> getProducts($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProducts, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateProductResponse> createProduct(
      $0.CreateProductRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateProductResponse> updateProduct(
      $0.UpdateProductRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProduct, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteProductResponse> deleteProduct(
      $0.DeleteProductRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteProduct, request, options: options);
  }
}

abstract class ProductServiceBase extends $grpc.Service {
  $core.String get $name => 'product.ProductService';

  ProductServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetProductRequest, $0.GetProductResponse>(
        'GetProduct',
        getProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProductRequest.fromBuffer(value),
        ($0.GetProductResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetProductsResponse>(
        'GetProducts',
        getProducts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetProductsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateProductRequest, $0.CreateProductResponse>(
            'CreateProduct',
            createProduct_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateProductRequest.fromBuffer(value),
            ($0.CreateProductResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateProductRequest, $0.UpdateProductResponse>(
            'UpdateProduct',
            updateProduct_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateProductRequest.fromBuffer(value),
            ($0.UpdateProductResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteProductRequest, $0.DeleteProductResponse>(
            'DeleteProduct',
            deleteProduct_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteProductRequest.fromBuffer(value),
            ($0.DeleteProductResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetProductResponse> getProduct_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetProductRequest> request) async {
    return getProduct(call, await request);
  }

  $async.Future<$0.GetProductsResponse> getProducts_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getProducts(call, await request);
  }

  $async.Future<$0.CreateProductResponse> createProduct_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateProductRequest> request) async {
    return createProduct(call, await request);
  }

  $async.Future<$0.UpdateProductResponse> updateProduct_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateProductRequest> request) async {
    return updateProduct(call, await request);
  }

  $async.Future<$0.DeleteProductResponse> deleteProduct_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteProductRequest> request) async {
    return deleteProduct(call, await request);
  }

  $async.Future<$0.GetProductResponse> getProduct(
      $grpc.ServiceCall call, $0.GetProductRequest request);
  $async.Future<$0.GetProductsResponse> getProducts(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.CreateProductResponse> createProduct(
      $grpc.ServiceCall call, $0.CreateProductRequest request);
  $async.Future<$0.UpdateProductResponse> updateProduct(
      $grpc.ServiceCall call, $0.UpdateProductRequest request);
  $async.Future<$0.DeleteProductResponse> deleteProduct(
      $grpc.ServiceCall call, $0.DeleteProductRequest request);
}

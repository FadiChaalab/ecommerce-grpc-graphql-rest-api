///
//  Generated code. Do not modify.
//  source: order.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'order.pb.dart' as $0;
export 'order.pb.dart';

class OrderServiceClient extends $grpc.Client {
  static final _$getOrder =
      $grpc.ClientMethod<$0.GetOrderRequest, $0.GetOrderResponse>(
          '/order.OrderService/GetOrder',
          ($0.GetOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetOrderResponse.fromBuffer(value));
  static final _$getOrders = $grpc.ClientMethod<$0.Empty, $0.GetOrdersResponse>(
      '/order.OrderService/GetOrders',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetOrdersResponse.fromBuffer(value));
  static final _$createOrder =
      $grpc.ClientMethod<$0.CreateOrderRequest, $0.CreateOrderResponse>(
          '/order.OrderService/CreateOrder',
          ($0.CreateOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateOrderResponse.fromBuffer(value));
  static final _$updateOrder =
      $grpc.ClientMethod<$0.UpdateOrderRequest, $0.UpdateOrderResponse>(
          '/order.OrderService/UpdateOrder',
          ($0.UpdateOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateOrderResponse.fromBuffer(value));
  static final _$deleteOrder =
      $grpc.ClientMethod<$0.DeleteOrderRequest, $0.DeleteOrderResponse>(
          '/order.OrderService/DeleteOrder',
          ($0.DeleteOrderRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteOrderResponse.fromBuffer(value));

  OrderServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetOrderResponse> getOrder($0.GetOrderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetOrdersResponse> getOrders($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOrders, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateOrderResponse> createOrder(
      $0.CreateOrderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateOrderResponse> updateOrder(
      $0.UpdateOrderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteOrderResponse> deleteOrder(
      $0.DeleteOrderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteOrder, request, options: options);
  }
}

abstract class OrderServiceBase extends $grpc.Service {
  $core.String get $name => 'order.OrderService';

  OrderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetOrderRequest, $0.GetOrderResponse>(
        'GetOrder',
        getOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOrderRequest.fromBuffer(value),
        ($0.GetOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetOrdersResponse>(
        'GetOrders',
        getOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetOrdersResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateOrderRequest, $0.CreateOrderResponse>(
            'CreateOrder',
            createOrder_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateOrderRequest.fromBuffer(value),
            ($0.CreateOrderResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateOrderRequest, $0.UpdateOrderResponse>(
            'UpdateOrder',
            updateOrder_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateOrderRequest.fromBuffer(value),
            ($0.UpdateOrderResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteOrderRequest, $0.DeleteOrderResponse>(
            'DeleteOrder',
            deleteOrder_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteOrderRequest.fromBuffer(value),
            ($0.DeleteOrderResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetOrderResponse> getOrder_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetOrderRequest> request) async {
    return getOrder(call, await request);
  }

  $async.Future<$0.GetOrdersResponse> getOrders_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getOrders(call, await request);
  }

  $async.Future<$0.CreateOrderResponse> createOrder_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateOrderRequest> request) async {
    return createOrder(call, await request);
  }

  $async.Future<$0.UpdateOrderResponse> updateOrder_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateOrderRequest> request) async {
    return updateOrder(call, await request);
  }

  $async.Future<$0.DeleteOrderResponse> deleteOrder_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteOrderRequest> request) async {
    return deleteOrder(call, await request);
  }

  $async.Future<$0.GetOrderResponse> getOrder(
      $grpc.ServiceCall call, $0.GetOrderRequest request);
  $async.Future<$0.GetOrdersResponse> getOrders(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.CreateOrderResponse> createOrder(
      $grpc.ServiceCall call, $0.CreateOrderRequest request);
  $async.Future<$0.UpdateOrderResponse> updateOrder(
      $grpc.ServiceCall call, $0.UpdateOrderRequest request);
  $async.Future<$0.DeleteOrderResponse> deleteOrder(
      $grpc.ServiceCall call, $0.DeleteOrderRequest request);
}

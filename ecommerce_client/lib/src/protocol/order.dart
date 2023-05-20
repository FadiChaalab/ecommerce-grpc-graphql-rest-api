/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Order extends _i1.SerializableEntity {
  Order({
    this.id,
    required this.customer_id,
    required this.product_id,
    required this.quantity,
    required this.total_amount,
  });

  factory Order.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Order(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      customer_id: serializationManager
          .deserialize<int>(jsonSerialization['customer_id']),
      product_id: serializationManager
          .deserialize<int>(jsonSerialization['product_id']),
      quantity:
          serializationManager.deserialize<int>(jsonSerialization['quantity']),
      total_amount: serializationManager
          .deserialize<double>(jsonSerialization['total_amount']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int customer_id;

  int product_id;

  int quantity;

  double total_amount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customer_id,
      'product_id': product_id,
      'quantity': quantity,
      'total_amount': total_amount,
    };
  }
}

// ignore_for_file: non_constant_identifier_names

/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Order extends _i1.TableRow {
  Order({
    int? id,
    required this.customer_id,
    required this.product_id,
    required this.quantity,
    required this.total_amount,
  }) : super(id);

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

  static final t = OrderTable();

  int customer_id;

  int product_id;

  int quantity;

  double total_amount;

  @override
  String get tableName => 'orders';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'customer_id': customer_id,
      'product_id': product_id,
      'quantity': quantity,
      'total_amount': total_amount,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'customer_id': customer_id,
      'product_id': product_id,
      'quantity': quantity,
      'total_amount': total_amount,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'customer_id':
        customer_id = value;
        return;
      case 'product_id':
        product_id = value;
        return;
      case 'quantity':
        quantity = value;
        return;
      case 'total_amount':
        total_amount = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Order>> find(
    _i1.Session session, {
    OrderExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Order>(
      where: where != null ? where(Order.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Order?> findSingleRow(
    _i1.Session session, {
    OrderExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Order>(
      where: where != null ? where(Order.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Order?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Order>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required OrderExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Order>(
      where: where(Order.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    OrderExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Order>(
      where: where != null ? where(Order.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef OrderExpressionBuilder = _i1.Expression Function(OrderTable);

class OrderTable extends _i1.Table {
  OrderTable() : super(tableName: 'orders');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final customer_id = _i1.ColumnInt('customer_id');

  final product_id = _i1.ColumnInt('product_id');

  final quantity = _i1.ColumnInt('quantity');

  final total_amount = _i1.ColumnDouble('total_amount');

  @override
  List<_i1.Column> get columns => [
        id,
        customer_id,
        product_id,
        quantity,
        total_amount,
      ];
}

@Deprecated('Use OrderTable.t instead.')
OrderTable tOrder = OrderTable();

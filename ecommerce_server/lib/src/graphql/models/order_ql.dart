import 'package:graphql_schema2/graphql_schema2.dart';

@GraphQLDocumentation(description: 'Order entity')
class OrderQL {
  @GraphQLDocumentation(description: 'ID of the order')
  int? id;

  @GraphQLDocumentation(description: 'ID of the customer')
  int? customerId;

  @GraphQLDocumentation(description: 'Product ID included in the order')
  int? productId;

  @GraphQLDocumentation(description: 'Quantity of the order')
  int? quantity;

  @GraphQLDocumentation(description: 'Total amount of the order')
  double? totalAmount;

  OrderQL({
    this.id,
    this.customerId,
    this.productId,
    this.quantity,
    this.totalAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerId': customerId,
      'productId': productId,
      'quantity': quantity,
      'totalAmount': totalAmount,
    };
  }
}

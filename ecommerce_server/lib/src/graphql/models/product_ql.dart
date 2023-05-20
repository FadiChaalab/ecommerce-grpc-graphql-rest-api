import 'package:graphql_schema2/graphql_schema2.dart';

@GraphQLDocumentation(description: 'Product entity')
class ProductQL {
  @GraphQLDocumentation(description: 'ID of the product')
  int? id;

  @GraphQLDocumentation(description: 'Name of the product')
  String? name;

  @GraphQLDocumentation(description: 'Description of the product')
  String? description;

  @GraphQLDocumentation(description: 'Price of the product')
  double? price;

  @GraphQLDocumentation(description: 'Image of the product')
  String? image;

  ProductQL({this.id, this.name, this.description, this.price, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}

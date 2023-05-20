// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_client/ecommerce_client.dart';
import 'package:ecommerce_flutter/pages/home_page.dart';
import 'package:ecommerce_flutter/pages/update_product.dart';
import 'package:ecommerce_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../repository/repository.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  EcommerceRepository repository = EcommerceRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(widget.product.name),
                    content: const Text(
                      'Are you sure do delate this product?',
                      style: TextStyle(color: kTextColor),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kDangerColor,
                        ),
                        onPressed: () {
                          repository.deleteProduct(widget.product.id!).then(
                                (value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const HomePage(),
                                  ),
                                ),
                              );
                        },
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/Delete.svg',
              color: kDangerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  settings:
                      RouteSettings(name: '/product/${widget.product.id}/edit'),
                  builder: (_) => UpdateProduct(
                    product: widget.product,
                  ),
                ),
              ),
              icon: SvgPicture.asset(
                'assets/icons/Edit.svg',
                color: kSuccessColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kDefaultPadding),
              Hero(
                tag: widget.product.id.toString(),
                child: Container(
                  height: 304,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                'Shoppy collection'.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    '${widget.product.price.toStringAsFixed(2)}\$',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding / 2),
              const Chip(
                side: BorderSide.none,
                backgroundColor: kSuccessColor,
                label: Text(
                  'Available in Stock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              Text(
                'Product Info',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Text(
                widget.product.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: kTextColor),
              ),
              const SizedBox(height: kDefaultPadding),
              LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth < 600 ? double.infinity : 184,
                  height: 54,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () {},
                    child: const Text(
                      'Order now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

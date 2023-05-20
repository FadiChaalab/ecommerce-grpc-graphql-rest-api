import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_client/ecommerce_client.dart';
import 'package:ecommerce_flutter/pages/add_product.dart';
import 'package:ecommerce_flutter/pages/product_page.dart';
import 'package:ecommerce_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../repository/repository.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  EcommerceRepository repository = EcommerceRepository();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding,
          ),
          child: FutureBuilder<List<Product>>(
            future: repository.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: LottieBuilder.asset('assets/json/nodata.json'),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: LottieBuilder.asset('assets/json/nodata.json'),
                  );
                }
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return RefreshIndicator(
                      onRefresh: () => repository.getProducts(),
                      child: GridView.builder(
                        itemCount: snapshot.data?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth < 600
                              ? 2
                              : constraints.maxWidth < 992
                                  ? 3
                                  : 4,
                          crossAxisSpacing: kDefaultPadding,
                          mainAxisSpacing: kDefaultPadding,
                        ),
                        itemBuilder: (context, index) {
                          Product product = snapshot.data![index];
                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              PageRouteBuilder(
                                settings: RouteSettings(
                                    name: 'product/${product.id}'),
                                pageBuilder: (_, animation, __) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: ProductPage(product: product),
                                ),
                              ),
                            ),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            child: Hero(
                              tag: product.id.toString(),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      product.image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
              return Center(
                child: LottieBuilder.asset('assets/json/nodata.json'),
              );
            },
          ),
        ),
        Positioned(
          bottom: kDefaultPadding,
          right: kDefaultPadding,
          child: FloatingActionButton(
            heroTag: 'products',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                settings: const RouteSettings(name: 'products/add'),
                builder: (_) => const AddProduct(),
              ),
            ),
            backgroundColor: kPrimaryColor,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/Plus.svg',
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:ecommerce_client/ecommerce_client.dart';
import 'package:ecommerce_flutter/pages/add_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../repository/repository.dart';
import '../utils/constants.dart';
import 'home_page.dart';
import 'update_order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
          child: FutureBuilder<List<Order>>(
            future: repository.getOrders(),
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
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Order order = snapshot.data![index];
                    return ListTile(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          contentPadding: const EdgeInsets.all(24),
                          title: Text('Order #${order.id}'),
                          children: [
                            Text('Customer #${order.customer_id}'),
                            const SizedBox(height: kDefaultPadding / 2),
                            Text('Product #${order.product_id}'),
                            const SizedBox(height: kDefaultPadding / 2),
                            Text('Quantity: ${order.quantity}'),
                            const SizedBox(height: kDefaultPadding / 2),
                            Text(
                              'Total amount: ${order.total_amount.toStringAsFixed(2)}\$',
                            ),
                          ],
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            settings:
                                RouteSettings(name: 'order/${order.id}/edit'),
                            builder: (_) => UpdateOrder(
                              order: order,
                            ),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/Edit.svg',
                          color: kSuccessColor,
                        ),
                      ),
                      title: Text(
                        '${order.total_amount.toStringAsFixed(2)}\$',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'Quantity: ${order.quantity}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Order #${order.id}'),
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
                                      repository.deleteOrder(order.id!).then(
                                            (value) =>
                                                Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    const HomePage(),
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
            heroTag: 'orders',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                settings: const RouteSettings(name: 'orders/add'),
                builder: (_) => const AddOrder(),
              ),
            ),
            backgroundColor: kPrimaryColor,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/Plus.svg',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

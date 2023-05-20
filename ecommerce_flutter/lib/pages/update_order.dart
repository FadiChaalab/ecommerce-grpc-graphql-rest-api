import 'package:ecommerce_client/ecommerce_client.dart';
import 'package:ecommerce_flutter/pages/home_page.dart';
import 'package:ecommerce_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

import '../repository/repository.dart';

class UpdateOrder extends StatefulWidget {
  final Order order;
  const UpdateOrder({super.key, required this.order});

  @override
  State<UpdateOrder> createState() => _UpdateOrderState();
}

class _UpdateOrderState extends State<UpdateOrder> {
  EcommerceRepository repository = EcommerceRepository();
  late TextEditingController _orderCustomerIdController;
  late TextEditingController _orderProductIdController;
  late TextEditingController _orderQuantityController;
  late TextEditingController _orderTotalAmountController;

  @override
  void initState() {
    _orderCustomerIdController =
        TextEditingController(text: widget.order.customer_id.toString());
    _orderProductIdController =
        TextEditingController(text: widget.order.product_id.toString());
    _orderQuantityController =
        TextEditingController(text: widget.order.quantity.toString());
    _orderTotalAmountController = TextEditingController(
        text: widget.order.total_amount.toStringAsFixed(2));
    super.initState();
  }

  @override
  void dispose() {
    _orderCustomerIdController.dispose();
    _orderProductIdController.dispose();
    _orderQuantityController.dispose();
    _orderTotalAmountController.dispose();
    super.dispose();
  }

  void update() async {
    if (_orderCustomerIdController.text.isEmpty ||
        _orderProductIdController.text.isEmpty ||
        _orderQuantityController.text.isEmpty ||
        _orderTotalAmountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All the fields are required')));
      return;
    }

    final customerId = int.tryParse(_orderCustomerIdController.text) ?? 1;
    final productId = int.tryParse(_orderProductIdController.text) ?? 1;
    final quantity = int.tryParse(_orderQuantityController.text) ?? 1;
    final totalAmount =
        double.tryParse(_orderTotalAmountController.text) ?? 9.99;
    final o = Order(
        id: widget.order.id,
        customer_id: customerId,
        product_id: productId,
        quantity: quantity,
        total_amount: totalAmount);
    await repository.updateOrder(o).then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kDefaultPadding),
                const Text(
                  'Update Order',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _orderCustomerIdController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter order customer id',
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _orderProductIdController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter order product id',
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _orderQuantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter order quantity',
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _orderTotalAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter order total amount',
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                SizedBox(
                  width: constraints.maxWidth < 600 ? double.infinity : 184,
                  height: 54,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onPressed: () => update(),
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

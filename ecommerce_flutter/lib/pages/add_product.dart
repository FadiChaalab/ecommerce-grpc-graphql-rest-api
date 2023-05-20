import 'package:ecommerce_client/ecommerce_client.dart';
import 'package:ecommerce_flutter/pages/home_page.dart';
import 'package:ecommerce_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

import '../repository/repository.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  EcommerceRepository repository = EcommerceRepository();
  late TextEditingController _productNameController;
  late TextEditingController _productDescriptionController;
  late TextEditingController _productPriceController;
  late TextEditingController _productImageController;

  @override
  void initState() {
    _productNameController = TextEditingController();
    _productDescriptionController = TextEditingController();
    _productPriceController = TextEditingController();
    _productImageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    _productImageController.dispose();
    super.dispose();
  }

  void update() async {
    if (_productNameController.text.isEmpty ||
        _productDescriptionController.text.isEmpty ||
        _productPriceController.text.isEmpty ||
        _productImageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All the fields are required')));
      return;
    }

    final name = _productNameController.text;
    final description = _productDescriptionController.text;
    final price = double.tryParse(_productPriceController.text) ?? 9.99;
    final image = _productImageController.text;
    final p = Product(
        name: name, description: description, price: price, image: image);
    await repository.createProduct(p).then(
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
                  'Create Product',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _productNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter product name',
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _productDescriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter product description',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _productPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter product price',
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TextField(
                  controller: _productImageController,
                  decoration: const InputDecoration(
                    hintText: 'Enter product image',
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
                      'Create',
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

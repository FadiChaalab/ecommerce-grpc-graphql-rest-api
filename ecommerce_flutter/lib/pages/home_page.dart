// ignore_for_file: deprecated_member_use

import 'package:ecommerce_flutter/pages/orders_page.dart';
import 'package:ecommerce_flutter/pages/products_page.dart';
import 'package:ecommerce_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SizedBox(
          height: 64,
          width: 84,
          child: Image.asset(
            'assets/images/logo-dark.png',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/shop.svg'),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          IndexedStack(
            index: _selectedPage,
            children: const [
              ProductsPage(),
              OrdersPage(),
            ],
          ),
          Positioned(
            bottom: kDefaultPadding,
            height: 74,
            width: 164,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: kDarkBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedPage = 0;
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/Home.svg',
                        color: _selectedPage == 0 ? Colors.white : kTextColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedPage = 1;
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/Bag.svg',
                        color: _selectedPage == 1 ? Colors.white : kTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

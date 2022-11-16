import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_grid.dart';
import 'package:myshop/ui/shared/app_drawer.dart';

import '../shared/app_bottomnavbar.dart';

class UserFavoriteScreen extends StatelessWidget {
  const UserFavoriteScreen({Key? key}) : super(key: key);
  static const routeName = '/user-favorite';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorite'),
      ),
      drawer: const AppDrawer(),
      body: const ProductsGrid(true),
      bottomNavigationBar: const BottomNavBar(),
      );
  }
}
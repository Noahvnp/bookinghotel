import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:myshop/models/product.dart';
import 'package:myshop/ui/cart/cart_screen.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import './products_grid.dart';

import '../shared/app_drawer.dart';
import 'top_right_badge.dart';

enum FilterOptions { favorites, all }

const double kDefaultPadding = 16.0; // standard padding using default items
const double kMediumPadding = 24.0; // bigger default padding

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchProducts;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Hotel'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
        // backgroundColor: Colors.deepPurple,
        // elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_back),
        // ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {},
        //   ),
        // const SizedBox(width: 10.0)
        // ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ValueListenableBuilder<bool>(
                valueListenable: _showOnlyFavorites,
                builder: (context, onlyFavorites, child) {
                  return ProductsGrid(onlyFavorites);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites.value = true;
          } else {
            _showOnlyFavorites.value = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only favorites'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show All'),
        ),
      ],
    );
  }

  // Widget buildMainOverview() {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     bottomNavigationBar: SalomonBottomBar(
  //       currentIndex: _currentIndex,
  //       onTap: (i) => setState(
  //         () => _currentIndex = i,
  //       ),
  //       selectedItemColor: Colors.lightBlue,
  //       unselectedItemColor: Colors.lightBlue.withOpacity(0.2),
  //       selectedColorOpacity: 0.2,
  //       margin: EdgeInsets.symmetric(
  //           horizontal: kMediumPadding, vertical: kDefaultPadding),
  //       items: [
  //         SalomonBottomBarItem(
  //           icon: Icon(
  //             FontAwesomeIcons.house,
  //             size: kDefaultPadding,
  //           ),
  //           title: Text("Home"),
  //         ),
  //         SalomonBottomBarItem(
  //           icon: Icon(
  //             FontAwesomeIcons.solidHeart,
  //             size: kDefaultPadding,
  //           ),
  //           title: Text("Likes"),
  //         ),
  //         SalomonBottomBarItem(
  //           icon: Icon(
  //             FontAwesomeIcons.briefcase,
  //             size: kDefaultPadding,
  //           ),
  //           title: Text("Booking"),
  //         ),
  //         SalomonBottomBarItem(
  //           icon: Icon(
  //             FontAwesomeIcons.solidUser,
  //             size: kDefaultPadding,
  //           ),
  //           title: Text("Profile"),
  //         ),
  //       ],
  //     ),
  //     body: IndexedStack(
  //       index: _currentIndex,
  //       children: [
  //         Container(),
  //         Container(),
  //         Container(),
  //         Container(),
  //       ],
  //     ),
  //   );
  // }
}

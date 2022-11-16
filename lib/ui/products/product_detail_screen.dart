import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(product.title),
          ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       SizedBox(
      //         height: 300,
      //         width: double.infinity,
      //         child: Image.network(product.imageUrl, fit: BoxFit.cover),
      //       ),
      //       const SizedBox(height: 10),
      //       Text(
      //         '\$${product.price}',
      //         style: const TextStyle(
      //           color: Colors.grey,
      //           fontSize: 20,
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 10),
      //         width: double.infinity,
      //         child: Text(
      //           product.description,
      //           textAlign: TextAlign.center,
      //           softWrap: true,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: FittedBox(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            width: 360,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const Icon(Icons.star),
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.local_atm_outlined,
                            color: Colors.lightBlue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.lightBlue,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Ninh Kieu, Can Tho',
                                  style: TextStyle(
                                    color: Colors.black87.withOpacity(.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.lightBlue,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: const Center(
                            child: TextButton(
                              child: Text(
                                'Đặt phòng ngay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: null,
                              // shape: StadiumBorder(),
                              // highlightedBorderColor: Colors.red,
                              // borderSide:
                              //     BorderSide(width: 2, color: Colors.red),
                              // ),

                              //                     child: IconButton(
                              //                       icon: ,
                              //                       onPressed: onPressed() {
                              //   final cart = context.read<CartManager>();
                              //   cart.addItem(product);
                              //   ScaffoldMessenger.of(context)
                              //     ..hideCurrentSnackBar()
                              //     ..showSnackBar(
                              //       SnackBar(
                              //         content: const Text(
                              //           'Item  added to cart',
                              //         ),
                              //         duration: const Duration(seconds: 2),
                              //         action: SnackBarAction(
                              //           label: 'UNDO',
                              //           onPressed: () {
                              //             cart.removeSingleItem(product.id!);
                              //           },
                              //         ),
                              //       ),
                              //     );
                              // },
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            border: Border.all(color: Colors.lightBlue),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

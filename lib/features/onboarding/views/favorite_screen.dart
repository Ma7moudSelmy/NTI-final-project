import 'package:e_commerce_flutter/core/wrapper/cart_screen.dart';
import 'package:e_commerce_flutter/features/home/views/widgets/product_controller.dart';
import 'package:e_commerce_flutter/features/home/views/widgets/product_grid_view.dart';
import 'package:e_commerce_flutter/features/home/views/widgets/product_list_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getFavoriteItems();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder(
          builder: (ProductController controller) {
            return ProductGridView(
              items: controller.filteredProducts,
              likeButtonPressed: (index) => controller.isFavorite(index),
              isPriceOff: (product) => controller.isPriceOff(product),
            );
          },
        ),
      ),
    );
  }
}

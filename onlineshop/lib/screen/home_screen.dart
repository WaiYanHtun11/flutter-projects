import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';
import '../model/product.dart';
import '../widget/category.dart';
import 'details_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'Women',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Category(),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                  itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 8
                    ),
                    itemBuilder: (context,index) => buildItem(products[index],context)
                ),
              )
          )
        ],
      ),
    );
  }

  Widget buildItem(Product product,BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailsScreen(product: product)
          )
        );
      },
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Image.asset(product.image),
              ),
              const SizedBox(height: 10),
              Text(product.title,style: const TextStyle(color: kTextLightColor)),
              const Text('\$234',style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search,color: kTextColor,)
        ),
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart_outlined,color: kTextColor)
        ),
        const SizedBox(width: kDefaultPadding/2)
      ],
    );
  }
}

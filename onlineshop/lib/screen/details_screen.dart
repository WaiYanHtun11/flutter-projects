import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';
import '../model/product.dart';
import '../widget/cart_counter.dart';
import '../widget/color_dot.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  Widget buildAddToCardBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: product.color),
              borderRadius: BorderRadius.circular(18),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/add_to_cart.svg',
                color: product.color,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    backgroundColor: product.color,
                    foregroundColor: Colors.white),
                child: const Text('Buy Now'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildCounterWithFav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CartCounter(),
        Container(
          height: 32,
          width: 32,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/icons/heart.svg'),
        )
      ],
    );
  }

  Widget buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }

  Row buildColorAndSize(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Color'),
              Row(
                children: [
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(color: Color(0xFFF8C078), isSelected: false),
                  ColorDot(color: Color(0xFFA29B9B), isSelected: false),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(
                  style: const TextStyle(color: kTextColor),
                  children: [
                const TextSpan(text: 'Size\n'),
                TextSpan(
                    text: '${product.size} cm',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold))
              ])),
        ),
      ],
    );
  }

  Widget buildProductWithImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aristocratic Hand Bag',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(text: 'Price\n'),
                TextSpan(
                    text: '\$${product.price}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ])),
              const SizedBox(width: kDefaultPadding),
              Expanded(
                  child: Image.asset(
                product.image,
                fit: BoxFit.fitWidth,
              ))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              )),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
          const SizedBox(width: kDefaultPadding / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                        top: size.height * 0.12,
                        left: kDefaultPadding,
                        right: kDefaultPadding),
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24))),
                    child: Column(
                      children: [
                        buildColorAndSize(context),
                        buildDescription(),
                        buildCounterWithFav(),
                        buildAddToCardBtn()
                      ],
                    ),
                  ),
                  buildProductWithImage(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

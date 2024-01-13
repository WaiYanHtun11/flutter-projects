import 'package:flutter/material.dart';
import 'package:onlineshop/constant.dart';
class Category extends StatefulWidget {
  const Category({super.key});
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> categories = ['Hand Bag','Jewellery','Footwear','Dresses','Lipsticks'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return buildCategory(index);
            }
        ),
      ),
    );
  }

  Widget buildCategory(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor
              ),
            ),
            Container(
              height: 2,
              margin: const EdgeInsets.only(top: kDefaultPadding/4),
              width: 80,
              color: selectedIndex == index ? Colors.black : Colors.transparent,

            )
          ],
        ),
      ),
    );
  }
}

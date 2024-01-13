import 'package:flutter/material.dart';
import 'package:onlineshop/constant.dart';
class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(Icons.remove,(){
          if(count > 1) {
            setState(() {
            count--;
          });
          }
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
          child: Text(count.toString().padLeft(2,'0'),style: Theme.of(context).textTheme.headlineSmall,),
        ),
        buildOutlineButton(Icons.add, (){
          setState(() {
            count++;
          });
        })
      ],
    );
  }

  SizedBox buildOutlineButton(IconData icon,Function press) {
    return SizedBox(
        width: 40,
        height: 32,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13)
            )
          ),
          onPressed: ()=> press(),
          child: Icon(icon),
        ),
      );
  }
}

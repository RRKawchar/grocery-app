import 'package:flutter/material.dart';
import 'package:grocery_app/utility/constants.dart';

class ProductUnit extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const ProductUnit({Key? key, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 2),
        height: 30,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 10,color: primaryColor),
                )),
            const Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: 10,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}

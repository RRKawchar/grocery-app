import 'package:flutter/material.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';

class SingleDeliveryItems extends StatelessWidget {
final String title;
final String address;
final String number;
final String addressType;
SingleDeliveryItems({required this.title,required this.address,required this.number,required this.addressType});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: title),
              Container(
                padding: const EdgeInsets.all(1),
                width: 60,
                height: 20,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: TextWidget(text: addressType,size: 13,color: Colors.black,),

                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: primaryColor,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: address),
              const SizedBox(height: 10,),
              TextWidget(text: number)
            ],
          ),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}

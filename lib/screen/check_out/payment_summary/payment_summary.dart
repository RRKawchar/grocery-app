import 'package:flutter/material.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';
class PaymentSummary extends StatefulWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: textColor
        ),
        backgroundColor: primaryColor,
        title: TextWidget(text: "Payment Summary",size: 18,),
      ),
      bottomNavigationBar: ListTile(
        title: TextWidget(text: 'Total Amount'),
        subtitle: TextWidget(text: '\$3000',color: Colors.green[900],fontWeight: FontWeight.bold,size: 17,),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: (){},
            color:primaryColor ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            child: TextWidget(text: 'Place Order',color: textColor,),
          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child:ListView.builder(
          itemCount: 1,
            itemBuilder: (context,index){
            return Column(
              children: [
                ListTile(
                  title: TextWidget(text:'First Name'),
                  subtitle: TextWidget(text:'"Dhaka/Bangladesh, sector 14, road 22, house 12"'),
                ),
                Divider(),
                ExpansionTile(
                    children: [

                    ],
                    title:TextWidget(text: "Order Item 10",),
                )
              ],
            );
            }
        )
      ),
    );
  }
}

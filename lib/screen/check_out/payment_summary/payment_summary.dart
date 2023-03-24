import 'package:flutter/material.dart';
import 'package:grocery_app/models/delivery_address_model.dart';
import 'package:grocery_app/screen/check_out/delevery_details/single_delivery_items.dart';
import 'package:grocery_app/screen/check_out/payment_summary/order_item.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';
class PaymentSummary extends StatefulWidget {

  final DeliveryAddressModel deliveryAddressList;
  const PaymentSummary({Key? key,required this.deliveryAddressList}) : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}
enum AddressType { home, onlinePayment}
class _PaymentSummaryState extends State<PaymentSummary> {

  var myType = AddressType.home;

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
            SingleDeliveryItems(
            address: "${widget.deliveryAddressList.cityName}/${widget.deliveryAddressList.cityName}, ${widget.deliveryAddressList.roadNo}, ${widget.deliveryAddressList.houseNo}, ${widget.deliveryAddressList.pinCode}",
              title: "${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}",
              addressType: widget.deliveryAddressList.addressType=="AddressType.other"?"Other" :widget.deliveryAddressList.addressType=="AddressType.home"?'Home':'work',
              number: widget.deliveryAddressList.mobile,
            ),
                const Divider(),
                ExpansionTile(
                    title:TextWidget(text: "Order Item 6",),
                    children: const [
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                    ],
                ),
                const Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading:TextWidget(text: "sub total",fontWeight: FontWeight.bold,) ,
                  trailing: TextWidget(text: "\$200",fontWeight: FontWeight.bold,),

                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading:TextWidget(text: "Shipping Charge",color: Colors.grey[600],) ,
                  trailing: TextWidget(text: "\$0",fontWeight: FontWeight.bold,),

                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading:TextWidget(text: "Compen discount",color: Colors.grey[600],) ,
                  trailing: TextWidget(text: "\$10",fontWeight: FontWeight.bold,),

                ),
                const Divider(),
                ListTile(
                  leading: TextWidget(text: "Payment Option",),
                ),
                RadioListTile(
                  value: AddressType.home,
                  groupValue: myType,
                  title: TextWidget(
                    text: "Home",
                  ),
                  secondary: const Icon(
                    Icons.home,
                    color: primaryColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                ),
                RadioListTile(
                  value: AddressType.onlinePayment,
                  groupValue: myType,
                  title: TextWidget(
                    text: "Online Payment",
                  ),
                  secondary: const Icon(
                    Icons.devices_other,
                    color: primaryColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                ),
              ],
            );
            }
        )
      ),
    );
  }
}

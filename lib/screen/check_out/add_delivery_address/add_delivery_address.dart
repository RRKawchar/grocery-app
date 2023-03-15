import 'package:flutter/material.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/custom_text_field.dart';
import 'package:grocery_app/widget/textWidget.dart';

class AddDeliveryAddress extends StatefulWidget {

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressType{
  home,
  work,
  other
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
final TextEditingController controller=TextEditingController();

var myType=AddressType.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: TextWidget(text:"Add Delivery address",size: 18,),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        height: 48,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              onPressed: (){},
              color: primaryColor,
              child: TextWidget(text: "Add Address",color: textColor,),
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
              CustomTextField(
                  controller: controller,
                  labelText: "Firs name",
                  keyboardType: TextInputType.text,
              ),
              CustomTextField(
                  controller: controller,
                  labelText: "Last name",
                  keyboardType: TextInputType.text,
              ),
            CustomTextField(
              controller: controller,
              labelText: "Country name",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: controller,
              labelText: "City",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: controller,
              labelText: "Mobile Number",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: controller,
              labelText: "Alternative Mobile No",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: controller,
              labelText: "Road No",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: controller,
              labelText: "House no",
              keyboardType: TextInputType.text,
            ),
            CustomTextField(
              controller: controller,
              labelText: "Pin code",
              keyboardType: TextInputType.text,
            ),
            InkWell(
              onTap: (){},
              child: Container(
                height: 48,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Set Location")
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
                value: AddressType.home,
                groupValue: myType,
                title: TextWidget(text: "Home",),
                secondary: const Icon(Icons.home,color: primaryColor,),
                onChanged: (value){
                  setState(() {
                    myType=value!;
                  });
                },
            ),
            RadioListTile(
              value: AddressType.work,
              groupValue: myType,
              title: TextWidget(text: "Work",),
              secondary: const Icon(Icons.work,color: primaryColor,),
              onChanged: (value){
                 setState(() {
                   myType=value!;
                 });
              },
            ),
            RadioListTile(
              value:AddressType.other,
              groupValue: myType,
              title: TextWidget(text: "Others",),
              secondary: const Icon(Icons.devices_other,color: primaryColor,),
              onChanged: (value){
               setState(() {
                 myType=value!;
               });
              },
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController countryName = TextEditingController();
  TextEditingController cityName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController alMobile = TextEditingController();
  TextEditingController roadNo = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController location = TextEditingController();

  void validator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name is Empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Last Name is Empty');
    } else if (countryName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Country Name is Empty');
    } else if (cityName.text.isEmpty) {
      Fluttertoast.showToast(msg: 'City Name is Empty');
    } else if (mobile.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Mobile No  is Empty');
    } else if (alMobile.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Alternate Mobile No is Empty');
    } else if (roadNo.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Road No is Empty');
    } else if (houseNo.text.isEmpty) {
      Fluttertoast.showToast(msg: 'House No is Empty');
    } else if (pinCode.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Pin code is Empty');
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('addDeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "countryName": countryName.text,
        "cityName": cityName.text,
        "mobile": mobile.text,
        "alMobile": alMobile.text,
        "roadNo": roadNo.text,
        "houseNo": houseNo.text,
        "picCode": pinCode.text,
        "location": location.text,
        "addressType": myType.toString(),
      }).then((value) async {
        isLoading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Add your delivery address");
        Navigator.pop(context);
        notifyListeners();
      });
      notifyListeners();
    }
  }
}

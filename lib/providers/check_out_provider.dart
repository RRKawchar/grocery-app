import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/models/delivery_address_model.dart';
import 'package:location/location.dart';

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
   LocationData? setLocation;

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
    } else if (setLocation==null) {
      Fluttertoast.showToast(msg: 'Location is Empty');
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
        "addressType": myType.toString(),
        'longitude':setLocation!.longitude.toString(),
         "latitude":setLocation!.latitude.toString(),
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


   getDeliveryAddressData()async{
    DeliveryAddressModel deliveryAddressModel;
   DocumentSnapshot _db= await FirebaseFirestore.instance
        .collection('addDeliveryAddress')
        .doc(FirebaseAuth.instance.currentUser!.uid).get();
    if(_db.exists){
      deliveryAddressModel=DeliveryAddressModel(
          firstName: _db.get('firstName'),
          lastName: _db.get('lastName'),
          countryName: _db.get('countryName'),
          cityName: _db.get('cityName'),
          mobile: _db.get('mobile'),
          alMobile: _db.get('alMobile'),
          roadNo: _db.get('roadNo'),
          houseNo: _db.get('houseNo'),
          pinCode: _db.get('picCode'),
          addressType: _db.get('addressType'),
      );
      return deliveryAddressModel;
    }


  }
}

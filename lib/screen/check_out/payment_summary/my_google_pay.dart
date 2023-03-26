// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
// class MyGooglePay extends StatefulWidget {
//   const MyGooglePay({Key? key}) : super(key: key);
//
//   @override
//   State<MyGooglePay> createState() => _MyGooglePayState();
// }
//
// class _MyGooglePayState extends State<MyGooglePay> {
//
//   final _paymentItems = [
//     const PaymentItem(
//       label: 'Total',
//       amount: '99.99',
//       status: PaymentItemStatus.final_price,
//     )
//   ];
//
// // In your Widget build() method
//
//
//
// // In your Stateless Widget class or State
//   void onGooglePayResult(paymentResult) {
//     // Send the resulting Google Pay token to your server or PSP
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GooglePayButton(
//       paymentConfigurationAsset: 'sample_payment_configuration.json',
//       paymentItems: _paymentItems,
//      // style: GooglePayButtonStyle.black,
//       type: GooglePayButtonType.pay,
//       onPaymentResult: onGooglePayResult,
//     );
//   }
// }

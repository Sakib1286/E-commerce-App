// import 'dart:convert';
// import 'package:bkash/bkash.dart';
//
//
//
// void onButtonTap(String selected) async {
//   switch (selected) {
//     case 'bkash':
//       bkashPayment();
//       break;
//
//
//     default:
//       print('No gateway selected');
//   }
// }
//
// double totalPrice = 1.00;
//
//
// bkashPayment() async {
//   final bkash = Bkash(
//     logResponse: true,
//   );
//
//   try {
//     final response = await bkash.pay(
//       ////Error here
//      // context: context!,
//       amount: totalPrice,
//       merchantInvoiceNumber: 'Test0123456',
//     );
//
//     print(response.trxId);
//     print(response.paymentId);
//   } on BkashFailure catch (e) {
//     print(e.message);
//   }
// }

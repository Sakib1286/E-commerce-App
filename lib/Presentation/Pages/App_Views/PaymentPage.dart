// import 'package:flutter/material.dart';
// import 'package:quick_shopping/Presentation/Pages/Payment_Helper/Payment_Helper.dart';
//
// class CheckOut extends StatefulWidget {
//   const CheckOut({super.key});
//
//   @override
//   State<CheckOut> createState() => _CheckOutState();
// }
//
// class _CheckOutState extends State<CheckOut> {
//   String? selected;
//   List<Map> gateways = [
//   {
//   'name': 'Bkash',
//   'logo': 'assets/images/bkash.png',
// },
//     //{
//       //'name': 'Visa Card',
//      // 'logo': 'assets/images/visa.png',
//    // },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Payment",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
//         backgroundColor: Colors.blueGrey,
//         centerTitle: true,
//       ),
//       body: Padding(padding: EdgeInsets.all(15),
//       child: Column(
//         children: [
//           Expanded(
//               child:ListView(
//               children: [
//                 Text("Select Payment Method",style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                 ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ListView.separated(
//                     shrinkWrap: true,
//                     primary: false,
//           itemBuilder: (_,index){
//             return PaymentMethodTile(
//               logo: gateways[index]['logo'],
//               name: gateways[index]['name'],
//               selected: selected ?? '',
//               onTap: () {
//                 selected = gateways[index]['name']
//                     .toString()
//                     .replaceAll(' ', '_')
//                     .toLowerCase();
//                 setState(() {});
//               },
//             );
//             },
//                   separatorBuilder:  (_, index) => const SizedBox(
//                   height: 10,)
//                   ,itemCount: gateways.length,
//
//     )
//
//               ],
//
//               )
//
//           ),
//           InkWell(
//             onTap:  (){
//
//               selected == null ? null : () => onButtonTap(selected ?? '');
//
//             },
//             child: Container(
//             height: 50,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: selected == null
//                     ? Colors.blueGrey.withOpacity(.5)
//                     : Colors.blueGrey,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Center(
//                 child: Text(
//                   'Continue to payment',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//
//           )
//         ],
//       ),
//
//
//       ),
//
//     );
//   }
// }
// class PaymentMethodTile extends StatelessWidget {
//   final String logo;
//   final String name;
//   final Function()? onTap;
//   final String selected;
//
//   const PaymentMethodTile({
//     super.key,
//     required this.logo,
//     required this.name,
//     this.onTap,
//     required this.selected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: selected == name.replaceAll(' ', '_').toLowerCase()
//                 ? Colors.blueGrey
//                 : Colors.black.withOpacity(.1),
//             width: 2,
//           ),
//         ),
//         child: ListTile(
//           leading: Image.asset(
//             logo,
//             height: 35,
//             width: 35,
//           ),
//           title: Text(name),
//         ),
//       ),
//     );
//   }
// }
//

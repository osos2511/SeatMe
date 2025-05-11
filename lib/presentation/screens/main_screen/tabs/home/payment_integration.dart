// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
//
// class PaymentIntegration extends StatefulWidget {
//   const PaymentIntegration({super.key});
//
//   @override
//   _PaymentIntegrationState createState() => _PaymentIntegrationState();
// }
//
// class _PaymentIntegrationState extends State<PaymentIntegration> {
//   CardFieldInputDetails? _card;
//
//   bool _loading = false;
//
//   void _handlePayPress() async {
//     if (_card == null || !_card!.complete) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter complete card details")));
//       return;
//     }
//
//     setState(() {
//       _loading = true;
//     });
//
//     try {
//       // ✅ تنشئ طريقة دفع جديدة باستخدام البيانات
//       final paymentMethod = await Stripe.instance.createPaymentMethod(
//         params: PaymentMethodParams.card(
//           paymentMethodData: PaymentMethodData(),
//         ),
//       );
//
//       // الآن ترسل paymentMethod.id إلى السيرفر لإنشاء PaymentIntent وتأكيده
//       print('PaymentMethod ID: ${paymentMethod.id}');
//
//       // ⬅️ هنا ترسل هذا الـ ID إلى السيرفر الخاص بك
//
//       // بعد تأكيد الدفع من السيرفر يمكنك عرض رسالة نجاح
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment method created!")));
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment failed: $e")));
//     } finally {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stripe Payment")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             CardField(
//               onCardChanged: (card) {
//                 setState(() {
//                   _card = card;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _loading ? null : _handlePayPress,
//               child: _loading ? CircularProgressIndicator() : Text("Pay"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

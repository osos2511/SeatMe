import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/widgets/custom_textForm_field.dart';

class PaymentBottomSheet extends StatefulWidget {

  const PaymentBottomSheet({super.key});

  @override
  _PaymentBottomSheetState createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    cardHolderNameController.dispose();
    super.dispose();
  }

  void _confirmPayment() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment successful!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Payment Information",
                style: GoogleFonts.alexandria(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              CustomTextFormField(
                controller: amountController,
                labelText: "Amount",
                hintText: "Enter amount",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Please enter the amount";
                  if (double.tryParse(value) == null) return "Enter a valid number";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              CustomTextFormField(
                controller: cardNumberController,
                labelText: "Card Number",
                hintText: "1234 5678 9012 3456",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Please enter your card number";
                  if (value.length != 16) return "Card number must be 16 digits";
                  return null;
                },
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: expiryDateController,
                      labelText: "Expiry Date",
                      hintText: "MM/YY",
                      keyboardType: TextInputType.datetime,
                      validator: (value) => value!.isEmpty ? "Enter expiry date" : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormField(
                      controller: cvvController,
                      labelText: "CVV",
                      hintText: "123",
                      keyboardType: TextInputType.number,
                      isSecure: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Enter CVV";
                        if (value.length != 3) return "CVV must be 3 digits";
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: cardHolderNameController,
                labelText: "Cardholder Name",
                hintText: "Enter cardholder name",
                validator: (value) => value!.isEmpty ? "Please enter cardholder's name" : null,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)
                  ),
                  backgroundColor: ColorApp.primaryColor,
                ),
                onPressed: _confirmPayment,
                child: const Text("Confirm Payment", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isLoading = false;
  bool isObscure = true;

  String? getCardTypeImage(String number) {
    if (number.startsWith('4')) return 'assets/visa.png';
    if (number.startsWith('5')) return 'assets/mastercard.png';
    return null;
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void submitPayment() {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment Successful!')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardTypeImage = getCardTypeImage(cardNumberController.text);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Info"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (cardTypeImage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(cardTypeImage, height: 40),
                ),
              TextFormField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                ],
                decoration: const InputDecoration(
                  labelText: "Card Number",
                  prefixIcon: Icon(Icons.credit_card),
                ),
                validator: (value) =>
                    value!.length != 16 ? "Enter 16-digit card number" : null,
                onChanged: (value) => setState(() {}),
              ),
              TextFormField(
                controller: expiryDateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: "Expiry Date (MM/YY)",
                  prefixIcon: Icon(Icons.date_range),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Required";
                  final regex = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$');
                  if (!regex.hasMatch(value)) return "Invalid format";
                  return null;
                },
              ),
              TextFormField(
                controller: cvvController,
                keyboardType: TextInputType.number,
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: "CVV",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () => setState(() => isObscure = !isObscure),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                validator: (value) =>
                    value!.length < 3 ? "Enter valid CVV" : null,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Cardholder Name",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter cardholder name" : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: isLoading ? null : submitPayment,
                icon: isLoading
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.payment),
                label: Text(isLoading ? "Processing..." : "Pay Now"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

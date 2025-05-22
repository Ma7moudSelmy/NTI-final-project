import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Info")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Card Number"),
                validator: (value) => value!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                controller: expiryDateController,
                keyboardType: TextInputType.datetime,
                decoration:
                    const InputDecoration(labelText: "Expiry Date (MM/YY)"),
                validator: (value) => value!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                controller: cvvController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "CVV"),
                validator: (value) => value!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

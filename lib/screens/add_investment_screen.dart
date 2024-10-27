import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment/controller/investment_controller.dart';
import 'package:investment/model/investment.dart';

class AddInvestmentScreen extends StatelessWidget {
  final InvestmentController controller = Get.find();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final currentValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Investment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Investment Name'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount Invested (USD)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: currentValueController,
              decoration: InputDecoration(labelText: 'Current Value (USD)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final amount = double.tryParse(amountController.text) ?? 0;
                final currentValue = double.tryParse(currentValueController.text) ?? 0;

                if (name.isNotEmpty && amount > 0 && currentValue > 0) {
                  final newInvestment = Investment(
                    name: name,
                    amountInvested: amount,
                    currentValue: currentValue,
                  );
                  controller.addInvestment(newInvestment);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Please fill in all fields with valid values');
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

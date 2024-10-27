import 'package:flutter/material.dart';
import 'package:investment/model/investment.dart';

class InvestmentDetailsScreen extends StatelessWidget {
  final Investment investment;

  InvestmentDetailsScreen({required this.investment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(investment.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Investment Name: ${investment.name}', style: TextStyle(fontSize: 18)),
            Text('Amount Invested: \$${investment.amountInvested}', style: TextStyle(fontSize: 18)),
            Text('Current Value: \$${investment.currentValue}', style: TextStyle(fontSize: 18)),
            Text(
              'Percentage Growth: ${investment.percentageGrowth.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:investment/model/investment.dart';

class InvestmentTile extends StatelessWidget {
  final Investment investment;
  final VoidCallback onTap;

  const InvestmentTile({required this.investment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        onTap: onTap,
        title: Text(
          investment.name,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        subtitle: Text(
          'Invested: \$${investment.amountInvested.toStringAsFixed(2)}\n'
              'Current: \$${investment.currentValue.toStringAsFixed(2)}',
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.tealAccent),
      ),
    );
  }
}

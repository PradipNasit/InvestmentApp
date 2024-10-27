import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment/controller/investment_controller.dart';
import 'add_investment_screen.dart';
import 'investment_details_screen.dart';
import '../widgets/investment_tile.dart';
import '../widgets/investment_pie_chart.dart';

class HomeScreen extends StatelessWidget {
  final InvestmentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investments', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Obx(() {
              if (controller.investments.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No investments added yet.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                );
              } else {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 4)),
                    ],
                  ),
                  child: SizedBox(
                    height: 260,
                    child: InvestmentPieChart(data: controller.chartData),
                  ),
                );
              }
            }),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.investments.length,
                  itemBuilder: (context, index) {
                    final investment = controller.investments[index];
                    return InvestmentTile(
                      investment: investment,
                      onTap: () => Get.to(() => InvestmentDetailsScreen(investment: investment)),
                    );
                  },
                ),
              ),
            ),
            Obx(
                  () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Total Portfolio Value: \$${controller.totalPortfolioValue.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.tealAccent),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 28),
        onPressed: () => Get.to(() => AddInvestmentScreen()),
      ),
    );
  }
}

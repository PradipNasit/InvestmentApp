import 'package:get/get.dart';
import 'package:investment/model/investment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class InvestmentController extends GetxController {
  var investments = <Investment>[].obs;

  double get totalPortfolioValue => investments.fold(0, (sum, item) => sum + item.currentValue);

  List<Map<String, dynamic>> get chartData {
    return investments.map((investment) {
      return {
        'name': investment.name,
        'value': investment.currentValue,
        'percentage': (investment.currentValue / totalPortfolioValue) * 100
      };
    }).toList();
  }

  Future<void> loadInvestments() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedData = prefs.getString('investments');
    if (savedData != null) {
      investments.value = List<Investment>.from(
        json.decode(savedData).map((data) => Investment.fromJson(data)),
      );
    }
  }

  Future<void> saveInvestments() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('investments', json.encode(investments.map((i) => i.toJson()).toList()));
  }

  void addInvestment(Investment investment) {
    investments.add(investment);
    saveInvestments();
  }
}

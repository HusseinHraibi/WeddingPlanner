
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BudgetCalculator()));
}

class BudgetCalculator extends StatefulWidget {
  const BudgetCalculator({super.key});

  @override
  State<BudgetCalculator> createState() => _BudgetCalculatorState();
}

class _BudgetCalculatorState extends State<BudgetCalculator> {
  final budget = TextEditingController();
  final expenses = TextEditingController();

  int remaining = 0;

  @override
  void dispose() {
    budget.dispose();
    expenses.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wedding Budget Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: budget,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Budget'),
            ),
            TextField(
              controller: expenses,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Expenses'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  remaining = (int.tryParse(budget.text) ?? 0) -
                      (int.tryParse(expenses.text) ?? 0);
                });
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text('Remaining Budget: $remaining'),
          ],
        ),
      ),
    );
  }
}

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'The flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.44,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      // make the modal full-screen so the pop-up keyboard doesn't overlap the modal
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(
      () {
        _registeredExpenses.add(expense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('chart data'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
          // using a ListView inside a column cause a problem, that's why we need the 'Expanded' widget here
        ],
      ),
    );
  }
}

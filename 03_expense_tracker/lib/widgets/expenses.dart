import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart.dart';
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
      // make sure our ui does not overlap with device's features like camera, sensors, etc...
      useSafeArea: true,
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

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(
      () {
        _registeredExpenses.remove(expense);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    // clear previews snackBars before showing a new one
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense deleted.'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // to know if our device is in landscape mode or not, so we can change the ui to be more responsive
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
                // using a ListView inside a column cause a problem, that's why we need the 'Expanded' widget here
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}

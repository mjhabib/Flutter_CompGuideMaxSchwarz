import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';

import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    // this ListView will help us to build as much as data we need on screen, therefore if we have thousands of data, it'll save us a lot of recourses because it does not need to create the whole list at once.
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
            // this unique key will help flutter to identify the selected card in ListView to be dismissed
            key: ValueKey(expenses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
            ),
            onDismissed: (direction) => onRemoveExpense(expenses[index]),
            child: ExpenseItem(expense: expenses[index]));
      },
      itemCount: expenses.length,
    );
  }
}

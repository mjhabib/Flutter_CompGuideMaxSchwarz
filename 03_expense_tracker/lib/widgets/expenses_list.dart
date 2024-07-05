import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';

import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    // this ListView will help us to build as much as data we need on screen, therefore if we have thousands of data, it'll save us a lot of recourses because it does not need to create the whole list at once.
    return ListView.builder(
      itemBuilder: (context, index) {
        return ExpenseItem(expense: expenses[index]);
      },
      itemCount: expenses.length,
    );
  }
}

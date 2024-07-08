import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, leisure, travel, work }
// the 'enum' keyword creates a new type (Category) which only accept the values defined between '{}'

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  // the ':' syntax will initialize the 'id' property when this class is called and will assign a unique id to it with the help of uuid package

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket({required this.category, required this.expenses});

  // Extra constructor function
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where(
              (expense) => expense.category == category,
            )
            .toList();

  double get totalExpenses {
    double sum = 0;

    for (var expense in expenses) {
      sum += expense.amount;
      // sum = sum + expense.amount;
    }

    return sum;
  }
}

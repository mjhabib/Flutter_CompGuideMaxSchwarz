import 'package:flutter/material.dart';

import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense({super.key, required this.onAddExpense});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
// Manually save user's input data in a variable
// var _title = '';
// void _saveInputTitle(String inputValue) {
//   _title = inputValue;
// }

// Flutter's built-in class approach to save user's data
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      // ).then((onValue){});
      // instead of this chained .then method, we can use the async await to save the value
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseDate() {
    // convert the 'string amount value' to 'double' if can, if not return 'null'
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Invalid input'),
            content: const Text(
                'Please make sure you entered a valid title/amount/date/category!'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Okay'))
            ],
          );
        },
      );
      return;
      // this return is because we don't wanna continue to execute other lines of code like storing any data, if we have any error
    }
    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // to know how much space our keyboard occupies in our app, so we can fix that if keyboard takes too much space
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                // the syntax of this if statement has no {} inside this widget!
                if (width >= 600)
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        maxLength: 50,
                        decoration: const InputDecoration(label: Text('Title')),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            label: Text('Amount'), prefixText: '\$ '),
                      ),
                    ),
                  ])
                // else: if we don't have enough space
                else
                  TextField(
                    controller: _titleController,
                    // onChanged: _saveInputTitle,
                    maxLength: 50,
                    decoration: const InputDecoration(label: Text('Title')),
                  ),
                if (width >= 600)
                  Row(children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values.map(
                          (category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase()),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                          // print(value);
                        }),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null
                              ? 'No date selected'
                              : formatter.format(_selectedDate!)),
                          IconButton(
                            onPressed: _datePicker,
                            icon: const Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),
                  ])
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // TextField within Row will cause problem that's why we need the Expanded widget
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Amount'), prefixText: '\$ '),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        // Row within Row will cause problem that's why we need the Expanded widget
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate == null
                                ? 'No date selected'
                                : formatter.format(_selectedDate!)),
                            IconButton(
                              onPressed: _datePicker,
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                if (width >= 600)
                  Row(children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                        onPressed: _submitExpenseDate,
                        child: const Text('Save Expense'))
                  ])
                else
                  Row(
                    children: [
                      // we use 'map' here to to solve the error "type 'List<Category>' can't be assigned to the parameter type 'List<DropdownMenuItem<Object>>?'"
                      DropdownButton(
                          value: _selectedCategory,
                          items: Category.values.map(
                            (category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase()),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                            // print(value);
                          }),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                          onPressed: _submitExpenseDate,
                          // () {
                          // print(_titleController.text);
                          // print(_amountController.text);
                          // print(_title);
                          // },
                          child: const Text('Save Expense'))
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  String category;
  double amount;
  String memo;

  Transaction({
    required this.category,
    required this.amount,
    required this.memo,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionPage(),
    );
  }
}

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  String selectedCategory = 'Expense'; // Default to 'Expense'

  List<Transaction> transactions = [];

  void addTransaction() {
    if (categoryController.text.isNotEmpty && amountController.text.isNotEmpty) {
      double amount = double.parse(amountController.text);
      String memo = memoController.text;
      transactions.add(Transaction(category: selectedCategory, amount: amount, memo: memo));

      // Clear the input fields
      categoryController.clear();
      amountController.clear();
      memoController.clear();

      // Optionally, you can add logic to save transactions to persistent storage.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: ['Expense', 'Income'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextField(
              controller: memoController,
              decoration: InputDecoration(labelText: 'Memo (optional)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){
                setState(() {
                 addTransaction();  
                });
              },
              child: Text('Add Transaction'),
            ),
            SizedBox(height: 16),
            Text('Transactions:'),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Category: ${transactions[index].category}'),
                    subtitle: Text('Amount: \$${transactions[index].amount.toString()}'),
                    trailing: Text('Memo: ${transactions[index].memo}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

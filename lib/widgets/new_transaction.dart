import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          padding: EdgeInsets.all(10),
        ),
        Container(
          child: TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          padding: EdgeInsets.all(10),
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () => newTransactionHandler(
            titleController.text,
            double.parse(amountController.text),
          ),
        ),
      ],
    );
  }
}

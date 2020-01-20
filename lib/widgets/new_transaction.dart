import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransactionHandler;

  NewTransaction(this.newTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _datePicked;

  void _submitData() {
    var enteredTitle = _titleController.text;
    var enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _datePicked == null)
      return;

    widget.newTransactionHandler(enteredTitle, enteredAmount, _datePicked);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _datePicked = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          Container(
            height: 80,
            child: Row(
              children: <Widget>[
                _datePicked == null
                    ? Text('No date chosen')
                    : Text(DateFormat.yMd().format(_datePicked)),
                FlatButton(
                  child: Text('Choose Date'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _showDatePicker,
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text('Add'),
            textColor: Theme.of(context).textTheme.button.color,
            color: Theme.of(context).primaryColor,
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}

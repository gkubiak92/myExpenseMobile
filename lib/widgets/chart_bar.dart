import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            child: Text(
              '€${spendingAmount.toStringAsFixed(0)}',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 20,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.15,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}

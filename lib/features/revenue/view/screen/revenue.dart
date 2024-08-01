import 'package:flutter/material.dart';



class RevenuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilterButton(text: 'Day'),
              FilterButton(text: 'Week'),
              FilterButton(text: 'Month'),
              FilterButton(text: 'Year', isSelected: true),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 120,
                height: 40,
                child: Row(
                  children: [
                    Text(
                      'Expense',
                      // (
                      //   color: Colors.grey,
                      //   fontSize: 16,
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                    Icon(Icons.arrow_downward_sharp),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: SimpleBarChart(),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  FilterButton({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey,
      ),
      child: Text(text),
    );
  }
}
import 'package:flutter/material.dart';

class RevenuePage extends StatefulWidget {
  @override
  _RevenuePageState createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Mobiles', 'imagePath': 'Assets/images/mobile.png', 'quantity': 50, 'amount': 20000},
    {'name': 'Tablets', 'imagePath': 'Assets/images/tablet.png', 'quantity': 30, 'amount': 15000},
    {'name': 'Smart Watches', 'imagePath': 'Assets/images/smartwatch.png', 'quantity': 20, 'amount': 10000},
    {'name': 'Accessories', 'imagePath': 'Assets/images/accessories.png', 'quantity': 50, 'amount': 5000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revenue Page'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Date:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    DateTimeRange? pickedDateRange = await showDateRangePicker(
                      context: context,
                      initialDateRange: DateTimeRange(start: _startDate, end: _endDate),
                      firstDate: DateTime(2020, 1, 1),
                      lastDate: DateTime(2030, 12, 31),
                    );
                    if (pickedDateRange != null) {
                      setState(() {
                        _startDate = pickedDateRange.start;
                        _endDate = pickedDateRange.end;
                      });
                    }
                  },
                  child: Text(
                    '${_startDate.toLocal().toIso8601String().split('T')[0]} - ${_endDate.toLocal().toIso8601String().split('T')[0]}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: buildInfoCard('Total Revenue', '₹ 50,000', Colors.green)),
                SizedBox(width: 15),
                Expanded(child: buildInfoCard('Total Products', '150', Colors.blue)),
              ],
            ),
            SizedBox(height: 20),
           
            Expanded(
              child: ListView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return buildCategoryCard(
                    category['name'],
                    category['imagePath'],
                    category['quantity'],
                    category['amount'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryCard(String name, String imagePath, int quantity, int amount) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Qty: $quantity',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        'Amount: ₹$amount',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

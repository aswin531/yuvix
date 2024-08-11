
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/core/constants/color.dart';
import 'package:yuvix/features/revenue/view/widget/rev.dart';
import 'package:yuvix/features/salespage/controller/sales_service.dart';
import 'package:yuvix/features/salespage/model/sales_model.dart';


class RevenuePage extends StatefulWidget {
  @override
  _RevenuePageState createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  int _totalProducts = 0;
  double _totalRevenue = 0.0;
  List<Map<String, dynamic>> _categories = [];

  @override
  void initState() {
    super.initState();
    _calculateTotals();
  }

  void _calculateTotals() {
    final salesProvider = Provider.of<SalesProvider>(context, listen: false);
    final sales = salesProvider.getFilteredSales(_startDate, _endDate);

    setState(() {
      _totalProducts = salesProvider.getTotalQuantity(sales);
      _totalRevenue = salesProvider.getTotalAmount(sales);
      _categories = _generateCategoryData(sales);
    });
  }

  List<Map<String, dynamic>> _generateCategoryData(List<SalesModel> sales) {
    // Assuming this is a sample data generator
    return [
      {'name': 'Mobiles', 'imagePath': 'Assets/images/mobile.png', 'quantity': 50, 'amount': 20000},
      {'name': 'Tablets', 'imagePath': 'Assets/images/tablet.png', 'quantity': 30, 'amount': 15000},
      {'name': 'Smart Watches', 'imagePath': 'Assets/images/smartwatch.png', 'quantity': 20, 'amount': 10000},
      {'name': 'Accessories', 'imagePath': 'Assets/images/accessories.png', 'quantity': 50, 'amount': 5000},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revenue Page'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: ConstC.getColor(AppColor.textC1), fontSize: 23),
        backgroundColor: ConstC.getColor(AppColor.background1),
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ConstC.getColor(AppColor.textC2),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstC.getColor(AppColor.background1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    DateTimeRange? pickedDateRange = await showDateRangePicker(
                      context: context,
                      initialDateRange:
                          DateTimeRange(start: _startDate, end: _endDate),
                      firstDate: DateTime(2020, 1, 1),
                      lastDate: DateTime(2030, 12, 31),
                    );
                    if (pickedDateRange != null) {
                      setState(() {
                        _startDate = pickedDateRange.start;
                        _endDate = pickedDateRange.end;
                      });
                      _calculateTotals();
                    }
                  },
                  child: Text(
                    '${_startDate.toLocal().toIso8601String().split('T')[0]} - ${_endDate.toLocal().toIso8601String().split('T')[0]}',
                    style: TextStyle(fontSize: 16, color: ConstC.getColor(AppColor.textC1)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: RevenueWidgets.buildInfoCard(
                    'Total Revenue',
                    '₹$_totalRevenue',
                    Colors.green,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: RevenueWidgets.buildInfoCard(
                    'Total Products',
                    '$_totalProducts',
                    Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  return RevenueWidgets.buildCategoryCard(
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
}

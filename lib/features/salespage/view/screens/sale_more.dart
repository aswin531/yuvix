
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:yuvix/features/salespage/controller/sales_service.dart';
import '../widget/sale_card.dart';

class SalesMore extends StatefulWidget {
  const SalesMore({Key? key}) : super(key: key);

  @override
  _SalesMoreState createState() => _SalesMoreState();
}

class _SalesMoreState extends State<SalesMore> {
  DateTime selectedDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    String formattedToday = formatter.format(selectedDate);
    String formattedYesterday = formatter.format(selectedDate.subtract(Duration(days: 1)));
    String formattedStartDate = startDate != null ? formatter.format(startDate!) : 'Start Date';
    String formattedEndDate = endDate != null ? formatter.format(endDate!) : 'End Date';

    return Scaffold(
      appBar: AppBar(
        title: Text("Sales More"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      startDate = selectedDate.subtract(Duration(days: 1));
                      endDate = selectedDate.subtract(Duration(days: 1));
                    });
                  },
                  child: Text(
                    formattedYesterday,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      startDate = selectedDate;
                      endDate = selectedDate;
                    });
                  },
                  child: Text(
                    formattedToday,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: startDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          startDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        formattedStartDate,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: endDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          endDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        formattedEndDate,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<SalesProvider>(
              builder: (context, salesProvider, child) {
                final allSales = salesProvider.getAllSales();
                final filteredSales = (startDate != null && endDate != null)
                    ? allSales.where((sale) {
                        DateTime saleDate = DateTime.parse(sale['date']);
                        return saleDate.isAfter(startDate!.subtract(Duration(days: 1))) &&
                            saleDate.isBefore(endDate!.add(Duration(days: 1)));
                      }).toList()
                    : [];

                if (filteredSales.isEmpty) {
                  return Center(child: Text('Please select a date'));
                }

                return ListView.builder(
                  itemCount: filteredSales.length,
                  itemBuilder: (context, index) {
                    final sale = filteredSales[index];
                    final salesList = sale['salesList'] as List<dynamic>;

                    Map<String, int> productQuantities = {};
                    double totalAmount = sale['totalAmount'];

                    salesList.forEach((product) {
                      final productName = product['productName'];
                      final productQuantity = product['quantity'] as int;

                      if (productQuantities.containsKey(productName)) {
                        productQuantities[productName] =
                            productQuantities[productName]! + productQuantity;
                      } else {
                        productQuantities[productName] = productQuantity;
                      }
                    });

                    return SalesCard(
                      buyerName: sale['customerName'],
                      mobileNumber: sale['mobileNumber'],
                      totalAmount: totalAmount,
                      productQuantities: productQuantities,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

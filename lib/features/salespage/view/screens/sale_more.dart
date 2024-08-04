import 'package:flutter/material.dart';


class SalesMore extends StatelessWidget {
  const SalesMore({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
  // final List<SalesCard> salesCards = [
  //   SalesCard(
  //     buyerName: "Alice",
  //     productName: "Smartphone",
  //     price: "\$799",
  //     date: "2024-07-24",
  //   ),
  //   SalesCard(
  //     buyerName: "Bob",
  //     productName: "Tablet",
  //     price: "\$399",
  //     date: "2024-07-23",
  //   ),
  //   SalesCard(
  //     buyerName: "Charlie",
  //     productName: "Smartwatch",
  //     price: "\$199",
  //     date: "2024-07-22",
  //   ),
  // ];

  // DateTime selectedDate = DateTime.now();
  // final DateFormat formatter = DateFormat('yyyy-MM-dd');

  // @override
  // Widget build(BuildContext context) {
  //   String formattedToday = formatter.format(selectedDate);
  //   String formattedYesterday = formatter.format(selectedDate.subtract(Duration(days: 1)));

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Sales More"),
  //     ),
  //     body: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(formattedYesterday, style: TextStyle(fontSize: 16)),
  //               Row(
  //                 children: [
  //                   Text(
  //                     formattedToday,
  //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                   ),
  //                   SizedBox(width: 5),
  //                   IconButton(
  //                     icon: Icon(Icons.calendar_today, size: 18),
  //                     onPressed: () async {
  //                       DateTime? pickedDate = await showDatePicker(
  //                         context: context,
  //                         initialDate: selectedDate,
  //                         firstDate: DateTime(2000),
  //                         lastDate: DateTime(2101),
  //                       );
  //                       if (pickedDate != null && pickedDate != selectedDate) {
  //                         setState(() {
  //                           selectedDate = pickedDate;
  //                         });
  //                       }
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //           child: ListView.builder(
  //             itemCount: salesCards.length,
  //             itemBuilder: (context, index) {
  //               return salesCards[index];
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
    // );
   



import 'package:flutter/material.dart';
import 'package:yuvix/features/salespage/view/screens/sales_add_sheet.dart';
import 'package:yuvix/features/salespage/view/widget/sales_content.dart';
import '../../../../core/constants/color.dart';


class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstC.getColor(AppColor.appBar),
        title: Text(
          'Sales Page',
          style: TextStyle(color: ConstC.getColor(AppColor.textC1), fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: SalesPageContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SalesAddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: ConstC.getColor(AppColor.background1),
      ),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/category_Service.dart';
import 'package:yuvix/features/inventory/view/widgets/catogary/category_card.dart';



class CategoryGridView extends StatelessWidget {
  
  CategoryGridView({super.key,});

     

  @override
  Widget build(BuildContext context) {
     final categoryService = Provider.of<CategoryService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future:  categoryService.getCategories(), 
        builder: (context , snapshot){
          if(snapshot.hasError || snapshot.data == null){
            return Center(
              child: Text('no data found!!!'),
            );
          }
          return 
          GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
             final cat = snapshot.data![index];
            return CatCard(cat:cat );
          },
        );
        },
      
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter Options'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FilterOption(title: 'Price', options: ['Under ₹15,000', '₹15,000 - ₹30,000', '₹30,000 - ₹60,000','Above ₹60,000',]),
                FilterOption(title: 'RAM', options: ['2 GB', '3 GB', '4 GB' ,'8 GB' ,'12 GB' ,'16 GB']),
                FilterOption(title: 'Color', options: ['Black', 'Blue', 'Red', 'Green','White','Purple','Silver']),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Apply'),
              onPressed: () {
                Navigator.of(context).pop();
                // Apply the filters here if needed
              },
            ),
          ],
        );
      },
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;
  final List<String> options;

  FilterOption({required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: options.map((option) {
        return CheckboxListTile(
          title: Text(option),
          value: false, // Replace with actual state management
          onChanged: (bool? value) {
            // Update state here
          },
        );
      }).toList(),
    );
  }
}


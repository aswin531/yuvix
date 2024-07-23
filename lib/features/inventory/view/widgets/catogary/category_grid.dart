
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/category_Service.dart';


import '../../../models/category_model.dart';
import 'category_card.dart';



class CategoryGridView extends StatelessWidget {
  final List<CategoryModel> categories;
   CategoryGridView({super.key, required this.categories});
 
 
  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body:FutureBuilder(
        future: categoryService.getCategories() ,
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
             final category = snapshot.data![index];
            return CatCard(cat: category);
          },
        );
        },
      
      ),
    );
  }
}



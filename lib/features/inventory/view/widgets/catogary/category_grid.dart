
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/inventory/controller/category_Service.dart';
import 'package:yuvix/features/inventory/view/widgets/catogary/category_card.dart';


class CategoryGridView extends StatelessWidget {
  CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder(
        future: categoryService.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return Center(child: Text('No data found!'));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final cat = snapshot.data![index];
              return CatCard(cat: cat);
            },
          );
        },
      ),
    );
  }

}
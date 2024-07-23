  

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../controller/category_Service.dart';
import '../../../models/category_model.dart';


class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController categoryNameController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> addCategory() async {
    if (categoryNameController.text.isEmpty || _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide a category name and select an image.')),
      );
      return;
    }
    final newCategory = CategoryModel(
      categoryId: DateTime.now().millisecondsSinceEpoch,
      categoryName: categoryNameController.text,
      image: _image!.path,
    );

    await Provider.of<CategoryService>(context, listen: false).addCategory(newCategory, _image!.path);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Category Added')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: categoryNameController,
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: getImage,
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? Center(
                          child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                        )
                      : Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                   ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      fixedSize: Size(100, 50), 
                    ),
                  ),
                  ElevatedButton(
                    onPressed: addCategory,
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      fixedSize: Size(100, 50), 
                    ),
                  ),
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



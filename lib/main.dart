import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/core/theme/theme.dart';
import 'package:yuvix/features/profile/model/profilemodel.dart';
import 'package:yuvix/features/splash/splash.dart';
import 'package:yuvix/features/profile/view/screens/login.dart';
import 'package:yuvix/features/profile/controller/auth_services.dart';
import 'package:yuvix/features/inventory/controller/brand_services.dart';
import 'package:yuvix/features/inventory/controller/category_Service.dart';

import 'features/inventory/controller/product_services.dart';
import 'features/homepage/widgets/bottom_nav.dart';
import 'features/inventory/models/brand_model.dart';

import 'features/inventory/models/category_model.dart';
import 'features/inventory/models/product_model.dart';
import 'features/profile/controller/profile_service.dart';
import 'features/profile/model/usermodel.dart';

late final catBox;
late final brandbox;
late final productbox;
late final _profilebox;
void main() async {
  // WidgetsFlutterBinding().ensureInitialzed();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(BrandModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());


  AuthService authService = AuthService();
  await authService.openBox();
  catBox = await Hive.openBox<CategoryModel>('categoryBox');
  brandbox= await Hive.openBox<BrandModel>('brandBox');
  productbox= await Hive.openBox<ProductModel>('productBox');
  _profilebox= await Hive.openBox<ProfileModel>('profileBox');
  

  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => authService),
      ChangeNotifierProvider(create: (_) => CategoryService()),
      ChangeNotifierProvider(create: (_) => BrandService()),
      ChangeNotifierProvider(create: (_) => ProductService()),
      ChangeNotifierProvider(create: (_) => ProfileService()),
    ],
    child: const YuvixApp(),
  ));
}


class YuvixApp extends StatelessWidget {
  const YuvixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: appTextTheme,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'login': (context) => const LoginScreen(),
        'BottomNav': (context) =>  BottomNav(),
      },
    );
  }
}

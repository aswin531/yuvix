import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuvix/features/profile/controller/auth_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    checkLoginState();
    super.initState();
  }
  Future<void>checkLoginState()async{
    await Future.delayed(const Duration(seconds: 3));
    final authService=Provider.of<AuthService>(context,listen:false);
    final isLoggedIn=await authService.isUserLoggedIn();
    if(isLoggedIn){
       Navigator.pushNamedAndRemoveUntil(context, 'BottomNav',(route) => false);
    }else{
       Navigator.pushReplacementNamed(context,'login');
                                      
                                      
                                       
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      
   body:Container(
    
    height: double.infinity,
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('Assets/images/logo.png',height: 500,width: 500,)
        
      ],
    ),
   )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:try_again/bloc_observer.dart';
import 'package:try_again/view/screens/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ));
  }
}

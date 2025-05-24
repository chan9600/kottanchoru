import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kottanchoru/common_widget/provider.dart';
import 'package:kottanchoru/firebase_options.dart';
import 'package:kottanchoru/page_view/maintap_bar/maintap_bar.dart';
import 'package:kottanchoru/page_view/on_boarding/welcome.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //SharedPreference Save data
  @override
  Widget build(BuildContext context) {
    Future<void> checker() async {
      final SharedPreferences preference =
          await SharedPreferences.getInstance();
      bool? newUser = preference.getBool("newUser");
      if (newUser == false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MainTapBar()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Welcome()));
      }
    }

    @override
    void initState() {
      // TODO: implement initState

      checker();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumbersListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kottanchoru Food Delivery',
        theme: ThemeData(fontFamily: 'metropolis'),
        home: const Welcome(),
      ),
    );
  }
}

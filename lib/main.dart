import 'package:cash_leaf/components/fade_indexed_stack.dart';
import 'package:cash_leaf/pages/home_page.dart';
import 'package:cash_leaf/pages/transactions_page.dart';
import 'package:cash_leaf/storage/account/account_model.dart';
import 'package:cash_leaf/storage/app.dart';
import 'package:cash_leaf/storage/storage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();
  await preferenceBox.loadPrefs();

  await preferenceBox.setCurrencySuffix("රු");

  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) => AccountModel(),
          child: const MyApp(),
        );
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cash Leaf',
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
                elevation: 0, backgroundColor: Colors.transparent),
            toggleableActiveColor: const Color(0xff27AE61),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xff26a35a),
              secondary: const Color(0xff26a35a),
            )),
        home: const HomeRoute());
  }
}

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Transactions",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Money"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: activeIndex,
        onTap: (index) {
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
          setTab(index);
        });
  }

  Widget getBody() {
    return FadeIndexedStack(index: activeIndex, children: const [
      HomePage(),
      TransactionsPage(),
      Text("Budget"),
      Text("Account"),
    ]);
  }

  setTab(index) {
    setState(() {
      activeIndex = index;
    });
  }
}

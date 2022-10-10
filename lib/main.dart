import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'constant/service_constant.dart';
import 'constant/string_constant.dart';
import 'screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ServiceConstants.stripeAPIkey;
  Stripe.merchantIdentifier = ServiceConstants.merchantIdentifier;
  Stripe.urlScheme = ServiceConstants.urlScheme;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: StringConstant.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue, dividerColor: Colors.transparent),
        home: const SplashScreen());
  }
}

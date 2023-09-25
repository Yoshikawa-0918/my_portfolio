import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:my_portfolio/app.dart';
import 'package:my_portfolio/keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  setUrlStrategy(PathUrlStrategy());
  runApp(
    const ProviderScope(child: App()),
  );
}

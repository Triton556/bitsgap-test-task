import 'package:bitsgap/src/features/authentification/application/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthStore _autStore = AuthStore();
  _autStore.checkAuth();
  runApp(
    Provider(
      create: (context) {
        return _autStore;
      },
      child: MyApp(),
    ),
  );
}

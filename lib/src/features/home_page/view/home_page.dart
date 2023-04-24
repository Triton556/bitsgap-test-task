import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentification/application/auth_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthStore _authStore = Provider.of<AuthStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bitsgap'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_authStore.user),
            ElevatedButton(
              onPressed: () => _authStore.signOut(context),
              child: Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}

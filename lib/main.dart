import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morelia_client_flutter/modules/database/db.dart';
import 'package:morelia_client_flutter/modules/router.dart';

void main() async {
  DatabaseHandler().connect();
  runApp(const MoreliaApp());
}

class MoreliaApp extends StatelessWidget {
  const MoreliaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ProviderScope(child: MoreliaRouter());
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:github_search/app.dart';
import 'package:github_search/data/local/objectbox.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  runApp(const ProviderScope(child: GitHubSearch()));
}

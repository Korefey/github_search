import 'package:flutter/material.dart';
import 'package:github_search/config/router.dart';

class GitHubSearch extends StatelessWidget {
  const GitHubSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

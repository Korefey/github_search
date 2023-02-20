import 'package:flutter/material.dart';
import 'package:github_search/config/app_color.dart';
import 'package:github_search/config/app_text_style.dart';
import 'package:github_search/domain/state/repo_list_provider.dart';
import 'package:github_search/presentation/widgets/favorite_list.dart';
import 'package:github_search/presentation/widgets/repo_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Github data',
              style: AppTextStyles.caption3(color: AppColors.white),
            ),
            centerTitle: true,
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            RepoList(),
            FavoriteList(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.orange,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        ref.read(repoListProvider.notifier).fetchRepoList(page: '0', perPage: '30');
      }
    });
  }
}

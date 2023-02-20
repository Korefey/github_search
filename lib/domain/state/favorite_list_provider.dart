import 'package:flutter/foundation.dart';
import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/domain/state/repository_local_module_provider.dart';
import 'package:github_search/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteListProvider = StateNotifierProvider<FavoriteListNotifier, List<Repo>>((ref) {
  return FavoriteListNotifier(ref, []);
});

class FavoriteListNotifier extends StateNotifier<List<Repo>> {
  final Ref ref;

  FavoriteListNotifier(this.ref, super.state);

  void removeItemFromFavoriteList(int repoId) async {
    try {
      final repositoryLocalModule = ref.watch(repositoryLocalModuleProvider);
      repositoryLocalModule.removeItemFromLocalDb(repoId);
    } catch (e) {
      if (kDebugMode) {
        print('ERROR in removing favorite ');
      }
    }
  }

  bool getFavoriteStatus(int repoId) {
    return objectbox.findRepoDb(repoId);
  }
}

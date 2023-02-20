import 'package:flutter/foundation.dart';
import 'package:github_search/domain/model/repo_list.dart';
import 'package:github_search/domain/state/repo_list_module_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final repoListProvider = StateNotifierProvider<RepoListNotifier, AsyncValue<RepoList>>((ref) {
  return RepoListNotifier(ref, const AsyncLoading());
});

class RepoListNotifier extends StateNotifier<AsyncValue<RepoList>> {
  final Ref ref;

  RepoListNotifier(this.ref, super.state);

  Future<void> fetchRepoList({String page = '0', String perPage = '30'}) async {
    try {
      state = const AsyncLoading();
      final repositoryModule = ref.watch(repoListModuleProvider);
      state = await repositoryModule.getRepoList(page: page, perPage: perPage);
    } catch (e, st) {
      if (kDebugMode) {
        print('ERROR in fetching github data $e  $st');
      }
    }
  }
}

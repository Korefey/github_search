import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/domain/state/repo_list_provider.dart';
import 'package:github_search/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteProvider = StateNotifierProvider.autoDispose.family<FavoriteNotifier, bool, int>(
  (ref, id) {
    return FavoriteNotifier(ref, id, false);
  },
);

class FavoriteNotifier extends StateNotifier<bool> {
  final Ref ref;

  FavoriteNotifier(this.ref, int id, super.state) {
    state = objectbox.findRepoDb(id);
  }

  void favoriteStatusChange(Repo repo) {
    var repoList = ref.read(repoListProvider);
    repoList.whenOrNull(data: (repoList) {
      if (getFavoriteStatus(repo.id)) {
        objectbox.removeRepoDb(repo.id);
        state = false;
      } else {
        objectbox.addRepoDb(
          repo.id,
          repo.name,
          repo.owner,
          repo.description,
          repo.htmlUrl,
          repo.watchersCount,
          repo.language,
        );
        state = true;
      }
    });
  }

  bool getFavoriteStatus(int repoId) {
    return objectbox.findRepoDb(repoId);
  }
}

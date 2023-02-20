import 'package:github_search/data/local/model/repo_db.dart';
import 'package:github_search/data/mapper/repo_list_local_mapper.dart';
import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/main.dart';

class RepoLocalService {
  Stream<List<Repo>> getRepoList() {
    Stream<List<RepoDb>> response = objectbox.getRepoDb();
    return RepoListLocalMapper.fromLocalStorage(response);
  }

  void removeItemFromFavoriteList(int repoId) {
    objectbox.removeRepoDb(repoId);
  }
}

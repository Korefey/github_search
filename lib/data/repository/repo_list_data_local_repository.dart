import 'package:github_search/data/local/api_local_util.dart';
import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/domain/repository/repo_list_local_repository.dart';

class RepoListDataLocalRepository extends RepoListLocalRepository {
  final ApiLocalUtil _apiLocalUtil;

  RepoListDataLocalRepository(this._apiLocalUtil);

  @override
  Stream<List<Repo>> getStreamRepoList() {
    return _apiLocalUtil.getRepoList();
  }

  @override
  void removeItemFromLocalDb(int repoId) {
    _apiLocalUtil.removeItemFromFavoriteList(repoId);
  }
}

import 'package:github_search/data/local/service/repo_local_service.dart';
import 'package:github_search/domain/model/repo.dart';

class ApiLocalUtil {
  final RepoLocalService _repoLocalService;

  ApiLocalUtil(this._repoLocalService);

  Stream<List<Repo>> getRepoList() {
    final result = _repoLocalService.getRepoList();
    return result;
  }

  void removeItemFromFavoriteList(int repoId) {
    _repoLocalService.removeItemFromFavoriteList(repoId);
  }
}

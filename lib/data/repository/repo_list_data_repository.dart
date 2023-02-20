import 'package:github_search/data/api/api_util.dart';
import 'package:github_search/domain/model/repo_list.dart';
import 'package:github_search/domain/repository/repo_list_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepoListDataRepository extends RepoListRepository {
  final ApiUtil _apiUtil;

  RepoListDataRepository(this._apiUtil);

  @override
  Future<AsyncValue<RepoList>> getRepoList({String? page, String? perPage}) {
    return _apiUtil.getRepoList(page: page!, perPage: perPage!);
  }
}

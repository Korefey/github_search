import 'package:github_search/data/api/request/get_repo_list_body.dart';
import 'package:github_search/data/api/service/repo_service.dart';
import 'package:github_search/data/mapper/repo_list_mapper.dart';
import 'package:github_search/domain/model/repo_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApiUtil {
  final RepoService _repoService;

  ApiUtil(this._repoService);

  Future<AsyncValue<RepoList>> getRepoList({
    required String page,
    required String perPage,
  }) async {
    final body = GetRepoListBody(page: page, perPage: perPage);
    final result = await _repoService.getRepoList(body);
    return RepoListMapper.fromApi(result);
  }
}

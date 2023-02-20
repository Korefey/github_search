import 'package:dio/dio.dart';
import 'package:github_search/data/api/model/api_repo_list.dart';
import 'package:github_search/data/api/request/get_repo_list_body.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepoService {
  static const _baseUrl = 'https://api.github.com';
  static const _urlRepositories = '/search/repositories';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  Future<AsyncValue<ApiRepoList>> getRepoList(GetRepoListBody body) async {
    try {
      final response = await _dio.get(_urlRepositories, queryParameters: body.toApi());
      if (response.statusCode == 200) {
        return AsyncValue.data(ApiRepoList.fromApi(response.data));
      } else {
        return AsyncError(response.data, StackTrace.current);
      }
    } catch (e, stackTrace) {
      return AsyncError(e, stackTrace);
    }
  }
}

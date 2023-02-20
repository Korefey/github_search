import 'package:github_search/data/api/api_util.dart';
import 'package:github_search/data/api/service/repo_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(RepoService());
    return _apiUtil!;
  }
}
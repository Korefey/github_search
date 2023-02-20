import 'package:github_search/data/local/api_local_util.dart';
import 'package:github_search/data/local/service/repo_local_service.dart';

class ApiLocalModule {
  static ApiLocalUtil? _apiLocalUtil;

  static ApiLocalUtil apiLocalUtil() {
    _apiLocalUtil ??= ApiLocalUtil(RepoLocalService());
    return _apiLocalUtil!;
  }
}

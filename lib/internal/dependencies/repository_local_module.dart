import 'package:github_search/data/repository/repo_list_data_local_repository.dart';
import 'package:github_search/domain/repository/repo_list_local_repository.dart';
import 'package:github_search/internal/dependencies/api_local_module.dart';

class RepositoryLocalModule {
  static RepoListLocalRepository? _repoListLocalRepository;

  static RepoListLocalRepository repoListLocalRepository() {
    _repoListLocalRepository ??= RepoListDataLocalRepository(
      ApiLocalModule.apiLocalUtil(),
    );
    return _repoListLocalRepository!;
  }
}

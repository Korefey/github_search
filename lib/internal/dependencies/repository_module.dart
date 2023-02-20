import 'package:github_search/data/repository/repo_list_data_repository.dart';
import 'package:github_search/domain/repository/repo_list_repository.dart';
import 'package:github_search/internal/dependencies/api_module.dart';

class RepositoryModule {
  static RepoListRepository? _repoListRepository;

  static RepoListRepository repoListRepository() {
    _repoListRepository ??= RepoListDataRepository(
      ApiModule.apiUtil(),
    );
    return _repoListRepository!;
  }
}

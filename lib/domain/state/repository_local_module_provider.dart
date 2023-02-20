import 'package:github_search/internal/dependencies/repository_local_module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final repositoryLocalModuleProvider = Provider((ref) => RepositoryLocalModule.repoListLocalRepository());

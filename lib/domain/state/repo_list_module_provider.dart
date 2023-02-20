import 'package:github_search/internal/dependencies/repository_module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final repoListModuleProvider = Provider((ref) => RepositoryModule.repoListRepository());

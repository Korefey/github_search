import 'package:github_search/domain/model/repo.dart';
import 'package:github_search/domain/state/repository_local_module_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteStreamProvider = StreamProvider<List<Repo>>((ref) async* {
  final repositoryLocalModule = ref.watch(repositoryLocalModuleProvider);
  final stream = repositoryLocalModule.getStreamRepoList();

  await for (final repoList in stream) {
    yield repoList;
  }
});

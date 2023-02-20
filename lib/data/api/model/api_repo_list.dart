import 'package:github_search/data/api/model/api_repo.dart';

class ApiRepoList {
  final List<ApiRepo> list;

  ApiRepoList.fromApi(Map<String, dynamic> map)
      : list = map['items'].map<ApiRepo>((f) {
          return ApiRepo.fromApi(f);
        }).toList();
}

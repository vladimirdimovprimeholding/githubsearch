import 'package:flutter_template/api/api.dart';
import 'package:flutter_template/models/list_items.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryService {
  ApiClient client;

  RepositoryService() {
    //TODO: DI
    client = ApiClient();
  }

  Observable<ListItems> getRepositoriesWithName(String name) {
    var repos = client.fetchRepositories(name);
    return Observable.fromFuture(repos).map((result) {
      return ListItems.fromApiResult(result);
    });
  }
}

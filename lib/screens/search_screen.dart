import 'package:flutter/material.dart';
import 'package:flutter_template/models/list_items.dart';
import 'package:flutter_template/services/repositories_service.dart';
import 'package:flutter_template/widgets/repositories_list.dart';
import 'package:flutter_template/widgets/search_bar.dart';
import 'package:rxdart/rxdart.dart';

class SearchScreen extends StatefulWidget {
  final RepositoryService _repositoryService = RepositoryService();

  @override
  _SearchScreenState createState() =>
      _SearchScreenState(repositoryService: _repositoryService);
}

class _SearchScreenState extends State<SearchScreen> {
  RepositoryService repositoryService;

  final TextEditingController _searchController = TextEditingController();

  final onTextChanged = PublishSubject<String>();

  Observable<ListItems> listItems;

  _SearchScreenState({this.repositoryService});

  @override
  void initState() {
    super.initState();

    listItems = onTextChanged
        .distinct()
        .debounceTime(Duration(milliseconds: 250))
        .flatMap((text) {
      return repositoryService.getRepositoriesWithName(text);
    }).share();
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchBar(
          searchController: _searchController,
          textChangedSubject: onTextChanged,
        ),
        Expanded(
          child: RepositoriesList(
            listItems: listItems,
          ),
        ),
      ],
    );
  }
}

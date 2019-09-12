import 'package:flutter/material.dart';
import 'package:flutter_template/models/item.dart';
import 'package:flutter_template/models/list_items.dart';
import 'package:flutter_template/services/repositories_service.dart';
import 'package:flutter_template/widgets/repository_item.dart';
import 'package:rxdart/rxdart.dart';

class SearchScreen extends StatefulWidget {
  RepositoryService _repositoryService = RepositoryService();

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
        _renderSearchBar(_searchController),
        Expanded(
          child: _renderListView(),
        ),
      ],
    );
  }

  //TODO: move this to a separate widget
  Widget _renderSearchBar(TextEditingController textEditingController) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[350],
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[400],
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    //the code below handle some weird exception
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => _searchController.clear());
                  }),
              hintText: "Repository search",
              border: InputBorder.none,
            ),
            onChanged: onTextChanged.add),
      ),
    );
  }

  //TODO: move this to a separate widget
  Widget _renderListView() {
    return StreamBuilder<ListItems>(
        stream: listItems,
        initialData: ListItems(list: List<Item>()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var listItems;
          if (snapshot.hasData && !snapshot.hasError) {
            listItems = (snapshot.data as ListItems).list;
          } else {
            return _renderEmptyListView();
          }

          return ListView.builder(
              shrinkWrap: true,
              itemCount: listItems.length,
              itemBuilder: (BuildContext context, int index) {
                return RepositoryItem(
                  item: listItems[index],
                );
              });
        });
  }

  //TODO: move this to a separate widget
  Widget _renderEmptyListView() {
    return ListView.separated(
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "",
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}

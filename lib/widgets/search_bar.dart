import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final searchController;

  final textChangedSubject;

  SearchBar({this.searchController, this.textChangedSubject});

  @override
  Widget build(BuildContext context) {
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
            controller: searchController,
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
                        .addPostFrameCallback((_) => searchController.clear());
                  }),
              hintText: "Repository search",
              border: InputBorder.none,
            ),
            onChanged: textChangedSubject.add),
      ),
    );
  }
}

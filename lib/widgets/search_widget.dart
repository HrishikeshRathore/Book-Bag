import 'package:flutter/material.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  // final TextEditingController searchController = TextEditingController();
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  String searchTerm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * .8,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            onChanged: (value) {
              this.searchTerm = value;
            },
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        IconButton(
            icon: Icon(
                Icons.search_sharp,
              color: Colors.white,
            ),
            onPressed: (){
              Provider.of<DataProvider>(context, listen: false).getSearchedLetter(searchTerm);
            },
        ),
      ],
    );
  }
}

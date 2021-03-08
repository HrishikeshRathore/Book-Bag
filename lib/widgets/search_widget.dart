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
          child: TextFormField(
            cursorColor: Colors.white,
            onChanged: (value){
              this.searchTerm = value;
            },
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            focusNode: FocusNode(),
            onFieldSubmitted: (term) {
              Provider.of<DataProvider>(context, listen: false).getSearchedLetter(searchTerm);
            },
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.white
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              hintText: 'Search here ...',
              fillColor: Colors.white,
            ),
          ),
        ),
        IconButton(
            icon: Icon(
                Icons.search_sharp,
              color: Colors.white,
              size: 30,
            ),
            onPressed: (){
              Provider.of<DataProvider>(context, listen: false).getSearchedLetter(searchTerm);
            },
        ),
      ],
    );
  }
}

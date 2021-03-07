import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_junction/best%20seller/bestseller_list.dart';
import 'package:movie_junction/best%20seller/nyt_data_model.dart';
import 'package:movie_junction/best%20seller/nyt_data_provider.dart';
import 'package:movie_junction/models/utils.dart';
import 'package:provider/provider.dart';

import 'expandable_container.dart';

class ListWidget extends StatefulWidget {

  final String id;
  final String name;
  final String nameKey;
  final String lastDate;
  final String newDate;
  final String update;

  ListWidget({
    this.id,
    this.name,
   this.newDate,
   this.nameKey,
   this.update,
   this.lastDate,
});

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {

  List<NytDataModel> bookList = [];

  bool expandFlag = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    double changeFontSize = expandFlag == true ? 10 : 12;

    return GestureDetector(
      onTap: () async {
        print('tapped');
        setState(() {
          expandFlag = !expandFlag;
          if(expandFlag == true)
            isLoading = true;
        });

        bookList = await Provider.of<NytDataProvider>(context, listen: false).getDataNytAccordingToList(widget.id);

        setState(() {
          isLoading = false;
        });

      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 17,
        ),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: expandFlag == true ? Colors.redAccent : Colors.black,
                    fontWeight: expandFlag == true ? FontWeight.normal : FontWeight.w800,
                    fontSize: expandFlag == true ? 13 : 18,
                  ),
                ),
              SizedBox(height: 10,),




              ExpandableContainer(
                  expanded: expandFlag,
                  child: isLoading == true ?
                      Center(child: CircularProgressIndicator(),)
                      :
                  bookList.length == 0 ?
                  Center(child: Text('try again after sometime'),) :
                  Container(
                        height: 300,
                        child: ListView.builder(
                          itemBuilder: (ctx, i) => BestsellerList(
                            bookTitle: bookList[i].bookTitle,
                            bookAuthor: bookList[i].author,
                            bookImage: bookList[i].image,
                            bookRank: bookList[i].rank,
                            publisher: bookList[i].publisher,
                            description: bookList[i].description,
                            buyLink: bookList[i].buyLink,
                          ),
                          itemCount: bookList.length,
                        ),
                      ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Published Between',
                        style: TextStyle(
                          color: Colors.red[300],
                          fontSize: changeFontSize,
                        ),
                      ),
                      Text(
                        '${Utils.trimDate(widget.lastDate, 4)} - ${Utils.trimDate(widget.newDate, 4)}',
                        style: TextStyle(
                          color: Colors.red[300],
                          fontSize: changeFontSize,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Updated',
                        style: TextStyle(
                          color: Colors.red[300],
                          fontSize: changeFontSize,
                        ),
                      ),
                      Text(
                        widget.update,
                        style: TextStyle(
                          color: Colors.red[300],
                          fontSize: changeFontSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(height: 40,),
            ],
          ),
      ),
    );
  }
}

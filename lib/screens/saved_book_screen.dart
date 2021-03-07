import 'package:flutter/material.dart';
import 'package:movie_junction/provider/database_provider.dart';
import 'package:movie_junction/widgets/saved_book_widget.dart';
import 'package:provider/provider.dart';

class SavedBookScreen extends StatelessWidget {

  static const routeName = '/saved_book_screen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  child: Image(image: AssetImage('assets/appbg.jpg'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 25),
                  alignment: Alignment.bottomLeft,
                      child: Text(
                        'Saved Books',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder (
                    future: Provider.of<DatabaseProvider>(context, listen: false).getSavedBooks(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                       return snapshot.connectionState == ConnectionState.waiting ?
                         Center(child: CircularProgressIndicator(),) :
                         Consumer<DatabaseProvider> (
                        builder: (BuildContext context, dbp, Widget child) {
                          if(snapshot.connectionState == ConnectionState.done){
                          }
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) => SavedBookWidget(
                                id: dbp.savedBooks[index].id,
                                imageLink : dbp.savedBooks[index].image,
                                bookTitle : dbp.savedBooks[index].title,
                                bookAuthor : dbp.savedBooks[index].author,
                            ),
                            itemCount: dbp.savedBooks.length,
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      )
    );
  }
}

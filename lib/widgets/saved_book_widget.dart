import 'package:flutter/material.dart';
import 'package:movie_junction/database/database_control.dart';
import 'package:movie_junction/models/detail_model.dart';
import 'package:movie_junction/models/utils.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/screens/details_screen.dart';
import 'package:movie_junction/widgets/grid_model.dart';
import 'package:provider/provider.dart';

class SavedBookWidget extends StatelessWidget {

  final String id;
  final String imageLink;
  final String bookTitle;
  final String bookAuthor;

  SavedBookWidget({this.id, this.imageLink, this.bookTitle, this.bookAuthor});

  void deleteBook() {
    DatabaseControl.deleteBook(id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        DetailModel savedBook = await Provider.of<DataProvider>(context, listen: false).getDataUsingId(id);

        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: GridModel(
          id: savedBook.id,
          buyLink: savedBook.buyLink,
          image: savedBook.thumbnailUrl,
          description: savedBook.description,
          publisher: savedBook.publisher,
          previewLink: savedBook.previewLink,
          published: savedBook.publisher,
          pages: savedBook.pageCount,
          amount: savedBook.amount,
          rating: savedBook.averageRating,
          bookName: savedBook.title,
          subtitle: savedBook.subtitle,
          subject: savedBook.categories,
          authorName: savedBook.authors,
        ));
      },
      child: Dismissible(
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => deleteBook(),
        key: ValueKey(id),
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          color: Colors.redAccent,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.delete, color: Colors.white, size: 30,)),
        ),
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          elevation: 2,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.network(imageLink,
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.height * .2,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15,),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        Utils.trimString(bookTitle, 50),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Utils.trimString(bookAuthor, 50,),
                        style: TextStyle(
                          color: Colors.red,
                          letterSpacing: 1,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

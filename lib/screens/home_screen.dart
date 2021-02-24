import 'package:flutter/material.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/widgets/categories.dart';

import 'package:provider/provider.dart';
import '../widgets/grid_model.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bookCount = Provider.of<DataProvider>(context).listOfBooks;

    return Scaffold(
      appBar: AppBar(

          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                    'Book Bin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
            ),
          ),
          toolbarHeight: 150,
          flexibleSpace: Image(
            image: AssetImage('assets/appbg.jpg'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),

      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 120,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Categories('Novel', bookCount.length),
                        Categories('Comic', bookCount.length),
                        Categories('Magazine', bookCount.length),
                        Categories('Action', bookCount.length),
                        Categories('Love', bookCount.length),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Consumer<DataProvider>(
                    builder: (BuildContext context, providerCall, Widget child) {
                      return GridView.builder(
                        itemCount: providerCall.listOfBooks.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 8,
                          childAspectRatio: 2/3,
                        ),
                        itemBuilder: (ctx, i) => GridModel(
                            providerCall.listOfBooks[i].bookName,
                            providerCall.listOfBooks[i].image
                        ),
                      );
                    },
                  ),
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}

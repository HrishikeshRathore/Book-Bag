import 'package:flutter/material.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/widgets/app_bar.dart';
import 'package:movie_junction/widgets/categories.dart';
import 'package:movie_junction/widgets/grid_model.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {

  static const routeName = '/categoryScreen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {



    final getProvider = Provider.of<DataProvider>(context, listen: false);

    final Categories args = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Appbar(args.book),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            width: double.infinity,
                            child: Card(
                              elevation: 4,
                              child: FutureBuilder (
                                future: getProvider.getDataFromApi(args.book),
                                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                  return snapshot.connectionState == ConnectionState.waiting ?
                                      Center(child: CircularProgressIndicator(),) :

                                    Consumer<DataProvider>(
                                      child: Center(child: CircularProgressIndicator(),),
                                    builder: (BuildContext context, dataProvider,
                                        Widget child) {
                                      return dataProvider.listOfBooks.length == 0 ? child : GridView.builder(
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 15,
                                          mainAxisSpacing: 15,
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.5 / 3,
                                        ),
                                        itemBuilder: (ctx, index) =>
                                            GridModel(
                                              id: dataProvider.listOfBooks[index].id,
                                              rating: dataProvider.listOfBooks[index].averageRating,
                                              previewLink: dataProvider.listOfBooks[index].previewLink,
                                              buyLink: dataProvider.listOfBooks[index].buyLink,
                                              description: dataProvider.listOfBooks[index].description,
                                              image: dataProvider.listOfBooks[index].thumbnailUrl,
                                              subtitle: dataProvider.listOfBooks[index].subtitle,
                                              amount: dataProvider.listOfBooks[index].amount,
                                              authorName: dataProvider.listOfBooks[index].authors,
                                              subject: dataProvider.listOfBooks[index].categories,
                                              pages: dataProvider.listOfBooks[index].pageCount,
                                              bookName: dataProvider.listOfBooks[index].title,
                                              published: dataProvider.listOfBooks[index].publishedDate,
                                              publisher: dataProvider.listOfBooks[index].publisher,
                                            ),
                                        itemCount: dataProvider.listOfBooks.length,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          child: Card(
                            elevation: 4,
                            child: Consumer<DataProvider> (
                              builder: (BuildContext context, value, Widget child) {
                                return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                      '${value.totalBookCount} books found',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                SizedBox(),
                                SizedBox(),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                  color: Colors.red,
                                  disabledColor: Colors.grey,
                                  onPressed: value.initialIndex <= 0 ? null : () => value.previousPage(),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                    color: Colors.red,
                                    disabledColor: Colors.grey ,
                                    onPressed: value.initialIndex > (value.totalBookCount - 20) ? null : () => value.nextPage(),
                                ),
                              ],
                            );
                              }
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
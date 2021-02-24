import 'package:flutter/material.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/widgets/app_bar.dart';
import 'package:movie_junction/widgets/categories.dart';
import 'package:movie_junction/widgets/grid_model.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {

  static const routeName = '/categoryScreen';

  @override
  Widget build(BuildContext context) {
    final getProvider = Provider.of<DataProvider>(context, listen: false);

    final Categories args = ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
      body: FutureBuilder(
          future: getProvider.getDataFromApi(args.book),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return snapshot.connectionState == ConnectionState.waiting ?
            Center(
              child: Image(image: AssetImage('assets/loader.gif'),),
            ) :
            Column(
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
                              child: Consumer<DataProvider>(
                                builder: (BuildContext context, dataProvider,
                                    Widget child) {
                                  return GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      crossAxisCount: 3,
                                      childAspectRatio: 1.5 / 3,
                                    ),
                                    itemBuilder: (ctx, index) =>
                                        GridModel(
                                          dataProvider.listOfBooks[index]
                                              .bookName,
                                          dataProvider.listOfBooks[index].image,
                                        ),
                                    itemCount: dataProvider.listOfBooks.length,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${getProvider.totalBookCount} books found',

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
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () => getProvider.previousPage(),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () => getProvider.nextPage()
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
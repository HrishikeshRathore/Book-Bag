import 'package:flutter/material.dart';
import 'package:movie_junction/best%20seller/nyt_data_provider.dart';
import 'package:provider/provider.dart';

import 'list_widget.dart';

class BestSellerScreen extends StatelessWidget {

  static const routeName = '/best_seller_screen';

  @override
  Widget build(BuildContext context) {

    var list = Provider.of<NytDataProvider>(context,listen: false).categoryScreenList;

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
                    },
                  ),
                ),

                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: [
                        Text(
                          'New York Times',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Best Sellers',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder (
            future: Provider.of<NytDataProvider>(context).getCategoryData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               return Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (ctx, i) => ListWidget(
                    id: list[i].catId,
                    name: list[i].catName,
                    nameKey: list[i].catId,
                    lastDate: list[i].oldDate,
                    newDate: list[i].newDate,
                    update: list[i].updateStatus,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

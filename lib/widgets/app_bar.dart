import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {

  final String categoryName;

  Appbar(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Container(
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

          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'CATEGORY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Divider(height: 3,),
                Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

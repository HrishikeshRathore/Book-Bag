import 'package:flutter/material.dart';
import 'package:movie_junction/models/utils.dart';

class ListWidget extends StatelessWidget {

  final String name;
  final String nameKey;
  final String lastDate;
  final String newDate;
  final String update;

  ListWidget({
   this.name,
   this.newDate,
   this.nameKey,
   this.update,
   this.lastDate,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17,
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(
                name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            SizedBox(height: 10,),
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
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${Utils.trimDate(lastDate, 4)} - ${Utils.trimDate(newDate, 4)}',
                      style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 12,
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
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      update,
                      style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 40,),
          ],
        ),
    );
  }
}

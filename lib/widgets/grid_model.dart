import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridModel extends StatelessWidget {

  final String titleName;
  final String src;

  GridModel(this.titleName, this.src);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 20, left: 5, right: 5),
        child: Column(
          children: [
            Expanded(
              child: Card(
                  elevation: 4,
                  child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(src == '' ? 'https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg' : src, fit:BoxFit.cover,)),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              child: Text(titleName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
    );
  }
}

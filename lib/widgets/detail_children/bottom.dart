import 'package:flutter/material.dart';
import 'package:movie_junction/database/database_control.dart';
import 'package:movie_junction/models/saved_book.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class Bottom extends StatefulWidget {

  final String previewLink;
  final String shopLink;
  final String id;
  final String name;
  final String image;
  final List<dynamic> author;

  Bottom({this.previewLink, this.shopLink, this.id, this.name, this.image, this.author});



  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  Future<void> share() async {
    await FlutterShare.share(
        title: widget.name,
        chooserTitle: 'Share ${widget.name}',
        linkUrl: widget.shopLink,
        text: 'Checkout this book.',
    );
  }

  bool isSaved = false;

  @override
  void initState (){
    super.initState();
  }

  Future<void> checkSaved(String id) async{

    var bookInList = await DatabaseControl.findBook(id);
    if(bookInList) {
      isSaved = true;

    } else
      isSaved = false;


  }



  _launchURLPreview() async {
    if (await canLaunch(widget.previewLink)) {
      await launch(widget.previewLink);
    } else {
      throw 'Could not launch ${widget.previewLink}';
    }
  }


  _launchURLBuy() async {
    if (await canLaunch(widget.shopLink)) {
      await launch(widget.shopLink);
    } else {
      throw 'Could not launch ${widget.shopLink}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 15 ),
      width: MediaQuery.of(context).size.width * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 30,
          ), onPressed:() {
            Navigator.of(context).pop();
          }
          ),

          IconButton(icon: Icon(Icons.remove_red_eye_sharp,
            color:widget.previewLink == null ? Colors.grey : Colors.white,
            size: 30,
          ),
            onPressed: widget.previewLink == null ? null : _launchURLPreview,
          ),

          IconButton(icon: Icon(Icons.shop,
            size: 30,
            color: widget.shopLink == '' ? Colors.grey :Colors.white,
          ),
            onPressed: widget.shopLink == '' ? null : _launchURLBuy,
          ),

          IconButton(icon: Icon(Icons.share,
            color: widget.shopLink == '' ? Colors.grey :Colors.white,
            size: 30,
          ),
              onPressed: share,
          ),

          FutureBuilder (
            future: checkSaved(widget.id),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.connectionState == ConnectionState.waiting ?
                  CircularProgressIndicator() :
                  IconButton(icon: Icon(isSaved ? Icons.save_rounded : Icons.save_outlined,
                color: Colors.white,
                size: 30,
              ), onPressed:() async {
                if(isSaved){
                  await DatabaseControl.deleteBook(widget.id);
                }
                else {
                  await DatabaseControl.insertBook(SavedBook(
                    id: widget.id,
                    title: widget.name,
                    image: widget.image,
                    author: widget.author.toString(),
                  ));
                }
                setState(() {
                  isSaved = !isSaved;
                });
              }
              );
            },
          ),
        ],
      ),
    );
  }
}

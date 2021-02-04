import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List booksList;
  Future getData() async {
    http.Response response =
        await http.get('https://ab-books-api.vercel.app/books');
    var data = jsonDecode(response.body);
    setState(() {
      booksList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    final devWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: booksList == null
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.menu, color: Colors.red),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.grey),
                  onPressed: () {},
                )
              ],
            ),
      body: booksList == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: devHeight,
              width: devWidth,
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: devHeight * 0.2,
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(2, 7),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover books',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('CLASSICS',
                                style: TextStyle(color: Colors.red)),
                            Text('NEW'),
                            Text('UPCOMING'),
                            SizedBox(width: 40.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  //big books cover
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: booksList.length,
                      itemBuilder: (context, index) {
                        return myBookCover(
                          title: booksList[index]['title'],
                          imgUrl: booksList[index]['posterImage'],
                          datePosted: DateFormat('yMMMMd').format(
                              DateTime.parse(booksList[index]['postDate'])),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    child: Center(child: Text('to be implemented')),
                  )
                ],
              ),
            ),
    );
  }

  Widget myBookCover({String title, String datePosted, String imgUrl}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              print('pressed');
            },
            child: Container(
              height: 200.0,
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.grey[300],
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(2, 7),
                    blurRadius: 20.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 3.0),
          Text(datePosted,
              style: TextStyle(fontSize: 10.0, color: Colors.grey)),
        ],
      ),
    );
  }
}

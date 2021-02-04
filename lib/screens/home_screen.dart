import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    final devWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
      body: Container(
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
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50.0)),
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
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CLASSICS', style: TextStyle(color: Colors.red)),
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
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15.0),
                  myBookCover(),
                  SizedBox(width: 15.0),
                  myBookCover(),
                  SizedBox(width: 15.0),
                  myBookCover(),
                  SizedBox(width: 15.0),
                ],
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

  Column myBookCover() {
    return Column(
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
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.grey[300],
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: NetworkImage(
                    'https://res.cloudinary.com/df8icafxq/image/upload/t_global/libxku58siqmvavo3zie.jpg'),
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
        Text('Title', style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 3.0),
        Text('Subtitle', style: TextStyle(fontSize: 10.0, color: Colors.grey)),
      ],
    );
  }
}

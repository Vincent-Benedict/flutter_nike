
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/shoes.dart';
import 'package:myapp/views/pages/items.dart';
import 'package:myapp/views/pages/login.dart';
import 'package:myapp/globals/global.dart' as globals;


class HomePage extends StatefulWidget{

  String usernameLogin;

  HomePage(this.usernameLogin);

  @override
  State<StatefulWidget> createState() {
    return HomePageState(this.usernameLogin);
  }
}

class HomePageState extends State<HomePage>{

  String usernameLogin;

  HomePageState(this.usernameLogin);

  var _darkTheme = false;


  var _images = [
    'assets/carousel1.jpg',
    'assets/carousel2.jpg',
    'assets/carousel3.jpg',
    'assets/carousel4.jpg',
    'assets/carousel5.jpg'
  ];

  void _onPressedItemsMenu(){
    Navigator.push(context, MaterialPageRoute(builder: (builder){
      return ItemsPage(this.usernameLogin);
    }));
  }

  void _onPressedHomeMenu(){
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder){
        return HomePage(this.usernameLogin);
      }), (route) => false);
  }

  void _onPressedLogout(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder){
        return LoginPage();
      }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
         actions: [
              PopupMenuButton(itemBuilder: (context) {
                return ['Toggle Theme'].map((e) {
                  return PopupMenuItem(
                      child: TextButton(
                    child: Text('Dark Theme'),
                    onPressed: () {
                      setState(() {
                        _darkTheme = !_darkTheme;
                        globals.isDarkTheme$.add(_darkTheme);
                      });
                    },
                  ));
                }).toList();
              })
            ],
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              ListTile(
                title: Text('Hello ${this.usernameLogin}', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), )
              ),
              ListTile(
                title: TextButton(
                  child: Text('Home'),
                  onPressed: _onPressedHomeMenu,
                ),
              ),
              ListTile(
                title: TextButton(
                  child: Text('Items'),
                  onPressed: _onPressedItemsMenu,
                ),
              ),
              ListTile(
                title: TextButton(
                  child: Text('Logout'),
                  onPressed: _onPressedLogout,
                ),
              ),
            ],
          ),
        )
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'NIKE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  child: Image.asset(
                    'assets/nike.png',
                    height: 250,
                    width: 250,
                    ),
                ),
              ],
            ),

            Column(
              children: [
                Text(
                  'Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan area.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)
                )
              ],
            ),

            Container(
                padding: EdgeInsets.only(top: 42),
                child: Column(
                children: [
                  Text(
                    'Our Showcase',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),

            Column(
              children: [
                CarouselSlider(items: [
                  Image(image: AssetImage(_images[0]),),
                  Image(image: AssetImage(_images[1]),),
                  Image(image: AssetImage(_images[2]),),
                  Image(image: AssetImage(_images[3]),)
                ], options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 3)
                ))
              ],
            )
          ],
        )
      )
    );
  }

}

import 'package:flutter/material.dart';
import 'package:myapp/models/review.dart';

class ItemDetailPage extends StatefulWidget{

  String img;
  String name;
  int price;
  String desc;
  String usernameLogin;

  ItemDetailPage(this.img, this.name, this.price, this.desc, this.usernameLogin);

  @override
  State<StatefulWidget> createState() {
    return ItemDetailState(this.img, this.name, this.price, this.desc, this.usernameLogin);
  }
}




class ItemDetailState extends State<ItemDetailPage>{

  String img;
  String name;
  int price;
  String desc;

  String usernameLogin;

  int _counter = 0;

  var _dataReview = [
    Review('Nike Men Revolution 5', 'Arap', 'Oh it is so Good'),
    Review('Nike Men Revolution 5', 'Joni', 'So Nice'),
    Review('Nike Womens Running', 'Arap', 'Oh my God, its so good'),
    Review('Nike Womens Running5', 'Stanley', 'Fantastic'),
    Review('Nike Mens Air Monarch', 'Arap', 'Like Vincenzo Style'),
    Review('Nike Mens Air Monarch', 'Bonjour', 'Quite Good'),
    Review('Nike Mens Fitness', 'Budi', 'Oh mi God, my favorite'),
    Review('Nike Mens Fitness', 'Vina', 'Give me please this shoes'),
    Review('Nike Metcon Sport', 'Shopee', 'Homina-homina'),
    Review('Nike Metcon Sport', 'Tokped', 'Like Father Like Son Style'),
    Review('Nike Metcon SportV', 'Sumenep', 'Fascinating'),
    Review('Nike Metcon SportV', 'BlackBlue', 'This is totally awesome'),
    Review('Nike Men Revolution 5', 'BlackPink', 'Great job Nike')
  ];

  ItemDetailState(this.img, this.name, this.price, this.desc, this.usernameLogin);

  var _ctrlReview = TextEditingController();

  void _onPressed(BuildContext context){
    if(_ctrlReview.text == ""){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Review must not be Empty !'))
      );
    } else{
      _dataReview.add(Review(this.name, this.usernameLogin, _ctrlReview.text));

      setState(() {
        _counter++;
      });

      _ctrlReview.text = '';
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
              length: 2,
              child: Scaffold(
              appBar: AppBar(
                title: Text('Item Detail'),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.stars)),
                    Tab(icon: Icon(Icons.add_comment)),
                  ],
                ),
              ),
              body: TabBarView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                this.name,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[ 
                                  Image.asset(
                                    'assets/${this.img}',
                                    height: 150,
                                    width: 200,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                            Text('Price: ${this.price.toString()} \$', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)), 
                                      ],
                                    ),
                                  )
                                ]
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Text(this.desc, textAlign: TextAlign.center,)
                            ],
                          ),


                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Text("Input Review Section", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),

                                TextField(
                                  decoration: InputDecoration(hintText: 'Input review or comment !'),
                                  controller: _ctrlReview,
                                ),

                                ElevatedButton(onPressed: () => _onPressed(context), child: Text('Input'))
                                
                              ],
                            ),
                          )
                          
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Container(
                            child: ListView(
                                children: _dataReview.map((e) {
                                  if(e.pruductName == this.name){
                                    return Card(
                                      child: ListTile(
                                        title: Text(e.reviewerName),
                                        subtitle: Text(e.review),
                                      ),
                                    );
                                  } else{
                                    return SizedBox.shrink();
                                  }
                                }).toList(),
                              ),
                          ),
                    ) 
                  ]
                ),
              ),
            );
    }

}


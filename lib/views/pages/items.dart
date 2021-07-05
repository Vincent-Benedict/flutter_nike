import 'package:flutter/material.dart';
import 'package:myapp/models/shoes.dart';
import 'package:myapp/views/pages/itemdetail.dart';
import '../../globals/global.dart' as globals;

class ItemsPage extends StatefulWidget{

  String usernameLogin;

  ItemsPage(this.usernameLogin);

  @override
  State<StatefulWidget> createState() {
    return ItemsPageState(this.usernameLogin);
  }
}

class ItemsPageState extends State<ItemsPage>{


  String usernameLogin;

  ItemsPageState(this.usernameLogin);

  var _data = [
    Shoes(
      'item1.jpg',
      'Nike Men Revolution 5',
      5000,
      'The Nike Revolution 5 mens running shoes cushion your stride with soft foam to keep you running in comfort. Minimalist design fits in just about anywhere your day takes you'
    ),
    Shoes(
      'item2.jpg',
      'Nike Womens Running',
      4500,
      'Bottom eyelet has been moved up to open up the forefoot flex zone and provide an optimal fit.'
    ),
    Shoes(
      'item3.jpg',
      'Nike Mens Air Monarch',
      6000,
      'MENS LEATHER SNEAKERS: Leather upper features overlays for support and perforations for airflow'
    ),
    Shoes(
      'item4.jpg',
      'Nike Mens Fitness',
      2000,
      'Nike Mens Fitness Available at a lower price from other sellers that may not offer free Prime shipping'
    ),
    Shoes(
      'item5.jpg',
      'Nike Metcon Sport',
      8000,
      'Nike Metcon Sport Mens Synthetic skins around the toe and heel provide long-lasting durability.'
    ),
    Shoes(
      'item6.jpg',
      'Nike Metcon SportV',
      1300,
      'Nike Metcon Sport MensV Synthetic skins around the toe and heel provide long-lasting durability'
    ),
  ];

  void _viewDetails(Shoes s){
    Navigator.push(context, MaterialPageRoute(builder: (builder){
      return ItemDetailPage(s.img, s.name, s.price, s.desc, this.usernameLogin);
    }));
  }

  Widget _buildWidget(Shoes s){
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 50,
            minWidth: 50,
            maxHeight: 75,
            maxWidth: 75
          ),
          child: Image.asset('assets/${s.img}', fit: BoxFit.cover,),
        ),
        title: Text(s.name),
        trailing: ElevatedButton(
          child: Text('See Details'),
          onPressed: () => {
            _viewDetails(s)
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Container(
              child: ListView(
                  children: _data.map((e) => _buildWidget(e)).toList(),
                ),
            ),
        
      ) 
    );
  }
}



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/provider_state_management/provider/favourite_provider.dart';
import 'package:testapp/provider_state_management/screens/favourite/myfavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    //final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    print('BUILD');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Favourite App'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => MyfavouriteItemScreen()
              ));
            },
            child: Icon(Icons.favorite_outline_rounded)
          ),
          SizedBox(width: 20,)
        ]
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,index){
                return Consumer<FavouriteItemProvider>(builder: (context , value, child){
                  return ListTile(
                  onTap: (){
                    if(value.selectedItem.contains(index)){
                      value.removeItem(index);

                    }else{
                      value.addItem(index);
                    }
                    
                    // setState(() {
                      
                    // });
                  },
                title: Text('item'+index.toString()),
                trailing: Icon(
                  value.selectedItem.contains(index) ?Icons.favorite : Icons.favorite_outline
                  )
                );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
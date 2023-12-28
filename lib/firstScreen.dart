import 'package:e_commerce/cart_page.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'Detail_page.dart';

List<ItemModel> selectedItems = [];

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<List<ItemModel>> itemObjList;


  @override
  void initState() {
    super.initState();
    itemObjList = getItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[400],
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('E Commerce App'),
            InkWell(
              onTap: () {
                Navigator.push(
                  context , MaterialPageRoute(builder: (context) => SecondScreen(selectedItems: selectedItems),)
                );
              },
              child: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ItemModel>>(
        future: itemObjList,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return 
            
            ListView.builder(
              itemBuilder: (context, index) {
                var img=snapshot.data![index].image.toString();
                var t = snapshot.data![index].title.toString();
                var p = snapshot.data![index].price.toString();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context , MaterialPageRoute(builder: (context) => DetailPage(img , p , t ),)
                        );
                      },
                      child: Image.network(img,height: MediaQuery.of(context).size.height*.5,)
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.04),
                    Text(snapshot.data![index].title.toString(),style: TextStyle(fontSize: 12),),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*.05,),
                          Icon(Icons.currency_rupee,size: 20,),
                          Text(snapshot.data![index].price.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          SizedBox(width: MediaQuery.of(context).size.width*.05,),
                          ElevatedButton(onPressed: (){
                            selectedItems.add(snapshot.data![index]);
                          }, child: Text('Add to Cart'))
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*.04),
                  ],
                );
              },
              itemCount: snapshot.data!.length,
            );

          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error.toString()}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

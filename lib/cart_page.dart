import 'package:e_commerce/firstScreen.dart';
import 'package:flutter/material.dart';
import 'model/itemmodel.dart';

class SecondScreen extends StatefulWidget {
  final List<ItemModel> selectedItems;

  SecondScreen({required this.selectedItems});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items'),
      ),
      body: ListView.builder(
        itemCount: widget.selectedItems.length,
        itemBuilder: (context, index) {
          return 
          Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.currency_rupee),
                    Text(widget.selectedItems[index].price!.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: MediaQuery.of(context).size.width*.6,),
                    InkWell(
                      onTap: () {
                        selectedItems.remove(widget.selectedItems[index]);
                        setState(() {});
                      },
                      child: Icon(Icons.delete,color: Colors.red,)
                    )
                  ],
                ),
                subtitle: Image.network(widget.selectedItems[index].image!,height: MediaQuery.of(context).size.height*.5,),
              ),
              const Text('____________________________________________________'),
            ],
          );
        },
      ),
    );
  }
}

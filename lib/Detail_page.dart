import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget
{
  var img , title , price;
  DetailPage( this.img , this.price , this.title );

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var quatity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Image.network(widget.img,height: MediaQuery.of(context).size.height*.7),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.04,),
            Text(widget.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height*.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.currency_rupee,size: 20,),
                Text(widget.price,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ElevatedButton(
                  onPressed: (){
                    quatity = quatity+1;
                    setState(() {});
                  }, child: Text('Add To Cart',style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold),)
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: ()
                      {
                        quatity=quatity+1;setState(() {});
                      },
                      child: Icon(Icons.add)
                    ),
                    SizedBox(width: 5,),
                    Text('$quatity'),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: () {
                        if(quatity!=1)
                        {
                          quatity=quatity-1;
                          setState(() {});
                        }
                      },
                      child: Icon(Icons.remove)
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
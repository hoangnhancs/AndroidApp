import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp() extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: String.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: String.appName),
    );
  }
}


class Accessory{
  int id;
  String name;
  int price;
  String imageUrl;
  //Acessory(this._id, this.name, this._price, this.imageUrl);
  Accessory(int _id, String _name, int _price, String _imageurl){
    this.id = _id;
    this.name = _name;
    this.price = _price;
    this.imageUrl = _imageurl;
  }
  List<Accessory> _getSampleData() { return [
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU"),
    Accessory(1, "Asrock B40 pro", 2500000, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2VuTEit3BW0TDkQPGKtrwvklE7alcPZtxSg&usqp=CAU") ]; }

}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final _sampleData = _getSampleData();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildList());
  }

//   Widget _buildList(){
//     return ListView.builder(itemBuilder: (context, index){
//       if(index>_sampleData.length-1) return null;
//       return GestureDetector(
//         child: _buildItemRow(_sampleData[index]),
//         onTap: (){
//           Scaffold.of(context).showSnackBar(
//             SnackBar(content: Text('Clicked at ${_sampleData[index].name}'),
//           ),
//         },
//       )
//     };
//   }
// }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index > _sampleData.length - 1) return null;
      return GestureDetector(
        child: _buildItemRow(_sampleData[index]),
        onTap: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Clicked at ${_sampleData[index].name}'),
            ),
          );
        },
      );
    });
  }


  Widget _buildItemRow(Accessory accessory) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15.0, top: 15.0),
                  child: Image.network(accessory.imageUrl,
                      width: 120, height: 120),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Visibility(
                      visible: accessory.isBestSellers,
                      replacement: SizedBox.shrink(),
                      child: Text(
                        Strings.bestSellers,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            backgroundColor: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Flexible(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      accessory.name,
                      softWrap: false,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${String.originalPrice} ${accessory.price.toString()}đ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "${String.discount} -${accessory.discountAmount.toString()}đ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${Strings.currentPrice} ${accessory.currentPrice.toString()}đ",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}


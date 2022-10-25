import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:memes/controller/fetchMeme.dart';
import 'package:memes/controller/saveMyData.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  String imgUrl = "";
  int ? memeno;
  int targetmeme = 20;

  @override
  void initState() {
    super.initState();
    GetinitMemeNo();
    UpadteImg();
  }
  GetinitMemeNo() async{
    memeno = await MyData.fetchData()??0;
    if(memeno!>20){
      targetmeme = 100;
    }
    else if(memeno!>100){
      targetmeme = 500;
    }
    else if(memeno!>500){
      targetmeme = 1000;
    }
    setState(() {
      
    });
  }
 
    
    
  UpadteImg()async{
    String getImg = await FetchMeme.fetchMoreMemes();

    
    setState(() {
      imgUrl = getImg;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 168, 86),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Memes #$memeno",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25,),
            Text(
              "Target memes ${targetmeme}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 45,),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              
              child: Image.network(
                fit : BoxFit.fitHeight,
                imgUrl)),
            SizedBox(
              height: 65,
            ),
            Container(
                height: 70,
                width: 150,
                
                
                child: ElevatedButton(
              
                    onPressed: ()async {
                      await MyData.saveData(memeno!+1);
                      GetinitMemeNo();
                      UpadteImg();
                    }, child: Text("More Meme!!",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),))),
            Spacer(),
            Text("App Created By",
            style: TextStyle(
                fontSize: 20,
              
              ),),
               Text("Sabyasachi Roy Chowdhury",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

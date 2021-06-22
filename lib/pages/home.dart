import 'package:ads_proj/pages/cadastro_page.dart';
import 'package:ads_proj/pages/formualario_cadastro.dart';
import 'package:ads_proj/pages/vedendo_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => VendendorPager()));
          },
          icon: Icon(Icons.person, color: Colors.blue.shade900,size: 35),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SizedBox(height: 160),
            Image.asset(
              'assets/pp.png',
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed:() {
                Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FormularioCadastro()));
              },
              child: Text('Novo cadastro'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: Colors.blue.shade900,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed:() {
                Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CadastroPage()));
              },
              child: Text('Meus cadastros'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: Colors.blue.shade900,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
            ),
            SizedBox(height: 190,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('NA', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w900)),
                Text('team', style: TextStyle(fontWeight: FontWeight.w600)),
                Text(' copyright © 2021')
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      )
    );
  }

}


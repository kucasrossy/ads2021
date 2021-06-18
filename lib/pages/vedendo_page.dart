import 'package:ads_proj/pages/home.dart';
import 'package:ads_proj/widget/button_widgt.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendendorPager extends StatefulWidget {
  const VendendorPager({ Key? key }) : super(key: key);

  @override
  _VendendorPagerState createState() => _VendendorPagerState();
}

class _VendendorPagerState extends State<VendendorPager> {
  final formKey = GlobalKey<FormState>();
  var valor = '';
 
  _setVendedorName(valor) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('Vendedor', valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getFutureDados(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Form(
            key: formKey,
            child: Center(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  SizedBox(height: 150,),
                  CircleAvatar(
                    child: Icon(
                      Icons.person, 
                      size: 70,
                      color: Colors.blue.shade900,
                    ),
                    maxRadius: 50,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Vendedor',
                      hintText: 'Digite o nome do vendedor',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value!.length < 4){
                        return 'O nome do vendendor precisa ter mais de 3 digitos';
                      }else{
                        return null;
                      }
                    },
                    maxLength: 10,
                    onSaved: (value) => setState(() => valor = value!),
                    onChanged: (value) => setState(()=> valor = value),
                    initialValue: snapshot.data.toString(),
                  ),
                  SizedBox(height: 15,),
                  buildSubmit()
                ],
              )
            ),
          );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }

  Widget buildSubmit() => Builder(
      builder: (context) => ButtonWidget(
        text: 'Salvar',
        size: 10,
        onClicked: () {
          final isValid = formKey.currentState!.validate();
          if(isValid){
            formKey.currentState!.save();
            _setVendedorName(valor);
            Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
          }
        },
      ),
    );
}

Future<String> getFutureDados() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString('Vendedor') ?? '';
}

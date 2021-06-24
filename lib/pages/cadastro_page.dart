import 'package:ads_proj/controller/controller_cadastros.dart';
import 'package:ads_proj/db/cliente_database.dart';
import 'package:ads_proj/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({ Key? key }) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  List<Cliente> _clienteLista = [];

  getAllClientes() async {
    _clienteLista = [];
    var clientes = await ClienteDatabase.instance.readAllCliente();
    clientes.forEach((cliente) { 
      var clienteModel = cliente.copy();
      _clienteLista.add(clienteModel);
      print(_clienteLista.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Cadastros', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w600, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue.shade900,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getAllClientes(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Padding(
              padding: EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: ListView.builder(
                itemCount: _clienteLista.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: IconButton(icon: Icon(Icons.edit), onPressed: () => ControllerCadastro.editCadastro(
                        _clienteLista[index].id!, context),),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Text(
                            _clienteLista[index].contato,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            onPressed: () => ControllerCadastro.shareCadastro(_clienteLista[index].id!),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                ControllerCadastro.deleteCadastro(_clienteLista[index].id!);
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => CadastroPage())
                                );
                              });
                            },
                          ) 
                        ],
                      ),
                      subtitle: Container(
                        alignment: Alignment.bottomRight,
                        child: Text(DateFormat('dd/MM/yyyy').format(_clienteLista[index].createdTime)),
                      ),
                      onTap: () => ControllerCadastro.viewCadastro(_clienteLista[index].id!, context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    elevation: 15,
                  );
                },
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
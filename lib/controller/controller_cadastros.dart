import 'package:ads_proj/api/pdf_api.dart';
import 'package:ads_proj/api/pdf_cadastro.dart';
import 'package:ads_proj/db/cliente_database.dart';
import 'package:ads_proj/models/cliente.dart';
import 'package:ads_proj/pages/edit_formulario_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ControllerCadastro{
  static deleteCadastro(int id) {
    ClienteDatabase.instance.delete(id);
  }

  static editCadastro(int id, context) async {
    Cliente clienteModel = await ClienteDatabase.instance.readCliente(id);
    Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => EditFormularioCadastro(clienteModel)));
  }

  static viewCadastro(int id, context) async {
    Cliente clienteModel = await ClienteDatabase.instance.readCliente(id);
    
    final file = await PdfCadastro.generate(clienteModel);

    PdfApi.openFile(file, context);
  }

  static shareCadastro(int id) async {
    Cliente clienteModel = await ClienteDatabase.instance.readCliente(id);

    final file = await PdfCadastro.generate(clienteModel);
    Share.share(file.path);
  }
}
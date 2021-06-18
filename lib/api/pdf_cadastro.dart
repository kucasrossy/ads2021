import 'dart:io';

import 'package:ads_proj/models/cliente.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'package:ads_proj/api/pdf_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfCadastro {
  static Future<File> generate(Cliente cliente) async {
    final imageJpg = (await rootBundle.load('assets/pp.png')).buffer.asUint8List();
    final pdf = Document();
    final vendedorNome = await _getNameVendedor();
        pdf.addPage(
          MultiPage(
            pageFormat: PdfPageFormat.a4,
            build: (context) => [
              buildCustomHeader(imageJpg),
              SizedBox(height: 1.5 * PdfPageFormat.cm),
              buildCustomBody(cliente, vendedorNome),
              SizedBox(height: 0.3* PdfPageFormat.cm),
              buildCustomReferencia(cliente),
              buildCustomComentarios(cliente)
            ],
          )
        );
    
        return PdfApi.saveDocument(name: 'Cadastro.pdf', pdf: pdf);
      }
    
      static Widget buildCustomHeader(var imageJpg) => Row(
        children: [
          Image(MemoryImage(imageJpg), height: 200, width: 200),
          Spacer(),
          Text('FICHA DO CADASTRO', style: TextStyle(fontSize: 25))
        ]
      );

      static Widget buildProprio(Cliente cliente){
        if(cliente.residenciaPropria){
          return Row(
            children: [
              Text('Proprio(X)  Alugado()', style: TextStyle(fontSize: 15))
            ]
          );
        }else{
          return Row(
            children: [
              Text('Proprio()  Alugado(X)', style: TextStyle(fontSize: 15))
            ]
          );
        }
      }

       static Widget buildPessoal(Cliente cliente){
        if(cliente.pFisica){
          return Row(
            children: [
              Text('P.Fisica(X)  P.Juridica()', style: TextStyle(fontSize: 15))
            ]
          );
        }else{
          return Row(
            children: [
              Text('P.Fisica()  P.Juridica(X)', style: TextStyle(fontSize: 15))
            ]
          );
        }
      }
    
      static Widget buildCustomBody(Cliente cliente, vendedorName) { 
        var date = cliente.createdTime;
        String dateConverte = DateFormat('dd/MM/yyyy').format(date);
        return Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Vendedor: ${vendedorName.toString()}', style: TextStyle(fontSize: 15)),
                  Spacer(),
                  Text('Codigo: ________', style: TextStyle(fontSize: 15)),
                  Spacer(),
                  buildProprio(cliente)
                ]
              ),
              Row(
                children: [
                  Text('Data de Cadastro: $dateConverte',style: TextStyle(fontSize: 15)),
                  Spacer(),
                  buildPessoal(cliente)
                ]
              ),
              Text('Razão Social: ${cliente.razaoSocial}', style: TextStyle(fontSize: 15)),
              Text('Nome Fantasia: ${cliente.nomeFantasia}', style: TextStyle(fontSize: 15)),
              Row(
                children: [
                  Text('Endereço: ${cliente.endereco}', style: TextStyle(fontSize: 15)),
                  Spacer(),
                  Text('Nº: ${cliente.numeroRua}', style: TextStyle(fontSize: 15)),
                  SizedBox(width: 3 * PdfPageFormat.cm)
                ]
              ),
              Row(
                children: [
                  Text('Bairro: ${cliente.bairro}', style: TextStyle(fontSize: 15)),
                  Spacer(),
                  Text('Cidade: ${cliente.cidade}', style: TextStyle(fontSize: 15)),
                  SizedBox(width: 1.2 * PdfPageFormat.cm),
                  Text('CEP: ${cliente.cep}',style: TextStyle(fontSize: 15))
                ]
              ),
              Text('Ponto de Referencia: ${cliente.pontoReferencia}', style: TextStyle(fontSize: 15)),
              Row(
                children: [
                  Text('CNPJ: ${cliente.cnpj}', style: TextStyle(fontSize: 15)),
                  Spacer(),
                  Text('CGF:${cliente.cgf}', style: TextStyle(fontSize: 15)),
                  SizedBox(width: 3 * PdfPageFormat.cm)
                ]
              ),
              Row(
                children: [
                  Text('Contato: ${cliente.contato}', style: TextStyle(fontSize: 15)),
                  SizedBox(width: 0.5 * PdfPageFormat.cm),
                  Text('Fone:${cliente.fone}', style: TextStyle(fontSize: 15))
                ]
              ),
              Text('Email:${cliente.email}',style: TextStyle(fontSize: 15))
            ],
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1),
              right: BorderSide(width: 1),
              top: BorderSide(width: 1),
              left: BorderSide(width: 1)
            )
          )
        );
      }
    
      static Widget buildCustomReferencia(Cliente cliente) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
             Text('Referências Comercias', style: TextStyle(fontSize: 20)),
            Row(
              children: [
                Text('Empresa:${cliente.ref_1}', style: TextStyle(fontSize: 15)),
                Spacer(),
                Flexible(child: Text('${cliente.numero_1}', style: TextStyle(fontSize: 15)))
              ]
            ),
            Row(
              children: [
                Text('Empresa:${cliente.ref_2}', style: TextStyle(fontSize: 15)),
                SizedBox(width: 5 * PdfPageFormat.cm),
                Flexible(child: Text('${cliente.numero_2}', style: TextStyle(fontSize: 15)))
              ]
            ),
            Row(
              children: [
                Text('Empresa:${cliente.ref_3}', style: TextStyle(fontSize: 15)),
                Spacer(),
                Flexible(child: Text('${cliente.numero_3}', style: TextStyle(fontSize: 15)))
              ]
            ),
          ]
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1),
            right: BorderSide(width: 1),
            top: BorderSide(width: 1),
            left: BorderSide(width: 1)
          )
        )
      );
    
      static Widget buildCustomComentarios(Cliente cliente) => Column(
        children: [
          Text('Comentário Vendedor', style: TextStyle(fontSize: 20)),
          Container(
            padding: EdgeInsets.all(8),
            child: Paragraph(
              text: '${cliente.comentario}',
              style: TextStyle(fontSize: 20)
            ),
            decoration: cliente.comentario!.length > 100 ? BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1),
                right: BorderSide(width: 1),
                top: BorderSide(width: 1),
                left: BorderSide(width: 1)
              )
            ) : null,
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            children: [
              Text('Limite: ', style: TextStyle(fontSize: 20)),
              Container(
                height: 10,
                width: 100,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 2))
                )
              )
            ]
          )
        ]
      );
    
      static _getNameVendedor() async {
        var prefs =  await SharedPreferences.getInstance();
        return prefs.getString('Vendedor') ?? 'Não registrou';
      }
}

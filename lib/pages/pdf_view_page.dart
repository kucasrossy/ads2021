import 'dart:io';

import 'package:ads_proj/controller/controller_cadastros.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';

class PdfViewPage extends StatefulWidget {
  const PdfViewPage({
    Key? key,
    required this.file,
  }) : super(key: key);
  final File file;

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Visualizando o Formulario', style: TextStyle(color: Colors.blue.shade900),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.blue.shade900,), onPressed: () {
          Navigator.pop(context);
        },),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.blue.shade900,
              ),
            onPressed: () => Share.share(widget.file.path),
          )
        ],
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
      backgroundColor: Colors.white,
    );
  }
}
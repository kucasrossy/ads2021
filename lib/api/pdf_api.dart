
import 'dart:io';

import 'package:ads_proj/pages/pdf_view_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi{
  static Future<File> saveDocument({
    required String name,
    required Document pdf
  }) async {
    final bytes = await pdf.save();

    final dir =  await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file, context) async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PdfViewPage(file: file))
    );
  }
}
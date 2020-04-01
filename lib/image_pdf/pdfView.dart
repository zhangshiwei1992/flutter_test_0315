import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'PdfPage.dart';

class PdfViewPage extends StatefulWidget {
  String pdfPath;

  PdfViewPage({
    this.pdfPath ,
  });

  @override
  State<StatefulWidget> createState() {
    return PdfViewPageState();
  }
}

class PdfViewPageState extends State<PdfViewPage>  {
  String pathPDF = "";
  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((pdfFile) {
      setState(() {
        pathPDF = pdfFile.path;
        print('pathPDF================================================='+pathPDF)  ;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    String pdfFileUrl = widget.pdfPath;
    print('pdfFileUrl================================================='+pdfFileUrl)  ;
    final filename = pdfFileUrl.substring(pdfFileUrl.lastIndexOf("/") + 1,pdfFileUrl.lastIndexOf("?"));
    print('filename================================================='+filename)  ;
    var request = await HttpClient().getUrl(Uri.parse(pdfFileUrl));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    print('dir================================================='+dir)  ;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }
  
  @override
  Widget build(BuildContext context) {
    return PDFScreen(pathPDF);
  }

}

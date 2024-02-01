import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatelessWidget {
  const PDFViewer({
    super.key,
    required this.id,required this.name,
  });

  final String id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SfPdfViewer.network(id,
          enableTextSelection: true,
          canShowScrollHead: true,
          scrollDirection: PdfScrollDirection.vertical),
    );
  }
}

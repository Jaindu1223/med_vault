import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class qrScanner extends StatefulWidget {
  const qrScanner({super.key});

  @override
  State<qrScanner> createState() => _qrScannerState();
}

class _qrScannerState extends State<qrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result ="";

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData){
      setState(() {
        result = scanData.code!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("QR code scanner"),
        ),
        body:Column(
          children: [
          Expanded(
            flex: 5,
            child:QRView(
                key: qrKey,
                onQRViewCreated:_onQRViewCreated,
            ),
          ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Scan Result: $result",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if(result.isNotEmpty){
                          Clipboard.setData(ClipboardData(text: result));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:Text("copied to the Clipboard"),
                            ),
                          );
                        }
                      },
                    child: Text("Copy"),
                  ),
                  ElevatedButton(
                    onPressed: ()async {
                      if(result.isNotEmpty){
                        final Uri _url= Uri.parse(result);
                        await launchUrl(_url);
                      }
                    },
                    child: Text("Open"),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}

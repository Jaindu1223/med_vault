import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_vault/pages/doctor/doc_pharmacy_spotter.dart';
import 'package:med_vault/pages/doctor/home_pageD.dart';
import 'package:med_vault/pages/doctor/navigation_components_doc.dart';
import 'package:med_vault/pages/doctor/new_prescription.dart';
import 'package:med_vault/pages/patient/check.dart';
import 'package:med_vault/pages/patient/settings.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import '../patient/view_prescription.dart';
import 'doc_settings.dart';
import 'doc_view_prescription.dart';

class QrScan extends StatefulWidget {
  final String email;
  final String docemail;
  const QrScan({Key? key, required this.email,required this.docemail}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  int _currentIndexD = 2;

  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result = "";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
        controller.stopCamera();
      });
      Future.delayed(const Duration(seconds: 30), () {
        controller.resumeCamera();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color customBackgroundColor = Color(int.parse('0xFFE3E4E4'));
    return Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const Text("Scan the QR Code "),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  width: 230.0,
                  height: 230.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Scan Result: $result",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50,left: 20),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder:
                              (context)=>docViewPrescription(email: result,docemail: widget.docemail)));
                    },

                    child: Container(
                      padding: const EdgeInsets.all(6),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('Previous Prescription',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11)),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      // Assuming that the scanned NIC number is stored in the `result` variable
                      //if (result != null && result.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPrescription(email: result, docemail: widget.docemail,),
                        ),
                      );
                      },

                    child: Container(
                      padding: const EdgeInsets.all(6),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('New Prescription ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavigationBar2(
        currentIndexD: _currentIndexD,
        onTap: (index) {
          setState(() {
            _currentIndexD = index;
          });
          switch (index) {
            case 0:
              NavigationServiceDoc.navigateTo(
                  HomePageDoc(email: widget.email, docemail: widget.docemail),
                  context);
              break;
            case 1:
              NavigationServiceDoc.navigateTo(
                  PharmacySearchPage2(email: widget.email, docemail: widget.docemail),
                  context);
              break;
            case 2:
              NavigationServiceDoc.navigateTo(
                  QrScan(email: widget.email,docemail: widget.docemail),
                  context); // Already on QrScan page, no need to navigate
              break;
            case 3:
              NavigationServiceDoc.navigateTo(
                  docSettingsPage(email: widget.email, docemail: widget.docemail),
                  context);
              break;
          }
        },
      ),
    );
  }
}

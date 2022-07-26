import 'package:image_picker_platform_interface/src/types/picked_file/unsupported.dart';
import 'package:pmyl/backend/documentsUpload_service.dart';

import '../a_p_lpage_copy_copy/documents_screen.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../sucess_screen/sucess_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature/signature.dart';

class DigitalSignWidget extends StatefulWidget {
  const DigitalSignWidget(
      {Key? key, String? passportPhoto, String? panCard, String? adharFront, String? adharBack, String? cheque,
      })
      : super(key: key);

  @override
  _DigitalSignWidgetState createState() => _DigitalSignWidgetState();
}

class _DigitalSignWidgetState extends State<DigitalSignWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SignatureController signatureController;
  final DocumentsUploadService _documentsUpload = DocumentsUploadService();

  @override
  void initState() {
    super.initState();
    signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }
  submitAllDetails() async{
    final sign = await SignatureController;
    if (sign==null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Field is required')));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              'Digital Signature',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
            ),
          ),
          flexibleSpace: Align(
            alignment: AlignmentDirectional(0, -0.45),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
              child: ClipRect(
                child: Signature(
                  controller: signatureController,
                  backgroundColor: Colors.white,
                  height: 600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                 await submitAllDetails();
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SucessScreenWidget(),
                  //   ),
                  // );
                },
                text: 'Go Next',
                options: FFButtonOptions(
                  width: 300,
                  height: 40,
                  color: Color(0xFFFAEA48),
                  textStyle: FlutterFlowTheme.of(context).bodyText1,
                  elevation: 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  }

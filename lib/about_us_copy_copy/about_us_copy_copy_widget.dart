import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsCopyCopyWidget extends StatefulWidget {
  const AboutUsCopyCopyWidget({Key? key}) : super(key: key);

  @override
  _AboutUsCopyCopyWidgetState createState() => _AboutUsCopyCopyWidgetState();
}

class _AboutUsCopyCopyWidgetState extends State<AboutUsCopyCopyWidget> {
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;
  String? dropDownValue4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).lineColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'FAQs',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).lineColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: FlutterFlowDropDown(
              options: [
                'आधार कार्ड पर ऋण',
                'ऋण की कुच शर्ते',
                'आधार कार्ड पर होम लोन केसे ले',
                'ऑनलाइन लोन के लिए करे अप्लाई करें'
              ],
              onChanged: (val) => setState(() => dropDownValue1 = val),
              width: 350,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
              hintText: 'आधार कार्ड पर ऋण',
              fillColor: Colors.white,
              elevation: 2,
              borderColor: FlutterFlowTheme.of(context).lineColor,
              borderWidth: 0,
              borderRadius: 15,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: FlutterFlowDropDown(
              options: [
                'प्रधान मंत्री मुद्रा योजना',
                'प्रधानमंत्री मुद्रा योजना के लाभ',
                'कोन ले सकाता है मुद्रा योजना के तहत लोन',
                'मुद्रा ऋण पर ब्याज दरे',
                'आप के ले सकते हैं PMMY लोन'
              ],
              onChanged: (val) => setState(() => dropDownValue2 = val),
              width: 350,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
              hintText: 'प्रधानमंत्री मुद्रा योजना',
              fillColor: Colors.white,
              elevation: 2,
              borderColor: FlutterFlowTheme.of(context).lineColor,
              borderWidth: 0,
              borderRadius: 15,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: FlutterFlowDropDown(
              options: [
                'प्रधानमंत्री आवास योजना',
                '15 महीने बढ़ा समय',
                'कहाँ से उठता सकते है फयाद'
              ],
              onChanged: (val) => setState(() => dropDownValue3 = val),
              width: 350,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
              hintText: 'प्रधानमंत्री आवास योजना',
              fillColor: Colors.white,
              elevation: 2,
              borderColor: FlutterFlowTheme.of(context).lineColor,
              borderWidth: 0,
              borderRadius: 15,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: FlutterFlowDropDown(
              options: ['प्रधानमंत्री रोजगार योजना', 'शामील गतिविधिया'],
              onChanged: (val) => setState(() => dropDownValue4 = val),
              width: 350,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
              hintText: 'प्रधानमंत्री रोजगार योजना',
              fillColor: Colors.white,
              elevation: 2,
              borderColor: FlutterFlowTheme.of(context).lineColor,
              borderWidth: 0,
              borderRadius: 15,
              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
        ],
      ),
    );
  }
}

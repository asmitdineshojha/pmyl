import 'package:flutter/foundation.dart';
import '../a_p_lpage_copy/accountDetails_screen.dart';
import '../a_p_lpage_copy_copy/documents_screen.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/emiCalculation_service.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class APLpageCopy2Widget extends StatefulWidget {
  const APLpageCopy2Widget(
      {Key? key,
      required String acName,
      required String acNo,
      required String branchName,
      required String ifsc,
      required String adhar})
      : super(key: key);

  @override
  _APLpageCopy2WidgetState createState() => _APLpageCopy2WidgetState();
}

class _APLpageCopy2WidgetState extends State<APLpageCopy2Widget> {
  String? dropDownValue;
  String? loanAmtValue;
  String? emiValue;
  bool viewVisible = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final EmiCalService _emiCalService = EmiCalService();

  // late final _regfee = {};
  // late final _emifee={};

  var emiOptions = [
    {"label": "12 Months | 1 Year", "value": "EMI12"},
    {"label": "24 Months | 2 Year", "value": "EMI24"},
    {"label": "36 Months | 3 Year", "value": "EMI36"},
    {"label": "48 Months | 4 Year", "value": "EMI48"},
    {"label": "60 Months | 5 Year", "value": "EMI60"},
    {"label": "72 Months | 6 Year", "value": "EMI72"},
    {"label": "84 Months | 7 Year", "value": "EMI84"},
    {"label": "96 Months | 8 Year", "value": "EMI96"},
    {"label": "108 Months | 9 Year", "value": "EMI108"},
    {"label": "120 Months | 10 Year", "value": "EMI120"},
    {"label": "132 Months | 11 Year", "value": "EMI132"},
    {"label": "144 Months | 12 Year", "value": "EMI144"},
    {"label": "156 Months | 13 Year", "value": "EMI156"},
    {"label": "168 Months | 14 Year", "value": "EMI168"},
    {"label": "180 Months | 15 Year", "value": "EMI180"},
    {"label": "192 Months | 16 Year", "value": "EMI192"},
    {"label": "204 Months | 17 Year", "value": "EMI204"},
    {"label": "216 Months | 18 Year", "value": "EMI216"},
    {"label": "240 Months | 20 Year", "value": "EMI240"},
    {"label": "228 Months | 19 Year", "value": "EMI228"},
  ];

  // @override
  // void initState() {
  //   _emiCalService.emiCal(loanAmtValue,emiValue).then((regstrationFee) {
  //     setState(() {
  //       _emifee=regstrationFee;
  //     });
  //   });
  //
  //
  //   _emiCalService.emiCal(loanAmtValue,emiValue).then((regstrationFee) {
  //     setState(() {
  //        _regfee=regstrationFee;
  //     });
  //   });
  //
  //
  //   super.initState();
  //  }

  sendLoanDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => APLpageCopyCopyWidget(
          tob: dropDownValue,
          loanAmt: loanAmtValue,
          loanEmi: emiValue,
        ),
      ),
    );
  }

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              'Apply For Loan',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
            ),
          ),
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Select Loan Offer',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                      ),
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: FlutterFlowDropDown(
                      options: ['Employee', 'Self Employeed', 'Government Job'],
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: 345,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Select Business',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 15,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: FutureBuilder<ApiCallResponse>(
                      future: EmiAmountCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 3,
                              height: 1,
                              child: SpinKitThreeBounce(
                                color: Colors.amberAccent,
                                size: 1,
                              ),
                            ),
                          );
                        }
                        final loanAmtEmiAmountResponse = snapshot.data!;
                        return FlutterFlowDropDown(
                          options: (EmiAmountCall.amount(
                            (loanAmtEmiAmountResponse?.jsonBody ?? ''),
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()
                              .toList(),
                          onChanged: (val) {
                            setState(() => loanAmtValue = val);
                            _emiCalService.emiCal(loanAmtValue, emiValue);
                          },
                          width: 345,
                          height: 50,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                          hintText: 'Select Loan Amount',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 15,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Container(
                              height: 50,
                              width: 345,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton(
                                    hint: Text(
                                      'Emi Tenure',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onChanged: (String? val) {
                                      setState(() {
                                        emiValue = val;
                                      });
                                      _emiCalService.emiCal(
                                          loanAmtValue, emiValue);
                                      if(val==emiValue){
                                        showWidget();
                                      }
                                      else{
                                        hideWidget();
                                      }
                                    },
                                    value: emiValue,
                                    items: emiOptions
                                        .map((Map<String, String> option) {
                                      return DropdownMenuItem(
                                        child: Text(option["label"]!),
                                        value: option["value"],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: viewVisible,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Your Monthly EMI is :  ",
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF0909A7),
                            ),
                      ),
                      Text(
                        'Your registration fee is :  ',
                        style: FlutterFlowTheme.of(context).subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: FFButtonWidget(
                onPressed: () async {
                  if (formKey.currentState == null ||
                      !formKey.currentState!.validate()) {
                    return;
                  }

                  if (dropDownValue == null) {
                    return showSnackbar(
                        context, 'Please Select Business type..',
                        duration: 2);
                  }
                  if (loanAmtValue == null) {
                    return showSnackbar(context, 'Please Select Loan Amount..',
                        duration: 2);
                  }
                  if (emiValue == null) {
                    return showSnackbar(context, 'Please Select EMI Tenure..',
                        duration: 2);
                  }
                  await sendLoanDetails(context);

                },
                text: 'APPLY NOW',
                options: FFButtonOptions(
                  width: 200,
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

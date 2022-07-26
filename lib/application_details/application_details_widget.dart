import 'package:pmyl/sucess_screen/sucess_screen_widget.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../loan_history/loan_history_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationDetailsWidget extends StatefulWidget {
  const ApplicationDetailsWidget({Key? key}) : super(key: key);

  @override
  _ApplicationDetailsWidgetState createState() =>
      _ApplicationDetailsWidgetState();
}

class _ApplicationDetailsWidgetState extends State<ApplicationDetailsWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 54,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme
                .of(context)
                .secondaryText,
            size: 24,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoanHistoryWidget(),
              ),
            );
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-1, -0.95),
          child: Text(
            'Application Detail',
            style: FlutterFlowTheme
                .of(context)
                .title3,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme
          .of(context)
          .primaryBackground,
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    onChanged: (_) =>
                        EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 2000),
                              () => setState(() {}),
                        ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Search Application Id',
                      labelStyle: FlutterFlowTheme
                          .of(context)
                          .bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme
                          .of(context)
                          .secondaryBackground,
                    ),
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyText1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 44,
                    icon: Icon(
                      Icons.search_rounded,
                      color: FlutterFlowTheme
                          .of(context)
                          .primaryText,
                      size: 24,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ],
            ),
          ),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Application Id',
                ),
              ),
              DataColumn(
                label: Text(
                  'Date',
                ),
              ),
              DataColumn(
                label: Text(
                  'Status',
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('171922063952008')),
                  DataCell(Text('11-12-2022')),
                  DataCell(Text('Released')),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                decoration: BoxDecoration(
                  border:
                  Border.all(width: 1.0, color: Color(0xFFFAEA48)),
                  borderRadius: BorderRadius.all(Radius.circular(
                      18.0) //                 <--- border radius here
                  ),
                  color: Color(0xFFFAEA48),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                height: 50,
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Full Name :',style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Yash Jariwala',style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Gender :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('Male',)),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Date Of Birth :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('11-11-1999')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Father Name :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('Jariwala')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Mother Name :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('Jariwala')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 1.0, color: Color(0xFFFAEA48)),
                          borderRadius: BorderRadius.all(Radius.circular(
                              18.0) //                 <--- border radius here
                          ),
                          color: Color(0xFFFAEA48),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        height: 50,
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text(
                            "Contact Information",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Mobile Number :',style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '9874561231',style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('State :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('Gujrat',)),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('City :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('Surat')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Pincode :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('395007')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 1.0, color: Color(0xFFFAEA48)),
                          borderRadius: BorderRadius.all(Radius.circular(
                              18.0) //                 <--- border radius here
                          ),
                          color: Color(0xFFFAEA48),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        height: 50,
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text(
                            "Loan and Fee Information",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Loan Amount (Rs.) :',style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '9,874,25',style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('EMI (Years) :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('1',)),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('EMI (Rs.) :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('1,77,500')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 1.0, color: Color(0xFFFAEA48)),
                          borderRadius: BorderRadius.all(Radius.circular(
                              18.0) //                 <--- border radius here
                          ),
                          color: Color(0xFFFAEA48),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        height: 50,
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text(
                            "Remarks",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Insurance Fee (Rs.) :',style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '7',style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                      rows: const <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Processing Fee (Rs.) :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('1',)),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('AgreementFee (Rs.) :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('1')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Note :',style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataCell(Text('')),
                          ],
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text('Pay Mr.FName TlName',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Text('We will update your application shortly',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SucessScreenWidget(),
                          ),
                        );
                      },
                      text: 'Pay Now',
                      options: FFButtonOptions(
                        width: 370,
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
                  )
          ]),
    ),
      ),
      
    
    );
    
  }
}

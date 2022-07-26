import 'dart:io';
import 'package:pmyl/backend/documentsUpload_service.dart';
import '../digital_sign/digital_sign_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class APLpageCopyCopyWidget extends StatefulWidget {
  const APLpageCopyCopyWidget({Key? key, String? tob, String? loanAmt, String? loanEmi}) : super(key: key);

  @override
  _APLpageCopyCopyWidgetState createState() => _APLpageCopyCopyWidgetState();
}

class _APLpageCopyCopyWidgetState extends State<APLpageCopyCopyWidget> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  PickedFile? imageFile, imageFile1, imageFile2, imageFile3, imageFile4;
  final DocumentsUploadService _uploadDocuments =DocumentsUploadService();
   late final fileInput;
  sendDocumentsDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DigitalSignWidget(
          passportPhoto: imageFile?.path,
          panCard: imageFile1?.path,
          adharFront: imageFile2?.path,
          adharBack: imageFile3?.path,

          cheque: imageFile4?.path,

        ),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context, int imageField) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Choose option"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    onTap: () {
                      print("object");
                      _openGallery(context, imageField);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.add_photo_alternate_outlined,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context, imageField);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  void _openGallery(BuildContext context, int imageField) async {
    Navigator.pop(context);
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      switch (imageField) {
        case 0:
          imageFile = pickedFile!;
          break;
        case 1:
          imageFile1 = pickedFile!;
          break;
        case 2:
          imageFile2 = pickedFile!;
          break;
        case 3:
          imageFile3 = pickedFile!;
          break;
        case 4:
          imageFile4 = pickedFile!;
          break;
      }
    });
  }

  void _openCamera(BuildContext context, int imageField) async {
    Navigator.pop(context);
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      switch (imageField) {
        case 0:
          imageFile = pickedFile!;
          break;
        case 1:
          imageFile1 = pickedFile!;
          break;
        case 2:
          imageFile2 = pickedFile!;
          break;
        case 3:
          imageFile3 = pickedFile!;
          break;
        case 4:
          imageFile4 = pickedFile!;
          break;
      }
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
          iconTheme: IconThemeData( color: Colors. black),
          title:  Padding(
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
                  'Document Detail',
                  style: FlutterFlowTheme.of(context).title3,
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
          children: [
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child:Container( height: 80, width: 80,
                            decoration: BoxDecoration(color: Color(0xFFFAEA48)),
                            child: (imageFile == null)
                                ? const Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            )
                                : SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Passport Size Photo',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  _showChoiceDialog(context, 0);
                                  _uploadDocuments.documentsUpload(imageFile!.path);

                                },

                                text: 'Choose Image',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFFAEA48),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.5,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                    ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:Container( height: 80, width: 80,
                      decoration: BoxDecoration(color: Color(0xFFFAEA48)),
                      child: (imageFile1 == null)
                          ? const Center(
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      )
                          : SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.file(
                          File(imageFile1!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Pan Card Photo',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  _showChoiceDialog(context, 1);
                                  print('Button pressed ...');
                                },
                                text: 'Choose Image',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFFAEA48),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.5,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child:Container( height: 80, width: 80,
                            decoration: BoxDecoration(color: Color(0xFFFAEA48)),
                            child: (imageFile2 == null)
                                ? const Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            )
                                : SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.file(
                                File(imageFile2!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(65, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Aadhar Card Front Side',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  _showChoiceDialog(context, 2);
                                  print('Button pressed ...');
                                },
                                text: 'Choose Image',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFFAEA48),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.5,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child:Container( height: 80, width: 80,
                            decoration: BoxDecoration(color: Color(0xFFFAEA48)),
                            child: (imageFile3 == null)
                                ? const Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            )
                                : SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.file(
                                File(imageFile3!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(65, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Aadhar Card Back Side',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  _showChoiceDialog(context, 3);
                                  print('Button pressed ...');
                                },
                                text: 'Choose Image',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFFAEA48),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.5,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child:Container( height: 80, width: 80,
                            decoration: BoxDecoration(color: Color(0xFFFAEA48)),
                            child: (imageFile4 == null)
                                ? const Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            )
                                : SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.file(
                                File(imageFile4!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(59, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Cancelled Cheque Photo',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () {
                                  _showChoiceDialog(context, 4);
                                  print('Button pressed ...');
                                },
                                text: 'Choose Image',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFFFAEA48),
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.5,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 20, 0, 20),
              child: FFButtonWidget(
                onPressed: () async {
                  if (formKey.currentState == null ||
                      !formKey.currentState!.validate()) {
                    return;
                  }
                  if (imageFile == null) {
                    return showSnackbar(
                        context, 'Please Upload Passport size photo..',
                        duration: 2);
                  }
                  if (imageFile1 == null) {
                    return showSnackbar(context, 'Please Upload Pan card photo..',
                        duration: 2);
                  }
                  if (imageFile2 == null) {
                    return showSnackbar(context, 'Please Upload Adharcard front side..',
                        duration: 2);
                  }
                  if (imageFile3 == null) {
                    return showSnackbar(context, 'Please Upload Adharcard back side..',
                        duration: 2);
                  }
                  if (imageFile4 == null) {
                    return showSnackbar(context, 'Please Upload Cancle Cheque photo..',
                        duration: 2);
                  }

                  await sendDocumentsDetails(context);
                },
                text: 'REGISTER NOW',
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

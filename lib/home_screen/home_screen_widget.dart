import 'package:carousel_slider/carousel_slider.dart';
import 'package:pmyl/backend/banner_service.dart';
import '../a_p_lpage/personalDetails_screen.dart';
import '../about_us/about_us_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../loan_history/loan_history_widget.dart';
import '../privacy_policy_copy/privacy_policy_copy_widget.dart';
import '../register_user/register_user_widget.dart';
import '../track_application/track_application_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    Key? key,
    this.images,
    this.tittle,
  }) : super(key: key);

  final String? images;
  final String? tittle;

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final SharedPreferences pref;
  String? name = "";
  String? mobile = "";
  final BannerService _bannnerService = BannerService();
  List<dynamic> imageList = [];
  Map<String, dynamic> images = {};

  @override
  void initState() {

    _bannnerService.getAllBanner().then((image) {
      setState(() {
        imageList = image;
      });
    });
    super.initState();
    _getname();
  }

  @override
 Future _getname() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState((){
    name = pref.getString('name');
    print(name);
    mobile = pref.getString('contactNo');
    print(mobile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFAEA48),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          'Home',
          style: FlutterFlowTheme
              .of(context)
              .title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme
          .of(context)
          .primaryBtnText,
      drawer: Container(
        width: 220,
        child: Drawer(
          elevation: 20,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 220,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Color(0xFFFAEA48),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 25, 0, 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.8, -0.35),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 40, 0, 0),
                                    child: Text("$name",
                                      style: FlutterFlowTheme
                                          .of(context)
                                          .bodyText1
                                          .override(
                                        fontFamily: 'Poppins',
                                        lineHeight: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.8, 0),
                            child: Text(
                              "$mobile",
                              style: FlutterFlowTheme
                                  .of(context)
                                  .bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(-0.7, -0.4),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreenWidget(),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.black,
                      size: 19,
                    ),
                    title: Text(
                      'Home',
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme
                          .of(context)
                          .bodyText1
                          .override(
                        fontFamily: 'Poppins',
                        lineHeight: 1.5,
                      ),
                    ),
                    tileColor: FlutterFlowTheme
                        .of(context)
                        .primaryBtnText,
                    dense: false,
                    contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackApplicationWidget(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.find_in_page,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Track Application',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      lineHeight: 1.5,
                    ),
                  ),
                  tileColor: FlutterFlowTheme
                      .of(context)
                      .primaryBtnText,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanHistoryWidget(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.history_rounded,
                    color: Colors.black,
                    size: 21,
                  ),
                  title: Text(
                    'Loan History',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      lineHeight: 1.5,
                    ),
                  ),
                  tileColor: FlutterFlowTheme
                      .of(context)
                      .primaryBtnText,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsWidget(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.info_sharp,
                    color: Colors.black,
                    size: 21,
                  ),
                  title: Text(
                    'About us',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      lineHeight: 1.5,
                    ),
                  ),
                  tileColor: FlutterFlowTheme
                      .of(context)
                      .primaryBtnText,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsWidget(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.chat_bubble_outlined,
                    color: Colors.black,
                    size: 21,
                  ),
                  title: Text(
                    'FAQs',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      lineHeight: 1.5,
                    ),
                  ),
                  tileColor: FlutterFlowTheme
                      .of(context)
                      .primaryBtnText,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyCopyWidget(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.live_help,
                    color: Colors.black,
                    size: 21,
                  ),
                  title: Text(
                    'Help',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      lineHeight: 1.5,
                    ),
                  ),
                  tileColor: FlutterFlowTheme
                      .of(context)
                      .primaryBtnText,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                ),
              ),
              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove("userid");
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterUserWidget(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.login_outlined,
                    color: Colors.black,
                    size: 21,
                  ),
                  title: Text(
                    'Logout',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme
                        .of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      lineHeight: 1.5,
                    ),
                  ),
                  tileColor: FlutterFlowTheme
                      .of(context)
                      .primaryBtnText,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 300,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      reverse: false,
                      aspectRatio: 5.0,
                    ),
                    itemBuilder: (context, i, id) {
                      //for onTap to redirect to another screen
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        //ClipRRect for image border radius
                        child: imageList.isEmpty
                            ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amberAccent,
                            ))
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            imageList[i]['url'],
                            width: 500,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => APLpageWidget(),
                        ),
                      );
                    },
                    text: 'APPLY FOR LOAN',
                    options: FFButtonOptions(
                      width: 300,
                      height: 40,
                      color: Color(0xFFFAEA48),
                      textStyle:
                      FlutterFlowTheme
                          .of(context)
                          .subtitle2
                          .override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.15, 0.2),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryBtnText,
                          ),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Text(
                              'Pradhan Mantri Mudra Yojana को बिना गारंटी का लोन कारोबार के लिए प्रदान करने के लिए आरंभ किया गया है। इस योजना के अंतर्गत तीन प्रकार के लोन मुहैया कराए जाते हैं जो कि शिशु मुद्रा लोन, किशोर मुद्रा लोन एवं तरुण मुद्रा लोन है। शिशु मुद्रा लोन के अंतर्गत ₹50000 तक का लोन मुहैया कराया जाता है। किशोर मुद्रा लोन के अंतर्गत ₹50000 से लेकर ₹500000 तक का लोन मुहैया कराया जाता एवं तरुण मुद्रा लोन के अंतर्गत ₹500000 से ₹1000000 तक का मुद्रा लोन उपलब्ध करवाया जाता है। इस योजना को 8 अप्रैल 2015 को आरंभ किया गया था। इस योजना के अंतर्गत कोई भी निश्चित ब्याज दर नहीं है। विभिन्न बैंकों द्वारा प्रधानमंत्री मुद्रा लोन योजना के अंतर्गत अलग-अलग ब्याज दर की वसूली की जाती है।',
                              style: FlutterFlowTheme
                                  .of(context)
                                  .bodyText1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

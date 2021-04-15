import 'package:alu_express_student/ui_screens/login_ui_screens/student_signup.dart';
import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// We can check if the user is logged in  or not and redirect to  the approp page.
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    // return (Scaffold(
    //     body: SingleChildScrollView(
    //   child: Align(
    //     child: Column(children: <Widget>[
    //       Padding(padding: EdgeInsets.only(top: 100)),
    //       SvgPicture.asset('assets/4.svg',
    //           height: displayHeight(context) * 0.4,
    //           width: displayWidth(context) * 0.3),
    //     ]),
    //   ),
    // )));
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bkg.jpg"),
            fit: BoxFit.cover,
          ),
        )),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white70.withOpacity(0.7),
            ],
            stops: [0.4, 1],
            begin: Alignment.topCenter,
          )),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.5,
          ),
          // left: displayWidth(context) * 0.05),
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: displayWidth(context) * 0.03)),
                    Text(
                      "Welcome to ",
                      style: GoogleFonts.ptSans(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 35,
                        letterSpacing: .3,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "ALU-Express, ",
                        style: GoogleFonts.ptSans(
                          color: Colors.red[900],
                          decoration: TextDecoration.none,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          letterSpacing: .3,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: displayWidth(context) * 0.04,
                          top: displayHeight(context) * 0.01),
                    ),
                    Text(
                      "Your number one Campus delivery point!",
                      style: GoogleFonts.ptSans(
                        color: Colors.black87,
                        fontSize: 18,
                        letterSpacing: .3,
                      ),
                    )
                  ],
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * 0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            primary: Colors.red[900]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentSignUp()),
                          );
                        },
                        child: Text(
                          'I am a Student',
                          style: GoogleFonts.ptSans(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          primary: Colors.amber,
                        ),
                        onPressed: () {},
                        child: Text(
                          'I am a Vendor',
                          style: GoogleFonts.ptSans(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: SizedBox(height: displayHeight(context) * 0.05)),
              ],
            ),
          ),
        )
      ],
    );
  }
}

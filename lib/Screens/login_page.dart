import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scmia_eprom/Data/dummy_data.dart';
import 'package:scmia_eprom/Screens/patient_questionnaire_screen.dart';
import 'package:scmia_eprom/Widgets/email_text_input.dart';
import 'package:scmia_eprom/Widgets/password_text_input.dart';
import 'package:scmia_eprom/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_gray,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: customAppBar(context),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(minWidth: 210, maxWidth: 450),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EmailTextInput(
                            controller: TextEditingController(),
                            hintText: "Username"),
                        SizedBox(height: 20),
                        PasswordTextInput(
                            controller: TextEditingController(),
                            hintText: "Password"),
                        SizedBox(height: 20),
                        loginButton(context)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      height: 60,
      child: FloatingActionButton.extended(
          backgroundColor: theme_dark,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientQuestionnaireScreen(
                        questions: questions, loginPageContext: context)));
          },
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Text("Log In"),
          )),
    );
  }

  Widget customAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        // Padding(
        //     padding: const EdgeInsets.only(right: 40),
        //     child: SizedBox(
        //         child: IconButton(
        //             iconSize: 24,
        //             splashRadius: 24,
        //             icon: Icon(Icons.remove, color: theme_dark, weight: 2),
        // onPressed: () => Navigator.pop(context))))
      ],
      shape: Border(bottom: BorderSide(color: border_gray, width: 1)),
      toolbarHeight: 100,
      backgroundColor: background_white,
      shadowColor: Colors.black,
      centerTitle: true,
      title: Text(
        "Sample ePROM",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(fontSize: 20, color: theme_dark),
      ),
    );
  }
}

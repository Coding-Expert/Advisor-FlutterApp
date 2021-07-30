import 'package:flutter/material.dart';
import '../helpers/app_config.dart' as config;

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF232121),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: config.App(context).appHeight(20),
              width: config.App(context).appWidth(100),
              decoration: BoxDecoration(
                color: Color(0xFF232121),
              ),
              child: Center(
                child: Text(
                  "privacy policy".toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(6),
            ),
            Container(
              color: Color(0xFF232121),
              width: config.App(context).appWidth(92),
              padding: EdgeInsets.symmetric(
                horizontal: config.App(context).appWidth(5),
                vertical: config.App(context).appHeight(3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Our Privacy Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "1.1 We are committed to safeguarding the privacy of our website & mobile app members",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "1.2 This policy applies where we are acting as a data controller with respect to the personal data of our website & mobile app visitors and service users; in other words, where we determine the purposes and means of the processing of that personal data.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "1.3 We use cookies on our website & mobile app. Insofar as those cookies are not strictly necessary for the provision of our website and mobile apps and services, we will ask you to consent to our use of cookies when you first visit our website or mobile app.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "1.4 Our website incorporates privacy controls which affect how we will process your personal data. By using the privacy controls, you can specify whether you would like to receive email newsletter communications.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "1.5 In this policy, “we”,”us” and “our” refer to The Client or DM Products.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(8),
                  ),
                  Text(
                    "2. How we use personal data",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "2.1 In this section 2 we have set out:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "a) the general categories of personal data that we may process;",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "b) the purposes for which we may process personal data; and",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "c) the legal bass of the processing",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "2.2 We may process data about your use of our website & mobile app. The usage data may include your IP address, geographical location, browser type and version, operating system, reference source, lengthy of visit, page views and website navigation paths as well as information about the timing, frequently and pattern of your service use. The source of the usage data is our analytics tracking system. This usage data may be processed for the purposes of analyzing the use of the website, mobile app and services. The legal basis for this processing is our legitimate interests, namely monitoring and improving our website, mobile app & services.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "2.3 We may process your account data. The account data may include your name and email address. The source of the account data is you. The account data may be processed for the purpose of operating our website and mobile apps, providing our services, ensuring the security of our website, mobile app and services, maintaining back-ups of our databases and communicating with you. The legal basis for this processing is consent.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "2.4 In addition to the specific purposes for which we may process your personal data set out in this section 2, we may also process any of your personal data where such processing is necessary for compliance with a legal obligation to which we are subject, or in order to protect your vital interests or the vital interests of another natural person.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(8),
                  ),
                  Text(
                    "3. Providing your personal data to others",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "3.1 In addition to the specific disclosures of personal data set out in this section 3, we may disclose your personal data where such disclosure is necessary for compliance with a legal obligation to which we are subject, or in order to protect your vital interests or the vital interests of another natural person. We may also disclose your personal data where such disclosure is necessary with such claims as liable, whether court proceedings or in an administrative or out-of-court procedure.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(8),
                  ),
                  Text(
                    "4. Retaining and deleting personal data",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "4.1 This section 4 sets out our data retention policies and procedure, which are designed to help ensure that we comply with our legal obligations in relation to the retention and deletion of personal data.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "4.2 Personal data that we process for any purpose or purposes shall not be kept longer than is necessary for that purpose or purposes.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "4.3 We will retain your personal data as follows:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "a) usage data will be retained for a minimum period of 1 year following your last visit to our website or mobile app, and for a maximum period of 6 years following your last visit to our website or mobile app; and",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "b) account data will be retained for a minimum period of 1 year following your last visit to our website or mobile app, and for a maximum period of 6 years following your last visit to our website or mobile app",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "4.4 In some cases it is not possible for us to specify in advance the periods for which your personal data will be retained. In such cases, we will determine the period of retention based on the following criteria:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "a) the period of retention of other data will be determined based on our legal obligations and legitimate business interest",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "4.5 Notwithstanding the other provisions of this section 4, we may retain your personal data where such retention is necessary for compliance with legal obligation to which we are subject, or in order to protect your vital interests or the vital interests of another natural person.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(8),
                  ),
                  Text(
                    "5. Security of personal data",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "5.1 We will take appropriate technical and organizational precautions to secure your personal data and prevent the loss, misuse or alteration of your personal data",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "5.2 We will store all of your personal data on secure servers, personal computers and mobile devices and in secure manual record-keeping systems.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "5.3 The following personal data will be stored by us in encrypted form: your password",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "5.4 Data that is sent from your web browser to our web server, or from our web server to your web browser, will be protected using encryption technology.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "5.5 You acknowledge that the transmission of unencrypted (or inadequately encrypted) data over the internet is inherently insecure, and we cannot guarantee the security of data sent over the internet.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "5.6 You should ensure that your password is not susceptible to being guessed, whether by a person or a computer program. You are responsible for keeping the password you use for accessing our website and mobile apps confidential and we will not ask you for your password (except when you log in to our website or mobile app)",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "6. Amendments",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "6.1 We may update this policy from time to time by publishing a new version on our website or app",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "6.2 You should check this page occasionally to ensure you are happy with any changes to the policy.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "7. Your rights",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.1 In this section 7, we have summarized the rights that you have under data protection law. Some of the rights are complex, and not all of the details have been included in our summaries. Accordingly, you should read the relevant laws and guidance from the regulatory authorities for a full explanation of these rights.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.2 Your principal rights under data protection law are:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "a) the right to access;",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "b) the right to rectification",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "c) the right to erasure;",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "d) the right to restrict processing",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "e) the right to object processing",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "f) the right to data portability",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "g) the right to complain to a supervisory authority; and",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "h) the right to withdraw consent",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.3 You have the right to confirmation as to whether or now we process your personal data and, where we do, access to the personal data, together with certain additional information. That additional information includes details of the purposes of the processing, the categories of personal data concerned and the recipients of the personal data. Providing the rights and freedoms of others are not affected, we will supply to you a copy of your personal data. The first copy will be provided free of charge, but additional copies may be subject to a reasonable fee.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.4 You have the right to have any inaccurate personal data about you rectified and, taking into account the purposes of the processing, to have any incomplete personal data about you completed.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.5 In some circumstances you have the right to the erasure of your personal data without undue delay. Those circumstances include: the personal data are no longer necessary in relation to the purposes for which they were collected or otherwise processed; you withdraw consent to the consent-based processing; you object to the processing under certain rules of the applicable data protection law; the processing is for the direct marketing purposes; and the personal data have been unlawfully processed. However, there are exclusions of the right to erasure. The general exclusions include where processing is necessary; for exercising the right of freedom of expression and information; for compliance with a legal obligation; or for the establishment, exercise or defense of legal claims.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.6 In some circumstances you have the right to restrict the processing of your personal data. Those circumstances are; you contest the accuracy of the personal data; processing is unlawful but you oppose erasure’ we no longer need the personal data for the purposes of our processing, but you require personal data for the establishment, exercise or defense of legal claims, and you have objected to processing, pending the verification of that objection. Where processing has been restricted on this basis, we may continue to store your personal data. However, we will only otherwise process it; with your consent; for the establishment, exercise or defense of legal claims; for the protection of the rights of another natural or legal person; or for reasons of important public interests.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.7 You have the right to object to our processing of your personal data on the grounds of relating to your particular situation, but only to extent of that the legal basis for the processing is that the processing is necessary for: the performance of a task carried out in the public interest or in the exercise of any official authority vested in us; or the purposes of the legitimate interests pursued by us or by a third party. If you make such an objection, we ill cease to process the personal information unless we can demonstrate compelling legitimate grounds for the processing which override your interests, rights and freedoms, or the processing is for the establishment, exercise or defense of legal claims.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.8 To the extent that the legal basis for our processing of your personal data is:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "a) consent; or",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "b) that the processing is necessary for the performance of a contract to which you are party or in order to take steps at your request prior to entering into a contract,and such processing is carried out by automated means, you have the right to receive your personal data from us in a structured, commonly used an machine-readable format. However, this right does not apply where it would adversely affect the rights and freedoms of others.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.9 If you consider that our processing of your personal information infringes data protection laws, you have a legal right to lodge a complaint with a supervisory authority responsible for data protection.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.10 To the extent that the legal basis for our processing of your personal information is consent, you have the right to withdraw that consent at any time. Withdrawal will not affect the lawfulness of processing before the withdrawal",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "7.11 You may exercise any of your rights in relation to your personal data by written notice to us, in addition to the other methods specified in this section 7.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "8. Our website and mobile app includes hyperlinks to, and details of, third party websites.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "8.1 We have no control over, and are not responsible for, the privacy policies and practices of third parties.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "9. Personal data of children",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "9.1 Our website, mobile app and services are geared towards adults over the age of 18.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "10. Updating information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "10.1 Please let us know if the personal information that we hold about you needs to be corrected or updated.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "11. About website and mobile app cookies",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "11.1 A cookie is a file containing an identifier a) a string of letters and numbers) that is sent by a web server to a web browser and is stored by the browser. The identifier is then sent back to the server each time the browser requests a page from the server.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "11.2 Cookies may be either “persistent” cookies or “session” cookies: a persistent cookie will be stored by a web browser and will remain valid until its set expiry date, unless deleted by the user before the expiry date’ a session cookie, on the other hand, will expire at the end of the user session, when the web browser is closed.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "11.3 Cookies do not typically contain any information that personally identifies a user, but personal information that we store about you may be linked to the information stored in and obtained from cookies.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "12. Website and mobile app cookies that we use",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "12.1 We use cookies for the following purposes:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "a) authentication – we use cookies to identify you when you visit our website and mobile app and you navigate our website and mobile app",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "b) status – we use cookies to help us to determine if you are logged into our website or mobile app",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "c) security – we use cookies as an element of the security measures use to protect user accounts, including preventing fraudulent use of login credentials, and to protect our website, mobile app and service generally",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "d) translation – we use cookies to store language settings",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "e) support- we use cookies to manage your use of our support center and ticket system",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "13. Cookies used by our members",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "13.1 Our members use cookies and those cookies may be stored on your computer or phone when you visit our website or use our mobile app.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "13.2 We use Google Analytics to analyze the use of our website and mobile app. This service uses cookies for gathering information about website and mobile app use by means of cookies. The information gathered relating to our website and mobile app is used to create reports about the use of our website and mobile app.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "14. Managing cookies",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "14.1 Most browsers allow you to refuse to accept cookies and to delete cookies. The methods for doing so vary from browser to browser, and from version to version.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "14.2 Blocking cookies will have a negative impact upon the usability of many websites and mobile apps.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "14.3 If you block cookies, you will not be able to use all of the features on our website and mobile app.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "15. Logging of website and mobile app searches for phone numbers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "15.1 We do not log website or mobile app searches for phone numbers",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "16. Mobile apps",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "16.1 Our Google app requests access to your incoming and outgoing call/SMS lists and the ‘draw over apps’ permission. This is for the purposes of providing the automatic call and SMS screening and pop up alerts feature of our Google app. The app sends the phone number of all incoming and outgoing calls and incoming SMS to us. Our system then check if that phone number is listed in our database. We return the result of the query to the ap, which then provides you the pop up alert advising you of the result of the check. During this process we do not log your phone number or the phone number being checked against our database. In the Client app “settings” section you can seitch off call/SMS screening if you do not want to use this part of the service. You may also disallow the Client app access to the your incoming and outgoing call/SMS list and the ‘Draw over other apps’ permission, then the app will not be able to provide you with the pop up alerts.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "17. Our Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "17.1 This website and our mobile app are owned and operated by DM Products",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "17.2 We are registered in the United States",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "17.3 You can contact us by using our contact form",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(8),
            ),
          ],
        ),
      ),
    );
  }
}

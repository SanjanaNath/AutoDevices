import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                // margin: const EdgeInsets.only(top: 40),
                // color: Colors.amber,
                // height: 30,
                // width: 100,
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 40),
                ),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(
                'Privacy Policy                                                                  _________________ ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  // decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: const Text(
                """
         
        
            
All TMS products are owned and operated by Tetrahedron Manufacturing Services Pvt. Ltd. and will be referred to as "we", "our" and "us" in this Privacy Policy. By using TMS products which includes website,and TMS app you agree to the Internet Privacy Policy of website ("the Website"), and privacy policy of all TMS products.
            
At Tetrahedron Manufacturing Services Pvt. Ltd. we are committed to safeguarding the privacy of our users. We take your privacy very seriously and it is important to us that you can use and enjoy our Website without having to compromise your privacy in any way. The Privacy Policy relates to the collection and use of personal information you may supply to us while using our products.
          
This Privacy Policy is in addition to any other terms and conditions applicable to TMS products. Except as otherwise contemplated in this Privacy Policy, we do not disclose any personally identifiable information about you to any third party without your permission. This Privacy Policy should be reviewed periodically so that you become aware of any changes.
            
        """,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 3.0,
                  color: Colors.black,
                ),
                // textAlign: TextAlign.left,
              ),
            ),
            Container(
              // height: 2,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                """How we may collect or receive personal data from you
_______________""",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                """TMS may collect or receive your personal data from you through your use of TMS products in various ways. You may choose to submit your personal data and other information to us through various communication channels provided by TMS products including the Website, for example, form submissions, chat submissions, blog subscription, emails, calls etc. We may use cookies or similar technologies that collect certain Website usage information when you access, view and use the Website.""",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  // fontStyle: FontStyle.italic,
                  color: Colors.black,
                  // letterSpacing: 2.0,
                  wordSpacing: 3.0,
                  // decoration: TextDecoration.underline,
                  // decorationColor: Colors.red,
                  // decorationStyle: TextDecorationStyle.wavy,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                """The types of personal data/sensitive personal data we may collect We may collect
_______________""",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                """	
• Name and phone number
        
• Your pincode
        
• Contact information including email address
        
• Your date of birth
        
• Your gender
        
• Demographic information such as pincode, preferences and interests
        
• Your financial information such as bank account information or credit card or debit card or other payment instrument details
Internet protocol address
        
• Any other items of "sensitive personal data or information" as such term is defined under the Information Technology (Reasonable Security Practices And Procedures And Sensitive Personal Data Of Information) Rules, 2011 enacted under the Information Technology Act, 2000.
        
• Identification code of your communication device which you use to access TMS products or otherwise deal with TMS
        
• Other information relevant to customer surveys and/or offers
        
• Phone contacts information like name, address, email, phone number, instant messenger information and organization.
        
        """,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 3.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 100),
              alignment: Alignment.bottomLeft,
              child: const Text(
                """How we may use the data we collect
_______________
        
        """,
                style: TextStyle(
                  fontSize: 20,
                  //  wordSpacing: 3.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 100),
              child: const Text(
                """We may use the information obtained from you for the following purposes:
        
• Processing your requests / inquiries
        
• Correspond with you
        
• To support products or services you have obtained from us
        
• Internal record keeping
        
• Improvement of our products and services
        
• To conduct analysis of data
        
• Marketing purposes to send periodic promotional emails about new products, special offers or other information of interest to you. We may contact you by email or phone for the same
        
• For proper administering of TMS products
        
• To conduct internal reviews and data analysis for TMS products (e.g., to determine the number of visitors to specific pages within the Website)
        
• To conducting academic research and surveys
        
• To protect the integrity of the TMS products
        
• To implement information security practices
        
• To determine any security breaches, computer contaminant or computer virus
        
• To investigate, prevent, or take action regarding illegal activities and suspected fraud
        
• To undertake forensics of the concerned computer resource as a part of investigation or internal audit
        
• To trace computer resources or any person who may have contravened, or is suspected of having or being likely to contravene, any provision of law including the Information Technology Act, 2000 that is likely to have an adverse impact on the services provided on any Website or by TMS
        
• To enable a potential buyer or investor to evaluate the business of TMS
        
        
• Enable you to refer contacts for solar rooftops or other products offered by TMS and earn referral rewards if applicable Marketing purposes to send periodic promotional emails about new products, special offers or other information of interest to you and your contacts by email, SMS, phone or other communication channels.
        
        """,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 3.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 100),
              alignment: Alignment.centerLeft,
              child: const Text(
                """Security and access to information  _______________
        
        """,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 100),
              child: const Text(
                """TMS will endeavour to take all reasonable steps to ensure the security, integrity and the privacy of your personal data and sensitive personal data that you may submit to us while accessing the Website. At any instance you discover that the information that is held by us is incomplete or incorrect, you may contact us to have the same corrected.
        
        """,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 3.0,
                  color: Colors.black,
                  // wordSpacing: 4.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 250),
              alignment: Alignment.centerLeft,
              child: const Text(
                """Disclosure
_______________
        
        """,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 100),
              child: const Text(
                """Save alone cases wherein you have consented to or where disclosure is necessary to achieve the purpose for which it was submitted, TMS will not sell, rent or trade or publish your personal and sensitive data, except as required by law.
        """,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 3.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right:
              // ),
              alignment: Alignment.centerLeft,
              child: const Text(
                """Links to other Sites
_______________
        
        """,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 100),
              child: const Text(
                """You may come across links to third party websites, which are not under our control, and hence we cannot accept responsibility for the conduct of such other companies linked to the Website. Before disclosing your personal information on any other website, we advise you to examine the terms and conditions and privacy policies of such other websites.
        
        """,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 3.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // margin: EdgeInsets.only(right: 250),
              alignment: Alignment.centerLeft,
              child: const Text(
                """Contact Us
_______________
        
        """,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),

              // margin: EdgeInsets.only(right: 100),
              child: const Text(
                """If you have any questions about this Privacy Policy, please contact us using the contact information specified on www.tetrahedron.in
        
        """,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 3.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              // height: 100,
              padding: const EdgeInsets.only(bottom: 50, top: 20),
              alignment: Alignment.center,
              color: Colors.blueGrey.shade900,
              child: Column(
                children: [
                  const Text(
                    'follow us on',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.facebook,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            launchFacebookURL();
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.squareInstagram,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            launchInstagramURL();
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.linkedin,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            launchIinkedinURL();
                          },
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.globe,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            launchWebsiteURL();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Our office',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Address: G-7, near Hindi Khabar, G Block, Sector 63, Noida, Uttar Pradesh 201307',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    """By using this website, you agree to
our Terms of Use,Privacy Policy
Copyright © 2023 Tetrahedron Manufacturing Services Pvt Ltd.
All Rights Reserved""",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void launchFacebookURL() async {
    const url = 'https://m.facebook.com/TetrahedronManufacturingServices';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchInstagramURL() async {
    const url = 'https://instagram.com/tetrahedron_tms?igshid=MzRlODBiNWFlZA==';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchIinkedinURL() async {
    const url =
        'https://www.linkedin.com/company/tetrahedronmanufacturingservices/';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWebsiteURL() async {
    const url = 'https://www.tetrahedron.in/';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

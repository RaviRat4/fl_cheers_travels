import 'package:flutter/material.dart';

import '../footer.dart';
import '../header.dart';
import '../usb_section.dart';

class PrivacyPolicyContent extends StatelessWidget {
  const PrivacyPolicyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          HeaderSection(),
          _buildHeroBanner(context),
          UsbSection(),
          Center(
            child: Container(
              width: 1280,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PageTitle('Privacy Policy Statement'),
                  SizedBox(height: 16),
                  Paragraph(
                    'Cheers Travel Partners is registered under Akash Travels Pty Ltd (Akash Travel, we, our or us) '
                        'is an online and retail travel agent operating in New Zealand (NZBN 9429051128821).',
                  ),
                  Paragraph(
                    'Cheers Travel Partners under Akash Travel undertakes to use its best endeavors to safeguard the privacy and confidentiality of its users and your personal information.',
                  ),
                  Paragraph(
                    'Cheers Travel Partners under Akash Travels has created this Privacy Policy (our Policy, this policy) in order to demonstrate our firm’s commitment to your privacy.',
                  ),
                  Paragraph(
                    'The following discloses the information-gathering and dissemination practices for this web site.',
                  ),
                  Paragraph(
                    'If you have any queries concerning your personal information or any questions relating to how we use the information, please email ',
                    linkText: 'care@cheerstravel.co.nz',
                  ),

                  SectionTitle('What information do we gather?'),
                  Paragraph(
                    'When you register as a user or purchase any goods or services on the Cheers Travel website, we may collect the information necessary to provide the services required.',
                  ),
                  Paragraph(
                    'Such information would at the very least include your name, Phone number and an email address.',
                  ),
                  Paragraph(
                    'We will also collect information from you if you complete any other forms on our site or if you contact us with comments or specific requests either in person, by telephone, SMS, letter, facsimile, email or through interactive website activities such as, but not restricted to, Facebook, and Twitter.',
                  ),

                  SectionTitle('Use personal information for?'),
                  Paragraph(
                    'Should it be necessary to send your details to any carefully selected third parties when collecting or processing your information, we will provide you with details of these parties in advance.',
                  ),
                  Paragraph(
                    'We will also provide you with details of any other parties who wish to provide you with information and details of products and services relevant to your interests.',
                  ),
                  Paragraph(
                    'Any registration forms will give you the opportunity to opt out of receiving such information.',
                  ),
                  Paragraph(
                    'By law we are required to obtain your consent in the collection of sensitive information. We will assume that your consent has been given to the collection of all information that is supplied to Cheer Travel in accordance to this Privacy Policy, unless you state otherwise.',
                  ),
                  Paragraph(
                    'Cheers Travel Partners under Akash Travels at times will act as an agent for our wholesalers and providers for travel products and services. This means that Akash Travels may collect personal information about you on behalf of the parties for whom we act as agent, for their internal purposes.',
                  ),
                  Paragraph(
                    'Therefore, the consent to the collection of sensitive information under this Privacy Policy, applies equally to the parties for whom we act as agent, and whose products and services we sell. As we act as agent for a large number of companies, it is not possible for us to set out in this Privacy Policy how each of these companies will use your personal information individually.',
                  ),

                  SectionTitle('What other information should I know about my privacy?'),
                  Paragraph(
                    'Cheers Travel site contains links to other websites. Please note that when you click on one of these links, you are entering another website for which Cheers travels and Akash Travels has no responsibility.',
                  ),
                  Paragraph(
                    'We encourage you to read the privacy statements of all such sites, as their policies may be materially different from Akash Travels Privacy Policy.',
                  ),
                  Paragraph(
                    'You are solely responsible for maintaining the secrecy of your passwords and any account information. Please remain careful, responsible, and alert with this information, especially when you are online.',
                  ),
                  Paragraph(
                    'In addition to the circumstances described above, Cheers Travel Partners may disclose member information if required to do so by any law, court order, or request by any government or law enforcement authority; or in the good faith or belief that disclosure is otherwise necessary or advisable including, without limitation, to protect the rights or properties of Akash Travels Pty Ltd or when we have reason to believe that disclosing the information is necessary to identify, contact or bring legal action against someone who may be causing interference with our rights or properties, whether intentionally or otherwise, or when anyone else could be harmed by such activities.',
                  ),
                  Paragraph(
                    'Disclosure of member information by Cheers Travel Partners will be warranted but not limited to the enforcement of the Terms and Conditions, when Akash Travels PTY LTD is required to do so by law and in the defense of Akash Travels in any action or protection of property.',
                  ),

                  SectionTitle('Email messages:'),
                  Paragraph(
                    'If you decide that you would like to receive a weekly e-mail, you will receive a summary of Akash Travels news. It is possible that this will be sponsored by third parties, whose details may appear on the email.',
                  ),
                  Paragraph(
                    'To remove yourself from this email list at any time, simply click on the link provided at the bottom of the received email and follow the instructions to be removed from the database.',
                  ),

                  SectionTitle('Information to improve our site'),
                  Paragraph(
                    'We also collect information automatically about your visit to our site.',
                  ),
                  Paragraph(
                    'This information is used to help us with analyzing your browsing preferences so that we can regularly improve our website; identification of frAUD or error; developing, improving and marketing our travel products and services; analyzing trends in sales and travel activities; and to facilitate your participation in loyalty programs.',
                  ),

                  SectionTitle('Cookies'),
                  Paragraph(
                    'We may use cookies in components of the website to allow us to personalise our service to you.',
                  ),
                  Paragraph(
                    'If you do not want a cookie, you can always set your browser to deny it.',
                  ),

                  SectionTitle('Choice/opt-out'),
                  Paragraph(
                    'Should you no longer wish to receive information on promotions and services we think may be of interest to you, or to participate in market research, kindly email us at ',
                    linkText: 'care@cheerstravel.co.nz',
                  ),

                  SectionTitle('Changes to this policy'),
                  Paragraph(
                    'Any material changes in the way Cheers Travel Partners under Akash Travels uses personal information will be described in future versions of this Privacy Policy. We reserve the right to change our Policy at any time. Should a change occur, the amendment will be posted on our website.',
                  ),
                  Paragraph(
                    'You may submit any concerns regarding our Privacy Policy or privacy practices to ',
                    linkText: 'care@cheerstravel.co.nz',
                  ),
                ],
              ),
            ),
          ),
          FooterSection(),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  final String text;
  const PageTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class Paragraph extends StatelessWidget {
  final String text;
  final String? linkText;
  const Paragraph(this.text, {this.linkText, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 15.5, height: 1.5, color: Colors.black87);
    final linkStyle = textStyle.copyWith(color: Colors.blue, decoration: TextDecoration.underline);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: RichText(
        text: TextSpan(
          text: text,
          style: textStyle,
          children: linkText != null
              ? [
            TextSpan(text: ''),
            TextSpan(text: linkText, style: linkStyle),
          ]
              : [],
        ),
      ),
    );
  }
}
Widget _buildHeroBanner(context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  final isSmallScreen = screenWidth < 600;

  return Stack(
    children: [
      Image.asset(
        'assets/images/homebanner.jpg',
        width: double.infinity,
        height: screenHeight * 0.3,
        fit: BoxFit.cover,
      ),
      Container(
        width: double.infinity,
        height: screenHeight * 0.3,
        color: Colors.black.withOpacity(0.4),
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 16 : 40,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 28 : 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 0 : screenWidth * 0.2),
              child: Text(
                "Please read the following terms and conditions carefully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 16 : 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
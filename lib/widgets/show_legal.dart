import 'package:flutter/material.dart';

class ShowLegal extends StatelessWidget {
  const ShowLegal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 16.0),
          children: [
            TextSpan(
              text: 'Usage Terms\n\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            TextSpan(
              text: '1. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Work in Progress: This website, Applicant Oasis, is currently in development and is provided as a "beta" version for testing and evaluation purposes only. While we strive to ensure the accuracy and completeness of the information presented, users are advised that the content may be subject to change, errors, or omissions. ',
            ),
            TextSpan(
              text:
                  'Any and all use of this website, its content, and services should be independently verified.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  ' We do not guarantee the accuracy or functionality of the website during this phase.\n\n',
            ),
            TextSpan(
              text: '2. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Anonymous Analytics: By using Count, you consent to the collection of anonymous usage data for analytics purposes. This data will be used solely to improve the website\'s functionality, performance, and user experience. No personally identifiable information will be collected or shared without your explicit consent.\n\n',
            ),
            TextSpan(
              text: '3. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'No Warranties: The website and its content are provided "as is" without warranties of any kind, express or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, and non-infringement. ',
            ),
            TextSpan(
              text:
                  'We make no warranties or representations about the accuracy, reliability, or completeness of any information or functionality provided.\n\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '4. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Limitation of Liability: To the fullest extent permitted by law, Count and its author, Never Happy LTD., shall not be liable for any damages of any kind (including but not limited to direct, indirect, incidental, or consequential damages) arising out of or in connection with the use or inability to use the website, even if advised of the possibility of such damages.\n\n',
            ),
            TextSpan(
              text: '5. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'User Responsibility: Users are responsible for their own use of the website and any decisions or actions they take based on the information provided herein. We strongly recommend users consult professionals (legal, financial, technical, etc.) before relying on any information or features provided by the site.\n\n',
            ),
            TextSpan(
              text: '6. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Changes to the Website: As a beta platform, Count may undergo frequent updates and changes without prior notice. Features may be added, modified, or removed at any time. We are not obligated to provide continuous access to the website or any specific features during this phase.\n\n',
            ),
            TextSpan(
              text: '7. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Third-Party Links and Services: This website may contain links to third-party websites or services. We are not responsible for the content, privacy practices, or terms of use of any third-party sites or services. Your interaction with such sites is at your own risk.\n\n',
            ),
            TextSpan(
              text: '8. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'Jurisdiction: By using this website, you agree that any legal disputes arising out of or related to your use of the site will be governed by and construed in accordance with the laws of the State of Ohio, without regard to its conflict of law principles.\n\n',
            ),
          ],
        ),
      ),
    );
  }
}

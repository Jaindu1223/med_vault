import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'About MedVault!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'MedVault application aims to modernize the prescription process through a digital platform for doctors, '
                    'patients, and pharmacists. Key features include digitized prescriptions generated within the app, '
                    'easy prescription sharing, and real-time stock availability for pharmacies. '
                    'This innovation reduces errors and inefficiencies in healthcare. The app synchronizes '
                    'pharmaceutical availability in real-time, provides access to patient medical history for doctors, '
                    'and undergoes iterative updates based on user feedback to ensure it meets user needs effectively.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[900],
                ),
              ),
            ),


            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Our Team',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const TeamMember(
              name: 'Jaindu Gajanayake',
              levelOfStudy: 'L5 Undergraduate, UOW',
              image: 'lib/images/aboutus/jaindu.jpg',
            ),
            const TeamMember(
              name: 'Kalani Amanda',
              levelOfStudy: 'L5 Undergraduate, UOW',
              image: 'lib/images/aboutus/kalani.jpg',
            ),
            const TeamMember(
              name: 'Thihansa Akmeemana',
              levelOfStudy: 'L5 Undergraduate, UOW',
              image: 'lib/images/aboutus/thihansa.jpg',
            ),
            const TeamMember(
              name: 'Irushika De Silva',
              levelOfStudy: 'L5 Undergraduate, UOW',
              image: 'lib/images/aboutus/irushika.jpg',
            ),
            const TeamMember(
              name: 'Krishan Rupasinghe',
              levelOfStudy: 'L5 Undergraduate, UOW',
              image: 'lib/images/aboutus/krishan.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String levelOfStudy;
  final String image;

  const TeamMember({
    super.key,
    required this.name,
    required this.levelOfStudy,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 10.0),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            levelOfStudy,
            style: const TextStyle(
              fontSize: 14.0,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
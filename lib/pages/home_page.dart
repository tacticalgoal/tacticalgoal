import 'package:flutter/material.dart';
import 'package:futbolize/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icons/logo.png'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Home Page', style: TextStyle(fontSize: 0)),
            ),
            _buildSection('Matches'),
            _buildSection('Tournaments'),
            _buildSection('Clubs'),
            _buildProfileSection(),
            _buildSupportSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('$title $index'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection() {
    return Builder(
  builder: (context) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()), // Replace with your Profile Page
      );
    },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile'),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Username'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _profileStat('Matches', '0'),
                    _profileStat('G/A', '0'),
                    _profileStat('Rating', '0'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _profileStat(String label, String value) {
    return Column(
      children: [
        Text(value),
        Text(label),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Support'),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Need Help?'),
                SizedBox(height: 10),
                Text('Email us at support@futbolize.com'),
                Text('Call or WhatsApp at +92 xxx xxxxxxx'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            _buildFootballInfo(),
            _buildStatsSection(),
            _buildRecentMatches(),
            _buildYearlyOverview(),
            _buildBestAgainstTeam(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: Image.asset('assets/icons/messi.png').image,
          ),
          SizedBox(height: 10),
          Text('Username'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Profile ID'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFootballInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Club: XYZ FC'),
          Text('Tournament: ABC League'),
          Text('Position: Midfielder'),
          Row(
            children: [
              Text('Preferred Foot: Right'),
              Image.asset('assets/icons/right_foot.png', color: Colors.green, height: 10), // Highlighted foot
              Image.asset('assets/icons/left_foot.png', color: Colors.grey, height: 10),
              //Icon(Icons.directions_run, color: Colors.green) Highlighted foot
              //Icon(Icons.directions_run, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _profileStat('Attacking', '85'),
          _profileStat('Defending', '78'),
          _profileStat('G/A', '12'),
        ],
      ),
    );
  }

  Widget _buildRecentMatches() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Matches'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _matchResult('W', Colors.green),
              _matchResult('L', Colors.red),
              _matchResult('D', Colors.orangeAccent),
              _matchResult('W', Colors.green),
              _matchResult('L', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYearlyOverview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Yearly Overview'),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Performance Summary'),
          ),
        ],
      ),
    );
  }

  Widget _buildBestAgainstTeam() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Best Against Team', style: TextStyle(fontSize: 20, color: Colors.white)),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Top performances vs Opponents', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _matchResult(String result, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(result),
      ),
    );
  }

  Widget _profileStat(String label, String value) {
    return Column(
      children: [
        Text(value),
        Text(label),
      ],
    );
  }

}

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _selectedindex = 0;
    return Scaffold(
      backgroundColor: Color(0xFFF9F6FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with User Profile
            Container(
              padding: EdgeInsets.fromLTRB(24, 50, 24, 20),
              decoration: BoxDecoration(
                color: Color(0xFFD9B8FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, John Doe", // Replace with user's name
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/pic1.jpg'), // Replace with user's profile picture
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.card_giftcard, size: 16, color: Colors.purple),
                        SizedBox(width: 4),
                        Text(
                          "Rewards",
                          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Slider for Cards
            Container(
              height: 200, // Adjust height as needed
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCampaignCard("Share Your Food, Share Your Love", "Sadat Project"),
                  _buildCampaignCard("Support Local Farmers", "Farmers Initiative"),
                  _buildCampaignCard("Emergency Relief Fund", "Humanitarian Aid"),
                ],
              ),
            ),

            // Donation Balance
            Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Donation balance :", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Icon(Icons.attach_money, color: Colors.orange),
                          Text("\$215.00", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.add_circle, color: Colors.purple),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Action Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionCard(Icons.restaurant, "Donate Food"),
                  _buildActionCard(Icons.fastfood_outlined, "Request Food"),
                  _buildActionCard(Icons.delivery_dining, "NGO Agent"),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Latest Campaigns
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Latest Campaigns", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 10),
            _buildCampaignCard("Share Your Food, Share Your Love", "Sadat Project"),
            _buildCampaignCard("Support Local Farmers", "Farmers Initiative"),
            SizedBox(height: 20),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedindex,
          onTap: (index) {
            _onItemTapped(context, index);  // Pass context here
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Donation'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        )

    );
  }

  Widget _buildActionCard(IconData icon, String label) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Icon(icon, color: Colors.purple, size: 30),
                SizedBox(height: 6),
                Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCampaignCard(String title, String project) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/pic2.jpg'), // Replace with your image
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(project),
                        SizedBox(height: 6),
                        LinearProgressIndicator(value: 0.5, color: Colors.purple),
                        SizedBox(height: 4),
                        Text("Collected: \$180.00", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/Home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/donation');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/notification');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }

}

import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFFDC1F26),
        title: const Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              backgroundColor: Colors.white,
              radius: 18,
            ),
            SizedBox(width: 10),
            Text('JV ADMIN'),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('MF', style: TextStyle(color: Color(0xFFDC1F26))),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Panel Principal',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('Bienvenida, María Fernanda'),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                _buildSummaryCard(
                  'Ventas Hoy',
                  Icons.attach_money,
                  Colors.teal[200]!,
                ),
                _buildSummaryCard(
                  'Monturas',
                  Icons.remove_red_eye,
                  Colors.indigo[200]!,
                ),
                _buildSummaryCard(
                  'Proveedores',
                  Icons.local_shipping,
                  Colors.deepOrange[200]!,
                ),
                _buildSummaryCard(
                  'Stock Bajo',
                  Icons.report_problem,
                  Colors.amber[200]!,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Actividad Reciente',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 32, color: Colors.black54),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String text, String time, Color dotColor) {
    return ListTile(
      leading: Icon(Icons.circle, color: dotColor, size: 12),
      title: Text(text),
      subtitle: Text(time),
      contentPadding: EdgeInsets.zero,
    );
  }
}

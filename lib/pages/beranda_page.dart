import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("FitCek Fashion"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            MediaQuery.of(context).padding.top +
                kToolbarHeight +
                16, // top dinamis
            16,
            16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ================= REKOMENDASI FASHION =================
                const Text(
                  "Rekomendasi Fashion Hari Ini",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _rekomendasiCard(
                        "Streetwear Vibes",
                        "assets/images/streetwear.jpg",
                      ),
                      _rekomendasiCard(
                        "Office Formal",
                        "assets/images/formal.jpg",
                      ),
                      _rekomendasiCard(
                        "Korean Minimalist",
                        "assets/images/streetwear.jpg",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ================== KATEGORI BAJU ======================
                const Text(
                  "Kategori Fashion",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _kategoriChip("Casual", Icons.style),
                    _kategoriChip("Streetwear", Icons.directions_walk),
                    _kategoriChip("Formal", Icons.workspace_premium),
                    _kategoriChip("Vintage", Icons.timelapse),
                    _kategoriChip("Sporty", Icons.sports_basketball),
                    _kategoriChip("Minimalist", Icons.checkroom),
                  ],
                ),

                const SizedBox(height: 40),

                // ==================== CARD AJAKAN TANYA AI ===================
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bingung pilih outfit?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Gunakan AI untuk dapat rekomendasi fashion sesuai gaya kamu!",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/ai'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 25,
                          ),
                        ),
                        child: const Text(
                          "Tanya AI Sekarang",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= CARD REKOMENDASI =================
  Widget _rekomendasiCard(String title, String image) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // ================= CHIP KATEGORI =================
  Widget _kategoriChip(String label, IconData icon) {
    return Chip(
      backgroundColor: Colors.pinkAccent.withOpacity(0.2),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    );
  }
}

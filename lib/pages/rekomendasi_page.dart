import 'package:flutter/material.dart';

class RekomendasiPage extends StatefulWidget {
  const RekomendasiPage({super.key});

  @override
  State<RekomendasiPage> createState() => _RekomendasiPageState();
}

class _RekomendasiPageState extends State<RekomendasiPage> {
  String selectedGender = "All";

  final List<Map<String, dynamic>> items = [
    {
      "title": "Casual Streetwear",
      "img": "assets/images/streetwear.jpg",
      "gender": "Male",
    },
    {
      "title": "Office Formal",
      "img": "assets/images/formal.jpg",
      "gender": "Male",
    },
    {
      "title": "Minimalist Korean",
      "img": "assets/images/minimalis.jpg",
      "gender": "Male",
    },
    {
      "title": "Black & White Outfit",
      "img": "assets/images/blackwhite.jpg",
      "gender": "Male",
    },
    {
      "title": "Sporty Urban",
      "img": "assets/images/sportyurban.jpg",
      "gender": "Male",
    },
    {
      "title": "Vintage Brown Look",
      "img": "assets/images/vintagebrown.jpg",
      "gender": "Male",
    },
    {
      "title": "Hijab Casual",
      "img": "assets/images/hijabcasual.jpg",
      "gender": "Female",
    },
    {
      "title": "Skena Style",
      "img": "assets/images/ceweskena.jpg",
      "gender": "Female",
    },
    {
      "title": "Soft Girl",
      "img": "assets/images/softgirl.jpg",
      "gender": "Female",
    },
    {"title": "Y2K", "img": "assets/images/y2kgirl.jpg", "gender": "Female"},
    {
      "title": "Clean Look",
      "img": "assets/images/cleangirl.jpg",
      "gender": "Female",
    },
    {
      "title": "Old Money",
      "img": "assets/images/oldmoneygirl.jpg",
      "gender": "Female",
    },
    {
      "title": "Vintage Girly",
      "img": "assets/images/vintagegirly.jpg",
      "gender": "Female",
    },
    {
      "title": "Casual Chic",
      "img": "assets/images/casualchicgirl.jpg",
      "gender": "Female",
    },
    {
      "title": "Skena Style",
      "img": "assets/images/skenaunisex.jpg",
      "gender": "Unisex",
    },
    {
      "title": "Casual",
      "img": "assets/images/casualunisex.jpg",
      "gender": "Unisex",
    },
    {
      "title": "Vintage Retro",
      "img": "assets/images/vintageretrounisex.jpg",
      "gender": "Unisex",
    },
    {
      "title": "Formal",
      "img": "assets/images/formalunisex.jpg",
      "gender": "Unisex",
    },
    {
      "title": "Black & White",
      "img": "assets/images/blackwhiteunisex.jpg",
      "gender": "Unisex",
    },
    {
      "title": "Y2K Style",
      "img": "assets/images/y2kunisex.jpg",
      "gender": "Unisex",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter berdasarkan gender
    final filteredItems = selectedGender == "All"
        ? items
        : items.where((i) => i["gender"] == selectedGender).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Rekomendasi Fashion"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0F17), Color(0xFF1A1A27)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 90, left: 16, right: 16),
          child: Column(
            children: [
              // 🔹 Dropdown Filter Gender
              DropdownButtonFormField(
                value: selectedGender,
                dropdownColor: const Color(0xFF1A1A27),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Pilih Gender",
                  labelStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: "All", child: Text("Semua")),
                  DropdownMenuItem(value: "Male", child: Text("Cowo")),
                  DropdownMenuItem(value: "Female", child: Text("Cewe")),
                  DropdownMenuItem(value: "Unisex", child: Text("Unisex")),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // 🔹 Grid Koleksi Fashion
              Expanded(
                child: GridView.builder(
                  itemCount: filteredItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, i) {
                    return _fashionCard(
                      filteredItems[i]["title"],
                      filteredItems[i]["img"],
                      filteredItems[i]["gender"],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fashionCard(String title, String image, String gender) {
    return Container(
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
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        child: Text(
          "$title ($gender)",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

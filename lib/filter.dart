import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // variabel jarak dan harga
  double distance = 0;
  RangeValues priceRange = const RangeValues(200000, 700000);

  // variabel fitur hotel
  bool aula = false;
  bool gym = false;
  bool spa = false;
  bool kolamRenang = false;

  void resetFilter() {
    setState(() {
      distance = 0;
      priceRange = const RangeValues(200000, 700000);
      aula = gym = spa = kolamRenang = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("Filter",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Bagian atas: Bersihkan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Hotel Terdekat",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: resetFilter,
                  child: const Text("Bersihkan",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("Dalam meter"),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fitur Hotel
            const Text("Fitur Hotel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text(
                "Cari hotel dengan fitur lengkap sesuai kemauan anda!",
                style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 10),

            _buildFeature(Icons.meeting_room, "Aula", aula, (val) {
              setState(() => aula = val);
            }),
            _buildFeature(Icons.fitness_center, "Ruang Gym", gym, (val) {
              setState(() => gym = val);
            }),
            _buildFeature(Icons.spa, "Ruang Spa", spa, (val) {
              setState(() => spa = val);
            }),
            _buildFeature(Icons.pool, "Kolam Renang", kolamRenang, (val) {
              setState(() => kolamRenang = val);
            }),

            const Divider(height: 30, thickness: 1),

            // Jangkauan Harga
            const Text("Jangkauan Harga",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text(
                "Cari hotel dengan harga sesuai kemauan anda!",
                style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 8),
            Text(
                "Rp. ${priceRange.start.toStringAsFixed(0)} - Rp. ${priceRange.end.toStringAsFixed(0)}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 1000000,
              divisions: 100,
              activeColor: Colors.blue,
              labels: RangeLabels(
                "Rp ${priceRange.start.toStringAsFixed(0)}",
                "Rp ${priceRange.end.toStringAsFixed(0)}",
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  priceRange = values;
                });
              },
            ),
            const SizedBox(height: 30),

            // Tombol Filter
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              ),
              onPressed: () {
                // logika ketika tombol ditekan
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Filter diterapkan!")));
              },
              child: const Text("Filter",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(
      IconData icon, String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Icon(icon, size: 28),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 16)),
        ]),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
        )
      ],
    );
  }
}

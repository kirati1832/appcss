import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/staff.dart';
import '../../provider/staffprovider.dart';

class PersonnelScreen extends ConsumerWidget {
  const PersonnelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personnelAsync = ref.watch(personnelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("บุคลากร"),
        backgroundColor: Colors.blue.shade800,
        foregroundColor: Colors.white,
      ),
      body: personnelAsync.when(
        data: (personnelData) => _buildPersonnelTabs(personnelData, context),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("เกิดข้อผิดพลาด: $err")),
      ),
    );
  }

  /// ✅ UI แสดงบุคลากรเป็น TabBar
  Widget _buildPersonnelTabs(PersonnelData personnelData, BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: "อาจารย์"),
              Tab(text: "ผู้บริหารภาค"),
              Tab(text: "บุคลากรสนับสนุน"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildPersonnelGrid(personnelData.lecturers, context),
                _buildPersonnelGrid(personnelData.executives, context),
                _buildPersonnelGrid(personnelData.staff, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ UI สำหรับแสดงบุคลากรใน Grid
  Widget _buildPersonnelGrid(List<Personnel> personnelList, BuildContext context) {
    if (personnelList.isEmpty) {
      return const Center(child: Text("No data", style: TextStyle(fontSize: 18, color: Colors.grey)));
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: personnelList.length,
        itemBuilder: (context, index) {
          final person = personnelList[index];

          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonnelDetailScreen(person),
              ),
            ),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.blue.shade800,
              child: Column(
                children: [
                  Hero(
                    tag: person.name,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        person.image.isNotEmpty ? 'http://${person.image}' : "https://via.placeholder.com/150",
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      person.name.split(' ').first,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ✅ หน้าแสดงรายละเอียดบุคลากร
class PersonnelDetailScreen extends StatelessWidget {
  final Personnel person;

  const PersonnelDetailScreen(this.person, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> educationList = (person.education?.isNotEmpty ?? false) ? person.education!.split("|") : [];
    List<String> researchList = (person.research?.isNotEmpty ?? false) ? person.research!.split("|") : [];

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(width: double.infinity, height: 350, color: Colors.white),
                Hero(
                  tag: person.name,
                  child: Image.network(
                    person.image.isNotEmpty ? 'http://${person.image}' : "https://via.placeholder.com/150",
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => _buildErrorImage(),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(person.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    _buildInfoCard(icon: Icons.email, text: person.email, color: Colors.orange),
                    if (person.phone.isNotEmpty) _buildInfoCard(icon: Icons.phone, text: person.phone, color: Colors.green),
                    if (educationList.isNotEmpty) _buildSection("📘 วุฒิการศึกษา", educationList),
                    if (researchList.isNotEmpty) _buildSection("📑 ผลงานทางวิชาการ", researchList),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorImage() {
    return Container(
      width: double.infinity,
      height: 350,
      color: Colors.grey.shade300,
      child: const Icon(Icons.broken_image, size: 100, color: Colors.grey),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String text, required Color color}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, color: color, size: 28),
        title: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        ...items.map((item) => _buildListTile(Icons.book, item, Colors.purple)),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}

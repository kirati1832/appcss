import 'package:flutter/material.dart';
import 'detail_carousel_slide_detailpicture.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class CSGreen extends StatefulWidget {
  const CSGreen({super.key});

  @override
  State<CSGreen> createState() => _CSGreenState();
}

class _CSGreenState extends State<CSGreen> {
  final List<String> images = [
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/1_0.png",
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/2_0.png",
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/7%20policies.jpg",
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/Campaign_quit%20smoking.png",
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/Environmental%20goals.jpg",
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/dayhavethink.jpg",
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/policies_sci.jpg",
    "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/smoking.png",
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 233, 233),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: Column(
            children: [
              Image.network(
                "${dotenv.env['BASE_URL']}/DATA_From_chiab/Image/img/csgogreen/greenoffice.png",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'CS Green Office :',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '\t\tการดำเนินกิจกรรมต่าง ๆ ล้วนต้องใช้ทรัพยากร พลังงาน และก่อให้เกิดผลกระทบต่อสิ่งแวดล้อมทั้งขยะและน้ำเสีย รวมถึงการปล่อยก๊าซเรือนกระจก สู่ชั้นบรรยากาศอันเป็นสาเหตุหลักของการเปลี่ยนแปลงสภาพภูมิอากาศ (Climate Change) และปรากฏการณ์โลกร้อน(Global Warming) ที่กำลังกลายเป็นวิกฤติด้านสิ่งแวดล้อมที่สำคัญ และผลกระทบอย่างกว้างขวางในการดำเนินชีวิตของคนทั่วโลก',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Text(
                    '\t\t ภาควิชาวิทยาการคอมพิวเตอร์และสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ เป็นหน่วยงานที่สนับสนุนและส่งเสริมการดำเนินงานด้านการจัดการสำนักงานสีเขียว (Green Office) โดยมีการกำหนดเป็นค่านิยมของสำนัก คือ ริเริ่มสร้างสรรค์ มุ่งมั่นพัฒนา รักษาสิ่งแวดล้อม เพื่อมุ่งเน้นปรับเปลี่ยนพฤติกรรมและกระตุ้นการมีส่วนร่วมของบุคลากรภายในส่วนงาน ลดการใช้พลังงานและทรัพยากร ลดการเกิดของเสีย และมีการดำเนินการที่เป็นมิตรกับสิ่งแวดล้อม มีการจัดซื้อจัดจ้างสินค้าและบริการที่เป็นมิตรกับสิ่งแวดล้อม(Green Procurement) เพื่อช่วยลดการปล่อยก๊าซเรือนกระจกออกสู่บรรยากาศ และตอบสนองตามนโยบายของมหาวิทยาลัย คือ เป็นมหาวิทยาลัยแห่งการจัดการอย่างยั่งยืน',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Text(
                    '\t\t ปัจจุบันเกณฑ์การประเมินสำนักงานสีเขียว (Green Office) ประกอบด้วย 6 หมวด ดังนี้ หมวดที่ 1 นโยบายวางแผนการดำเนินงานและการปรับปรุงอย่างต่อเนื่อง หมวดที่ 2 การสื่อสารและสร้างจิตสำนึก หมวดที่ 3 การใช้ทรัพยากรและพลังงาน หมวดที่ 4 การจัดการของเสีย หมวดที่ 5 สภาพแวดล้อมและความปลอดภัย และหมวดที่ 6 การจัดซื้อและจัดจ้างโดยมีการนำเกณฑ์ดังกล่าวมาใช้ในสำนักงาน เพื่อปรับเปลี่ยนพฤติกรรมในสำนักงานเพื่อลดการใช้พลังงานและริเริ่มกิจกรรมที่เป็นมิตรกับสิ่งแวดล้อม เช่น ลดปริมาณขยะโดยการลดการใช้ การใช้ซ้ำ การนำกลับมาใช้ใหม่ การลดและเลิกใช้สารเคมีอันตราย รองรับการจัดซื้อจัดจ้างสินค้าและบริการที่เป็นมิตรกับสิ่งแวดล้อม(Green Procurement) เป็นต้น ส่งผลให้เกิดการลดการปล่อย Green House Gases (GHG) ในทุกภาคส่วน และตลอดห่วงโซ่การผลิตและการบริโภค นำไปสู่การผลิตและบริโภคที่เป็นมิตรกับสิ่งแวดล้อมอย่างยั่งยืน',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    'CS รณรงค์ลดโลกร้อนและรักษาสิ่งแวดล้อม',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

               DetailCarouselSlide(
                images: images,
              ),
              SizedBox(height: 100),

            ],
          ),
        ),
      ),
    );
  }
}

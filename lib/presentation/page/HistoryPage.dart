import 'package:flutter/material.dart';
import 'package:appcsall/presentation/widget/widget.dart';
List<Map<String, String>> historydata = [
  {
    'image': 'https://archives.lib.kmutnb.ac.th/files/original/0abe8a278abdde2bb04344d71c7f07b72116a68e.jpg',
    'year': 'พ.ศ. 2530',
    'article': 'ในปีพุทธศักราช 2530 ภาควิชาคณิตศาสตร์ ได้เปิดรับนักศึกษาระดับปริญญาตรี 4 ปี หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ประยุกต์เป็นรุ่นแรก',
  },
  {
    'image': 'https://archives.lib.kmutnb.ac.th/files/original/5e30ea0cdeb3a8f940f53e0b5c39c503d33ee10d.jpg',
    'year': 'พ.ศ. 2536',
    'article': 'ในปีพุทธศักราช 2536 เมื่อบุคลากรในด้านวิทยาการคอมพิวเตอร์มากขึ้น จึงได้แยกออกมาจากภาควิชาคณิตศาสตร์และวิทยาการคอมพิวเตอร์ ก่อตั้งเป็นภาควิชาวิทยาการคอมพิวเตอร์และสารสนเทศ และรับหลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ประยุกต์มาบริหารจัดการ และได้เปิดรับนักศึกษาในหลักสูตรดังต่อไปนี้เพิ่มเติม',
  },
  {
    'image': 'https://archives.lib.kmutnb.ac.th/files/original/d962fba2fd2d7a937a77778f72a4b0668d15fa16.jpg',
    'year': 'พ.ศ. 2537',
    'article': 'ปีพุทธศักราช 2537 เปิดรับนักศึกษาในหลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ (ต่อเนื่อง) และหยุดรับนักศึกษาในปีพุทธศักราช 2553',
  },
  {
    'image': 'https://archives.lib.kmutnb.ac.th/files/original/96158142a779d5a8d25eb46fb3d76c49f86403e5.jpg',
    'year': 'พ.ศ. 2546',
    'article': 'ปีพุทธศักราช 2546 เปิดรับนักศึกษาในหลักสูตรวิทยาศาสตรมหาบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ และมีการปรับปรุงเรื่อยมา ล่าสุดปรับปรุงปีพุทธศักราช 2562',
  },
  {
    'image': 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiQYISXmywZw5i_VuB0JHXrETXhq4D5YI8zyQOHzy2MASvT0ZwYrKpg_4wPJoVZRLwtRqnJhGz3vXvPt2fLU7c12PPLQ9aNix7eIEkGbIAe8Eh-iLxVXx_VnWKv4YiB0Pkd0OVQV5Dn4g4/s1600/1.JPG',
    'year': 'พ.ศ. 2554',
    'article': 'ปีพุทธศักราช 2554 เปิดรับนักศึกษาในหลักสูตรปรัชญาดุษฎีบัณฑิต สาขาวิชาวิทยาการคอมพิวเตอร์ และปรับปรุงในปีพุทธศักราช 2559',
  },
  {
    'image': 'https://lh5.googleusercontent.com/proxy/jcumltYtfncCIV67JtqH1sV3XUxLeT_XnuDTR6_zIK_UuvwjkDfy6QFi6BHjEedpffnBfZ-XWIs-NHPJaKC5vH0OxHjttAewjmF8c10O9kzAKkbNf1nX',
    'year': 'พ.ศ. 2559',
    'article': 'ปีพุทธศักราช 2559 ในภาคการศึกษาที่ 2 เปิดรับนักศึกษาในหลักสูตรวิทยาศาสตรมหาบัณฑิต สาขาวิชาวิศวกรรมซอฟต์แวร์ ซึ่งเป็นหลักสูตรใหม่',
  },
  {
    'image': 'https://www.kmutnb.ac.th/getattachment/life-in-the-university/bangkok/g.jpg.aspx',
    'year': 'ปัจุบัน',
    'article': 'ปัจจุบันภาควิชามีการเรียนการสอนใน 4 หลักสูตร สนับสนุนการเรียนการสอนให้มีความสามารถทั้งทฤษฎีและปฏิบัติ มีความร่วมมือกับหน่วยงานรัฐและเอกชน สนับสนุนการปฏิบัติงานสหกิจศึกษาทั้งในและต่างประเทศ',
  }
];
class Hitorymain extends StatelessWidget {
  const Hitorymain({super.key});

  @override
  Widget build(BuildContext context) {
    return History(imageData: historydata);
  }
}
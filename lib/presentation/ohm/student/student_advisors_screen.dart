import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StudentAdvisorsScreen extends StatelessWidget {
  StudentAdvisorsScreen({super.key});

  // รายการอาจารย์ที่ปรึกษา แบ่งตามปีการศึกษา
  final Map<String, List<Map<String, String>>> advisorsByYear = {
    "ปีการศึกษา 2567": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2567',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor67.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2567',
        'url': 'http://cs.kmutnb.ac.th/consult_master67.jsp',
      },
    ],
    "ปีการศึกษา 2566": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2566',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor66.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2566',
        'url': 'http://cs.kmutnb.ac.th/consult_master66.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาเอก ปี 2566',
        'url': 'http://cs.kmutnb.ac.th/consult_doctor66.jsp',
      },
    ],
    "ปีการศึกษา 2565": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2565',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor65.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2565',
        'url': 'http://cs.kmutnb.ac.th/consult_master65.jsp',
      },
    ],
    "ปีการศึกษา 2564": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2564',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor64.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2566',
        'url': 'http://cs.kmutnb.ac.th/consult_master64.jsp',
      },
    ],
    "ปีการศึกษา 2563": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2563',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor63.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2563',
        'url': 'http://cs.kmutnb.ac.th/consult_master63.jsp',
      },
    ],
    "ปีการศึกษา 2562": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2562',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor66.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2562',
        'url': 'http://cs.kmutnb.ac.th/consult_master66.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาเอก ปี 2562',
        'url': 'http://cs.kmutnb.ac.th/consult_doctor62.jsp',
      },
    ],
    "ปีการศึกษา 2561": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2561',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor61.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2561',
        'url': 'http://cs.kmutnb.ac.th/consult_master61.jsp',
      },
    ],
    "ปีการศึกษา 2560": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2560',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor60.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2560',
        'url': 'http://cs.kmutnb.ac.th/consult_master60.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาเอก ปี 2560',
        'url': 'http://cs.kmutnb.ac.th/consult_doctor60.jsp',
      },
    ],
    "ปีการศึกษา 2559": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2559',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor59.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาโท ปี 2559',
        'url': 'http://cs.kmutnb.ac.th/consult_master59.jsp',
      },
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาเอก ปี 2559',
        'url': 'http://cs.kmutnb.ac.th/consult_doctor59.jsp',
      },
    ],
    "ปีการศึกษา 2558": [
      {
        'title': 'ที่ปรึกษาหลักสูตรปริญญาตรี ปี 2558',
        'url': 'http://cs.kmutnb.ac.th/consult_bachelor58.jsp',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('อาจารย์ที่ปรึกษา'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: advisorsByYear.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header ของแต่ละปีการศึกษา
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    entry.key,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                // รายการที่ปรึกษาในแต่ละปี
                Column(
                  children: entry.value.map((advisor) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(
                          advisor['title']!,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.blue),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdvisorWebView(
                                      url: advisor['url']!,
                                      title: advisor['title']!)));
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AdvisorWebView extends StatefulWidget {
  final String url;
  final String title;

  const AdvisorWebView({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _AdvisorWebViewState createState() => _AdvisorWebViewState();
}

class _AdvisorWebViewState extends State<AdvisorWebView> {
  late final WebViewController _controller;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _progress = progress / 100;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          _progress < 1
              ? LinearProgressIndicator(
                  value: _progress,
                  color: Colors.blue,
                  backgroundColor: Colors.grey[200],
                )
              : Container(),
          Expanded(child: WebViewWidget(controller: _controller))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
class StudentAdvisorsScreen extends StatefulWidget {
  StudentAdvisorsScreen({super.key});

  @override
  _StudentAdvisorsScreenState createState() => _StudentAdvisorsScreenState();
}

class _StudentAdvisorsScreenState extends State<StudentAdvisorsScreen> {
  Map<String, dynamic> advisorsByYear = {};

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  Future<void> fetchJsonData() async {
    final response = await http.get(Uri.parse(
        '${dotenv.env['BASE_URL']}/Data_From_Chiab/json/advisorsbyyears.json'));
    if (response.statusCode == 200) {
      setState(() {
        advisorsByYear = json.decode(utf8.decode(response.bodyBytes));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 233, 233),
      appBar: AppBar(title: Text('อาจารย์ที่ปรึกษา'),backgroundColor: Colors.pink.shade700,foregroundColor: Colors.white,),
      body: advisorsByYear.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16.0),
              children: advisorsByYear.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(entry.key,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ),
                    Column(
                      children: (entry.value as List).map((advisor) {
                        return Card(
                          color: Colors.pink.shade100,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(advisor['title'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.arrow_forward_ios,
                                color: Colors.blue),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdvisorWebView(
                                        url: advisor['url'],
                                        title: advisor['title'])),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              }).toList(),
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
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              _progress = progress / 100;
            });
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            if (await _controller.canGoBack()) {
              _controller.goBack();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Column(
        children: [
          _progress < 1
              ? LinearProgressIndicator(value: _progress)
              : Container(),
          Expanded(child: WebViewWidget(controller: _controller))
        ],
      ),
    );
  }
}

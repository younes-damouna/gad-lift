import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/request.service.dart';
import 'package:mobile_app/helpers/models/request.model.dart';
import 'package:mobile_app/helpers/providers/request_provider.dart';
import 'package:mobile_app/widgets/app_bar.widget.dart';
import 'package:mobile_app/widgets/common/aler.widget.dart';
import 'package:mobile_app/widgets/common/request_button.dart';
import 'package:mobile_app/widgets/common/section_title.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  req() async {
    final response = await RequestService.getRequests();

    final req = Request.parseRequests(response['requests']);
    log('response $response');
    Provider.of<RequestProvider>(
      context,
      listen: false,
    ).getRequests(req);

    log('requests: ${response['requests']}');
  }

  @override
  // ignore: must_call_super
  initState() {
    super.initState();
    req();

    // ignore: avoid_print

    // print("initState Called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Settings'),
      backgroundColor: const Color(0xFFF3F1F1),
      body: Column(
        children: [
          Container(
            height: 500,
            decoration: const BoxDecoration(
              // color: Color.fromARGB(98, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xf1f1f1f1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            // height: 300,
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            child: ListView(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

                  // color: const Color.fromARGB(22, 22, 22, 22),
                  //  color: const Color(0x63FFFFFF),
                  // height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionTitle(title: 'Requests', size: 18),
                        ],
                      ),
                      SizedBox(
                        child: Consumer<RequestProvider>(
                          builder: (BuildContext context, req, Widget? child) {
                            if (req.requests.length > 0) {
                              return ListView.builder(
                                  itemCount: req.requests.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return RequestButton(
                                      text:
                                          '${req.requests[i].first_name} ${req.requests[i].last_name}',
                                      handlePress: () {
                                        log(req.requests[i].id);
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertMessage(
                                            handlePress: () async {
                                              final response = await RequestService
                                                  .acceptMember(
                                                      '${req.requests[i].id}');

                                              // final req = Request.parseRequests(
                                              //     response['requests']);
                                              // log('response $response');
                                              // Provider.of<RequestProvider>(
                                              //   context,
                                              //   listen: false,
                                              // ).getRequests(req);

                                              log('requests: $response');
                                            },
                                            request:
                                                '${req.requests[i].first_name} ${req.requests[i].last_name}',
                                          ),
                                        );
                                      },
                                    );
                                  });
                            } else {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: SectionTitle(
                                    title: 'You don\'t have new Requests!',
                                    size: 14),
                              );
                            }
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 2,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionTitle(title: 'Members', size: 18),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const Navigation(),
    );
  }
}

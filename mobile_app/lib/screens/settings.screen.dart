import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/api/services/family.service.dart';
import 'package:mobile_app/helpers/api/services/request.service.dart';
import 'package:mobile_app/helpers/models/member.model.dart';
import 'package:mobile_app/helpers/models/request.model.dart';
import 'package:mobile_app/helpers/providers/member_provider.dart';
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
  var parent = false;

  req() async {
    final response = await RequestService.getRequests();

    final req = Request.parseRequests(response['requests']);
    final members = Member.parseMembers(response['members']);
    log('response ${response['members']}');
    // ignore: use_build_context_synchronously
    Provider.of<RequestProvider>(
      context,
      listen: false,
    ).getRequests(req);

    // ignore: use_build_context_synchronously
    Provider.of<MemberProvider>(
      context,
      listen: false,
    ).getMembers(members);

    log('requests: ${response['requests']}');
    await isParent();
  }
  // ignore: prefer_typing_uninitialized_variables

  @override
  // ignore: must_call_super
  initState() {
    // parent=false;
    req();

    super.initState();

    // ignore: avoid_print

    // print("initState Called");
  }

  isParent() async {
    final checkParent = await FamilyService.checkIfParent();
    log('EXISTS ${checkParent['exists'] == true}');
    if (checkParent['exists'] == true) {
      setState(() {
        parent = true;
      });
    } else {
      setState(() {
        parent = false;
      });
    }
    print(parent);
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
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          parent?SectionTitle(title: 'Requests', size: 18):Container(),
                          parent?  TextButton(
                        onPressed: () {
                          // req();
                          Navigator.popAndPushNamed(context, '/login');
                        },
                        child: const Text('Log Out',style: TextStyle(color: Color.fromARGB(255, 184, 71, 63)),),
                      ):Container()
                        ],
                      ),
                      parent
                          ? SizedBox(
                              child: Consumer<RequestProvider>(
                                builder:
                                    (BuildContext context, req, Widget? child) {
                                  if (req.requests.isNotEmpty) {
                                    return ListView.builder(
                                        itemCount: req.requests.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, i) {
                                          return RequestButton(
                                            color: const Color.fromARGB(
                                                255, 158, 95, 95),
                                            text:
                                                '${req.requests[i].first_name} ${req.requests[i].last_name}',
                                            handlePress: () {
                                              log(req.requests[i].id);
                                              showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertMessage(
                                                  handlePress: () async {
                                                    req;

                                                    final response =
                                                        await RequestService
                                                            .acceptMember(req
                                                                .requests[i]
                                                                .id);

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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: SectionTitle(
                                          title:
                                              'You don\'t have new Requests!',
                                          size: 14),
                                    );
                                  }
                                },
                              ),
                            )
                          : Container(),
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
                      SizedBox(
                        child: Consumer<MemberProvider>(
                          builder:
                              (BuildContext context, member, Widget? child) {
                            if (member.members.isNotEmpty) {
                              return ListView.builder(
                                  itemCount: member.members.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return RequestButton(
                                      color: const Color.fromARGB(
                                          255, 95, 158, 104),
                                      text:
                                          '${member.members[i].first_name} ${member.members[i].last_name}',
                                      handlePress: () {
                                      
                                       
                                      },
                                    );
                                  });
                            } else {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: SectionTitle(
                                    title: 'There is no Members!', size: 14),
                              );
                            }
                          },
                        ),
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

import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/data/api/api_service.dart';
import 'package:valorant_app/data/model/agent_details_model.dart';
import 'package:valorant_app/fetch_state.dart';
import 'package:url_launcher/url_launcher.dart';

class AgentDetails extends StatefulWidget {
  final String agentId;

  const AgentDetails({super.key, required this.agentId});
  static const routeName = '/agent_details';

  @override
  AgentDetailsState createState() => AgentDetailsState();
}

class AgentDetailsState extends State<AgentDetails> {
  late FetchState _state;
  late Data _agents;
  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _state = FetchState.pending;
    _fetchAgentById();
  }

  void _fetchAgentById() async {
    try {
      final result = await apiService.getAgentsByID(widget.agentId);
      if (!mounted) return;
      setState(() {
        _state = FetchState.success;
        _agents = Data.fromJson(result);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _state = FetchState.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    if (_state == FetchState.success) {
      return AppBar(
        centerTitle: true,
        title: Text(
          _agents.displayName!,
          style: const TextStyle(
            color: secondaryColor,
            fontFamily: 'Tungsten-Bold',
            fontSize: 32,
          ),
        ),
      );
    }
    return AppBar(
      centerTitle: true,
      title: const Text(''),
    );
  }

  Widget _buildBody() {
    switch (_state) {
      case FetchState.success:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                _agents.displayIcon!,
                width: 200.0,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Agent Name',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              _agents.displayName!,
              style: const TextStyle(
                fontFamily: 'URW DIN W05 Medium',
                fontSize: 16,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Agent Role',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${_agents.role!.displayName!} ",
                  style: const TextStyle(
                    fontFamily: 'URW DIN W05 Medium',
                    fontSize: 16,
                    color: accentColor,
                  ),
                ),
                Image.network(
                  _agents.role!.displayIcon!,
                  width: 15,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Description',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _agents.description!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'URW DIN W05 Medium',
                  fontSize: 16,
                  color: accentColor,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            IconButton(
              onPressed: () {
                 launchURL("https://playvalorant.com/en-us/agents/${_agents.displayName}");
              },
              icon: const Icon(Icons.travel_explore,),
              iconSize: 35,
              color: primaryColor,
            ),
          ],
        );
      case FetchState.pending:
        return const Center(
          child: Image(
            image: AssetImage(
              'assets/images/pending-logo.png',
            ),
            width: 150,
          ),
        );
      case FetchState.error:
        return const Center(
          child: Image(
            image: AssetImage(
              'assets/images/error-logo.png',
            ),
            width: 150,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}

Future <void> launchURL(String url) async{
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
}

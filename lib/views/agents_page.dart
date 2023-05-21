import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/data/api/api_service.dart';
import 'package:valorant_app/data/model/agents.dart';
import 'package:valorant_app/fetch_state.dart';
import 'package:valorant_app/widgets/card_agents.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({Key? key}) : super(key: key);
  static const routeName = '/agents_page';

  @override
  AgentsPageState createState() => AgentsPageState();
}

class AgentsPageState extends State<AgentsPage> {
  late FetchState _state;
  late List<Data> _agents;
  late List<Role> _role;

  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _state = FetchState.pending;
    _agents = [];
    _fetchAllAgents();
  }

  void _fetchAllAgents() async {
    try {
      final result = await apiService.getAgentsList();
      if (!mounted) return;
      setState(() {
        _state = FetchState.success;
        _agents = result.map((e) => Data.fromJson(e)).toList();
        _role = result.map((e) => Role.fromJson(e)).toList();
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
    if (_state == FetchState.pending || _state == FetchState.error) {
      return Scaffold(
        backgroundColor: secondaryColor,
        appBar: _buildAppBar(context),
        body: _buildBody(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Select Your Agent!',
        style: TextStyle(
          color: secondaryColor,
          fontFamily: 'Tungsten-Bold',
          fontSize: 32,
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_state) {
      case FetchState.success:
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height) *
                2,
          ),
          itemCount: _agents.length,
          itemBuilder: (_, index) {
            Data agents = _agents[index];
            Role role = _role[index];
            return CardAgents(
              agents: agents,
              role: role,
            );
          },
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
            image: AssetImage('assets/images/error-logo.png'),
            width: 150,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}

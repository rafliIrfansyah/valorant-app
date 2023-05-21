import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/data/model/agents.dart';
import 'package:valorant_app/views/agent_details.dart';

class CardAgents extends StatelessWidget {
  final Data agents;
  final Role role;
  const CardAgents({super.key, required this.agents, required this.role});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AgentDetails(agentId: agents.uuid!)));
      },
      child: Card(
        color: secondaryColor,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                agents.displayIconSmall!,
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

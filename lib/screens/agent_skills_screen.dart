import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillSource {
  final String name;
  final String description;
  final String url;
  final IconData icon;

  const SkillSource({
    required this.name,
    required this.description,
    required this.url,
    required this.icon,
  });
}

class AgentSkill {
  final String name;
  final String description;
  final String category;
  final String sourceUrl;
  final List<String> tags;

  const AgentSkill({
    required this.name,
    required this.description,
    required this.category,
    required this.sourceUrl,
    required this.tags,
  });
}

const List<SkillSource> _skillSources = [
  SkillSource(
    name: 'Claude Agent Skills',
    description:
        'Official Anthropic documentation for agent skills — reusable, composable capabilities that extend Claude agents.',
    url: 'https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview',
    icon: Icons.psychology,
  ),
  SkillSource(
    name: 'AgentSkills.io',
    description:
        'A community-maintained catalog for discovering and sharing agent skills across providers.',
    url: 'https://agentskills.io/home',
    icon: Icons.hub,
  ),
  SkillSource(
    name: 'Awesome Agent Skills (VoltAgent)',
    description:
        'A curated GitHub list of open-source agent skills, tools, and integrations for building autonomous agents.',
    url: 'https://github.com/VoltAgent/awesome-agent-skills',
    icon: Icons.stars,
  ),
  SkillSource(
    name: 'Anthropic Skills (GitHub)',
    description:
        "Anthropic's official collection of pre-built skills and integrations for Claude-powered agents.",
    url: 'https://github.com/anthropics/skills',
    icon: Icons.science,
  ),
  SkillSource(
    name: 'Skills Directory',
    description:
        'A searchable directory of AI agent skills spanning multiple platforms and frameworks.',
    url: 'https://www.skillsdirectory.com/',
    icon: Icons.list_alt,
  ),
  SkillSource(
    name: 'OpenAI Codex Skills',
    description:
        'Developer reference for building and deploying skills for OpenAI Codex-powered agents.',
    url: 'https://developers.openai.com/codex/skills',
    icon: Icons.code,
  ),
];

const List<AgentSkill> _featuredSkills = [
  AgentSkill(
    name: 'Web Search',
    description: 'Enable agents to search the web and retrieve up-to-date information.',
    category: 'Information Retrieval',
    sourceUrl: 'https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview',
    tags: ['search', 'web', 'retrieval'],
  ),
  AgentSkill(
    name: 'Code Execution',
    description: 'Run code snippets in a sandboxed environment and return results.',
    category: 'Development',
    sourceUrl: 'https://github.com/anthropics/skills',
    tags: ['code', 'sandbox', 'execution'],
  ),
  AgentSkill(
    name: 'File I/O',
    description: 'Read and write files, parse documents, and manage local data.',
    category: 'Data Management',
    sourceUrl: 'https://github.com/VoltAgent/awesome-agent-skills',
    tags: ['files', 'documents', 'storage'],
  ),
  AgentSkill(
    name: 'Image Analysis',
    description: 'Analyze images, extract text via OCR, and describe visual content.',
    category: 'Vision',
    sourceUrl: 'https://agentskills.io/home',
    tags: ['image', 'vision', 'ocr'],
  ),
  AgentSkill(
    name: 'Calendar & Scheduling',
    description: 'Create, update, and query calendar events and meeting schedules.',
    category: 'Productivity',
    sourceUrl: 'https://www.skillsdirectory.com/',
    tags: ['calendar', 'scheduling', 'productivity'],
  ),
  AgentSkill(
    name: 'Database Query',
    description: 'Connect to databases and execute queries to retrieve or mutate records.',
    category: 'Data Management',
    sourceUrl: 'https://developers.openai.com/codex/skills',
    tags: ['database', 'sql', 'data'],
  ),
  AgentSkill(
    name: 'Email & Messaging',
    description: 'Send, receive, and summarize emails and chat messages.',
    category: 'Communication',
    sourceUrl: 'https://github.com/anthropics/skills',
    tags: ['email', 'messaging', 'communication'],
  ),
  AgentSkill(
    name: 'API Integration',
    description: 'Call external REST or GraphQL APIs and process their responses.',
    category: 'Integration',
    sourceUrl: 'https://github.com/VoltAgent/awesome-agent-skills',
    tags: ['api', 'rest', 'graphql', 'integration'],
  ),
  AgentSkill(
    name: 'Memory & Context',
    description: 'Store and retrieve information across conversations to maintain context.',
    category: 'Cognition',
    sourceUrl: 'https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview',
    tags: ['memory', 'context', 'persistence'],
  ),
  AgentSkill(
    name: 'Math & Computation',
    description: 'Perform complex mathematical calculations and symbolic reasoning.',
    category: 'Analysis',
    sourceUrl: 'https://agentskills.io/home',
    tags: ['math', 'computation', 'reasoning'],
  ),
];

class AgentSkillsScreen extends StatefulWidget {
  const AgentSkillsScreen({super.key});

  @override
  State<AgentSkillsScreen> createState() => _AgentSkillsScreenState();
}

class _AgentSkillsScreenState extends State<AgentSkillsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<String> get _categories {
    final cats = _featuredSkills.map((s) => s.category).toSet().toList()..sort();
    return cats;
  }

  List<AgentSkill> get _filteredSkills {
    return _featuredSkills.where((skill) {
      final matchesSearch = _searchQuery.isEmpty ||
          skill.name.toLowerCase().contains(_searchQuery) ||
          skill.description.toLowerCase().contains(_searchQuery) ||
          skill.tags.any((t) => t.contains(_searchQuery));
      final matchesCategory =
          _selectedCategory == null || skill.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open $url')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('Agent Skills'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.explore), text: 'Browse Skills'),
            Tab(icon: Icon(Icons.source), text: 'Sources'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSkillsBrowser(colorScheme),
          _buildSourcesList(colorScheme),
        ],
      ),
    );
  }

  Widget _buildSkillsBrowser(ColorScheme colorScheme) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search skills…',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    )
                  : null,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            ),
          ),
        ),
        SizedBox(
          height: 44,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FilterChip(
                  label: const Text('All'),
                  selected: _selectedCategory == null,
                  onSelected: (_) => setState(() => _selectedCategory = null),
                ),
              ),
              ..._categories.map(
                (cat) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(cat),
                    selected: _selectedCategory == cat,
                    onSelected: (_) => setState(
                      () => _selectedCategory = _selectedCategory == cat ? null : cat,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: _filteredSkills.isEmpty
              ? const Center(child: Text('No skills match your search.'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  itemCount: _filteredSkills.length,
                  itemBuilder: (context, index) =>
                      _buildSkillCard(_filteredSkills[index], colorScheme),
                ),
        ),
      ],
    );
  }

  Widget _buildSkillCard(AgentSkill skill, ColorScheme colorScheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _launchUrl(skill.sourceUrl),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      skill.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      skill.category,
                      style: TextStyle(
                        fontSize: 11,
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                skill.description,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: skill.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        labelStyle: const TextStyle(fontSize: 11),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.open_in_new, size: 14, color: colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(
                    'View source',
                    style: TextStyle(fontSize: 12, color: colorScheme.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSourcesList(ColorScheme colorScheme) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _skillSources.length,
      itemBuilder: (context, index) =>
          _buildSourceCard(_skillSources[index], colorScheme),
    );
  }

  Widget _buildSourceCard(SkillSource source, ColorScheme colorScheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _launchUrl(source.url),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(source.icon, color: colorScheme.primary, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      source.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      source.description,
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.link, size: 13, color: colorScheme.primary),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            source.url,
                            style: TextStyle(
                              fontSize: 11,
                              color: colorScheme.primary,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ExamplesScreen extends StatelessWidget {
  const ExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenUI Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExampleCard(
            context,
            title: 'Dynamic Form Generation',
            description:
                'AI can generate forms with various input fields based on your requirements',
            icon: Icons.edit_note,
            example: '''
Example prompt: "Create a contact form with name, email, and message fields"

The AI will generate:
- Text input for name
- Email input field
- Multi-line text area for message
- Submit button
''',
          ),
          const SizedBox(height: 16),
          _buildExampleCard(
            context,
            title: 'Product Browsing',
            description: 'Generate product cards and carousels dynamically',
            icon: Icons.shopping_cart,
            example: '''
Example prompt: "Show me a product card for a laptop"

The AI will generate:
- Product image placeholder
- Product name and description
- Price display
- Add to cart button
- Rating stars
''',
          ),
          const SizedBox(height: 16),
          _buildExampleCard(
            context,
            title: 'Travel Booking',
            description:
                'Create booking interfaces with date pickers and selection controls',
            icon: Icons.flight,
            example: '''
Example prompt: "Create a flight booking interface"

The AI will generate:
- Departure/arrival city selectors
- Date pickers for travel dates
- Passenger count slider
- Class selection dropdown
- Search flights button
''',
          ),
          const SizedBox(height: 16),
          _buildExampleCard(
            context,
            title: 'Data Visualization',
            description:
                'Generate charts and graphs based on data requirements',
            icon: Icons.bar_chart,
            example: '''
Example prompt: "Show me sales data for the last quarter"

The AI will generate:
- Chart/graph visualization
- Data summary cards
- Filter controls
- Export options
''',
          ),
          const SizedBox(height: 16),
          _buildExampleCard(
            context,
            title: 'Interactive Cards',
            description: 'Create various card layouts with dynamic content',
            icon: Icons.dashboard,
            example: '''
Example prompt: "Create a dashboard with status cards"

The AI will generate:
- Multiple information cards
- Status indicators
- Action buttons
- Responsive layout
''',
          ),
          const SizedBox(height: 24),
          Card(
            color: Theme.of(context).colorScheme.primary,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'How it Works',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'GenUI uses Google\'s Gemini AI to understand your requirements and dynamically generate Flutter UI components. The AI selects from a catalog of available widgets and assembles them into a functional interface.',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required String example,
  }) {
    return Card(
      elevation: 2,
      child: ExpansionTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(description),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Example Usage:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    example,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

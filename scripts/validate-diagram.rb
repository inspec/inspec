#!/usr/bin/env ruby
# frozen_string_literal: true

# validate-diagram.rb
# Validates ai-track-docs/architecture.mmd without requiring mmdc/Node.
#
# Checks:
#   1. File exists and is non-empty
#   2. Starts with a valid Mermaid graph directive
#   3. subgraph / end blocks are balanced
#   4. Minimum node and edge counts (proves diagram has real content)
#   5. All lib/ and inspec-bin/ paths cited in node labels exist on disk
#      (keeps the diagram honest as the codebase evolves)
#
# Exit 0 = all checks pass. Exit 1 = at least one failure.

DIAGRAM = File.join(__dir__, "../ai-track-docs/architecture.mmd")
REPO_ROOT = File.expand_path("..", __dir__)

PASS = "\e[32m✔\e[0m"
FAIL = "\e[31m✗\e[0m"
MIN_NODES = 10
MIN_EDGES = 10

failures = []

def check(label, failures)
  result = yield
  if result
    puts "#{"\e[32m✔\e[0m"} #{label}"
  else
    puts "#{"\e[31m✗\e[0m"} #{label}"
    failures << label
  end
end

puts "▶ Validating #{DIAGRAM.sub(REPO_ROOT + "/", "")}"
puts

unless File.exist?(DIAGRAM)
  puts "#{FAIL} Diagram file not found: #{DIAGRAM}"
  exit 1
end

content = File.read(DIAGRAM)
lines   = content.lines.map(&:rstrip)

# 1. Non-empty
check("File is non-empty", failures) { content.strip.length > 0 }

# 2. Starts with graph directive
check("Has Mermaid graph directive (graph TD / graph LR)", failures) do
  lines.any? { |l| l.strip.match?(/\Agraph\s+(TD|LR|TB|RL)\z/) }
end

# 3. subgraph / end balance
subgraph_count = lines.count { |l| l.strip.start_with?("subgraph ") }
end_count       = lines.count { |l| l.strip == "end" }
check("subgraph/end blocks are balanced (#{subgraph_count} subgraph, #{end_count} end)", failures) do
  subgraph_count == end_count
end

# 4. Node count (lines with a quoted label [...] or (...)  defining a node)
node_lines = lines.select { |l| l.strip.match?(/\A\w[\w\d]*\[/) }
check("At least #{MIN_NODES} labelled nodes (found #{node_lines.size})", failures) do
  node_lines.size >= MIN_NODES
end

# 5. Edge count (lines with --> or -.-> or ==>)
edge_lines = lines.select { |l| l.include?("-->") || l.include?("-.->") || l.include?("==>") }
check("At least #{MIN_EDGES} edges (found #{edge_lines.size})", failures) do
  edge_lines.size >= MIN_EDGES
end

# 6. Path existence — extract lib/ and inspec-bin/ paths from node labels
#    Matches patterns like: lib/inspec/foo.rb  or  lib/inspec/resources/
path_pattern = /\b((?:lib|inspec-bin)\/[^\s\n"\\]+)/
cited_paths  = content.scan(path_pattern).flatten.uniq.sort

missing = cited_paths.reject do |p|
  full = File.join(REPO_ROOT, p)
  File.exist?(full) || Dir.exist?(full)
end

if missing.empty?
  puts "#{PASS} All #{cited_paths.size} cited paths exist on disk"
else
  puts "#{FAIL} #{missing.size} cited path(s) not found on disk:"
  missing.each { |p| puts "       missing: #{p}" }
  failures << "cited paths exist on disk"
end

puts
if failures.empty?
  puts "─" * 40
  puts "All diagram checks passed"
  exit 0
else
  puts "─" * 40
  puts "#{failures.size} check(s) failed: #{failures.join(", ")}"
  exit 1
end

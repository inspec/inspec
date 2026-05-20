#!/usr/bin/env ruby
# frozen_string_literal: true

# Micro-benchmark for NginxConfig.parse
# Run: bundle exec ruby test/benchmarks/nginx_parser_bench.rb
#
# This measures wall-clock time for parsing a realistic nginx.conf fixture.
# Results are informational — use them to detect regressions, not as absolutes.

require "benchmark"
require_relative "../../lib/inspec/utils/nginx_parser"

FIXTURE = File.read(File.expand_path("../../fixtures/files/nginx.conf", __FILE__))
ITERATIONS = 1000

puts "NginxConfig.parse micro-benchmark"
puts "=" * 40
puts "Fixture: test/fixtures/files/nginx.conf (#{FIXTURE.lines.count} lines, #{FIXTURE.bytesize} bytes)"
puts "Iterations: #{ITERATIONS}"
puts

# Warmup (JIT, caches, etc.)
50.times { NginxConfig.parse(FIXTURE) }

# Timed run
times = Array.new(5) do
  GC.start
  t = Benchmark.realtime { ITERATIONS.times { NginxConfig.parse(FIXTURE) } }
  t * 1000 # convert to ms
end

mean = times.sum / times.size
min = times.min
max = times.max
stddev = Math.sqrt(times.map { |t| (t - mean)**2 }.sum / times.size)

puts "Results (#{ITERATIONS} iterations × 5 samples):"
puts "  Mean:   #{format('%.2f', mean)} ms"
puts "  Min:    #{format('%.2f', min)} ms"
puts "  Max:    #{format('%.2f', max)} ms"
puts "  Stddev: #{format('%.2f', stddev)} ms"
puts "  Per-parse: #{format('%.4f', mean / ITERATIONS)} ms"
puts
puts "Variance note: stddev/mean = #{format('%.1f', (stddev / mean) * 100)}%"
puts "  < 5% → stable; 5-15% → acceptable; > 15% → noisy environment"

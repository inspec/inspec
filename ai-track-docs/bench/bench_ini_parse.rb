# frozen_string_literal: true

# Micro-benchmark: Inspec::Resources::IniConfig#parse
#
# Measures the cost of parsing INI content via SimpleConfig across three
# realistic input sizes: tiny (fixture), medium (50 keys), large (500 keys).
#
# Run:
#   bundle exec ruby ai-track-docs/bench/bench_ini_parse.rb
#
# No external gems required — uses only Ruby stdlib Benchmark.

require "benchmark"
require_relative "../../lib/inspec/utils/simpleconfig"

# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------

TINY_INI = <<~INI
  # Tiny fixture — mirrors test/fixtures/files/rootwrap.conf (2 keys, 1 section)
  [DEFAULT]
  filters_path=/etc/cinder/rootwrap.d,/usr/share/cinder/rootwrap
  exec_dirs=/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin
INI

MEDIUM_INI = begin
  lines = ["[section_a]"]
  25.times { |i| lines << "key_#{i}=value_#{i}_#{"x" * 20}" }
  lines << "[section_b]"
  25.times { |i| lines << "key_#{i}=value_#{i}_#{"y" * 20}" }
  lines.join("\n")
end

LARGE_INI = begin
  lines = []
  10.times do |s|
    lines << "[section_#{s}]"
    50.times { |i| lines << "key_#{i}=value_#{i}_#{"z" * 40}" }
  end
  lines.join("\n")
end

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def parse(content)
  SimpleConfig.new(content).params
end

# Warm up — prevents first-call JIT / require overhead from skewing results.
3.times { parse(TINY_INI); parse(MEDIUM_INI); parse(LARGE_INI) }

ITERATIONS = (ENV["ITERATIONS"] || 5_000).to_i

puts
puts "=" * 60
puts "  Inspec::IniConfig#parse  —  micro-benchmark"
puts "  Ruby #{RUBY_VERSION}  |  iterations=#{ITERATIONS} each"
puts "=" * 60
puts

# ---------------------------------------------------------------------------
# Benchmark.bmbm: two-pass (rehearsal + measure) to account for GC pressure.
# ---------------------------------------------------------------------------
Benchmark.bmbm(20) do |x|
  x.report("tiny  (2 keys)   ") { ITERATIONS.times { parse(TINY_INI)   } }
  x.report("medium (50 keys) ") { ITERATIONS.times { parse(MEDIUM_INI) } }
  x.report("large  (500 keys)") { ITERATIONS.times { parse(LARGE_INI)  } }
end

# ---------------------------------------------------------------------------
# Per-call timing (wall clock, μs) across 10 independent runs → mean ± stddev
# ---------------------------------------------------------------------------
require "benchmark"

def sample_us(content, n: 10, iters: ITERATIONS)
  n.times.map do
    t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    iters.times { parse(content) }
    elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC) - t
    (elapsed / iters * 1_000_000).round(3) # μs per call
  end
end

def stats(samples)
  mean = samples.sum.fdiv(samples.size)
  variance = samples.sum { |s| (s - mean)**2 }.fdiv(samples.size)
  stddev = Math.sqrt(variance)
  min, max = samples.minmax
  { mean: mean.round(3), stddev: stddev.round(3), min: min, max: max }
end

puts
puts "-" * 60
puts "  Per-call wall-clock  (μs / call,  10 × #{ITERATIONS} iter runs)"
puts "-" * 60
printf "  %-26s  mean=%8s μs  stddev=%7s  min=%7s  max=%7s\n",
       "tiny  (2 keys)",
       *stats(sample_us(TINY_INI)).values_at(:mean, :stddev, :min, :max)
printf "  %-26s  mean=%8s μs  stddev=%7s  min=%7s  max=%7s\n",
       "medium (50 keys)",
       *stats(sample_us(MEDIUM_INI)).values_at(:mean, :stddev, :min, :max)
printf "  %-26s  mean=%8s μs  stddev=%7s  min=%7s  max=%7s\n",
       "large  (500 keys)",
       *stats(sample_us(LARGE_INI)).values_at(:mean, :stddev, :min, :max)
puts

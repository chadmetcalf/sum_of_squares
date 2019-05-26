require 'spec_helper'
require 'sum_of_squares'

# Try jit compiler
# https://github.com/at1as/rspec_jit
# bundle exec ruby --jit -Ilib -Ispec -rrspec/autorun spec/sum_of_squares_spec.rb

RSpec.describe "Ruby performance testing - sum of squares" do
  include RSpec::Benchmark::Matchers

  let(:values) { Array.new(32_000_000) { rand(100) } }

  subject { SumOfSquares.new }

  it 'results are the same' do
    skip
    values_sum = values.sum { |n| n*n }
    expect(subject.each(values)).to       eq(values_sum)
    expect(subject.for(values)).to        eq(values_sum)
    expect(subject.map_reduce(values)).to eq(values_sum)
    expect(subject.reduce(values)).to     eq(values_sum)
    expect(subject.sum(values)).to        eq(values_sum)
  end

  it 'each' do
    skip
    expect { subject.each(values) }.to perform_under(0.1).sec
  end

  it 'for' do
    skip
    expect { subject.for(values) }.to perform_under(0.1).sec
  end

  it 'map_reduce' do
    skip
    expect { subject.map_reduce(values) }.to perform_under(0.1).sec
  end

  it 'reduce' do
    skip
    expect { subject.reduce(values) }.to perform_under(0.1).sec
  end

  it 'sum' do
    expect { subject.sum(values) }
      .to perform_under(0.1).sec
      .warmup(2)
      .sample(5)
  end

  it 'sum is faster than each' do
    skip
    expect { subject.sum(values) }
    .to perform_faster_than { subject.each(values) }
  end

  it 'sum is faster than for' do
    skip
    expect { subject.sum(values) }
    .to perform_faster_than { subject.for(values) }
  end

  it 'sum is faster than map_reduce' do
    skip
    expect { subject.sum(values) }
    .to perform_faster_than { subject.map_reduce(values) }
  end

  it 'sum is faster than reduce' do
    skip
    expect { subject.sum(values) }
      .to perform_faster_than { subject.reduce(values) }
  end
end

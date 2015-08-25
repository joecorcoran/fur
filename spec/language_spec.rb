require 'spec_helper'
require_relative '../lib/fur'

describe Fur do
  context 'literals' do
    specify 'boolean' do
      expect(Fur(%q{#t})).to eq true
      expect(Fur(%q{#f})).to eq false
    end

    specify 'integer' do
      expect(Fur(%q{1000})).to eq 1000
      expect(Fur(%q{0010})).to eq 10
    end

    specify 'string' do
      expect(Fur(%q{"un saludo"})).to eq "un saludo"
    end
  end

  context 'expressions' do
    specify 'separated by line breaks' do
      input = <<-fur
        1
        2
      fur
      expect(Fur(input)).to eq 2
    end

    specify 'separated by semicolons' do
      input = <<-fur
        1; 2
      fur
      expect(Fur(input)).to eq 2
    end

    specify 'separated by parentheses' do
      input = <<-fur
        1 (2)
      fur
      expect(Fur(input)).to eq 2
    end
  end

  context 'functions' do
    specify 'without params' do
      input = <<-fur
        greeting { "hello, world!" }
        greeting!
      fur
      expect(Fur(input)).to eq "hello, world!"
    end

    specify 'with param' do
      input = <<-fur
        id a:int { a }
        id 100!
      fur
      expect(Fur(input)).to eq 100
    end

    specify 'with incorrect param type' do
      input = <<-fur
        id x:int { x }
        id "oops"!
      fur
      expect { Fur(input) }.to raise_error(Fur::Runtime::TypeError)
    end

    specify 'return result of last expression' do
      input = <<-fur
        numbers {
          100
          200
        }
        numbers!
      fur
      expect(Fur(input)).to eq 200
    end

    specify 'nested functions' do
      input = <<-fur
        one a:str {
          two b:str { b }
          two a!
        }
        one "nested"!
      fur
      expect(Fur(input)).to eq "nested"
    end

    specify 'passing a named function as an argument' do
      input = <<-fur
        one { 1 }
        two a:fun { a! }
        two one!
      fur
      expect(Fur(input)).to eq 1
    end

    specify 'passing an anonymous function as an argument' do
      input = <<-fur
        run a:fun { a "executed"! }
        run -> b:str { b }!
      fur
      expect(Fur(input)).to eq "executed"
    end

    specify 'passing an expression as an argument' do
      input = <<-fur
        yes { #t }
        agree a:bln { a }
        agree (yes!)!
      fur
      expect(Fur(input)).to eq true
    end
  end

  context 'stdlib' do
    context 'maths' do
      context 'equal' do
        specify { expect(Fur(%q{equal 1 1!})).to eq true }
        specify { expect(Fur(%q{equal 1 2!})).to eq false }
      end

      context 'lt' do
        specify { expect(Fur(%q{lt 1 2!})).to eq true }
        specify { expect(Fur(%q{lt 1 0!})).to eq false }
      end

      context 'gt' do
        specify { expect(Fur(%q{gt 2 1!})).to eq true }
        specify { expect(Fur(%q{gt 0 1!})).to eq false }
      end

      context 'lte' do
        specify { expect(Fur(%q{lte 1 2!})).to eq true }
        specify { expect(Fur(%q{lte 1 1!})).to eq true }
        specify { expect(Fur(%q{lte 1 0!})).to eq false }
      end

      context 'gte' do
        specify { expect(Fur(%q{gte 2 1!})).to eq true }
        specify { expect(Fur(%q{gte 1 1!})).to eq true }
        specify { expect(Fur(%q{gte 0 1!})).to eq false }
      end

      specify('add')      { expect(Fur(%q{add 1 2!})).to eq 3 }
      specify('subtract') { expect(Fur(%q{subtract 2 1!})).to eq 1 }
      specify('multiply') { expect(Fur(%q{multiply 2 2!})).to eq 4 }
      specify('divide')   { expect(Fur(%q{divide 4 2!})).to eq 2 }
    end
  end
end

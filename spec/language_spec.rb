require 'spec_helper'
require_relative '../lib/fur'

describe Fur do
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
        id x:int { x }
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

    specify 'passing a function as an argument' do
      input = <<-fur
        one { 1 }
        two a:fun { a! }
        two one!
      fur
      expect(Fur(input)).to eq 1
    end
  end

  context 'stdlib' do
    context 'maths' do
      specify('add')      { expect(Fur(%q{add 1 2!})).to eq 3 }
      specify('subtract') { expect(Fur(%q{subtract 2 1!})).to eq 1 }
      specify('multiply') { expect(Fur(%q{multiply 2 2!})).to eq 4 }
      specify('divide')   { expect(Fur(%q{divide 4 2!})).to eq 2 }
    end
  end
end

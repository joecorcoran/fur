require 'spec_helper'
require_relative '../lib/fur'

describe Fur do
  context 'functions' do
    specify 'without params' do
      input = <<-fur
        greeting { "hello, world!" }
        greeting!
      fur
      expect(Fur(input)).to eq "hello, world!"
    end

    specify 'with params' do
      input = <<-fur
        id x:int { x }
        id 100!
      fur
      expect(Fur(input)).to eq 100
    end

    specify 'return value is result of last expression' do
      input = <<-fur
        numbers {
          100
          200
        }
        numbers!
      fur
      expect(Fur(input)).to eq 200
    end

    specify 'expressions can separated with semicolons or line breaks' do
      input = <<-fur
        phrases {
          hi { "hello" }
          "goodbye"; hi!
        }
        phrases!
      fur
      expect(Fur(input)).to eq "hello"
    end
  end

  context 'library' do
    context 'maths' do
      specify('add')      { expect(Fur(%q{add 1 2!})).to eq 3 }
      specify('subtract') { expect(Fur(%q{subtract 2 1!})).to eq 1 }
      specify('multiply') { expect(Fur(%q{multiply 2 2!})).to eq 4 }
      specify('divide')   { expect(Fur(%q{divide 4 2!})).to eq 2 }
    end
  end
end

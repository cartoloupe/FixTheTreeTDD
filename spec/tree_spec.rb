require 'rspec'
require 'tree'
require 'pry'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  it 'should be a subclass of Tree' do
    expect(described_class < Tree).to eq true
  end

  subject do
    AppleTree.new
  end

  context 'when initialized' do

    it 'should start at 0 years of age' do
      expect(subject.age).to eq 0
    end

    it 'it can start at any year of age specified' do
      object = AppleTree.new(age: 100)
      expect(object.age).to eq 100
    end

    it 'should start with no apples on it' do
      expect(subject.apples).to eq 0
    end

  end


  describe '#age!' do
    it 'increases the age by 1' do
      subject.age!
      expect(subject.age).to eq 1
      subject.age!
      expect(subject.age).to eq 2
    end
  end

  describe '#add_apples' do
    it 'adds some amount apples' do
      subject.add_apples
      expect(subject.apples).to_not eq 0
    end
  end

  describe '#any_apples?' do
    it 'returns false when there are no apples' do
      subject.apples = 0
      expect(subject.any_apples?).to be_falsey
    end
    it 'returns true when there are apples' do
      subject.apples = 1
      expect(subject.any_apples?).to be_truthy
    end
  end

  describe '#pick_an_apple!' do
    it 'returns an apple if there are apples' do
      subject.apples = 4
      object = subject.pick_an_apple!
      expect(subject.apples).to eq 3
      expect(object).to be_an Apple
    end
    it 'eventually will lead to a NoApplesError message' do
      subject.apples = 4
      5.times do
        subject.pick_an_apple!
      end
      expect{ subject.pick_an_apple! }.to raise_error
    end
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end

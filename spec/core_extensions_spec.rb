require 'spec_helper'

describe Array do
  context '#all_empty?' do
    it 'returns true if all elements of the array are empty' do
      expect(['', '', ''].all_empty?).to be true
    end

    it 'returns false if some of the array elements are not empty' do
      expect([2, '', Object.new].all_empty?).to be false
    end

    it 'returns true for an empty array' do
      expect([].all_empty?).to be true
    end
  end

  context '#all_same?' do
    it 'returns true for an array of 3 Xs' do
      expect(['X', 'X', 'X'].all_same?).to be true
    end
  end
end

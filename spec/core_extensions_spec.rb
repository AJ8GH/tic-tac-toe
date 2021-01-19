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

    it 'returns false for a mixed array' do
      expect(['X', 'X', ''].all_same?).to be false
    end

    it 'returns true for an empty array' do
      expect([].all_same?).to be true
    end
  end

  context '#any_empty?' do
    it 'returns true for all empty array' do
      expect(['', [], {}].any_empty?).to be true
    end

    it 'returns false if no element is empty' do
      expect(['X', Object.new, 7].any_empty?).to be false
    end

    it 'returns true if one element is empty' do
      expect(['X', '', 99].any_empty?).to be true
    end
  end

  context '#none_empty?' do
    it 'returns true for an array with no empties' do
      expect(['O', 'Cat', 'Dog'].none_empty?).to be true
    end

    it 'returns false for all empty array' do
      expect(['', '', ''].none_empty?).to be false
    end

    it 'returns false for one empty element' do
      expect(['X', 'O', ''].none_empty?).to be false
    end
  end

end

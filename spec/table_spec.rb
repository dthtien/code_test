# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Table do
  context '#initialize' do
    it 'creates a table with default size' do
      table = Table.new
      expect(table.width).to eq(Table::DEFAULT_SIZE)
      expect(table.height).to eq(Table::DEFAULT_SIZE)
    end

    it 'creates a table with specified size' do
      table = Table.new(10, 8)
      expect(table.width).to eq(10)
      expect(table.height).to eq(8)
    end
  end

  context '#valid_position?' do
    let(:table) { Table.new(5, 5) }

    context 'when checking valid positions' do
      it do
        expect(table.valid_position?(Position.new(0, 0))).to be_truthy
        expect(table.valid_position?(Position.new(4, 4))).to be_truthy
        expect(table.valid_position?(Position.new(2, 3))).to be_truthy
      end
    end

    context 'when checking invalid positions' do
      it do
        expect(table.valid_position?(Position.new(-1, 0))).to be_falsy
        expect(table.valid_position?(Position.new(5, 5))).to be_falsy
        expect(table.valid_position?(Position.new(3, -1))).to be_falsy
        expect(table.valid_position?(Position.new(6, 6))).to be_falsy
        expect(table.valid_position?(Position.new(-1, -1))).to be_falsy
      end
    end
  end
end

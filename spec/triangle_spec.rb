require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../triangle')

# TODO: テスト整理する
describe Triangle do
  describe 'pre_condition?' do
    specify { expect(Triangle.new(['1,', '1,', '1']).pre_condition?).to be_truthy }
    specify { expect(Triangle.new([0, 0, 0]).pre_condition?).to be_falsey }
    specify { expect(Triangle.new([nil, 1, 1]).pre_condition?).to be_falsey }
  end

  describe 'is_triangle?' do
    specify { expect(Triangle.new([2, 1, 1]).is_triangle?).to be_falsey }
  end

  describe 'is_equilateral_triangle?' do
    specify { expect(Triangle.new([1, 1, 1]).is_equilateral_triangle?).to be_truthy }
  end

  describe 'is_isosceles_triangle?' do
    specify { expect(Triangle.new([2, 2, 1]).is_isosceles_triangle?).to be_truthy }
  end

  describe 'is_scalene_triangle?' do
    specify { expect(Triangle.new([5, 4, 3]).is_scalene_triangle?).to be_truthy }
  end

  describe 'detect' do
    specify { expect { Triangle.new([2, 1, 1]).detect }.to output("三角形じゃないです＞＜\n").to_stdout }
    specify { expect { Triangle.new([1, 1, 1]).detect }.to output("正三角形ですね！\n").to_stdout }
    specify { expect { Triangle.new([2, 2, 1]).detect }.to output("二等辺三角形ですね！\n").to_stdout }
    specify { expect { Triangle.new([5, 4, 3]).detect }.to output("不等辺三角形ですね！\n").to_stdout }
  end
end
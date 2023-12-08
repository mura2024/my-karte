require 'rails_helper'

RSpec.describe Medical, type: :model do
  before do
    @medical = FactoryBot.build(:medical)
  end

  describe 'ノート作成' do
    context '新規作成できる場合' do
      it '診療科名の値が存在すれば作成できる' do
        expect(@medical).to be_valid
      end
    end

    context '新規作成できない場合' do
      it '診療科名が空では作成できない' do
        @medical.subject = ''
        @medical.valid?
        expect(@medical.errors.full_messages).to include('診療科名を入力してください')
      end
    end
  end
end
